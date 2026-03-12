local AllusioLib = {}
AllusioLib.__index = AllusioLib

local TweenService    = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local RunService      = cloneref(game:GetService("RunService"))
local TextService     = cloneref(game:GetService("TextService"))
local CoreGui         = cloneref(game:GetService("CoreGui"))
local Players         = cloneref(game:GetService("Players"))

-- ── Tween presets ───────────────────────────────────────────
local TI = {
    fast   = TweenInfo.new(0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    smooth = TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
    spring = TweenInfo.new(0.45, Enum.EasingStyle.Back,  Enum.EasingDirection.Out),
    snap   = TweenInfo.new(0.10, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out),
    linear = TweenInfo.new(0.25, Enum.EasingStyle.Linear),
}
local function tween(obj, ti, props) TweenService:Create(obj, ti, props):Play() end

-- ── Theme definitions ────────────────────────────────────────
-- Each mirrors screenshot layout; colorway changed per theme
local Themes = {
    Allusio = {
        Background     = Color3.fromRGB(10, 10, 14),
        Sidebar        = Color3.fromRGB(14, 14, 20),
        Card           = Color3.fromRGB(18, 19, 27),
        CardHover      = Color3.fromRGB(22, 23, 33),
        Accent         = Color3.fromRGB(88, 101, 242),   -- discord-ish indigo
        AccentHover    = Color3.fromRGB(110, 124, 255),
        AccentDim      = Color3.fromRGB(45, 50, 130),
        Text           = Color3.fromRGB(240, 241, 255),
        TextMid        = Color3.fromRGB(155, 158, 200),
        TextDim        = Color3.fromRGB(85,  90, 130),
        Stroke         = Color3.fromRGB(38, 40, 60),
        ToggleOff      = Color3.fromRGB(30, 32, 50),
        ToggleOn       = Color3.fromRGB(88, 101, 242),
        SliderTrack    = Color3.fromRGB(28, 30, 48),
        SliderFill     = Color3.fromRGB(88, 101, 242),
        SearchBg       = Color3.fromRGB(18, 19, 27),
        TabActive      = Color3.fromRGB(22, 23, 33),
        TabText        = Color3.fromRGB(88, 101, 242),
        TabIcon        = Color3.fromRGB(88, 101, 242),
    },
    Crimson = {
        Background     = Color3.fromRGB(12, 8, 9),
        Sidebar        = Color3.fromRGB(17, 10, 12),
        Card           = Color3.fromRGB(22, 13, 16),
        CardHover      = Color3.fromRGB(28, 16, 20),
        Accent         = Color3.fromRGB(220, 55, 80),
        AccentHover    = Color3.fromRGB(245, 80, 105),
        AccentDim      = Color3.fromRGB(110, 25, 38),
        Text           = Color3.fromRGB(255, 240, 242),
        TextMid        = Color3.fromRGB(200, 160, 168),
        TextDim        = Color3.fromRGB(100, 70, 78),
        Stroke         = Color3.fromRGB(55, 28, 36),
        ToggleOff      = Color3.fromRGB(40, 22, 28),
        ToggleOn       = Color3.fromRGB(220, 55, 80),
        SliderTrack    = Color3.fromRGB(38, 18, 24),
        SliderFill     = Color3.fromRGB(220, 55, 80),
        SearchBg       = Color3.fromRGB(22, 13, 16),
        TabActive      = Color3.fromRGB(28, 16, 20),
        TabText        = Color3.fromRGB(220, 55, 80),
        TabIcon        = Color3.fromRGB(220, 55, 80),
    },
    Emerald = {
        Background     = Color3.fromRGB(8, 13, 11),
        Sidebar        = Color3.fromRGB(11, 18, 15),
        Card           = Color3.fromRGB(14, 24, 20),
        CardHover      = Color3.fromRGB(18, 30, 25),
        Accent         = Color3.fromRGB(52, 211, 153),
        AccentHover    = Color3.fromRGB(72, 235, 175),
        AccentDim      = Color3.fromRGB(22, 100, 72),
        Text           = Color3.fromRGB(230, 255, 245),
        TextMid        = Color3.fromRGB(140, 195, 175),
        TextDim        = Color3.fromRGB(60, 100, 85),
        Stroke         = Color3.fromRGB(22, 55, 44),
        ToggleOff      = Color3.fromRGB(18, 40, 32),
        ToggleOn       = Color3.fromRGB(52, 211, 153),
        SliderTrack    = Color3.fromRGB(14, 38, 30),
        SliderFill     = Color3.fromRGB(52, 211, 153),
        SearchBg       = Color3.fromRGB(14, 24, 20),
        TabActive      = Color3.fromRGB(18, 30, 25),
        TabText        = Color3.fromRGB(52, 211, 153),
        TabIcon        = Color3.fromRGB(52, 211, 153),
    },
    Amber = {
        Background     = Color3.fromRGB(13, 10, 6),
        Sidebar        = Color3.fromRGB(18, 14, 8),
        Card           = Color3.fromRGB(24, 18, 10),
        CardHover      = Color3.fromRGB(30, 23, 13),
        Accent         = Color3.fromRGB(245, 168, 42),
        AccentHover    = Color3.fromRGB(255, 190, 70),
        AccentDim      = Color3.fromRGB(120, 80, 15),
        Text           = Color3.fromRGB(255, 248, 230),
        TextMid        = Color3.fromRGB(210, 185, 130),
        TextDim        = Color3.fromRGB(100, 82, 40),
        Stroke         = Color3.fromRGB(60, 45, 20),
        ToggleOff      = Color3.fromRGB(40, 30, 12),
        ToggleOn       = Color3.fromRGB(245, 168, 42),
        SliderTrack    = Color3.fromRGB(35, 25, 10),
        SliderFill     = Color3.fromRGB(245, 168, 42),
        SearchBg       = Color3.fromRGB(24, 18, 10),
        TabActive      = Color3.fromRGB(30, 23, 13),
        TabText        = Color3.fromRGB(245, 168, 42),
        TabIcon        = Color3.fromRGB(245, 168, 42),
    },
    Monochrome = {
        Background     = Color3.fromRGB(8, 8, 8),
        Sidebar        = Color3.fromRGB(12, 12, 12),
        Card           = Color3.fromRGB(18, 18, 18),
        CardHover      = Color3.fromRGB(24, 24, 24),
        Accent         = Color3.fromRGB(210, 210, 210),
        AccentHover    = Color3.fromRGB(240, 240, 240),
        AccentDim      = Color3.fromRGB(80, 80, 80),
        Text           = Color3.fromRGB(255, 255, 255),
        TextMid        = Color3.fromRGB(160, 160, 160),
        TextDim        = Color3.fromRGB(70, 70, 70),
        Stroke         = Color3.fromRGB(35, 35, 35),
        ToggleOff      = Color3.fromRGB(30, 30, 30),
        ToggleOn       = Color3.fromRGB(180, 180, 180),
        SliderTrack    = Color3.fromRGB(25, 25, 25),
        SliderFill     = Color3.fromRGB(200, 200, 200),
        SearchBg       = Color3.fromRGB(18, 18, 18),
        TabActive      = Color3.fromRGB(24, 24, 24),
        TabText        = Color3.fromRGB(210, 210, 210),
        TabIcon        = Color3.fromRGB(210, 210, 210),
    },
}

-- ── Helpers ──────────────────────────────────────────────────
local function new(class, props, children)
    local inst = Instance.new(class)
    for k, v in pairs(props or {}) do inst[k] = v end
    for _, c in ipairs(children or {}) do c.Parent = inst end
    return inst
end

local function corner(r, parent)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r)
    c.Parent = parent
    return c
