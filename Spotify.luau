-- ╔══════════════════════════════════════════════════════╗
-- ║           🎵  Spotify HUD  •  by sstvskids           ║
-- ║         Merged + Improved • Single-File Edition       ║
-- ╚══════════════════════════════════════════════════════╝
--
-- USAGE:
--   loadstring(game:HttpGet('YOUR_RAW_URL'))({
--       token = 'YOUR_SPOTIFY_TOKEN',  -- Required
--       icon  = true,                  -- Optional (default: auto-detect)
--       pos   = 'top',                 -- Optional: 'top' (default) or 'bottom'
--   })

local args = ... or {}

-- ─── Validate ────────────────────────────────────────────
assert(type(args) == 'table', '[SpotifyHUD] Pass a table of args, e.g. { token = "..." }')
assert(args.token,            '[SpotifyHUD] Missing required arg: token')

local TOKEN   = args.token
local SHOW_ICON = (getcustomasset ~= nil) and (args.icon ~= false) or (args.icon == true)
local POSITION  = args.pos or 'top' -- 'top' | 'bottom'

-- ─── Services ────────────────────────────────────────────
local cloneref = cloneref or function(o) return o end

local Services = setmetatable({}, {
    __index = function(_, k) return cloneref(game:GetService(k)) end
})

local Players     = Services.Players
local RunService  = Services.RunService
local TweenService= Services.TweenService
local HttpService = Services.HttpService

local lplr = Players.LocalPlayer

local gethui = get_hidden_ui or gethui or function()
    return (RunService:IsStudio() and lplr.PlayerGui) or cloneref(game:GetService('CoreGui'))
end

local request = (request or http and http.request or syn and syn.request)
assert(request, '[SpotifyHUD] No HTTP request function found.')

-- ─── Cache folder ─────────────────────────────────────────
for _, folder in {'spotify', 'spotify/cache'} do
    if isfolder and not isfolder(folder) then
        makefolder(folder)
    end
end

-- ─── Spotify API ─────────────────────────────────────────
local function fetchTrack()
    local ok, res = pcall(request, {
        Url     = 'https://api.spotify.com/v1/me/player',
        Method  = 'GET',
        Headers = {
            Accept        = 'application/json',
            Authorization = 'Bearer ' .. TOKEN
        }
    })

    if not ok or res.StatusCode == 401 then
        return nil, 'expired'
    end

    if res.StatusCode ~= 200 or res.Body == '' then
        return nil, 'empty'
    end

    local data = HttpService:JSONDecode(res.Body)
    if not data or not data.item then return nil, 'empty' end

    local artists = ''
    for i, v in ipairs(data.item.artists) do
        artists = artists .. v.name
        if i < #data.item.artists then artists = artists .. ', ' end
    end

    local coverUrl = (data.item.album.images[1] or {}).url or ''

    return {
        title     = data.item.name,
        artists   = artists,
        cover     = coverUrl,
        isPlaying = data.is_playing,
    }, nil
end

local function getCoverAsset(track)
    if not (getcustomasset and isfile and writefile) then return '' end
    local path = ('spotify/cache/%s_%s_cover.png'):format(track.title, track.artists)
    if not isfile(path) and track.cover ~= '' then
        local ok, body = pcall(game.HttpGet, game, track.cover)
        if ok then writefile(path, body) end
    end
    return isfile(path) and getcustomasset(path) or ''
end

-- ─── Helpers ─────────────────────────────────────────────
local function tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function makeCorner(parent, radius)
    local c = Instance.new('UICorner')
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function makePadding(parent, b, l, r, t)
    local p = Instance.new('UIPadding')
    p.PaddingBottom = UDim.new(0, b)
    p.PaddingLeft   = UDim.new(0, l)
    p.PaddingRight  = UDim.new(0, r)
    p.PaddingTop    = UDim.new(0, t)
    p.Parent = parent
    return p
end

