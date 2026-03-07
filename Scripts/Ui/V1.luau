-- ts file was generated at discord.gg/25ms

local VapeUI = {}

Vape.__index = VapeUI

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local TweenService = game:GetService('TweenService')
local UserInputService = game:GetService('UserInputService')
local HttpService = game:GetService('HttpService')
local CoreGui = game:GetService('CoreGui')
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local function ProtectGui(obj)
    if syn and syn.protect_gui then
        syn.protect_gui(obj)
    elseif gethui then
        obj.Parent = gethui()
    else
        obj.Parent = CoreGui
    end
end
local function Tween(obj, info, properties)
    return TweenService:Create(obj, info, properties)
end
local function New(class, properties, children)
    local obj = Instance.new(class)

    if properties then
        for k, v in pairs(properties)do
            if k ~= 'Parent' then
                obj[k] = v
            end
        end
    end
    if children then
        for _, child in ipairs(children)do
            child.Parent = obj
        end
    end
    if properties and properties.Parent then
        obj.Parent = properties.Parent
    end

    return obj
end

local Icons = {
    sword = 'rbxassetid://7734053421',
    zap = 'rbxassetid://7734022108',
    wrench = 'rbxassetid://7734091626',
    gamepad = 'rbxassetid://7734051591',
    eye = 'rbxassetid://7734052075',
    shield = 'rbxassetid://7734045100',
    target = 'rbxassetid://7734091626',
    settings = 'rbxassetid://7734056494',
    x = 'rbxassetid://7734068321',
    check = 'rbxassetid://7734050699',
    chevron = 'rbxassetid://7734053032',
    plus = 'rbxassetid://7734063405',
    minus = 'rbxassetid://7734056605',
    search = 'rbxassetid://7734056494',
    bell = 'rbxassetid://7734052075',
    user = 'rbxassetid://7734091626',
    home = 'rbxassetid://7734056494',
    more = 'rbxassetid://7734063405',
}
local Themes = {
    Dark = {
        Background = Color3.fromHex('#0f0f0f'),
        BackgroundSecondary = Color3.fromHex('#1a1a1a'),
        BackgroundTertiary = Color3.fromHex('#252525'),
        Text = Color3.fromHex('#ffffff'),
        TextDark = Color3.fromHex('#a0a0a0'),
        Accent = Color3.fromHex('#7c3aed'),
        AccentDark = Color3.fromHex('#5b21b6'),
        Border = Color3.fromHex('#2a2a2a'),
        Success = Color3.fromHex('#22c55e'),
        Error = Color3.fromHex('#ef4444'),
        Warning = Color3.fromHex('#f59e0b'),
    },
    Light = {
        Background = Color3.fromHex('#ffffff'),
        BackgroundSecondary = Color3.fromHex('#f5f5f5'),
        BackgroundTertiary = Color3.fromHex('#e5e5e5'),
        Text = Color3.fromHex('#0f0f0f'),
        TextDark = Color3.fromHex('#6b7280'),
        Accent = Color3.fromHex('#7c3aed'),
        AccentDark = Color3.fromHex('#5b21b6'),
        Border = Color3.fromHex('#e5e7eb'),
        Success = Color3.fromHex('#22c55e'),
        Error = Color3.fromHex('#ef4444'),
        Warning = Color3.fromHex('#f59e0b'),
    },
    Vape = {
        Background = Color3.fromHex('#0a0a0a'),
        BackgroundSecondary = Color3.fromHex('#111111'),
        BackgroundTertiary = Color3.fromHex('#1a1a1a'),
        Text = Color3.fromHex('#ffffff'),
        TextDark = Color3.fromHex('#888888'),
        Accent = Color3.fromHex('#00ff88'),
        AccentDark = Color3.fromHex('#00cc6a'),
        Border = Color3.fromHex('#222222'),
        Success = Color3.fromHex('#00ff88'),
        Error = Color3.fromHex('#ff4444'),
        Warning = Color3.fromHex('#ffaa00'),
    },
}

function VapeUI:Init()
    local self = setmetatable({}, VapeUI)

    self.ScreenGui = New('ScreenGui', {
        Name = 'VapeUI',
        Parent = CoreGui,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })

    ProtectGui(self.ScreenGui)

    self.Notifications = New('ScreenGui', {
        Name = 'VapeUI_Notifications',
        Parent = CoreGui,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    })

    ProtectGui(self.Notifications)

    self.Theme = Themes.Vape
    self.Windows = {}
    self.NotifHolder = nil

    self:CreateNotificationHolder()

    return self