end

local function stroke(color, thickness, transparency, parent)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Thickness = thickness
    s.Transparency = transparency
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

local function padding(t, b, l, r, parent)
    local p = Instance.new("UIPadding")
    p.PaddingTop    = UDim.new(0, t)
    p.PaddingBottom = UDim.new(0, b)
    p.PaddingLeft   = UDim.new(0, l)
    p.PaddingRight  = UDim.new(0, r)
    p.Parent = parent
    return p
end

local function listLayout(direction, halign, valign, pad, parent)
    local l = Instance.new("UIListLayout")
    l.FillDirection      = direction or Enum.FillDirection.Vertical
    l.HorizontalAlignment = halign   or Enum.HorizontalAlignment.Left
    l.VerticalAlignment   = valign   or Enum.VerticalAlignment.Top
    l.Padding            = UDim.new(0, pad or 0)
    l.SortOrder          = Enum.SortOrder.LayoutOrder
    l.Parent = parent
    return l
end

-- ─────────────────────────────────────────────────────────────
--  LIBRARY CONSTRUCTOR
-- ─────────────────────────────────────────────────────────────
function AllusioLib.new(settings)
    settings = settings or {}
    local self = setmetatable({}, AllusioLib)

    self._title        = settings.Title or "Allusio"
    self._theme        = settings.Theme or "Allusio"
    self._T            = Themes[self._theme] or Themes.Allusio
    self._tabs         = {}
    self._activeTab    = nil
    self._searchOpen   = false
    self._connections  = {}
    self._allElements  = {} -- {name, type, tabRef, widgetRef} for global search
    self._dragging     = false

    -- ── Destroy old GUI ──────────────────────────────────────
    local existing = CoreGui:FindFirstChild("AllusioUI")
    if existing then existing:Destroy() end

    -- ── Root ScreenGui ───────────────────────────────────────
    local gui = new("ScreenGui", {
        Name           = "AllusioUI",
        ResetOnSpawn   = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent         = CoreGui,
    })
    self._gui = gui

    -- ── Main window ──────────────────────────────────────────
    local win = new("Frame", {
        Name                 = "Window",
        Size                 = UDim2.fromOffset(900, 560),
        Position             = UDim2.new(0.5, -450, 0.5, -280),
        BackgroundColor3     = self._T.Background,
        BackgroundTransparency = 0,
        BorderSizePixel      = 0,
        ClipsDescendants     = true,
        Parent               = gui,
    })
    corner(14, win)
    stroke(self._T.Stroke, 1, 0.3, win)
    self._win = win

    -- ── SIDEBAR (left, 180px) ────────────────────────────────
    local sidebar = new("Frame", {
        Name             = "Sidebar",
        Size             = UDim2.new(0, 180, 1, 0),
        BackgroundColor3 = self._T.Sidebar,
        BackgroundTransparency = 0,
        BorderSizePixel  = 0,
        Parent           = win,
    })
    -- right border
    new("Frame", {
        Size             = UDim2.new(0, 1, 1, 0),
        Position         = UDim2.new(1, -1, 0, 0),
        BackgroundColor3 = self._T.Stroke,
        BorderSizePixel  = 0,
        Parent           = sidebar,
    })
    self._sidebar = sidebar

    -- ── Title area (top of sidebar) ──────────────────────────
    local titleArea = new("Frame", {
        Size             = UDim2.new(1, 0, 0, 52),
        BackgroundTransparency = 1,
        Parent           = sidebar,
    })
    -- Bell icon
    local bellIcon = new("ImageLabel", {
        Size             = UDim2.fromOffset(18, 18),
        Position         = UDim2.new(0, 16, 0.5, -9),
        BackgroundTransparency = 1,
        Image            = "rbxassetid://107819132007001",
        ImageColor3      = self._T.Accent,
        Parent           = titleArea,
    })
    -- Animated title label
    local titleLabel = new("TextLabel", {
        Name             = "TitleLabel",
        Size             = UDim2.new(1, -48, 1, 0),
        Position         = UDim2.new(0, 40, 0, 0),
        BackgroundTransparency = 1,
        Font             = Enum.Font.GothamBold,
        TextSize         = 15,
        TextColor3       = self._T.Text,
        TextXAlignment   = Enum.TextXAlignment.Left,
        TextYAlignment   = Enum.TextYAlignment.Center,
        Text             = "",
        Parent           = titleArea,
    })
    self._titleLabel = titleLabel
    self._titleFull  = self._title

    -- ── Thin accent line under title ─────────────────────────
    new("Frame", {
        Size             = UDim2.new(1, 0, 0, 1),
        Position         = UDim2.new(0, 0, 1, -1),
        BackgroundColor3 = self._T.Stroke,
        BorderSizePixel  = 0,
        Parent           = titleArea,
    })

    -- ── Tab list (scrollable) ────────────────────────────────
    local tabScroll = new("ScrollingFrame", {
        Name                    = "TabList",
        Size                    = UDim2.new(1, 0, 1, -52),
        Position                = UDim2.new(0, 0, 0, 52),
        BackgroundTransparency  = 1,
        BorderSizePixel         = 0,
        ScrollBarThickness      = 0,
        AutomaticCanvasSize     = Enum.AutomaticSize.Y,
        CanvasSize              = UDim2.new(0, 0, 0, 0),
        Parent                  = sidebar,
    })
    padding(8, 8, 0, 0, tabScroll)
    listLayout(nil, nil, nil, 2, tabScroll)
    self._tabScroll = tabScroll

    -- ── Content area (right of sidebar) ─────────────────────
    local content = new("Frame", {
        Name             = "Content",
        Size             = UDim2.new(1, -180, 1, 0),
        Position         = UDim2.new(0, 180, 0, 0),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = win,
    })
    self._content = content

    -- ── Top bar (search + keybind hint) ─────────────────────
    local topbar = new("Frame", {
        Name             = "Topbar",
        Size             = UDim2.new(1, 0, 0, 48),
        BackgroundTransparency = 1,
        Parent           = content,
    })

    -- Search button (magnifying glass icon, top-right)
    local searchBtn = new("ImageButton", {
        Name             = "SearchBtn",
        Size             = UDim2.fromOffset(32, 32),
        Position         = UDim2.new(1, -48, 0.5, -16),
        BackgroundColor3 = self._T.SearchBg,
        BorderSizePixel  = 0,
        Image            = "rbxassetid://6031094667",
        ImageColor3      = self._T.TextMid,
        Parent           = topbar,
    })
    corner(8, searchBtn)
    stroke(self._T.Stroke, 1, 0.4, searchBtn)
    self._searchBtn = searchBtn

    -- Search overlay (hidden by default)
    local searchOverlay = new("Frame", {
        Name             = "SearchOverlay",
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Visible          = false,
        ZIndex           = 50,
        Parent           = content,
    })
    -- Search box
    local searchBox = new("Frame", {
        Size             = UDim2.new(0, 420, 0, 44),
        Position         = UDim2.new(0.5, -210, 0, 18),
        BackgroundColor3 = self._T.Card,
        BorderSizePixel  = 0,
        ZIndex           = 51,
        Parent           = searchOverlay,
    })
    corner(10, searchBox)
    stroke(self._T.Accent, 1, 0.5, searchBox)

    new("ImageLabel", {
        Size             = UDim2.fromOffset(16, 16),
        Position         = UDim2.new(0, 12, 0.5, -8),
        BackgroundTransparency = 1,
        Image            = "rbxassetid://6031094667",
        ImageColor3      = self._T.TextMid,
        ZIndex           = 52,
        Parent           = searchBox,
    })

    local searchInput = new("TextBox", {
        Size             = UDim2.new(1, -40, 1, 0),
        Position         = UDim2.new(0, 36, 0, 0),
        BackgroundTransparency = 1,
        Font             = Enum.Font.GothamSemibold,
        TextSize         = 14,
        TextColor3       = self._T.Text,
        PlaceholderColor3 = self._T.TextDim,
        PlaceholderText  = "Search anything...",
        Text             = "",
        TextXAlignment   = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
        ZIndex           = 52,
        Parent           = searchBox,
    })
    self._searchInput = searchInput

    -- Search results list
    local searchResults = new("ScrollingFrame", {
        Size                  = UDim2.new(0, 420, 0, 0),
        Position              = UDim2.new(0.5, -210, 0, 68),
        BackgroundColor3      = self._T.Card,
        BorderSizePixel       = 0,
        ScrollBarThickness    = 2,
        AutomaticCanvasSize   = Enum.AutomaticSize.Y,
        CanvasSize            = UDim2.new(0, 0, 0, 0),
        ClipsDescendants      = true,
        ZIndex                = 51,
        Visible               = false,
        Parent                = searchOverlay,
    })
    corner(10, searchResults)
    stroke(self._T.Stroke, 1, 0.4, searchResults)
    padding(4, 4, 6, 6, searchResults)
    listLayout(nil, nil, nil, 2, searchResults)
    self._searchResults = searchResults

    -- Blur backdrop for search
    local searchBackdrop = new("TextButton", {
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.5,
        Text             = "",
        ZIndex           = 49,
        Parent           = searchOverlay,
    })
    searchBackdrop.MouseButton1Click:Connect(function()
        self:_closeSearch()
    end)
    self._searchOverlay = searchOverlay

    -- ── Tab page container ───────────────────────────────────
    local pageHolder = new("Frame", {
        Name             = "PageHolder",
        Size             = UDim2.new(1, 0, 1, -48),
        Position         = UDim2.new(0, 0, 0, 48),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
        Parent           = content,
    })
    self._pageHolder = pageHolder

    -- ── Drag logic ───────────────────────────────────────────
    do
        local dragStart, winStart
        local dragArea = new("TextButton", {
            Size  = UDim2.new(1, 0, 0, 48),
            BackgroundTransparency = 1,
            Text  = "",
            ZIndex = 2,
            Parent = topbar,
        })
        dragArea.MouseButton1Down:Connect(function(x, y)
            self._dragging = true
            dragStart = Vector2.new(x, y)
            winStart  = win.Position
        end)
        UserInputService.InputChanged:Connect(function(i)
            if not self._dragging then return end
            if i.UserInputType ~= Enum.UserInputType.MouseMovement then return end
            local d = Vector2.new(i.Position.X, i.Position.Y) - dragStart
            win.Position = UDim2.new(
                winStart.X.Scale, winStart.X.Offset + d.X,
                winStart.Y.Scale, winStart.Y.Offset + d.Y
            )
        end)
        UserInputService.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                self._dragging = false
            end
        end)
    end

    -- ── Search button logic ──────────────────────────────────
    searchBtn.MouseButton1Click:Connect(function()
        self:_openSearch()
    end)

    searchInput:GetPropertyChangedSignal("Text"):Connect(function()
        self:_runSearch(searchInput.Text)
    end)

    -- ── Animated title ───────────────────────────────────────
    self:_animateTitle()

    -- ── UI show keybind (RightAlt) ───────────────────────────
    UserInputService.InputBegan:Connect(function(i, gp)
        if gp then return end
        if i.KeyCode == Enum.KeyCode.RightAlt then
            gui.Enabled = not gui.Enabled
        end
    end)

    return self
