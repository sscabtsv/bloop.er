-- Bloop (.) er UI Series
-- Redesigned & Enhanced
-- Modern, Smooth, Clean
--[[
Features:
[+] Keybind
[+] Textbox
[+] Window API (UI Bind)
[+] Setting Manager
[+] Notifications
[+] Smooth spring-like animations
[+] Frosted glass aesthetic
[+] Ripple effects on buttons
[+] Improved scrolling
[+] Animated tab indicator
[+] Color-coded toggle states
[+] Enhanced dropdown with smooth expand
]]

local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Player = game:GetService("Players").LocalPlayer

-- ─── Easing Presets ─────────────────────────────────────────────────────────
local SPRING = TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local SMOOTH = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local FAST   = TweenInfo.new(0.2,  Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
local EASE   = TweenInfo.new(0.5,  Enum.EasingStyle.Sine,  Enum.EasingDirection.InOut)

-- ─── Palette ─────────────────────────────────────────────────────────────────
local C = {
	BG        = Color3.fromRGB(10, 10, 16),
	SURFACE   = Color3.fromRGB(17, 17, 26),
	SURFACE2  = Color3.fromRGB(22, 22, 34),
	CARD      = Color3.fromRGB(20, 20, 30),
	BORDER    = Color3.fromRGB(38, 38, 58),
	BORDER2   = Color3.fromRGB(50, 50, 72),
	ACCENT    = Color3.fromRGB(110, 170, 255),
	ACCENT2   = Color3.fromRGB(80, 130, 220),
	ACCENT_DIM= Color3.fromRGB(40, 70, 140),
	TEXT      = Color3.fromRGB(220, 220, 240),
	TEXT_SUB  = Color3.fromRGB(140, 140, 170),
	TEXT_DIM  = Color3.fromRGB(85, 85, 110),
	SUCCESS   = Color3.fromRGB(80, 220, 140),
	DANGER    = Color3.fromRGB(255, 90, 100),
	WHITE     = Color3.new(1, 1, 1),
}

-- ─── Utility ─────────────────────────────────────────────────────────────────
local function Create(class, props, children)
	local obj = Instance.new(class)
	for k, v in pairs(props or {}) do obj[k] = v end
	for _, c in pairs(children or {}) do c.Parent = obj end
	return obj
end

local function Tween(obj, info, props)
	return TweenService:Create(obj, info, props)
end

local function TweenPlay(obj, info, props)
	local t = TweenService:Create(obj, info, props)
	t:Play()
	return t
end

-- Ripple effect for buttons
local function Ripple(parent, x, y)
	local absPos = parent.AbsolutePosition
	local rx = x - absPos.X
	local ry = y - absPos.Y
	local size = math.max(parent.AbsoluteSize.X, parent.AbsoluteSize.Y) * 2.2

	local r = Create("Frame", {
		Size = UDim2.fromOffset(0, 0),
		Position = UDim2.fromOffset(rx, ry),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = C.WHITE,
		BackgroundTransparency = 0.82,
		ZIndex = 50,
		Parent = parent
	}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

	TweenPlay(r, TweenInfo.new(0.55, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
		Size = UDim2.fromOffset(size, size),
		BackgroundTransparency = 1
	}).Completed:Connect(function() r:Destroy() end)
end

-- ─── Library ─────────────────────────────────────────────────────────────────
local Library = {}
Library.__index = Library
Library.ToggleKey = Enum.KeyCode.RightShift
Library.Open = true

function Library.SettingManager()
	local Manager = {}
	function Manager:AddToTab(tab)
		tab:Paragraph({
			Title = "Bloop Settings",
			Content = "Manage UI settings and keybindings for Bloop (.) er."
		})
		tab:Keybind({
			Name = "Toggle UI Key",
			Default = Library.ToggleKey,
			OnChange = function(New)
				Library.ToggleKey = New
			end
		})
		tab:Button({
			Name = "Unload UI",
			Callback = function()
				local core = (pcall(gethui) and gethui()) or Player:WaitForChild("PlayerGui")
				local gui = core:FindFirstChild("BloopUI") or Player.PlayerGui:FindFirstChild("BloopUI")
				if gui then gui:Destroy() end
				local notifGui = core:FindFirstChild("BloopNotifications")
				if notifGui then notifGui:Destroy() end
			end
		})
	end
	return Manager
end

function Library:New(config)
	local self = setmetatable({}, Library)
	self.Open = true

	-- ── Root ScreenGui ──────────────────────────────────────────────────────
	local guiParent
	if pcall(function() return gethui() end) then guiParent = gethui()
	else guiParent = Player:WaitForChild("PlayerGui") end

	self.Gui = Create("ScreenGui", {
		Name = "BloopUI",
		ResetOnSpawn = false,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
		Parent = guiParent
	})

	-- ── Backdrop shadow ─────────────────────────────────────────────────────
	self.Shadow = Create("Frame", {
		Size = UDim2.fromOffset(566, 396),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.new(0, 0, 0),
		BackgroundTransparency = 0.55,
		BorderSizePixel = 0,
		Parent = self.Gui
	}, { Create("UICorner", {CornerRadius = UDim.new(0, 16)}) })

	-- ── Main frame ──────────────────────────────────────────────────────────
	self.Main = Create("Frame", {
		Name = "BloopMain",
		Size = UDim2.fromOffset(550, 380),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = C.BG,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Parent = self.Gui
	}, {
		Create("UICorner", {CornerRadius = UDim.new(0, 14)}),
		Create("UIStroke", {Color = C.BORDER, Thickness = 1.2, Transparency = 0}),
	})

	-- Subtle inner glow line at top
	Create("Frame", {
		Size = UDim2.new(0.5, 0, 0, 1),
		Position = UDim2.new(0.25, 0, 0, 0),
		BackgroundColor3 = C.ACCENT,
		BackgroundTransparency = 0.55,
		BorderSizePixel = 0,
		ZIndex = 10,
		Parent = self.Main
	}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

	-- ── Top bar ─────────────────────────────────────────────────────────────
	self.Top = Create("Frame", {
		Size = UDim2.new(1, 0, 0, 52),
		BackgroundColor3 = C.SURFACE,
		BorderSizePixel = 0,
		ZIndex = 5,
		Parent = self.Main
	}, {
		Create("UICorner", {CornerRadius = UDim.new(0, 14)}),
		-- bottom border
		Create("Frame", {
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, -1),
			BackgroundColor3 = C.BORDER,
			BorderSizePixel = 0,
		})
	})

	-- Logo dot
	Create("Frame", {
		Size = UDim2.fromOffset(7, 7),
		Position = UDim2.fromOffset(16, 22),
		BackgroundColor3 = C.ACCENT,
		ZIndex = 6,
		Parent = self.Top
	}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

	-- Title
	Create("TextLabel", {
		Text = config.Title or "Bloop (.) er",
		Font = Enum.Font.GothamBold,
		TextSize = 15,
		TextColor3 = C.TEXT,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(32, 10),
		Size = UDim2.new(0, 240, 0, 20),
		ZIndex = 6,
		Parent = self.Top
	})

	-- Subtitle
	Create("TextLabel", {
		Text = config.Footer or "bloop (.) er  •  v3.0",
		Font = Enum.Font.GothamMedium,
		TextSize = 10,
		TextColor3 = C.TEXT_DIM,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Position = UDim2.fromOffset(32, 30),
		Size = UDim2.new(0, 240, 0, 14),
		ZIndex = 6,
		Parent = self.Top
	})

	-- ── Toggle button ───────────────────────────────────────────────────────
	local IsOpen = true

	local ToggleBtn = Create("TextButton", {
		Text = "",
		Size = UDim2.fromOffset(32, 32),
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(1, -46, 0.5, 0),
		BackgroundColor3 = C.SURFACE2,
		ZIndex = 20,
		Parent = self.Top
	}, {
		Create("UICorner", {CornerRadius = UDim.new(0, 9)}),
		Create("UIStroke", {Color = C.BORDER2, Thickness = 1}),
	})

	-- Hamburger lines
	local function MakeHamLine(y)
		return Create("Frame", {
			Size = UDim2.fromOffset(14, 2),
			Position = UDim2.new(0.5, -7, 0, y),
			BackgroundColor3 = C.ACCENT,
			BorderSizePixel = 0,
			ZIndex = 21,
			Parent = ToggleBtn
		}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })
	end
	local hL1 = MakeHamLine(9)
	local hL2 = MakeHamLine(15)
	local hL3 = MakeHamLine(21)

	-- ── Container ───────────────────────────────────────────────────────────
	self.Container = Create("Frame", {
		Size = UDim2.new(1, 0, 1, -52),
		Position = UDim2.fromOffset(0, 52),
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Visible = true,
		ZIndex = 2,
		Parent = self.Main
	})

	ToggleBtn.MouseButton1Click:Connect(function()
		IsOpen = not IsOpen
		local targetSize = IsOpen and UDim2.fromOffset(550, 380) or UDim2.fromOffset(550, 52)

		TweenPlay(self.Main, SMOOTH, {Size = targetSize})
		TweenPlay(self.Shadow, SMOOTH, {
			Size = IsOpen and UDim2.fromOffset(566, 396) or UDim2.fromOffset(566, 68)
		})

		if IsOpen then
			task.delay(0.08, function()
				if IsOpen then self.Container.Visible = true end
			end)
			-- animate lines back
			TweenPlay(hL1, FAST, {BackgroundTransparency = 0, Size = UDim2.fromOffset(14, 2)})
			TweenPlay(hL3, FAST, {BackgroundTransparency = 0})
		else
			self.Container.Visible = false
			-- animate lines to X
			TweenPlay(hL1, FAST, {Size = UDim2.fromOffset(10, 2)})
			TweenPlay(hL3, FAST, {BackgroundTransparency = 0.6})
		end
	end)

	-- ── Sidebar ─────────────────────────────────────────────────────────────
	self.Sidebar = Create("Frame", {
		Size = UDim2.new(0, 148, 1, -14),
		Position = UDim2.fromOffset(8, 7),
		BackgroundColor3 = C.SURFACE,
		Parent = self.Container
	}, {
		Create("UICorner", {CornerRadius = UDim.new(0, 10)}),
		Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
	})

	-- Animated highlight pill
	self.TabHighlight = Create("Frame", {
		Size = UDim2.new(1, -14, 0, 32),
		Position = UDim2.fromOffset(7, 7),
		BackgroundColor3 = C.ACCENT_DIM,
		BackgroundTransparency = 0.3,
		Visible = false,
		ZIndex = 2,
		Parent = self.Sidebar
	}, {
		Create("UICorner", {CornerRadius = UDim.new(0, 8)}),
		Create("UIStroke", {Color = C.ACCENT, Thickness = 1, Transparency = 0.6}),
	})

	self.TabHolder = Create("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ZIndex = 3,
		Parent = self.Sidebar
	}, {
		Create("UIListLayout", {Padding = UDim.new(0, 4)}),
		Create("UIPadding", {
			PaddingTop = UDim.new(0, 7),
			PaddingLeft = UDim.new(0, 7),
			PaddingRight = UDim.new(0, 7)
		})
	})

	-- ── Pages area ──────────────────────────────────────────────────────────
	self.Pages = Create("Frame", {
		Size = UDim2.new(1, -176, 1, -14),
		Position = UDim2.fromOffset(166, 7),
		BackgroundTransparency = 1,
		Parent = self.Container
	})

	-- ── Drag ────────────────────────────────────────────────────────────────
	do
		local dragging, dragStart, startPos
		self.Top.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1
			or input.UserInputType == Enum.UserInputType.Touch then
				dragging = true
				dragStart = input.Position
				startPos = self.Main.Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then dragging = false end
				end)
			end
		end)
		UIS.InputChanged:Connect(function(input)
			if dragging and (
				input.UserInputType == Enum.UserInputType.MouseMovement
				or input.UserInputType == Enum.UserInputType.Touch
			) then
				local delta = input.Position - dragStart
				local newPos = UDim2.new(
					startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y
				)
				self.Main.Position = newPos
				self.Shadow.Position = newPos
			end
		end)
	end

	-- ── Global toggle keybind ────────────────────────────────────────────────
	UIS.InputBegan:Connect(function(input, gpe)
		if not gpe and input.KeyCode == Library.ToggleKey then
			self.Open = not self.Open
			self.Main.Visible = self.Open
			self.Shadow.Visible = self.Open
		end
	end)

	-- ── Notification system ──────────────────────────────────────────────────
	function Library:Notify(cfg)
		local title    = cfg.Title or "Notice"
		local content  = cfg.Content or ""
		local duration = cfg.Time or 5
		local kind     = cfg.Kind or "info" -- "info" | "success" | "error"

		local accentCol = kind == "success" and C.SUCCESS
			or kind == "error" and C.DANGER
			or C.ACCENT

		local NotifGui = guiParent:FindFirstChild("BloopNotifications")
		if not NotifGui then
			NotifGui = Create("ScreenGui", {
				Name = "BloopNotifications",
				ResetOnSpawn = false,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				Parent = guiParent
			})
		end

		local Holder = NotifGui:FindFirstChild("Holder")
		if not Holder then
			Holder = Create("Frame", {
				Name = "Holder",
				Size = UDim2.new(0, 270, 1, -20),
				Position = UDim2.new(1, -280, 0, 10),
				BackgroundTransparency = 1,
				Parent = NotifGui
			}, {
				Create("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical
				})
			})
		end

		local Notif = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			BackgroundColor3 = C.SURFACE,
			BackgroundTransparency = 0,
			ClipsDescendants = true,
			Parent = Holder
		}, {
			Create("UICorner", {CornerRadius = UDim.new(0, 10)}),
			Create("UIStroke", {Color = accentCol, Thickness = 1.2, Transparency = 0.3}),
		})

		-- Left accent bar
		Create("Frame", {
			Size = UDim2.new(0, 3, 1, -16),
			Position = UDim2.fromOffset(0, 8),
			BackgroundColor3 = accentCol,
			BorderSizePixel = 0,
			ZIndex = 3,
			Parent = Notif
		}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

		local TitleLbl = Create("TextLabel", {
			Text = title:upper(),
			Font = Enum.Font.GothamBold,
			TextSize = 11,
			TextColor3 = accentCol,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			Position = UDim2.fromOffset(14, 0),
			Size = UDim2.new(1, -24, 0, 18),
			TextXAlignment = Enum.TextXAlignment.Left,
			ZIndex = 3,
			Parent = Notif
		})

		local Div = Create("Frame", {
			Size = UDim2.new(1, -24, 0, 1),
			Position = UDim2.fromOffset(14, 20),
			BackgroundColor3 = C.BORDER,
			BorderSizePixel = 0,
			ZIndex = 3,
			Parent = Notif
		})

		local ContentLbl = Create("TextLabel", {
			Text = content,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextColor3 = C.TEXT_SUB,
			BackgroundTransparency = 1,
			TextTransparency = 0,
			Position = UDim2.fromOffset(14, 26),
			Size = UDim2.new(1, -24, 0, 0),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			TextWrapped = true,
			ZIndex = 3,
			Parent = Notif
		})

		-- Measure and grow
		local ts = game:GetService("TextService"):GetTextSize(
			content, 12, Enum.Font.GothamMedium, Vector2.new(230, 10000)
		)
		local targetH = ts.Y + 46
		ContentLbl.Size = UDim2.new(1, -24, 0, ts.Y)

		TweenPlay(Notif, SMOOTH, {Size = UDim2.new(1, 0, 0, targetH)})

		task.delay(duration, function()
			TweenPlay(Notif, SMOOTH, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0)
			}).Completed:Connect(function() Notif:Destroy() end)
		end)
	end

	-- ── Tab factory ──────────────────────────────────────────────────────────
	function self:NewTab(name)
		local Tab = {}

		local TabBg = Create("Frame", {
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundColor3 = C.SURFACE2,
			BackgroundTransparency = 1,
			ZIndex = 4,
			Parent = self.TabHolder
		}, {
			Create("UICorner", {CornerRadius = UDim.new(0, 8)}),
		})

		-- Small indicator dot
		local Dot = Create("Frame", {
			Size = UDim2.fromOffset(5, 5),
			Position = UDim2.new(0, 10, 0.5, -2),
			BackgroundColor3 = C.TEXT_DIM,
			ZIndex = 5,
			Parent = TabBg
		}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

		local TabBtn = Create("TextButton", {
			Text = name,
			Font = Enum.Font.GothamMedium,
			TextSize = 12,
			TextColor3 = C.TEXT_DIM,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			ZIndex = 5,
			Parent = TabBg
		})

		-- Indent label to make room for dot
		Create("UIPadding", {PaddingLeft = UDim.new(0, 24), Parent = TabBtn})

		-- Page (scrolling)
		local Page = Create("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			Visible = false,
			ScrollBarThickness = 2,
			ScrollBarImageColor3 = C.ACCENT,
			ScrollBarImageTransparency = 0.4,
			CanvasSize = UDim2.new(0, 0, 0, 0),
			ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
			Parent = self.Pages
		}, {
			Create("UIListLayout", {
				Padding = UDim.new(0, 7),
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Create("UIPadding", {
				PaddingTop = UDim.new(0, 3),
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 6),
				PaddingBottom = UDim.new(0, 6)
			})
		})

		local UIListLayout = Page:FindFirstChildOfClass("UIListLayout")
		local function UpdateCanvas()
			Page.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 16)
		end
		UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvas)
		task.spawn(UpdateCanvas)

		-- Tab click
		TabBtn.MouseButton1Click:Connect(function()
			-- Move highlight
			self.TabHighlight.Visible = true
			local yPos = TabBg.AbsolutePosition.Y - self.Sidebar.AbsolutePosition.Y
			TweenPlay(self.TabHighlight, SMOOTH, {Position = UDim2.fromOffset(7, yPos)})

			-- Hide all pages, deactivate all tabs
			for _, p in pairs(self.Pages:GetChildren()) do
				if p:IsA("ScrollingFrame") then p.Visible = false end
			end
			for _, bg in pairs(self.TabHolder:GetChildren()) do
				if bg:IsA("Frame") then
					local btn = bg:FindFirstChildOfClass("TextButton")
					local dot = bg:FindFirstChildOfClass("Frame")
					if btn then TweenPlay(btn, FAST, {TextColor3 = C.TEXT_DIM}) end
					if dot then TweenPlay(dot, FAST, {BackgroundColor3 = C.TEXT_DIM}) end
				end
			end

			Page.Visible = true
			TweenPlay(TabBtn, FAST, {TextColor3 = C.TEXT})
			TweenPlay(Dot, FAST, {BackgroundColor3 = C.ACCENT})
		end)

		-- Hover on tab
		TabBtn.MouseEnter:Connect(function()
			TweenPlay(TabBg, FAST, {BackgroundTransparency = 0.7})
		end)
		TabBtn.MouseLeave:Connect(function()
			TweenPlay(TabBg, FAST, {BackgroundTransparency = 1})
		end)

		-- ── Helper: card base ───────────────────────────────────────────────
		local function Card(height)
			local f = Create("Frame", {
				Size = UDim2.new(1, 0, 0, height),
				BackgroundColor3 = C.CARD,
				ClipsDescendants = true,
				Parent = Page
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 9)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
			})
			return f
		end

		-- ── Button ──────────────────────────────────────────────────────────
		function Tab:Button(config)
			local text     = config.Name or config.Text or "Button"
			local callback = config.Callback or function() end

			local BtnBg = Card(42)

			-- Label
			Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(1, -90, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = BtnBg
			})

			local Badge = Create("Frame", {
				Size = UDim2.fromOffset(46, 22),
				Position = UDim2.new(1, -56, 0.5, -11),
				BackgroundColor3 = C.SURFACE2,
				Parent = BtnBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
				Create("UIStroke", {Color = C.BORDER2, Thickness = 1}),
				Create("TextLabel", {
					Text = "RUN",
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextColor3 = C.TEXT_SUB,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				})
			})
			Badge:FindFirstChildOfClass("TextLabel").Parent = Badge

			local Hit = Create("TextButton", {
				Text = "", BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1), ZIndex = 10,
				Parent = BtnBg
			})

			Hit.MouseButton1Down:Connect(function(x, y)
				Ripple(BtnBg, x, y)
				TweenPlay(BtnBg, FAST, {BackgroundColor3 = Color3.fromRGB(28, 30, 48)})
				TweenPlay(Badge, FAST, {BackgroundColor3 = C.ACCENT})
				TweenPlay(Badge:FindFirstChildOfClass("TextLabel"), FAST, {TextColor3 = C.WHITE})
			end)
			Hit.MouseButton1Up:Connect(function()
				TweenPlay(BtnBg, SMOOTH, {BackgroundColor3 = C.CARD})
				TweenPlay(Badge, SMOOTH, {BackgroundColor3 = C.SURFACE2})
				TweenPlay(Badge:FindFirstChildOfClass("TextLabel"), SMOOTH, {TextColor3 = C.TEXT_SUB})
				task.spawn(callback)
			end)
			Hit.MouseEnter:Connect(function()
				TweenPlay(BtnBg, FAST, {BackgroundColor3 = Color3.fromRGB(24, 24, 36)})
			end)
			Hit.MouseLeave:Connect(function()
				TweenPlay(BtnBg, FAST, {BackgroundColor3 = C.CARD})
			end)
		end

		-- ── Toggle ──────────────────────────────────────────────────────────
		function Tab:Toggle(config)
			local text     = config.Name or "Toggle"
			local callback = config.Callback or function() end
			local state    = config.Default or false

			local TglBg = Card(42)

			Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(1, -72, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = TglBg
			})

			local Track = Create("Frame", {
				Size = UDim2.fromOffset(38, 20),
				Position = UDim2.new(1, -52, 0.5, -10),
				BackgroundColor3 = state and C.ACCENT or C.SURFACE2,
				Parent = TglBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(1, 0)}),
				Create("UIStroke", {
					Color = state and C.ACCENT or C.BORDER2,
					Thickness = 1
				}),
			})

			local Knob = Create("Frame", {
				Size = UDim2.fromOffset(14, 14),
				Position = state and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3),
				BackgroundColor3 = C.WHITE,
				Parent = Track
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

			-- Glow behind knob when on
			local KnobGlow = Create("Frame", {
				Size = UDim2.fromOffset(18, 18),
				Position = UDim2.new(0.5, -9, 0.5, -9),
				BackgroundColor3 = C.ACCENT,
				BackgroundTransparency = state and 0.6 or 1,
				ZIndex = 0,
				Parent = Knob
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

			local function UpdateView(val)
				TweenPlay(Track, FAST, {
					BackgroundColor3 = val and C.ACCENT or C.SURFACE2
				})
				TweenPlay(Track:FindFirstChildOfClass("UIStroke"), FAST, {
					Color = val and C.ACCENT or C.BORDER2
				})
				TweenPlay(Knob, SPRING, {
					Position = val and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
				})
				TweenPlay(KnobGlow, FAST, {BackgroundTransparency = val and 0.6 or 1})
			end

			local Hit = Create("TextButton", {
				Text = "", BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1), ZIndex = 10,
				Parent = TglBg
			})
			Hit.MouseButton1Click:Connect(function()
				state = not state
				UpdateView(state)
				callback(state)
			end)
			Hit.MouseEnter:Connect(function()
				TweenPlay(TglBg, FAST, {BackgroundColor3 = Color3.fromRGB(24, 24, 36)})
			end)
			Hit.MouseLeave:Connect(function()
				TweenPlay(TglBg, FAST, {BackgroundColor3 = C.CARD})
			end)

			local API = {}
			function API:SetValue(val)
				state = val
				UpdateView(state)
				callback(state)
			end
			function API:GetValue() return state end
			return API
		end

		-- ── Slider ──────────────────────────────────────────────────────────
		function Tab:Slider(config)
			local text     = config.Name or "Slider"
			local min      = config.Min or 0
			local max      = config.Max or 100
			local default  = config.Default or min
			local decimals = config.Rounding or 0
			local callback = config.Callback or function() end

			local SliderBg = Card(52)

			Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 8),
				Size = UDim2.new(1, -90, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = SliderBg
			})

			local ValueBox = Create("Frame", {
				Size = UDim2.fromOffset(52, 20),
				Position = UDim2.new(1, -62, 0, 7),
				BackgroundColor3 = C.SURFACE2,
				Parent = SliderBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
				Create("TextLabel", {
					Text = tostring(default),
					Font = Enum.Font.GothamBold,
					TextSize = 11,
					TextColor3 = C.ACCENT,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				})
			})
			local ValLabel = ValueBox:FindFirstChildOfClass("TextLabel")
			ValLabel.Parent = ValueBox

			local Track = Create("Frame", {
				Size = UDim2.new(1, -28, 0, 4),
				Position = UDim2.new(0, 14, 1, -14),
				BackgroundColor3 = C.SURFACE2,
				Parent = SliderBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(1, 0)}),
			})

			local pct = (default - min) / (max - min)

			local Fill = Create("Frame", {
				Size = UDim2.fromScale(pct, 1),
				BackgroundColor3 = C.ACCENT,
				Parent = Track
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

			-- Gradient on fill
			local FillGrad = Create("UIGradient", {
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, C.ACCENT2),
					ColorSequenceKeypoint.new(1, C.ACCENT),
				}),
				Parent = Fill
			})

			local Thumb = Create("Frame", {
				Size = UDim2.fromOffset(14, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(pct, 0, 0.5, 0),
				BackgroundColor3 = C.WHITE,
				ZIndex = 5,
				Parent = Track
			}, {
				Create("UICorner", {CornerRadius = UDim.new(1, 0)}),
				Create("UIStroke", {Color = C.ACCENT, Thickness = 1.5}),
			})

			local dragging = false

			local function UpdateSlider(input)
				local rel = math.clamp(
					(input.Position.X - Track.AbsolutePosition.X) / Track.AbsoluteSize.X, 0, 1
				)
				local raw = min + (max - min) * rel
				local val
				if decimals > 0 then
					local factor = 10 ^ decimals
					val = math.floor(raw * factor + 0.5) / factor
				else
					val = math.floor(raw + 0.5)
				end

				ValLabel.Text = tostring(val)
				TweenPlay(Fill, FAST, {Size = UDim2.fromScale(rel, 1)})
				TweenPlay(Thumb, FAST, {Position = UDim2.new(rel, 0, 0.5, 0)})
				callback(val)
			end

			SliderBg.InputBegan:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true
					UpdateSlider(i)
					TweenPlay(Thumb, FAST, {Size = UDim2.fromOffset(16, 16)})
				end
			end)
			UIS.InputChanged:Connect(function(i)
				if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
					UpdateSlider(i)
				end
			end)
			UIS.InputEnded:Connect(function(i)
				if i.UserInputType == Enum.UserInputType.MouseButton1 and dragging then
					dragging = false
					TweenPlay(Thumb, SPRING, {Size = UDim2.fromOffset(14, 14)})
				end
			end)
		end

		-- ── Dropdown ────────────────────────────────────────────────────────
		function Tab:Dropdown(config)
			local text     = config.Name or "Dropdown"
			local list     = config.List or {}
			local default  = config.Default
			local callback = config.Callback or function() end

			local expanded       = false
			local itemH          = 30
			local collapsedH     = 42
			local expandedH      = collapsedH + #list * itemH + 12

			local DropBg = Create("Frame", {
				Size = UDim2.new(1, 0, 0, collapsedH),
				BackgroundColor3 = C.CARD,
				ClipsDescendants = true,
				Parent = Page
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 9)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
			})

			local Header = Create("TextButton", {
				Size = UDim2.new(1, 0, 0, collapsedH),
				BackgroundTransparency = 1,
				Text = "",
				ZIndex = 5,
				Parent = DropBg
			})

			local TitleLbl = Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(1, -48, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				ZIndex = 5,
				Parent = Header
			})

			-- Arrow chevron (two lines)
			local ArrowFrame = Create("Frame", {
				Size = UDim2.fromOffset(16, 10),
				Position = UDim2.new(1, -30, 0.5, -5),
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = Header
			})
			Create("Frame", {
				Size = UDim2.fromOffset(9, 2),
				Position = UDim2.fromOffset(0, 4),
				BackgroundColor3 = C.TEXT_DIM,
				BorderSizePixel = 0,
				Rotation = 35,
				ZIndex = 5,
				Parent = ArrowFrame
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })
			Create("Frame", {
				Size = UDim2.fromOffset(9, 2),
				Position = UDim2.fromOffset(7, 4),
				BackgroundColor3 = C.TEXT_DIM,
				BorderSizePixel = 0,
				Rotation = -35,
				ZIndex = 5,
				Parent = ArrowFrame
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

			-- Separator
			Create("Frame", {
				Size = UDim2.new(1, -28, 0, 1),
				Position = UDim2.fromOffset(14, collapsedH - 1),
				BackgroundColor3 = C.BORDER,
				BorderSizePixel = 0,
				ZIndex = 3,
				Parent = DropBg
			})

			-- Options list
			local OptionHolder = Create("Frame", {
				Size = UDim2.new(1, -20, 0, #list * itemH),
				Position = UDim2.fromOffset(10, collapsedH + 5),
				BackgroundTransparency = 1,
				ZIndex = 5,
				Parent = DropBg
			}, {
				Create("UIListLayout", {
					Padding = UDim.new(0, 2),
					SortOrder = Enum.SortOrder.LayoutOrder
				})
			})

			-- Selection highlight pill
			local SelHighlight = Create("Frame", {
				Size = UDim2.new(1, 0, 0, itemH - 2),
				BackgroundColor3 = C.ACCENT_DIM,
				BackgroundTransparency = 0.35,
				Visible = false,
				ZIndex = 4,
				Parent = OptionHolder
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
				Create("UIStroke", {Color = C.ACCENT, Thickness = 1, Transparency = 0.5}),
			})

			local function Select(v, btn)
				SelHighlight.Visible = true
				local targetY = btn.AbsolutePosition.Y - OptionHolder.AbsolutePosition.Y
				TweenPlay(SelHighlight, SMOOTH, {Position = UDim2.fromOffset(0, targetY)})

				for _, o in pairs(OptionHolder:GetChildren()) do
					if o:IsA("TextButton") then
						TweenPlay(o, FAST, {TextColor3 = C.TEXT_SUB})
					end
				end
				TweenPlay(btn, FAST, {TextColor3 = C.WHITE})
				TitleLbl.Text = text .. "  ›  " .. v
				callback(v)
			end

			for i, v in ipairs(list) do
				local Opt = Create("TextButton", {
					Text = v,
					Font = Enum.Font.GothamMedium,
					TextSize = 12,
					TextColor3 = C.TEXT_SUB,
					Size = UDim2.new(1, 0, 0, itemH),
					BackgroundTransparency = 1,
					LayoutOrder = i,
					ZIndex = 6,
					Parent = OptionHolder
				})
				Opt.MouseButton1Click:Connect(function() Select(v, Opt) end)
				Opt.MouseEnter:Connect(function()
					TweenPlay(Opt, FAST, {TextColor3 = C.TEXT})
				end)
				Opt.MouseLeave:Connect(function()
					if Opt.TextColor3 ~= C.WHITE then
						TweenPlay(Opt, FAST, {TextColor3 = C.TEXT_SUB})
					end
				end)

				if default and v == default then
					task.spawn(function()
						repeat task.wait() until Opt.AbsolutePosition.Y > 0
						Select(v, Opt)
					end)
				end
			end

			Header.MouseButton1Click:Connect(function()
				expanded = not expanded
				TweenPlay(DropBg, SMOOTH, {
					Size = UDim2.new(1, 0, 0, expanded and expandedH or collapsedH)
				})
				-- Rotate chevron lines
				local lines = ArrowFrame:GetChildren()
				if #lines >= 2 then
					TweenPlay(lines[1], FAST, {Rotation = expanded and -35 or 35})
					TweenPlay(lines[2], FAST, {Rotation = expanded and 35 or -35})
				end
				TweenPlay(Header, FAST, {
					BackgroundColor3 = expanded and Color3.fromRGB(25, 25, 38) or C.CARD
				})
			end)
		end

		-- ── Label ───────────────────────────────────────────────────────────
		function Tab:Label(config)
			local text = config.Text or "Label"

			local LabelBg = Create("Frame", {
				Size = UDim2.new(1, 0, 0, 30),
				BackgroundColor3 = C.CARD,
				BackgroundTransparency = 0.4,
				Parent = Page
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 9)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1, Transparency = 0.4}),
			})

			local Lbl = Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = C.TEXT_SUB,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(1, -28, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextWrapped = true,
				Parent = LabelBg
			})

			local function Resize()
				local sz = game:GetService("TextService"):GetTextSize(
					Lbl.Text, Lbl.TextSize, Lbl.Font,
					Vector2.new(Lbl.AbsoluteSize.X, 10000)
				)
				LabelBg.Size = UDim2.new(1, 0, 0, sz.Y + 16)
				Lbl.Size = UDim2.new(1, -28, 0, sz.Y)
			end
			Lbl:GetPropertyChangedSignal("AbsoluteSize"):Connect(Resize)
			task.spawn(Resize)
		end

		-- ── Paragraph ───────────────────────────────────────────────────────
		function Tab:Paragraph(config)
			local title   = config.Title or "Section"
			local content = config.Content or ""

			local SectionBg = Create("Frame", {
				Size = UDim2.new(1, 0, 0, 65),
				BackgroundColor3 = C.CARD,
				Parent = Page
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 9)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
			})

			-- Top accent line
			Create("Frame", {
				Size = UDim2.new(0, 3, 0, 18),
				Position = UDim2.fromOffset(0, 10),
				BackgroundColor3 = C.ACCENT,
				ZIndex = 3,
				Parent = SectionBg
			}, { Create("UICorner", {CornerRadius = UDim.new(1, 0)}) })

			Create("TextLabel", {
				Text = title:upper(),
				Font = Enum.Font.GothamBold,
				TextSize = 10,
				TextColor3 = C.ACCENT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 8),
				Size = UDim2.new(1, -28, 0, 16),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = SectionBg
			})

			Create("Frame", {
				Size = UDim2.new(1, -28, 0, 1),
				Position = UDim2.fromOffset(14, 28),
				BackgroundColor3 = C.BORDER,
				BorderSizePixel = 0,
				Parent = SectionBg
			})

			local Desc = Create("TextLabel", {
				Text = content,
				Font = Enum.Font.GothamMedium,
				TextSize = 12,
				TextColor3 = C.TEXT_SUB,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 36),
				Size = UDim2.new(1, -28, 0, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				TextWrapped = true,
				Parent = SectionBg
			})

			local function Resize()
				local sz = game:GetService("TextService"):GetTextSize(
					Desc.Text, Desc.TextSize, Desc.Font,
					Vector2.new(Desc.AbsoluteSize.X, 10000)
				)
				SectionBg.Size = UDim2.new(1, 0, 0, sz.Y + 48)
				Desc.Size = UDim2.new(1, -28, 0, sz.Y)
			end
			Desc:GetPropertyChangedSignal("AbsoluteSize"):Connect(Resize)
			task.spawn(Resize)
		end

		-- ── Keybind ─────────────────────────────────────────────────────────
		function Tab:Keybind(config)
			local text     = config.Name or "Keybind"
			local default  = config.Default or Enum.KeyCode.E
			local callback = config.Callback or function() end
			local onChange = config.OnChange or function() end
			local listening = false

			local BindBg = Card(40)

			Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(1, -88, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = BindBg
			})

			local BindBox = Create("Frame", {
				Size = UDim2.fromOffset(68, 24),
				Position = UDim2.new(1, -78, 0.5, -12),
				BackgroundColor3 = C.SURFACE2,
				Parent = BindBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
				Create("UIStroke", {Color = C.BORDER2, Thickness = 1}),
				Create("TextLabel", {
					Text = default.Name,
					Font = Enum.Font.GothamBold,
					TextSize = 10,
					TextColor3 = C.TEXT,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				})
			})
			local BindText = BindBox:FindFirstChildOfClass("TextLabel")
			BindText.Parent = BindBox

			local Hit = Create("TextButton", {
				Text = "", BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1), ZIndex = 10,
				Parent = BindBg
			})

			Hit.MouseButton1Click:Connect(function()
				listening = true
				BindText.Text = ". . ."
				TweenPlay(BindBox:FindFirstChildOfClass("UIStroke"), FAST, {Color = C.ACCENT})
				TweenPlay(BindBox, FAST, {BackgroundColor3 = C.ACCENT_DIM})
			end)

			UIS.InputBegan:Connect(function(input, gpe)
				if gpe then return end
				if listening and input.UserInputType == Enum.UserInputType.Keyboard then
					listening = false
					default = input.KeyCode
					BindText.Text = input.KeyCode.Name
					TweenPlay(BindBox:FindFirstChildOfClass("UIStroke"), FAST, {Color = C.BORDER2})
					TweenPlay(BindBox, FAST, {BackgroundColor3 = C.SURFACE2})
					onChange(input.KeyCode)
				elseif not listening
					and input.UserInputType == Enum.UserInputType.Keyboard
					and input.KeyCode == default then
					-- Flash feedback
					local t = TweenPlay(BindBox, TweenInfo.new(0.1), {BackgroundColor3 = C.ACCENT})
					t.Completed:Connect(function()
						TweenPlay(BindBox, SMOOTH, {BackgroundColor3 = C.SURFACE2})
					end)
					callback()
				end
			end)
		end

		-- ── Textbox ─────────────────────────────────────────────────────────
		function Tab:Textbox(config)
			local text        = config.Name or "Textbox"
			local placeholder = config.Placeholder or "Type here..."
			local callback    = config.Callback or function() end

			local BoxBg = Card(40)

			local Lbl = Create("TextLabel", {
				Text = text,
				Font = Enum.Font.GothamMedium,
				TextSize = 13,
				TextColor3 = C.TEXT,
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(14, 0),
				Size = UDim2.new(0.55, 0, 1, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				Parent = BoxBg
			})

			local InputHolder = Create("Frame", {
				Size = UDim2.new(0, 58, 0, 24),
				Position = UDim2.new(1, -72, 0.5, -12),
				BackgroundColor3 = C.SURFACE2,
				ClipsDescendants = true,
				Parent = BoxBg
			}, {
				Create("UICorner", {CornerRadius = UDim.new(0, 6)}),
				Create("UIStroke", {Color = C.BORDER, Thickness = 1}),
			})

			local Input = Create("TextBox", {
				Text = "",
				PlaceholderText = placeholder,
				PlaceholderColor3 = C.TEXT_DIM,
				Font = Enum.Font.GothamMedium,
				TextSize = 11,
				TextColor3 = C.WHITE,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -10, 1, 0),
				Position = UDim2.fromOffset(5, 0),
				TextXAlignment = Enum.TextXAlignment.Center,
				ClearTextOnFocus = false,
				Parent = InputHolder
			})

			Input.Focused:Connect(function()
				TweenPlay(InputHolder, SMOOTH, {
					Size = UDim2.new(0, 170, 0, 24),
					Position = UDim2.new(1, -184, 0.5, -12)
				})
				TweenPlay(InputHolder:FindFirstChildOfClass("UIStroke"), FAST, {Color = C.ACCENT})
				TweenPlay(Lbl, FAST, {TextTransparency = 0.45})
			end)

			Input.FocusLost:Connect(function(enter)
				TweenPlay(InputHolder, SMOOTH, {
					Size = UDim2.new(0, 58, 0, 24),
					Position = UDim2.new(1, -72, 0.5, -12)
				})
				TweenPlay(InputHolder:FindFirstChildOfClass("UIStroke"), FAST, {Color = C.BORDER})
				TweenPlay(Lbl, FAST, {TextTransparency = 0})
				callback(Input.Text, enter)
			end)
		end

		return Tab
	end

	-- Animate in on creation
	self.Main.Size = UDim2.fromOffset(540, 10)
	self.Main.BackgroundTransparency = 0.5
	TweenPlay(self.Main, SPRING, {
		Size = UDim2.fromOffset(550, 380),
		BackgroundTransparency = 0
	})

	return self
end

return Library