local function makeList(parent, dir, halign, valign, padding)
    local l = Instance.new('UIListLayout')
    l.FillDirection       = dir or Enum.FillDirection.Horizontal
    l.HorizontalAlignment = halign or Enum.HorizontalAlignment.Left
    l.VerticalAlignment   = valign or Enum.VerticalAlignment.Center
    l.Padding             = UDim.new(0, padding or 0)
    l.SortOrder           = Enum.SortOrder.LayoutOrder
    l.Parent = parent
    return l
end

-- ─── Color Palette ────────────────────────────────────────
local C = {
    bg         = Color3.fromRGB(12, 12, 12),       -- near-black
    bgHover    = Color3.fromRGB(20, 20, 20),
    surface    = Color3.fromRGB(22, 22, 22),
    border     = Color3.fromRGB(45, 45, 45),
    accent     = Color3.fromRGB(30, 215, 96),       -- Spotify green
    white      = Color3.fromRGB(255, 255, 255),
    subtext    = Color3.fromRGB(160, 160, 160),
    dim        = Color3.fromRGB(90, 90, 90),
    paused     = Color3.fromRGB(200, 80, 80),
}

-- ─── Build UI ─────────────────────────────────────────────
local HUI = gethui()

-- Remove any old instance
local old = HUI:FindFirstChild('SpotifyHUD_v2')
if old then old:Destroy() end

local ScreenGui = Instance.new('ScreenGui')
ScreenGui.Name             = 'SpotifyHUD_v2'
ScreenGui.ResetOnSpawn     = false
ScreenGui.IgnoreGuiInset   = true
ScreenGui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent           = HUI

-- ── Outer pill ──────────────────────────────────────────
local yScale = POSITION == 'bottom' and 0.96 or 0.018
local yAnchor = POSITION == 'bottom' and 1 or 0

local Pill = Instance.new('Frame')
Pill.Name              = 'Pill'
Pill.AnchorPoint       = Vector2.new(0.5, yAnchor)
Pill.Position          = UDim2.fromScale(0.5, yScale)
Pill.Size              = UDim2.fromOffset(280, 64)
Pill.BackgroundColor3  = C.bg
Pill.BorderSizePixel   = 0
Pill.ClipsDescendants  = true
Pill.Parent            = ScreenGui
makeCorner(Pill, 32)

-- Subtle border via UIStroke
local stroke = Instance.new('UIStroke')
stroke.Color      = C.border
stroke.Thickness  = 1
stroke.Transparency = 0.4
stroke.Parent = Pill

-- ── Album art ────────────────────────────────────────────
local ArtFrame = Instance.new('Frame')
ArtFrame.Name             = 'ArtFrame'
ArtFrame.Size             = UDim2.fromOffset(48, 48)
ArtFrame.Position         = UDim2.fromOffset(8, 8)
ArtFrame.BackgroundColor3 = C.surface
ArtFrame.BorderSizePixel  = 0
ArtFrame.Parent           = Pill
makeCorner(ArtFrame, 10)

local AlbumArt = Instance.new('ImageLabel')
AlbumArt.Name               = 'AlbumArt'
AlbumArt.Size               = UDim2.fromScale(1, 1)
AlbumArt.BackgroundTransparency = 1
AlbumArt.Image              = ''   -- filled at runtime
AlbumArt.ScaleType          = Enum.ScaleType.Crop
AlbumArt.Parent             = ArtFrame
makeCorner(AlbumArt, 10)

-- Spotify logo fallback (shown when no cover)
local FallbackLogo = Instance.new('ImageLabel')
FallbackLogo.Name               = 'FallbackLogo'
FallbackLogo.Size               = UDim2.fromOffset(28, 28)
FallbackLogo.AnchorPoint        = Vector2.new(0.5, 0.5)
FallbackLogo.Position           = UDim2.fromScale(0.5, 0.5)
FallbackLogo.BackgroundTransparency = 1
FallbackLogo.Image              = 'rbxassetid://11432850205'
FallbackLogo.ImageColor3        = C.accent
FallbackLogo.ScaleType          = Enum.ScaleType.Fit
FallbackLogo.Visible            = true
FallbackLogo.Parent             = ArtFrame