end

-- ─────────────────────────────────────────────────────────────
--  ANIMATED TITLE  (typewriter + subtle wave shimmer)
-- ─────────────────────────────────────────────────────────────
function AllusioLib:_animateTitle()
    local lbl   = self._titleLabel
    local full  = self._titleFull
    local index = 0

    -- typewriter phase
    task.spawn(function()
        task.wait(0.3)
        while index < #full do
            index += 1
            lbl.Text = string.sub(full, 1, index)
            task.wait(0.07)
        end
        -- after typewriter, start wave shimmer loop using UIGradient
        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0,   self._T.Text),
            ColorSequenceKeypoint.new(0.4, self._T.Accent),
            ColorSequenceKeypoint.new(0.6, self._T.Text),
            ColorSequenceKeypoint.new(1,   self._T.Text),
        })
        grad.Parent = lbl
        local t = 0
        RunService.RenderStepped:Connect(function(dt)
            t += dt * 0.6
            grad.Offset = Vector2.new(math.sin(t) * 0.6, 0)
        end)
    end)
end

-- ─────────────────────────────────────────────────────────────
--  SEARCH
-- ─────────────────────────────────────────────────────────────
function AllusioLib:_openSearch()
    self._searchOverlay.Visible = true
    self._searchInput:CaptureFocus()
    tween(self._searchOverlay, TI.fast, {BackgroundTransparency = 0.001})