end
function VapeUI:CreateNotificationHolder()
    self.NotifHolder = New('Frame', {
        Name = 'NotificationHolder',
        Parent = self.Notifications,
        Size = UDim2.new(0, 300, 1, -20),
        Position = UDim2.new(1, -320, 0, 10),
        BackgroundTransparency = 1,
    }, {
        New('UIListLayout', {
            Padding = UDim.new(0, 8),
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    })
end
function VapeUI:CreateNotification(title, content, duration)
    duration = duration or 5

    local notif = New('Frame', {
        Name = 'Notification',
        Parent = self.NotifHolder,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = self.Theme.BackgroundSecondary,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    }, {
        New('UICorner', {
            CornerRadius = UDim.new(0, 8),
        }),
        New('UIStroke', {
            Color = self.Theme.Border,
            Thickness = 1,
        }),
        New('UIPadding', {
            PaddingLeft = UDim.new(0, 12),
            PaddingRight = UDim.new(0, 12),
            PaddingTop = UDim.new(0, 12),
            PaddingBottom = UDim.new(0, 12),
        }),
        New('Frame', {
            Name = 'Header',
            Size = UDim2.new(1, 0, 0, 20),
            BackgroundTransparency = 1,
        }, {
            New('UIListLayout', {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            New('ImageLabel', {
                Name = 'Icon',
                Size = UDim2.new(0, 16, 0, 16),
                BackgroundTransparency = 1,
                Image = Icons.bell,
                ImageColor3 = self.Theme.Accent,
            }),
            New('TextLabel', {
                Name = 'Title',
                Size = UDim2.new(1, -24, 1, 0),
                BackgroundTransparency = 1,
                Text = title,
                TextColor3 = self.Theme.Text,
                TextSize = 14,
                Font = Enum.Font.GothamBold,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
        }),
        New('TextLabel', {
            Name = 'Content',
            Size = UDim2.new(1, 0, 0, 0),
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.new(0, 0, 0, 28),
            BackgroundTransparency = 1,
            Text = content,
            TextColor3 = self.Theme.TextDark,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true,
        }),
    })
    local progress = New('Frame', {
        Name = 'Progress',
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
        Parent = notif,
    }, {
        New('UICorner', {
            CornerRadius = UDim.new(0, 1),
        }),
    })

    notif.Size = UDim2.new(1, 0, 0, 0)
    notif.BackgroundTransparency = 1

    Tween(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        Size = UDim2.new(1, 0, 0, notif.AbsoluteSize.Y),
        BackgroundTransparency = 0,
    }):Play()
    Tween(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 0, 0, 2),
    }):Play()
    task.delay(duration, function()
        Tween(notif, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1,
        }):Play()
        task.wait(0.3)
        notif:Destroy()
    end)
end
function VapeUI:CreateWindow(config)
    config = config or {}

    local window = {
        Title = config.Title or 'Vape',
        Subtitle = config.Subtitle or 'v4.0',
        Width = config.Width or 800,
        Height = config.Height or 500,
        ToggleKey = config.ToggleKey or Enum.KeyCode.RightShift,
        Categories = {},
        Modules = {},
        Gui = self.ScreenGui,
        Theme = self.Theme,
        Visible = true,
    }

    window.MainFrame = New('Frame', {
        Name = 'MainWindow',
        Parent = self.ScreenGui,
        Size = UDim2.new(0, window.Width, 0, window.Height),
        Position = UDim2.new(0.5, -window.Width / 2, 0.5, -window.Height / 2),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    }, {
        New('UICorner', {
            CornerRadius = UDim.new(0, 12),
        }),
        New('UIStroke', {
            Color = self.Theme.Border,
            Thickness = 1,
        }),
        New('Frame', {
            Name = 'Shadow',
            Size = UDim2.new(1, 20, 1, 20),
            Position = UDim2.new(0, -10, 0, -10),
            BackgroundTransparency = 1,
            ZIndex = -1,
        }, {
            New('ImageLabel', {
                Size = UDim2.new(1, 0, 1, 0),
                BackgroundTransparency = 1,
                Image = 'rbxassetid://131604521931759',
                ImageTransparency = 0.6,
                ScaleType = Enum.ScaleType.Slice,
                SliceCenter = Rect.new(50, 50, 50, 50),
                SliceScale = 0.5,
            }),
        }),
    })
    window.TopBar = New('Frame', {
        Name = 'TopBar',
        Parent = window.MainFrame,
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = self.Theme.BackgroundSecondary,
        BorderSizePixel = 0,
    }, {
        New('UICorner', {
            CornerRadius = UDim.new(0, 12),
        }),
        New('Frame', {
            Name = 'BottomLine',
            Size = UDim2.new(1, 0, 0, 1),
            Position = UDim2.new(0, 0, 1, 0),
            BackgroundColor3 = self.Theme.Border,
            BorderSizePixel = 0,
        }),
        New('Frame', {
            Name = 'TitleArea',
            Size = UDim2.new(1, -100, 1, 0),
            BackgroundTransparency = 1,
        }, {
            New('UIListLayout', {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 10),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            New('UIPadding', {
                PaddingLeft = UDim.new(0, 15),
            }),
            New('TextLabel', {
                Name = 'Title',
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.new(0, 0, 0, 20),
                BackgroundTransparency = 1,
                Text = window.Title,
                TextColor3 = self.Theme.Text,
                TextSize = 18,
                Font = Enum.Font.GothamBold,
            }),
            New('TextLabel', {
                Name = 'Subtitle',
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.new(0, 0, 0, 16),
                BackgroundTransparency = 1,
                Text = window.Subtitle,
                TextColor3 = self.Theme.TextDark,
                TextSize = 12,
                Font = Enum.Font.Gotham,
            }),
        }),
        New('Frame', {
            Name = 'Controls',
            Size = UDim2.new(0, 80, 1, 0),
            Position = UDim2.new(1, -90, 0, 0),
            BackgroundTransparency = 1,
        }, {
            New('UIListLayout', {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 8),
                VerticalAlignment = Enum.VerticalAlignment.Center,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
            }),
            New('UIPadding', {
                PaddingRight = UDim.new(0, 15),
            }),
        }),
    })

    New('Frame', {
        Name = 'CornerFix',
        Parent = window.TopBar,
        Size = UDim2.new(1, 0, 0, 12),
        Position = UDim2.new(0, 0, 1, -12),
        BackgroundColor3 = self.Theme.BackgroundSecondary,
        BorderSizePixel = 0,
    })

    window.Sidebar = New('Frame', {
        Name = 'Sidebar',
        Parent = window.MainFrame,
        Size = UDim2.new(0, 200, 1, -50),
        Position = UDim2.new(0, 0, 0, 50),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, {
        New('Frame', {
            Name = 'RightLine',
            Size = UDim2.new(0, 1, 1, 0),
            Position = UDim2.new(1, 0, 0, 0),
            BackgroundColor3 = self.Theme.Border,
            BorderSizePixel = 0,
        }),
        New('ScrollingFrame', {
            Name = 'TabContainer',
            Size = UDim2.new(1, -1, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 0,
            ScrollBarImageTransparency = 1,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
        }, {
            New('UIListLayout', {
                Padding = UDim.new(0, 2),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            New('UIPadding', {
                PaddingLeft = UDim.new(0, 10),
                PaddingRight = UDim.new(0, 10),
                PaddingTop = UDim.new(0, 10),
                PaddingBottom = UDim.new(0, 10),
            }),
        }),
    })
    window.Content = New('Frame', {
        Name = 'Content',
        Parent = window.MainFrame,
        Size = UDim2.new(1, -200, 1, -50),
        Position = UDim2.new(0, 200, 0, 50),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    })

    local dragging = false
    local dragStart = nil
    local startPos = nil

    window.TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = window.MainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart

            window.MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == window.ToggleKey then
            window.Visible = not window.Visible
            window.MainFrame.Visible = window.Visible
        end
    end)

    function window:Tab(config)
        config = config or {}

        local tab = {
            Title = config.Title or 'Tab',
            Icon = config.Icon or 'home',
            Sections = {},
            Active = false,
        }

        tab.Button = New('TextButton', {
            Name = tab.Title .. 'Tab',
            Parent = window.Sidebar.TabContainer,
            Size = UDim2.new(1, 0, 0, 40),
            BackgroundColor3 = window.Theme.Background,
            Text = '',
            AutoButtonColor = false,
        }, {
            New('UICorner', {
                CornerRadius = UDim.new(0, 8),
            }),
            New('UIStroke', {
                Color = window.Theme.Border,
                Thickness = 1,
                Transparency = 1,
            }),
            New('UIListLayout', {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0, 10),
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            New('UIPadding', {
                PaddingLeft = UDim.new(0, 12),
            }),
            New('ImageLabel', {
                Name = 'Icon',
                Size = UDim2.new(0, 18, 0, 18),
                BackgroundTransparency = 1,
                Image = Icons[tab.Icon] or Icons.home,
                ImageColor3 = window.Theme.TextDark,
            }),
            New('TextLabel', {
                Name = 'Title',
                Size = UDim2.new(1, -28, 1, 0),
                BackgroundTransparency = 1,
                Text = tab.Title,
                TextColor3 = window.Theme.TextDark,
                TextSize = 14,
                Font = Enum.Font.GothamSemibold,
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
        })
        tab.Container = New('ScrollingFrame', {
            Name = tab.Title .. 'Content',
            Parent = window.Content,
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            ScrollBarThickness = 2,
            ScrollBarImageColor3 = window.Theme.Accent,
            CanvasSize = UDim2.new(0, 0, 0, 0),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            Visible = false,
        }, {
            New('UIListLayout', {
                Padding = UDim.new(0, 10),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            New('UIPadding', {
                PaddingLeft = UDim.new(0, 15),
                PaddingRight = UDim.new(0, 15),
                PaddingTop = UDim.new(0, 15),
                PaddingBottom = UDim.new(0, 15),
            }),
        })

        tab.Button.MouseButton1Click:Connect(function()
            for _, t in ipairs(window.Categories)do
                t:SetActive(false)
            end

            tab:SetActive(true)
        end)

        function tab:SetActive(active)
            self.Active = active
            self.Container.Visible = active

            Tween(self.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = active and window.Theme.BackgroundTertiary or window.Theme.Background,
            }):Play()
            Tween(self.Button.Icon, TweenInfo.new(0.2), {
                ImageColor3 = active and window.Theme.Accent or window.Theme.TextDark,
            }):Play()
            Tween(self.Button.Title, TweenInfo.new(0.2), {
                TextColor3 = active and window.Theme.Text or window.Theme.TextDark,
            }):Play()

            self.Button.UIStroke.Transparency = active and 0 or 1
        end
        function tab:Section(config)
            config = config or {}

            local section = {
                Title = config.Title or 'Section',
                Elements = {},
            }

            section.Frame = New('Frame', {
                Name = section.Title .. 'Section',
                Parent = tab.Container,
                Size = UDim2.new(1, 0, 0, 0),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = window.Theme.BackgroundSecondary,
                BorderSizePixel = 0,
            }, {
                New('UICorner', {
                    CornerRadius = UDim.new(0, 10),
                }),
                New('UIStroke', {
                    Color = window.Theme.Border,
                    Thickness = 1,
                }),
                New('Frame', {
                    Name = 'Header',
                    Size = UDim2.new(1, 0, 0, 35),
                    BackgroundTransparency = 1,
                }, {
                    New('UIListLayout', {
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 8),
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                    New('UIPadding', {
                        PaddingLeft = UDim.new(0, 12),
                    }),
                    New('ImageLabel', {
                        Name = 'Icon',
                        Size = UDim2.new(0, 16, 0, 16),
                        BackgroundTransparency = 1,
                        Image = Icons[config.Icon] or Icons.settings,
                        ImageColor3 = window.Theme.Accent,
                    }),
                    New('TextLabel', {
                        Name = 'Title',
                        Size = UDim2.new(1, -24, 1, 0),
                        BackgroundTransparency = 1,
                        Text = section.Title,
                        TextColor3 = window.Theme.Text,
                        TextSize = 14,
                        Font = Enum.Font.GothamBold,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                }),
                New('Frame', {
                    Name = 'Content',
                    Size = UDim2.new(1, 0, 0, 0),
                    Position = UDim2.new(0, 0, 0, 35),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                }, {
                    New('UIListLayout', {
                        Padding = UDim.new(0, 8),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                    New('UIPadding', {
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                        PaddingBottom = UDim.new(0, 12),
                    }),
                }),
            })

            function section:CreateModule(config)
                config = config or {}

                local module = {
                    Name = config.Name or 'Module',
                    Function = config.Function or function() end,
                    Enabled = false,
                    Options = {},
                }

                module.Frame = New('Frame', {
                    Name = module.Name .. 'Module',
                    Parent = section.Frame.Content,
                    Size = UDim2.new(1, 0, 0, 45),
                    BackgroundColor3 = window.Theme.Background,
                    BorderSizePixel = 0,
                }, {
                    New('UICorner', {
                        CornerRadius = UDim.new(0, 8),
                    }),
                    New('UIStroke', {
                        Color = window.Theme.Border,
                        Thickness = 1,
                    }),
                    New('TextButton', {
                        Name = 'Toggle',
                        Size = UDim2.new(1, 0, 1, 0),
                        BackgroundTransparency = 1,
                        Text = '',
                        AutoButtonColor = false,
                    }),
                    New('UIListLayout', {
                        FillDirection = Enum.FillDirection.Horizontal,
                        Padding = UDim.new(0, 10),
                        VerticalAlignment = Enum.VerticalAlignment.Center,
                    }),
                    New('UIPadding', {
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                    }),
                    New('Frame', {
                        Name = 'Indicator',
                        Size = UDim2.new(0, 4, 0, 20),
                        BackgroundColor3 = window.Theme.Accent,
                        BorderSizePixel = 0,
                    }, {
                        New('UICorner', {
                            CornerRadius = UDim.new(1, 0),
                        }),
                    }),
                    New('TextLabel', {
                        Name = 'Title',
                        Size = UDim2.new(1, -50, 1, 0),
                        BackgroundTransparency = 1,
                        Text = module.Name,
                        TextColor3 = window.Theme.Text,
                        TextSize = 14,
                        Font = Enum.Font.GothamSemibold,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }),
                    New('Frame', {
                        Name = 'Switch',
                        Size = UDim2.new(0, 40, 0, 22),
                        BackgroundColor3 = window.Theme.BackgroundTertiary,
                        BorderSizePixel = 0,
                    }, {
                        New('UICorner', {
                            CornerRadius = UDim.new(1, 0),
                        }),
                        New('Frame', {
                            Name = 'Knob',
                            Size = UDim2.new(0, 18, 0, 18),
                            Position = UDim2.new(0, 2, 0.5, -9),
                            BackgroundColor3 = window.Theme.Text,
                            BorderSizePixel = 0,
                        }, {
                            New('UICorner', {
                                CornerRadius = UDim.new(1, 0),
                            }),
                        }),
                    }),
                })

                local switch = module.Frame.Switch
                local knob = switch.Knob

                module.Frame.Toggle.MouseButton1Click:Connect(function()
                    module.Enabled = not module.Enabled

                    Tween(switch, TweenInfo.new(0.2), {
                        BackgroundColor3 = module.Enabled and window.Theme.Accent or window.Theme.BackgroundTertiary,
                    }):Play()
                    Tween(knob, TweenInfo.new(0.2), {
                        Position = module.Enabled and UDim2.new(1, -20, 0.5, -9) or UDim2.new(0, 2, 0.5, -9),
                        BackgroundColor3 = module.Enabled and window.Theme.Text or window.Theme.TextDark,
                    }):Play()
                    module.Function(module.Enabled)
                end)

                module.OptionsContainer = New('Frame', {
                    Name = 'Options',
                    Parent = section.Frame.Content,
                    Size = UDim2.new(1, 0, 0, 0),
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundTransparency = 1,
                    Visible = false,
                    ClipsDescendants = true,
                }, {
                    New('UIListLayout', {
                        Padding = UDim.new(0, 6),
                        SortOrder = Enum.SortOrder.LayoutOrder,
                    }),
                    New('UIPadding', {
                        PaddingLeft = UDim.new(0, 12),
                        PaddingRight = UDim.new(0, 12),
                    }),
                })

                function module:CreateToggle(optionConfig)
                    optionConfig = optionConfig or {}

                    local option = {
                        Name = optionConfig.Name or 'Option',
                        Default = optionConfig.Default or false,
                        Callback = optionConfig.Callback or function() end,
                    }
                    local toggleFrame = New('Frame', {
                        Name = option.Name .. 'Toggle',
                        Parent = module.OptionsContainer,
                        Size = UDim2.new(1, 0, 0, 32),
                        BackgroundTransparency = 1,
                    }, {
                        New('UIListLayout', {
                            FillDirection = Enum.FillDirection.Horizontal,
                            Padding = UDim.new(0, 10),
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                        }),
                        New('TextLabel', {
                            Name = 'Label',
                            Size = UDim2.new(1, -40, 1, 0),
                            BackgroundTransparency = 1,
                            Text = option.Name,
                            TextColor3 = window.Theme.TextDark,
                            TextSize = 13,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }),
                        New('Frame', {
                            Name = 'Checkbox',
                            Size = UDim2.new(0, 20, 0, 20),
                            BackgroundColor3 = window.Theme.BackgroundTertiary,
                            BorderSizePixel = 0,
                        }, {
                            New('UICorner', {
                                CornerRadius = UDim.new(0, 6),
                            }),
                            New('ImageLabel', {
                                Name = 'Check',
                                Size = UDim2.new(0, 14, 0, 14),
                                Position = UDim2.new(0.5, -7, 0.5, -7),
                                BackgroundTransparency = 1,
                                Image = Icons.check,
                                ImageColor3 = window.Theme.Accent,
                                ImageTransparency = 1,
                            }),
                        }),
                    })
                    local checkbox = toggleFrame.Checkbox
                    local check = checkbox.Check

                    local function updateToggle(state)
                        option.Default = state

                        Tween(check, TweenInfo.new(0.15), {
                            ImageTransparency = state and 0 or 1,
                        }):Play()
                        Tween(checkbox, TweenInfo.new(0.15), {
                            BackgroundColor3 = state and window.Theme.Accent or window.Theme.BackgroundTertiary,
                        }):Play()
                        option.Callback(state)
                    end

                    toggleFrame.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            updateToggle(not option.Default)
                        end
                    end)

                    if option.Default then
                        updateToggle(true)
                    end

                    return option
                end
                function module:CreateSlider(optionConfig)
                    optionConfig = optionConfig or {}

                    local option = {
                        Name = optionConfig.Name or 'Slider',
                        Min = optionConfig.Min or 0,
                        Max = optionConfig.Max or 100,
                        Default = optionConfig.Default or optionConfig.Min or 0,
                        Callback = optionConfig.Callback or function() end,
                    }
                    local sliderFrame = New('Frame', {
                        Name = option.Name .. 'Slider',
                        Parent = module.OptionsContainer,
                        Size = UDim2.new(1, 0, 0, 50),
                        BackgroundTransparency = 1,
                    }, {
                        New('TextLabel', {
                            Name = 'Label',
                            Size = UDim2.new(1, 0, 0, 20),
                            BackgroundTransparency = 1,
                            Text = option.Name,
                            TextColor3 = window.Theme.TextDark,
                            TextSize = 13,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }),
                        New('Frame', {
                            Name = 'SliderBar',
                            Size = UDim2.new(1, 0, 0, 6),
                            Position = UDim2.new(0, 0, 0, 28),
                            BackgroundColor3 = window.Theme.BackgroundTertiary,
                            BorderSizePixel = 0,
                        }, {
                            New('UICorner', {
                                CornerRadius = UDim.new(1, 0),
                            }),
                            New('Frame', {
                                Name = 'Fill',
                                Size = UDim2.new(0, 0, 1, 0),
                                BackgroundColor3 = window.Theme.Accent,
                                BorderSizePixel = 0,
                            }, {
                                New('UICorner', {
                                    CornerRadius = UDim.new(1, 0),
                                }),
                            }),
                            New('TextButton', {
                                Name = 'Knob',
                                Size = UDim2.new(0, 16, 0, 16),
                                Position = UDim2.new(0, -8, 0.5, -8),
                                BackgroundColor3 = window.Theme.Text,
                                BorderSizePixel = 0,
                                Text = '',
                            }, {
                                New('UICorner', {
                                    CornerRadius = UDim.new(1, 0),
                                }),
                            }),
                        }),
                        New('TextLabel', {
                            Name = 'Value',
                            Size = UDim2.new(0, 40, 0, 20),
                            Position = UDim2.new(1, -40, 0, 0),
                            BackgroundTransparency = 1,
                            Text = tostring(option.Default),
                            TextColor3 = window.Theme.Accent,
                            TextSize = 13,
                            Font = Enum.Font.GothamBold,
                            TextXAlignment = Enum.TextXAlignment.Right,
                        }),
                    })
                    local sliderBar = sliderFrame.SliderBar
                    local fill = sliderBar.Fill
                    local knob = sliderBar.Knob
                    local valueLabel = sliderFrame.Value

                    local function updateSlider(value)
                        local percent = (value - option.Min) / (option.Max - option.Min)

                        fill.Size = UDim2.new(percent, 0, 1, 0)
                        knob.Position = UDim2.new(percent, -8, 0.5, -8)
                        valueLabel.Text = tostring(math.floor(value))

                        option.Callback(value)
                    end

                    local dragging = false

                    knob.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                        end
                    end)
                    sliderBar.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
                            local value = option.Min + (pos * (option.Max - option.Min))

                            updateSlider(value)
                        end
                    end)
                    UserInputService.InputChanged:Connect(function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            local pos = math.clamp((input.Position.X - sliderBar.AbsolutePosition.X) / sliderBar.AbsoluteSize.X, 0, 1)
                            local value = option.Min + (pos * (option.Max - option.Min))

                            updateSlider(value)
                        end
                    end)
                    UserInputService.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end)
                    updateSlider(option.Default)

                    return option
                end
                function module:CreateDropdown(optionConfig)
                    optionConfig = optionConfig or {}

                    local option = {
                        Name = optionConfig.Name or 'Dropdown',
                        Options = optionConfig.Options or {},
                        Default = optionConfig.Default or optionConfig.Options[1],
                        Callback = optionConfig.Callback or function() end,
                    }
                    local dropdownFrame = New('Frame', {
                        Name = option.Name .. 'Dropdown',
                        Parent = module.OptionsContainer,
                        Size = UDim2.new(1, 0, 0, 35),
                        BackgroundTransparency = 1,
                    }, {
                        New('UIListLayout', {
                            FillDirection = Enum.FillDirection.Horizontal,
                            Padding = UDim.new(0, 10),
                            VerticalAlignment = Enum.VerticalAlignment.Center,
                        }),
                        New('TextLabel', {
                            Name = 'Label',
                            Size = UDim2.new(0.5, -5, 1, 0),
                            BackgroundTransparency = 1,
                            Text = option.Name,
                            TextColor3 = window.Theme.TextDark,
                            TextSize = 13,
                            Font = Enum.Font.Gotham,
                            TextXAlignment = Enum.TextXAlignment.Left,
                        }),
                        New('TextButton', {
                            Name = 'Button',
                            Size = UDim2.new(0.5, -5, 1, 0),
                            BackgroundColor3 = window.Theme.BackgroundTertiary,
                            Text = option.Default,
                            TextColor3 = window.Theme.Text,
                            TextSize = 13,
                            Font = Enum.Font.Gotham,
                            AutoButtonColor = false,
                        }, {
                            New('UICorner', {
                                CornerRadius = UDim.new(0, 6),
                            }),
                            New('ImageLabel', {
                                Name = 'Icon',
                                Size = UDim2.new(0, 16, 0, 16),
                                Position = UDim2.new(1, -22, 0.5, -8),
                                BackgroundTransparency = 1,
                                Image = Icons.chevron,
                                ImageColor3 = window.Theme.TextDark,
                                Rotation = 90,
                            }),
                        }),
                    })
                    local button = dropdownFrame.Button

                    button.MouseButton1Click:Connect(function()
                        print('Dropdown clicked:', option.Name)
                    end)

                    return option
                end
                function module:ToggleOptions(visible)
                    module.OptionsContainer.Visible = visible

                    if visible then
                        Tween(module.OptionsContainer, TweenInfo.new(0.2), {
                            Size = UDim2.new(1, 0, 0, module.OptionsContainer.UIListLayout.AbsoluteContentSize.Y + 20),
                        }):Play()
                    end
                end

                table.insert(section.Elements, module)

                return module
            end
            function section:CreateSlider(config)
                return self:CreateModule({
                    Name = config.Name or 'Slider',
                }):CreateSlider(config)
            end
            function section:CreateToggle(config)
                return self:CreateModule({
                    Name = config.Name or 'Toggle',
                }):CreateToggle(config)
            end

            table.insert(tab.Sections, section)

            return section
        end

        table.insert(window.Categories, tab)

        if #window.Categories == 1 then
            tab:SetActive(true)
        end

        return tab
    end

    table.insert(self.Windows, window)

    return window
end

shared.VapeUI = VapeUI

return VapeUI