-- ── Playing indicator dots ───────────────────────────────
local DotsFrame = Instance.new('Frame')
DotsFrame.Name             = 'DotsFrame'
DotsFrame.Size             = UDim2.fromOffset(48, 10)
DotsFrame.Position         = UDim2.new(0, 8, 1, -14)
DotsFrame.BackgroundTransparency = 1
DotsFrame.Parent           = Pill

local dotsLayout = makeList(DotsFrame, Enum.FillDirection.Horizontal, Enum.HorizontalAlignment.Center, Enum.VerticalAlignment.Center, 3)
dotsLayout.Parent = DotsFrame

local dotInsts = {}
for i = 1, 3 do
    local dot = Instance.new('Frame')
    dot.Name             = 'Dot'..i
    dot.Size             = UDim2.fromOffset(4, 4)
    dot.BackgroundColor3 = C.accent
    dot.BorderSizePixel  = 0
    makeCorner(dot, 99)
    dot.Parent = DotsFrame
    dotInsts[i] = dot
end

-- ── Text area ─────────────────────────────────────────────
local TextArea = Instance.new('Frame')
TextArea.Name             = 'TextArea'
TextArea.Position         = UDim2.fromOffset(64, 0)
TextArea.Size             = UDim2.new(1, -80, 1, 0)
TextArea.BackgroundTransparency = 1
TextArea.ClipsDescendants = true
TextArea.Parent           = Pill

makeList(TextArea, Enum.FillDirection.Vertical, Enum.HorizontalAlignment.Left, Enum.VerticalAlignment.Center, 2)
makePadding(TextArea, 0, 0, 8, 0)

local SongName = Instance.new('TextLabel')
SongName.Name              = 'SongName'
SongName.Size              = UDim2.new(1, 0, 0, 22)
SongName.BackgroundTransparency = 1
SongName.FontFace          = Font.fromName('Montserrat', Enum.FontWeight.Bold)
SongName.Text              = 'Loading…'
SongName.TextColor3        = C.white
SongName.TextSize          = 15
SongName.TextXAlignment    = Enum.TextXAlignment.Left
SongName.TextTruncate      = Enum.TextTruncate.AtEnd
SongName.Parent            = TextArea

local ArtistName = Instance.new('TextLabel')
ArtistName.Name              = 'ArtistName'
ArtistName.Size              = UDim2.new(1, 0, 0, 16)
ArtistName.BackgroundTransparency = 1
ArtistName.FontFace          = Font.fromName('Montserrat', Enum.FontWeight.Medium)
ArtistName.Text              = '─'
ArtistName.TextColor3        = C.subtext
ArtistName.TextSize          = 12
ArtistName.TextXAlignment    = Enum.TextXAlignment.Left
ArtistName.TextTruncate      = Enum.TextTruncate.AtEnd
ArtistName.Parent            = TextArea

-- ── Status badge (LIVE / PAUSED) ─────────────────────────
local Badge = Instance.new('Frame')
Badge.Name             = 'Badge'
Badge.AnchorPoint      = Vector2.new(1, 0.5)
Badge.Position         = UDim2.new(1, -8, 0.5, 0)
Badge.Size             = UDim2.fromOffset(16, 16)
Badge.BackgroundColor3 = C.accent
Badge.BorderSizePixel  = 0
Badge.Parent           = Pill
makeCorner(Badge, 99)

local BadgeDot = Instance.new('Frame')
BadgeDot.Size             = UDim2.fromOffset(6, 6)
BadgeDot.AnchorPoint      = Vector2.new(0.5, 0.5)
BadgeDot.Position         = UDim2.fromScale(0.5, 0.5)
BadgeDot.BackgroundColor3 = Color3.new(1,1,1)
BadgeDot.BorderSizePixel  = 0
BadgeDot.Parent           = Badge
makeCorner(BadgeDot, 99)