end

function AllusioLib:_closeSearch()
    self._searchInput.Text = ""
    self._searchResults.Visible = false
    self._searchOverlay.Visible = false
end

function AllusioLib:_runSearch(query)
    -- clear old results
    for _, c in ipairs(self._searchResults:GetChildren()) do
        if c:IsA("GuiObject") then c:Destroy() end
    end

    local q = query:lower():gsub("^%s+", ""):gsub("%s+$", "")
    if q == "" then
        self._searchResults.Visible = false
        return
    end

    local matches = {}
    for _, entry in ipairs(self._allElements) do
        if entry.label:lower():find(q, 1, true) then
            table.insert(matches, entry)
        end
    end

    self._searchResults.Visible = true

    if #matches == 0 then
        local noResult = new("TextLabel", {
            Size             = UDim2.new(1, 0, 0, 36),
            BackgroundTransparency = 1,
            Font             = Enum.Font.Gotham,
            TextSize         = 12,
            TextColor3       = self._T.TextDim,
            Text             = "No results for \"" .. query .. "\"",
            TextXAlignment   = Enum.TextXAlignment.Left,
            ZIndex           = 52,
            Parent           = self._searchResults,
        })
        padding(0, 0, 8, 8, noResult)
        tween(self._searchResults, TI.fast, {Size = UDim2.new(0, 420, 0, 44)})
        return
    end

    local shown = math.min(#matches, 7)
    local rowH  = 36
    for i = 1, shown do
        local entry = matches[i]
        local row = new("TextButton", {
            Size             = UDim2.new(1, 0, 0, rowH),
            BackgroundColor3 = self._T.CardHover,
            BackgroundTransparency = 1,
            Text             = "",
            AutoButtonColor  = false,
            ZIndex           = 52,
            Parent           = self._searchResults,
        })
        corner(6, row)
        padding(0, 0, 8, 8, row)

        -- Type badge
        local badge = new("Frame", {
            Size             = UDim2.fromOffset(52, 16),
            Position         = UDim2.new(1, -60, 0.5, -8),
            BackgroundColor3 = self._T.AccentDim,
            BorderSizePixel  = 0,
            ZIndex           = 53,
            Parent           = row,
        })
        corner(4, badge)
        new("TextLabel", {
            Size             = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Font             = Enum.Font.GothamBold,
            TextSize         = 9,
            TextColor3       = self._T.Accent,
            Text             = entry.etype:upper(),
            ZIndex           = 53,
            Parent           = badge,
        })

        -- Tab breadcrumb
        new("TextLabel", {
            Size             = UDim2.new(0, 80, 1, 0),
            Position         = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1,
            Font             = Enum.Font.Gotham,
            TextSize         = 10,
            TextColor3       = self._T.TextDim,
            Text             = entry.tabName,
            TextXAlignment   = Enum.TextXAlignment.Left,
            ZIndex           = 53,
            Parent           = row,
        })

        -- Label
        new("TextLabel", {
            Size             = UDim2.new(1, -130, 1, 0),
            Position         = UDim2.new(0, 78, 0, 0),
            BackgroundTransparency = 1,
            Font             = Enum.Font.GothamSemibold,
            TextSize         = 12,
            TextColor3       = self._T.Text,
            Text             = entry.label,
            TextXAlignment   = Enum.TextXAlignment.Left,
            ZIndex           = 53,
            Parent           = row,
        })

        row.MouseEnter:Connect(function()
            tween(row, TI.snap, {BackgroundTransparency = 0})
        end)
        row.MouseLeave:Connect(function()
            tween(row, TI.snap, {BackgroundTransparency = 1})
        end)
        row.MouseButton1Click:Connect(function()
            -- navigate to that tab
            if entry.tabObj and entry.tabObj._tabBtn then
                entry.tabObj._tabBtn.MouseButton1Click:Fire()
            end
            self:_closeSearch()
        end)
    end

    local totalH = math.min(shown * rowH + 8, 270)
    tween(self._searchResults, TI.fast, {Size = UDim2.new(0, 420, 0, totalH)})
end

-- ─────────────────────────────────────────────────────────────
--  CREATE TAB
-- ─────────────────────────────────────────────────────────────
function AllusioLib:Tab(settings)
    settings = settings or {}
    local T   = self._T
    local lib = self

    -- ── Tab button in sidebar ────────────────────────────────
    local isFirst = #self._tabs == 0

    local tabBtn = new("TextButton", {
        Name             = "Tab_" .. (settings.Title or "Tab"),
        Size             = UDim2.new(1, -16, 0, 38),
        BackgroundColor3 = T.TabActive,
        BackgroundTransparency = isFirst and 0.4 or 1,
        Text             = "",
        AutoButtonColor  = false,
        BorderSizePixel  = 0,
        Parent           = self._tabScroll,
    })
    corner(8, tabBtn)

    -- Icon
    local tabIcon = new("ImageLabel", {
        Size             = UDim2.fromOffset(14, 14),
        Position         = UDim2.new(0, 12, 0.5, -7),
        BackgroundTransparency = 1,
        Image            = settings.Icon or "rbxassetid://107819132007001",
        ImageColor3      = isFirst and T.TabIcon or T.TextDim,
        Parent           = tabBtn,
    })

    local tabText = new("TextLabel", {
        Size             = UDim2.new(1, -34, 1, 0),
        Position         = UDim2.new(0, 32, 0, 0),
        BackgroundTransparency = 1,
        Font             = Enum.Font.GothamSemibold,
        TextSize         = 13,
        TextColor3       = isFirst and T.TabText or T.TextDim,
        Text             = settings.Title or "Tab",
        TextXAlignment   = Enum.TextXAlignment.Left,
        Parent           = tabBtn,
    })

    -- Active accent line (left edge)
    local accentLine = new("Frame", {
        Size             = UDim2.new(0, 2, 0, 18),
        Position         = UDim2.new(0, 0, 0.5, -9),
        BackgroundColor3 = T.Accent,
        BackgroundTransparency = isFirst and 0 or 1,
        BorderSizePixel  = 0,
        Parent           = tabBtn,
    })
    corner(2, accentLine)

    -- ── Page frame ────────────────────────────────────────────
    local page = new("ScrollingFrame", {
        Name                  = "Page_" .. (settings.Title or "Tab"),
        Size                  = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel       = 0,
        ScrollBarThickness    = 0,
        AutomaticCanvasSize   = Enum.AutomaticSize.None,
        Visible               = isFirst,
        Parent                = self._pageHolder,
    })
    padding(16, 16, 16, 16, page)

    -- Card grid (2-column)
    local cardGrid = new("Frame", {
        Size             = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        AutomaticSize    = Enum.AutomaticSize.Y,
        Parent           = page,
    })
    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellSize      = UDim2.new(0.5, -8, 0, 0)
    gridLayout.CellPadding   = UDim2.fromOffset(12, 12)
    gridLayout.SortOrder     = Enum.SortOrder.LayoutOrder
    gridLayout.FillDirection = Enum.FillDirection.Horizontal
    gridLayout.Parent        = cardGrid
    -- make cells auto-height
    gridLayout.CellSize = UDim2.new(0.5, -8, 0, 1) -- will be overridden per card

    local tabObj = {
        _lib      = lib,
        _page     = page,
        _cardGrid = cardGrid,
        _tabBtn   = tabBtn,
        _tabName  = settings.Title or "Tab",
        _cards    = {},
    }

    -- ── Tab button click ──────────────────────────────────────
    tabBtn.MouseEnter:Connect(function()
        if tabBtn.BackgroundTransparency > 0.5 then
            tween(tabBtn, TI.snap, {BackgroundTransparency = 0.7})
        end
    end)
    tabBtn.MouseLeave:Connect(function()
        if tabBtn.BackgroundTransparency > 0.3 then
            tween(tabBtn, TI.snap, {BackgroundTransparency = 1})
        end
    end)

    tabBtn.MouseButton1Click:Connect(function()
        -- deactivate all
        for _, t in ipairs(self._tabs) do
            tween(t._tabBtn,          TI.fast, {BackgroundTransparency = 1})
            tween(t._tabBtn.Icon,     TI.fast, {ImageColor3 = T.TextDim})
            tween(t._tabBtn.Label,    TI.fast, {TextColor3  = T.TextDim})
            tween(t._tabBtn.Accent,   TI.fast, {BackgroundTransparency = 1})
            t._page.Visible = false
        end
        -- activate this
        tween(tabBtn,    TI.smooth, {BackgroundTransparency = 0.4})
        tween(tabIcon,   TI.smooth, {ImageColor3 = T.TabIcon})
        tween(tabText,   TI.smooth, {TextColor3  = T.TabText})
        tween(accentLine,TI.smooth, {BackgroundTransparency = 0})
        page.Visible = true
        self._activeTab = tabObj
    end)

    -- store name references for icon/label lookup
    tabIcon.Name  = "Icon"
    tabText.Name  = "Label"
    accentLine.Name = "Accent"

    table.insert(self._tabs, tabObj)
    if isFirst then self._activeTab = tabObj end

    -- ── Card factory ─────────────────────────────────────────
    local cardLib = {}

    function cardLib:Card(csettings)
        csettings = csettings or {}
        local cardH = 0 -- will auto-grow

        local card = new("Frame", {
            Name             = "Card_" .. (csettings.Title or "Card"),
            Size             = UDim2.new(1, 0, 0, 0),
            AutomaticSize    = Enum.AutomaticSize.Y,
            BackgroundColor3 = T.Card,
            BorderSizePixel  = 0,
            Parent           = cardGrid,
        })
        corner(10, card)
        stroke(T.Stroke, 1, 0.35, card)

        local cardLayout = new("Frame", {
            Size             = UDim2.new(1, 0, 0, 0),
            AutomaticSize    = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            Parent           = card,
        })
        padding(14, 14, 14, 14, cardLayout)
        listLayout(nil, nil, nil, 10, cardLayout)

        -- Card header
        local headerRow = new("Frame", {
            Size             = UDim2.new(1, 0, 0, 32),
            BackgroundTransparency = 1,
            LayoutOrder      = 0,
            Parent           = cardLayout,
        })
        new("TextLabel", {
            Size             = UDim2.new(1, 0, 0, 16),
            BackgroundTransparency = 1,
            Font             = Enum.Font.GothamBold,
            TextSize         = 14,
            TextColor3       = T.Text,
            Text             = csettings.Title or "Module",
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = headerRow,
        })
        new("TextLabel", {
            Size             = UDim2.new(1, 0, 0, 12),
            Position         = UDim2.new(0, 0, 0, 17),
            BackgroundTransparency = 1,
            Font             = Enum.Font.Gotham,
            TextSize         = 10,
            TextColor3       = T.TextDim,
            Text             = csettings.Description or "",
            TextXAlignment   = Enum.TextXAlignment.Left,
            Parent           = headerRow,
        })

        -- thin divider under header
        new("Frame", {
            Size             = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = T.Stroke,
            BorderSizePixel  = 0,
            LayoutOrder      = 1,
            Parent           = cardLayout,
        })

        local widgetArea = new("Frame", {
            Size             = UDim2.new(1, 0, 0, 0),
            AutomaticSize    = Enum.AutomaticSize.Y,
            BackgroundTransparency = 1,
            LayoutOrder      = 2,
            Parent           = cardLayout,
        })
        listLayout(nil, nil, nil, 8, widgetArea)

        local widgetLib = {}
        local layoutOrder = 0

        local function nextOrder()
            layoutOrder += 1
            return layoutOrder
        end

        -- register element for global search
        local function reg(label, etype, wref)
            table.insert(lib._allElements, {
                label   = label,
                etype   = etype,
                tabName = tabObj._tabName,
                tabObj  = tabObj,
                widget  = wref,
            })
        end

        -- ── Section divider ───────────────────────────────────
        function widgetLib:Section(title)
            local lo = nextOrder()
            local f = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 18),
                BackgroundTransparency = 1,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })
            new("Frame", {
                Size             = UDim2.new(1, 0, 0, 1),
                Position         = UDim2.new(0, 0, 0.5, 0),
                BackgroundColor3 = T.Stroke,
                BorderSizePixel  = 0,
                Parent           = f,
            })
            local lbl = new("TextLabel", {
                Size             = UDim2.fromOffset(0, 14),
                AutomaticSize    = Enum.AutomaticSize.X,
                AnchorPoint      = Vector2.new(0.5, 0.5),
                Position         = UDim2.new(0.5, 0, 0.5, 0),
                BackgroundColor3 = T.Card,
                BackgroundTransparency = 0,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 10,
                TextColor3       = T.TextMid,
                Text             = "  " .. (title or "") .. "  ",
                Parent           = f,
            })
        end

        -- ── Toggle ────────────────────────────────────────────
        -- Matches screenshot: label left, toggle right + optional keybind badge
        function widgetLib:Toggle(tsettings)
            tsettings = tsettings or {}
            local lo = nextOrder()
            local state = tsettings.Default or false

            local row = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 26),
                BackgroundTransparency = 1,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })

            -- Keybind badge (left, matches screenshot style "None" / "E")
            local keybindBadge = new("Frame", {
                Size             = UDim2.fromOffset(36, 16),
                Position         = UDim2.new(0, 0, 0.5, -8),
                BackgroundColor3 = T.SliderTrack,
                BorderSizePixel  = 0,
                Parent           = row,
            })
            corner(4, keybindBadge)
            local keybindLbl = new("TextLabel", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamBold,
                TextSize         = 9,
                TextColor3       = T.TextMid,
                Text             = "None",
                Parent           = keybindBadge,
            })

            -- slider-like settings icon
            new("ImageLabel", {
                Size             = UDim2.fromOffset(10, 10),
                Position         = UDim2.new(0, -14, 0.5, -5),
                BackgroundTransparency = 1,
                Image            = "rbxassetid://79095934438045",
                ImageColor3      = T.TextDim,
                Parent           = keybindBadge,
            })

            -- Title
            new("TextLabel", {
                Size             = UDim2.new(1, -90, 1, 0),
                Position         = UDim2.new(0, 44, 0, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 12,
                TextColor3       = T.TextMid,
                Text             = tsettings.Title or "Toggle",
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = row,
            })

            -- Toggle pill
            local pill = new("Frame", {
                Size             = UDim2.fromOffset(32, 16),
                Position         = UDim2.new(1, -32, 0.5, -8),
                BackgroundColor3 = state and T.ToggleOn or T.ToggleOff,
                BorderSizePixel  = 0,
                Parent           = row,
            })
            corner(10, pill)
            local knob = new("Frame", {
                Size             = UDim2.fromOffset(12, 12),
                Position         = state
                    and UDim2.new(1, -14, 0.5, -6)
                    or  UDim2.new(0,   2, 0.5, -6),
                BackgroundColor3 = Color3.new(1, 1, 1),
                BorderSizePixel  = 0,
                Parent           = pill,
            })
            corner(10, knob)

            local pillBtn = new("TextButton", {
                Size             = UDim2.fromOffset(32, 16),
                Position         = UDim2.new(1, -32, 0.5, -8),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 2,
                Parent           = row,
            })

            local function setState(s)
                state = s
                tween(pill, TI.smooth, {BackgroundColor3 = state and T.ToggleOn or T.ToggleOff})
                tween(knob, TI.spring, {
                    Position = state
                        and UDim2.new(1, -14, 0.5, -6)
                        or  UDim2.new(0,   2, 0.5, -6)
                })
                if tsettings.Callback then
                    pcall(tsettings.Callback, state)
                end
            end

            pillBtn.MouseButton1Click:Connect(function() setState(not state) end)

            -- Middle-click sets keybind
            row.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton3 then
                    keybindLbl.Text = "..."
                    local conn
                    conn = UserInputService.InputBegan:Connect(function(ki, gp)
                        if gp then return end
                        if ki.KeyCode == Enum.KeyCode.Unknown then return end
                        conn:Disconnect()
                        if ki.KeyCode == Enum.KeyCode.Backspace then
                            keybindLbl.Text = "None"
                        else
                            local ks = tostring(ki.KeyCode):gsub("Enum.KeyCode.", "")
                            keybindLbl.Text = ks:sub(1, 3)
                            UserInputService.InputBegan:Connect(function(bi, bgp)
                                if bgp then return end
                                if tostring(bi.KeyCode) == tostring(ki.KeyCode) then
                                    setState(not state)
                                end
                            end)
                        end
                    end)
                end
            end)

            reg(tsettings.Title or "Toggle", "Toggle", {setState=setState, getState=function() return state end})
            return {
                Set = setState,
                Get = function() return state end,
            }
        end

        -- ── Slider ────────────────────────────────────────────
        function widgetLib:Slider(ssettings)
            ssettings = ssettings or {}
            local lo  = nextOrder()
            local min = ssettings.Min or 0
            local max = ssettings.Max or 100
            local val = ssettings.Default or min
            local step= ssettings.Step or 1

            local wrap = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 36),
                BackgroundTransparency = 1,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })

            local topRow = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 14),
                BackgroundTransparency = 1,
                Parent           = wrap,
            })
            new("TextLabel", {
                Size             = UDim2.new(0.7, 0, 1, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 11,
                TextColor3       = T.TextMid,
                Text             = ssettings.Title or "Slider",
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = topRow,
            })
            local valLbl = new("TextLabel", {
                Size             = UDim2.new(0.3, 0, 1, 0),
                Position         = UDim2.new(0.7, 0, 0, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamBold,
                TextSize         = 11,
                TextColor3       = T.Text,
                Text             = tostring(val),
                TextXAlignment   = Enum.TextXAlignment.Right,
                Parent           = topRow,
            })

            local trackBg = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 4),
                Position         = UDim2.new(0, 0, 1, -4),
                BackgroundColor3 = T.SliderTrack,
                BorderSizePixel  = 0,
                Parent           = wrap,
            })
            corner(4, trackBg)
            local fill = new("Frame", {
                Size             = UDim2.new((val - min)/(max - min), 0, 1, 0),
                BackgroundColor3 = T.SliderFill,
                BorderSizePixel  = 0,
                Parent           = trackBg,
            })
            corner(4, fill)
            local knobSlider = new("Frame", {
                Size             = UDim2.fromOffset(10, 10),
                AnchorPoint      = Vector2.new(0.5, 0.5),
                Position         = UDim2.new((val - min)/(max - min), 0, 0.5, 0),
                BackgroundColor3 = Color3.new(1, 1, 1),
                BorderSizePixel  = 0,
                Parent           = trackBg,
            })
            corner(10, knobSlider)

            local trackBtn = new("TextButton", {
                Size             = UDim2.new(1, 0, 0, 14),
                Position         = UDim2.new(0, 0, 1, -7),
                BackgroundTransparency = 1,
                Text             = "",
                Parent           = wrap,
            })

            local dragging = false
            local function updateFromMouse(mx)
                local rel = math.clamp((mx - trackBg.AbsolutePosition.X) / trackBg.AbsoluteSize.X, 0, 1)
                local raw = min + (max - min) * rel
                -- snap to step
                local snapped = math.floor(raw / step + 0.5) * step
                snapped = math.clamp(snapped, min, max)
                -- round display
                local display = (step >= 1) and math.floor(snapped) or (math.floor(snapped * 100) / 100)
                val = display
                valLbl.Text = tostring(display)
                tween(fill,       TI.snap, {Size = UDim2.new(rel, 0, 1, 0)})
                tween(knobSlider, TI.snap, {Position = UDim2.new(rel, 0, 0.5, 0)})
                if ssettings.Callback then pcall(ssettings.Callback, display) end
            end

            trackBtn.MouseButton1Down:Connect(function(mx)
                dragging = true
                tween(knobSlider, TI.spring, {Size = UDim2.fromOffset(13, 13)})
                updateFromMouse(mx)
            end)
            UserInputService.InputChanged:Connect(function(i)
                if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
                    updateFromMouse(i.Position.X)
                end
            end)
            UserInputService.InputEnded:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                    tween(knobSlider, TI.spring, {Size = UDim2.fromOffset(10, 10)})
                end
            end)

            reg(ssettings.Title or "Slider", "Slider", {get=function() return val end})
            return {
                Set = function(v)
                    val = v
                    local rel = math.clamp((v - min)/(max - min), 0, 1)
                    valLbl.Text = tostring(v)
                    tween(fill, TI.smooth, {Size = UDim2.new(rel, 0, 1, 0)})
                    tween(knobSlider, TI.smooth, {Position = UDim2.new(rel, 0, 0.5, 0)})
                end,
                Get = function() return val end,
            }
        end

        -- ── Dropdown ──────────────────────────────────────────
        function widgetLib:Dropdown(dsettings)
            dsettings = dsettings or {}
            local lo  = nextOrder()
            local opts = dsettings.Options or {}
            local sel  = dsettings.Default or (opts[1] or "")
            local open = false

            local wrap = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 36),
                BackgroundTransparency = 1,
                ClipsDescendants = false,
                LayoutOrder      = lo,
                ZIndex           = 5,
                Parent           = widgetArea,
            })

            new("TextLabel", {
                Size             = UDim2.new(1, 0, 0, 13),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 11,
                TextColor3       = T.TextMid,
                Text             = dsettings.Title or "Dropdown",
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = wrap,
            })

            local box = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 22),
                Position         = UDim2.new(0, 0, 0, 14),
                BackgroundColor3 = T.SliderTrack,
                BorderSizePixel  = 0,
                ZIndex           = 5,
                Parent           = wrap,
            })
            corner(6, box)

            local selLbl = new("TextLabel", {
                Size             = UDim2.new(1, -24, 1, 0),
                Position         = UDim2.new(0, 8, 0, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 11,
                TextColor3       = T.Text,
                Text             = tostring(sel),
                TextXAlignment   = Enum.TextXAlignment.Left,
                ZIndex           = 5,
                Parent           = box,
            })
            -- arrow icon
            local arrow = new("ImageLabel", {
                Size             = UDim2.fromOffset(10, 10),
                Position         = UDim2.new(1, -16, 0.5, -5),
                BackgroundTransparency = 1,
                Image            = "rbxassetid://84232453189324",
                ImageColor3      = T.TextMid,
                ZIndex           = 5,
                Parent           = box,
            })

            -- Options list (shown below box)
            local optList = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 0),
                Position         = UDim2.new(0, 0, 1, 4),
                BackgroundColor3 = T.Card,
                BorderSizePixel  = 0,
                ClipsDescendants = true,
                ZIndex           = 10,
                Visible          = false,
                Parent           = box,
            })
            corner(6, optList)
            stroke(T.Stroke, 1, 0.3, optList)
            padding(2, 2, 4, 4, optList)
            listLayout(nil, nil, nil, 2, optList)

            for _, opt in ipairs(opts) do
                local optBtn = new("TextButton", {
                    Size             = UDim2.new(1, 0, 0, 24),
                    BackgroundColor3 = T.CardHover,
                    BackgroundTransparency = 1,
                    Font             = Enum.Font.GothamSemibold,
                    TextSize         = 11,
                    TextColor3       = opt == sel and T.Text or T.TextMid,
                    Text             = tostring(opt),
                    TextXAlignment   = Enum.TextXAlignment.Left,
                    AutoButtonColor  = false,
                    ZIndex           = 11,
                    Parent           = optList,
                })
                corner(4, optBtn)
                padding(0, 0, 6, 0, optBtn)

                -- selected dot
                local dot = new("Frame", {
                    Size             = UDim2.fromOffset(4, 4),
                    Position         = UDim2.new(1, -10, 0.5, -2),
                    BackgroundColor3 = T.Accent,
                    BackgroundTransparency = opt == sel and 0 or 1,
                    BorderSizePixel  = 0,
                    ZIndex           = 12,
                    Parent           = optBtn,
                })
                corner(4, dot)

                optBtn.MouseEnter:Connect(function()
                    tween(optBtn, TI.snap, {BackgroundTransparency = 0, TextColor3 = T.Text})
                end)
                optBtn.MouseLeave:Connect(function()
                    tween(optBtn, TI.snap, {
                        BackgroundTransparency = 1,
                        TextColor3 = opt == sel and T.Text or T.TextMid
                    })
                end)
                optBtn.MouseButton1Click:Connect(function()
                    sel = opt
                    selLbl.Text = tostring(opt)
                    -- update all dots
                    for _, c in ipairs(optList:GetChildren()) do
                        if c:IsA("TextButton") then
                            local d = c:FindFirstChildOfClass("Frame")
                            if d then tween(d, TI.snap, {BackgroundTransparency = c.Text == tostring(sel) and 0 or 1}) end
                            tween(c, TI.snap, {TextColor3 = c.Text == tostring(sel) and T.Text or T.TextMid})
                        end
                    end
                    -- close
                    open = false
                    tween(arrow, TI.fast, {Rotation = 0})
                    tween(optList, TI.fast, {Size = UDim2.new(1, 0, 0, 0)})
                    task.delay(0.2, function() optList.Visible = false end)
                    if dsettings.Callback then pcall(dsettings.Callback, opt) end
                end)
            end

            local boxBtn = new("TextButton", {
                Size             = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Text             = "",
                ZIndex           = 6,
                Parent           = box,
            })
            boxBtn.MouseButton1Click:Connect(function()
                open = not open
                if open then
                    optList.Visible = true
                    tween(arrow, TI.fast, {Rotation = 180})
                    tween(optList, TI.smooth, {Size = UDim2.new(1, 0, 0, #opts * 26 + 4)})
                else
                    tween(arrow, TI.fast, {Rotation = 0})
                    tween(optList, TI.fast, {Size = UDim2.new(1, 0, 0, 0)})
                    task.delay(0.25, function() if not open then optList.Visible = false end end)
                end
            end)

            reg(dsettings.Title or "Dropdown", "Dropdown", {get=function() return sel end})
            return {
                Set = function(v) sel = v; selLbl.Text = tostring(v) end,
                Get = function() return sel end,
                Refresh = function(newOpts)
                    opts = newOpts
                    for _, c in ipairs(optList:GetChildren()) do
                        if c:IsA("TextButton") then c:Destroy() end
                    end
                    -- rebuild
                end,
            }
        end

        -- ── Button ────────────────────────────────────────────
        function widgetLib:Button(bsettings)
            bsettings = bsettings or {}
            local lo = nextOrder()

            local btn = new("TextButton", {
                Size             = UDim2.new(1, 0, 0, 28),
                BackgroundColor3 = T.AccentDim,
                BorderSizePixel  = 0,
                Font             = Enum.Font.GothamBold,
                TextSize         = 12,
                TextColor3       = T.Accent,
                Text             = bsettings.Title or "Button",
                AutoButtonColor  = false,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })
            corner(6, btn)
            stroke(T.Accent, 1, 0.6, btn)

            btn.MouseEnter:Connect(function()
                tween(btn, TI.fast, {BackgroundColor3 = T.Accent, TextColor3 = Color3.new(1,1,1)})
            end)
            btn.MouseLeave:Connect(function()
                tween(btn, TI.fast, {BackgroundColor3 = T.AccentDim, TextColor3 = T.Accent})
            end)
            btn.MouseButton1Down:Connect(function()
                tween(btn, TI.snap, {Size = UDim2.new(1, -4, 0, 26)})
            end)
            btn.MouseButton1Up:Connect(function()
                tween(btn, TI.spring, {Size = UDim2.new(1, 0, 0, 28)})
            end)
            btn.MouseButton1Click:Connect(function()
                if bsettings.Callback then pcall(bsettings.Callback) end
            end)

            reg(bsettings.Title or "Button", "Button", {})
            return btn
        end

        -- ── Textbox ───────────────────────────────────────────
        function widgetLib:Textbox(txsettings)
            txsettings = txsettings or {}
            local lo = nextOrder()

            local wrap = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 36),
                BackgroundTransparency = 1,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })
            new("TextLabel", {
                Size             = UDim2.new(1, 0, 0, 13),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 11,
                TextColor3       = T.TextMid,
                Text             = txsettings.Title or "Input",
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = wrap,
            })
            local tb = new("TextBox", {
                Size             = UDim2.new(1, 0, 0, 22),
                Position         = UDim2.new(0, 0, 0, 14),
                BackgroundColor3 = T.SliderTrack,
                BorderSizePixel  = 0,
                Font             = Enum.Font.Gotham,
                TextSize         = 11,
                TextColor3       = T.Text,
                PlaceholderText  = txsettings.Placeholder or "...",
                PlaceholderColor3 = T.TextDim,
                Text             = txsettings.Default or "",
                ClearTextOnFocus = false,
                Parent           = wrap,
            })
            corner(6, tb)
            padding(0, 0, 8, 8, tb)
            local tbStroke = stroke(T.Stroke, 1, 0.4, tb)

            tb.Focused:Connect(function()
                tween(tbStroke, TI.fast, {Color = T.Accent, Transparency = 0})
            end)
            tb.FocusLost:Connect(function(enter)
                tween(tbStroke, TI.fast, {Color = T.Stroke, Transparency = 0.4})
                if txsettings.Callback then pcall(txsettings.Callback, tb.Text) end
            end)

            reg(txsettings.Title or "Input", "Input", {get=function() return tb.Text end})
            return {
                Get = function() return tb.Text end,
                Set = function(v) tb.Text = v end,
            }
        end

        -- ── Color picker (mini swatch) ────────────────────────
        function widgetLib:ColorPicker(cpsettings)
            cpsettings = cpsettings or {}
            local lo  = nextOrder()
            local col = cpsettings.Default or Color3.fromRGB(88, 101, 242)

            local row = new("Frame", {
                Size             = UDim2.new(1, 0, 0, 22),
                BackgroundTransparency = 1,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })
            new("TextLabel", {
                Size             = UDim2.new(1, -60, 1, 0),
                BackgroundTransparency = 1,
                Font             = Enum.Font.GothamSemibold,
                TextSize         = 11,
                TextColor3       = T.TextMid,
                Text             = cpsettings.Title or "Color",
                TextXAlignment   = Enum.TextXAlignment.Left,
                Parent           = row,
            })
            -- arrow dropdown indicator
            local arrowBtn = new("TextButton", {
                Size             = UDim2.fromOffset(14, 14),
                Position         = UDim2.new(1, -58, 0.5, -7),
                BackgroundTransparency = 1,
                Text             = "◀",
                Font             = Enum.Font.GothamBold,
                TextSize         = 9,
                TextColor3       = T.TextDim,
                AutoButtonColor  = false,
                Parent           = row,
            })
            local swatch = new("Frame", {
                Size             = UDim2.fromOffset(40, 18),
                Position         = UDim2.new(1, -42, 0.5, -9),
                BackgroundColor3 = col,
                BorderSizePixel  = 0,
                Parent           = row,
            })
            corner(4, swatch)
            stroke(T.Stroke, 1, 0.3, swatch)

            reg(cpsettings.Title or "Color", "Color", {get=function() return col end})
            return {
                Get = function() return col end,
                Set = function(c) col = c; swatch.BackgroundColor3 = c end,
            }
        end
    
        function widgetLib:Label(lsettings)
            lsettings = lsettings or {}
            local lo = nextOrder()
            local lbl = new("TextLabel", {
                Size             = UDim2.new(1, 0, 0, 0),
                AutomaticSize    = Enum.AutomaticSize.Y,
                BackgroundTransparency = 1,
                Font             = Enum.Font.Gotham,
                TextSize         = 11,
                TextColor3       = T.TextMid,
                Text             = lsettings.Text or "",
                TextXAlignment   = Enum.TextXAlignment.Left,
                TextWrapped      = true,
                LayoutOrder      = lo,
                Parent           = widgetArea,
            })
            reg(lsettings.Text or "Label", "Label", {})
            return {
                Set = function(t) lbl.Text = t end,
                Get = function() return lbl.Text end,
            }
        end

        return widgetLib
    end

    function cardLib:ThemeCard()
        local c = self:Card({Title = "Theme", Description = "Choose a colorway"})
        local themeNames = {}
        for k in pairs(Themes) do table.insert(themeNames, k) end
        table.sort(themeNames)
        c:Dropdown({
            Title    = "Theme",
            Options  = themeNames,
            Default  = lib._theme,
            Callback = function(chosen)
                lib:SetTheme(chosen)
            end,
        })
        return c
    end

    return cardLib
end

function AllusioLib:SetTheme(themeName)
    local nt = Themes[themeName]
    if not nt then return end
    self._theme = themeName
    self._T = nt
    tween(self._win,     TI.smooth, {BackgroundColor3 = nt.Background})
    tween(self._sidebar, TI.smooth, {BackgroundColor3 = nt.Sidebar})
end

function AllusioLib:Load()
    self._win.Size = UDim2.fromOffset(0, 0)
    self._win.BackgroundTransparency = 1
    tween(self._win, TI.spring, {
        Size = UDim2.fromOffset(900, 560),
        BackgroundTransparency = 0,
    })
end

return AllusioLib