-- Entrance animation: slide in from top
Pill.Position = UDim2.fromScale(0.5, POSITION == 'bottom' and 1.05 or -0.1)
tween(Pill, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Position = UDim2.fromScale(0.5, yScale)
})

-- ─── Animation: pulsing equalizer dots ────────────────────
local function animateDots(playing)
    for i, dot in ipairs(dotInsts) do
        local target = playing and C.accent or C.dim
        tween(dot, TweenInfo.new(0.3), { BackgroundColor3 = target })

        if playing then
            task.delay((i-1)*0.18, function()
                while dot.Parent do
                    tween(dot, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Size = UDim2.fromOffset(4, 8) })
                    task.wait(0.35)
                    tween(dot, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Size = UDim2.fromOffset(4, 4) })
                    task.wait(0.35)
                end
            end)
        else
            tween(dot, TweenInfo.new(0.3), { Size = UDim2.fromOffset(4, 4) })
        end
    end
end

-- ─── Update HUD ───────────────────────────────────────────
local lastTitle = ''

local function updateHUD(track)
    local newTitle = track.title

    -- Fade out → update → fade in on song change
    if newTitle ~= lastTitle then
        tween(TextArea, TweenInfo.new(0.2), { GroupTransparency = 1 })
        task.wait(0.22)
    end

    SongName.Text   = track.title
    ArtistName.Text = track.artists

    -- Update badge color: green = playing, red = paused
    local badgeColor = track.isPlaying and C.accent or C.paused
    tween(Badge, TweenInfo.new(0.4), { BackgroundColor3 = badgeColor })
    stroke.Color = track.isPlaying and C.accent or C.border

    -- Animate dots
    animateDots(track.isPlaying)

    -- Album art
    if SHOW_ICON then
        local asset = getCoverAsset(track)
        if asset ~= '' then
            AlbumArt.Image       = asset
            FallbackLogo.Visible = false
        else
            AlbumArt.Image       = ''
            FallbackLogo.Visible = true
        end
    else
        FallbackLogo.Visible = true
    end

    if newTitle ~= lastTitle then
        tween(TextArea, TweenInfo.new(0.3), { GroupTransparency = 0 })
        lastTitle = newTitle
    end
end

-- ─── Error overlay ────────────────────────────────────────
local function showError(msg)
    SongName.Text      = '⚠ ' .. msg
    SongName.TextColor3 = C.paused
    ArtistName.Text    = 'Token expired — rejoin for a new one'
    ArtistName.TextColor3 = C.dim
    tween(Badge, TweenInfo.new(0.4), { BackgroundColor3 = C.paused })
    animateDots(false)
end

-- ─── Main loop ────────────────────────────────────────────
task.spawn(function()
    -- Initial validation request
    local ok, err = pcall(function()
        local track, errType = fetchTrack()
        assert(track, errType)
    end)

    if not ok then
        showError('Bad token')
        return
    end

    while Pill.Parent do
        local track, errType = fetchTrack()

        if errType == 'expired' then
            showError('Token expired')
            break
        elseif track then
            local success, updateErr = pcall(updateHUD, track)
            if not success then
                warn('[SpotifyHUD] updateHUD error: ' .. tostring(updateErr))
            end
        end

        task.wait(5)
    end
end)

-- ─── Return public API (optional) ─────────────────────────
return {
    destroy = function()
        tween(Pill, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.fromScale(0.5, POSITION == 'bottom' and 1.1 or -0.1)
        })
        task.wait(0.45)
        ScreenGui:Destroy()
    end,
    setToken = function(newToken)
        TOKEN = newToken
    end,
    refs = {
        gui      = ScreenGui,
        pill     = Pill,
        songName = SongName,
        artist   = ArtistName,
        art      = AlbumArt,
    }
}
