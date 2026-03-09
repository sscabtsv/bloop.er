getgenv().GG = {Language={CheckboxEnabled="Enabled",CheckboxDisabled="Disabled",SliderValue="Value",DropdownSelect="Select",DropdownNone="None",DropdownSelected="Selected",ButtonClick="Click",TextboxEnter="Enter",ModuleEnabled="Enabled",ModuleDisabled="Disabled",TabGeneral="General",TabSettings="Settings",Loading="Loading...",Error="Error",Success="Success"}};
local SelectedLanguage = GG.Language;
local Themes = {Midnight={Background=Color3.fromRGB(10, 11, 14),ModuleBackground=Color3.fromRGB(18, 22, 32),Accent=Color3.fromRGB(130, 100, 255),SecondaryAccent=Color3.fromRGB(190, 170, 255),Text=Color3.fromRGB(240, 240, 255),TextDark=Color3.fromRGB(160, 160, 185),Highlight=Color3.fromRGB(90, 60, 220),Stroke=Color3.fromRGB(60, 60, 90)},Rose={Background=Color3.fromRGB(14, 10, 12),ModuleBackground=Color3.fromRGB(28, 18, 24),Accent=Color3.fromRGB(255, 100, 150),SecondaryAccent=Color3.fromRGB(255, 180, 210),Text=Color3.fromRGB(255, 245, 250),TextDark=Color3.fromRGB(200, 170, 185),Highlight=Color3.fromRGB(200, 50, 100),Stroke=Color3.fromRGB(80, 40, 60)},Sapphire={Background=Color3.fromRGB(8, 12, 20),ModuleBackground=Color3.fromRGB(14, 22, 40),Accent=Color3.fromRGB(60, 140, 255),SecondaryAccent=Color3.fromRGB(140, 200, 255),Text=Color3.fromRGB(230, 240, 255),TextDark=Color3.fromRGB(150, 175, 220),Highlight=Color3.fromRGB(30, 100, 220),Stroke=Color3.fromRGB(30, 55, 100)},Emerald={Background=Color3.fromRGB(8, 14, 12),ModuleBackground=Color3.fromRGB(14, 26, 22),Accent=Color3.fromRGB(50, 220, 140),SecondaryAccent=Color3.fromRGB(130, 255, 200),Text=Color3.fromRGB(230, 255, 245),TextDark=Color3.fromRGB(140, 195, 175),Highlight=Color3.fromRGB(20, 170, 100),Stroke=Color3.fromRGB(25, 70, 55)},Obsidian={Background=Color3.fromRGB(8, 8, 10),ModuleBackground=Color3.fromRGB(15, 15, 20),Accent=Color3.fromRGB(200, 180, 120),SecondaryAccent=Color3.fromRGB(240, 220, 160),Text=Color3.fromRGB(245, 242, 235),TextDark=Color3.fromRGB(180, 170, 145),Highlight=Color3.fromRGB(160, 130, 70),Stroke=Color3.fromRGB(50, 45, 35)},Glacier={Background=Color3.fromRGB(10, 14, 20),ModuleBackground=Color3.fromRGB(18, 26, 38),Accent=Color3.fromRGB(130, 210, 240),SecondaryAccent=Color3.fromRGB(190, 235, 255),Text=Color3.fromRGB(235, 248, 255),TextDark=Color3.fromRGB(155, 195, 220),Highlight=Color3.fromRGB(80, 175, 225),Stroke=Color3.fromRGB(35, 70, 100)},Crimson={Background=Color3.fromRGB(12, 8, 8),ModuleBackground=Color3.fromRGB(24, 14, 14),Accent=Color3.fromRGB(220, 55, 75),SecondaryAccent=Color3.fromRGB(255, 120, 140),Text=Color3.fromRGB(255, 238, 240),TextDark=Color3.fromRGB(200, 160, 165),Highlight=Color3.fromRGB(170, 30, 50),Stroke=Color3.fromRGB(80, 30, 35)},Amber={Background=Color3.fromRGB(12, 10, 6),ModuleBackground=Color3.fromRGB(24, 20, 12),Accent=Color3.fromRGB(255, 175, 50),SecondaryAccent=Color3.fromRGB(255, 215, 120),Text=Color3.fromRGB(255, 248, 230),TextDark=Color3.fromRGB(210, 185, 130),Highlight=Color3.fromRGB(210, 135, 20),Stroke=Color3.fromRGB(80, 60, 20)},Cyber={Background=Color3.fromRGB(6, 6, 10),ModuleBackground=Color3.fromRGB(12, 12, 20),Accent=Color3.fromRGB(0, 240, 160),SecondaryAccent=Color3.fromRGB(60, 255, 220),Text=Color3.fromRGB(230, 255, 250),TextDark=Color3.fromRGB(120, 195, 185),Highlight=Color3.fromRGB(255, 50, 200),Stroke=Color3.fromRGB(20, 65, 55)},Neon={Background=Color3.fromRGB(5, 4, 10),ModuleBackground=Color3.fromRGB(12, 10, 22),Accent=Color3.fromRGB(255, 30, 130),SecondaryAccent=Color3.fromRGB(130, 60, 255),Text=Color3.fromRGB(255, 250, 255),TextDark=Color3.fromRGB(185, 165, 210),Highlight=Color3.fromRGB(200, 0, 255),Stroke=Color3.fromRGB(70, 30, 80)},Sunset={Background=Color3.fromRGB(14, 8, 10),ModuleBackground=Color3.fromRGB(28, 16, 20),Accent=Color3.fromRGB(255, 110, 70),SecondaryAccent=Color3.fromRGB(255, 175, 80),Text=Color3.fromRGB(255, 245, 235),TextDark=Color3.fromRGB(215, 175, 155),Highlight=Color3.fromRGB(220, 65, 30),Stroke=Color3.fromRGB(90, 40, 30)},Sakura={Background=Color3.fromRGB(14, 10, 12),ModuleBackground=Color3.fromRGB(28, 18, 24),Accent=Color3.fromRGB(255, 175, 200),SecondaryAccent=Color3.fromRGB(255, 215, 228),Text=Color3.fromRGB(255, 245, 248),TextDark=Color3.fromRGB(215, 180, 195),Highlight=Color3.fromRGB(230, 110, 160),Stroke=Color3.fromRGB(80, 45, 65)},Monochrome={Background=Color3.fromRGB(10, 10, 10),ModuleBackground=Color3.fromRGB(18, 18, 18),Accent=Color3.fromRGB(210, 210, 210),SecondaryAccent=Color3.fromRGB(255, 255, 255),Text=Color3.fromRGB(250, 250, 250),TextDark=Color3.fromRGB(155, 155, 155),Highlight=Color3.fromRGB(120, 120, 120),Stroke=Color3.fromRGB(45, 45, 45)},Ash={Background=Color3.fromRGB(12, 13, 15),ModuleBackground=Color3.fromRGB(22, 24, 28),Accent=Color3.fromRGB(160, 200, 255),SecondaryAccent=Color3.fromRGB(200, 225, 255),Text=Color3.fromRGB(240, 242, 248),TextDark=Color3.fromRGB(160, 168, 185),Highlight=Color3.fromRGB(100, 150, 230),Stroke=Color3.fromRGB(45, 50, 65)},Forest={Background=Color3.fromRGB(8, 12, 10),ModuleBackground=Color3.fromRGB(14, 22, 18),Accent=Color3.fromRGB(80, 210, 100),SecondaryAccent=Color3.fromRGB(155, 245, 165),Text=Color3.fromRGB(235, 255, 238),TextDark=Color3.fromRGB(150, 200, 160),Highlight=Color3.fromRGB(45, 160, 65),Stroke=Color3.fromRGB(28, 65, 38)},Ocean={Background=Color3.fromRGB(6, 12, 18),ModuleBackground=Color3.fromRGB(10, 22, 36),Accent=Color3.fromRGB(30, 200, 255),SecondaryAccent=Color3.fromRGB(120, 225, 255),Text=Color3.fromRGB(225, 248, 255),TextDark=Color3.fromRGB(135, 185, 215),Highlight=Color3.fromRGB(10, 155, 230),Stroke=Color3.fromRGB(18, 60, 95)},Lavender={Background=Color3.fromRGB(12, 10, 18),ModuleBackground=Color3.fromRGB(22, 18, 36),Accent=Color3.fromRGB(175, 155, 240),SecondaryAccent=Color3.fromRGB(215, 200, 255),Text=Color3.fromRGB(248, 245, 255),TextDark=Color3.fromRGB(190, 180, 220),Highlight=Color3.fromRGB(135, 110, 215),Stroke=Color3.fromRGB(60, 48, 90)},Coffee={Background=Color3.fromRGB(12, 10, 8),ModuleBackground=Color3.fromRGB(24, 19, 14),Accent=Color3.fromRGB(205, 150, 90),SecondaryAccent=Color3.fromRGB(235, 200, 150),Text=Color3.fromRGB(255, 248, 238),TextDark=Color3.fromRGB(200, 175, 145),Highlight=Color3.fromRGB(165, 105, 50),Stroke=Color3.fromRGB(65, 48, 30)},Mint={Background=Color3.fromRGB(8, 14, 12),ModuleBackground=Color3.fromRGB(14, 26, 22),Accent=Color3.fromRGB(80, 230, 195),SecondaryAccent=Color3.fromRGB(155, 255, 230),Text=Color3.fromRGB(230, 255, 248),TextDark=Color3.fromRGB(140, 200, 185),Highlight=Color3.fromRGB(35, 190, 160),Stroke=Color3.fromRGB(25, 72, 60)},Pink={Background=Color3.fromRGB(14, 8, 12),ModuleBackground=Color3.fromRGB(28, 14, 24),Accent=Color3.fromRGB(255, 120, 190),SecondaryAccent=Color3.fromRGB(255, 185, 220),Text=Color3.fromRGB(255, 240, 248),TextDark=Color3.fromRGB(215, 170, 200),Highlight=Color3.fromRGB(220, 60, 150),Stroke=Color3.fromRGB(90, 35, 70)},Purple={Background=Color3.fromRGB(10, 7, 16),ModuleBackground=Color3.fromRGB(20, 14, 32),Accent=Color3.fromRGB(160, 120, 240),SecondaryAccent=Color3.fromRGB(205, 170, 255),Text=Color3.fromRGB(245, 240, 255),TextDark=Color3.fromRGB(185, 165, 225),Highlight=Color3.fromRGB(120, 75, 210),Stroke=Color3.fromRGB(58, 38, 95)},Abyss={Background=Color3.fromRGB(4, 4, 8),ModuleBackground=Color3.fromRGB(8, 8, 16),Accent=Color3.fromRGB(80, 180, 255),SecondaryAccent=Color3.fromRGB(140, 210, 255),Text=Color3.fromRGB(220, 235, 255),TextDark=Color3.fromRGB(120, 150, 200),Highlight=Color3.fromRGB(40, 130, 230),Stroke=Color3.fromRGB(20, 35, 65)},Vanta={Background=Color3.fromRGB(3, 3, 3),ModuleBackground=Color3.fromRGB(8, 8, 8),Accent=Color3.fromRGB(255, 255, 255),SecondaryAccent=Color3.fromRGB(200, 200, 200),Text=Color3.fromRGB(255, 255, 255),TextDark=Color3.fromRGB(130, 130, 130),Highlight=Color3.fromRGB(160, 160, 160),Stroke=Color3.fromRGB(28, 28, 28)},Coral={Background=Color3.fromRGB(14, 8, 6),ModuleBackground=Color3.fromRGB(28, 14, 12),Accent=Color3.fromRGB(255, 120, 95),SecondaryAccent=Color3.fromRGB(255, 180, 160),Text=Color3.fromRGB(255, 245, 242),TextDark=Color3.fromRGB(215, 175, 165),Highlight=Color3.fromRGB(220, 75, 50),Stroke=Color3.fromRGB(90, 35, 28)},Arctic={Background=Color3.fromRGB(10, 14, 18),ModuleBackground=Color3.fromRGB(18, 26, 34),Accent=Color3.fromRGB(180, 230, 255),SecondaryAccent=Color3.fromRGB(220, 245, 255),Text=Color3.fromRGB(240, 250, 255),TextDark=Color3.fromRGB(160, 195, 220),Highlight=Color3.fromRGB(100, 190, 235),Stroke=Color3.fromRGB(40, 75, 105)},Void={Background=Color3.fromRGB(5, 3, 10),ModuleBackground=Color3.fromRGB(10, 6, 20),Accent=Color3.fromRGB(200, 50, 255),SecondaryAccent=Color3.fromRGB(230, 130, 255),Text=Color3.fromRGB(248, 240, 255),TextDark=Color3.fromRGB(175, 145, 210),Highlight=Color3.fromRGB(155, 0, 220),Stroke=Color3.fromRGB(65, 22, 90)},Dusk={Background=Color3.fromRGB(10, 8, 14),ModuleBackground=Color3.fromRGB(20, 16, 28),Accent=Color3.fromRGB(200, 140, 255),SecondaryAccent=Color3.fromRGB(255, 180, 220),Text=Color3.fromRGB(250, 245, 255),TextDark=Color3.fromRGB(185, 165, 210),Highlight=Color3.fromRGB(155, 90, 230),Stroke=Color3.fromRGB(65, 45, 90)},Lava={Background=Color3.fromRGB(12, 5, 4),ModuleBackground=Color3.fromRGB(24, 10, 8),Accent=Color3.fromRGB(255, 80, 40),SecondaryAccent=Color3.fromRGB(255, 155, 60),Text=Color3.fromRGB(255, 242, 235),TextDark=Color3.fromRGB(210, 160, 140),Highlight=Color3.fromRGB(210, 40, 10),Stroke=Color3.fromRGB(95, 28, 18)},Steel={Background=Color3.fromRGB(10, 12, 14),ModuleBackground=Color3.fromRGB(20, 24, 28),Accent=Color3.fromRGB(140, 175, 210),SecondaryAccent=Color3.fromRGB(185, 210, 235),Text=Color3.fromRGB(230, 238, 245),TextDark=Color3.fromRGB(150, 168, 190),Highlight=Color3.fromRGB(90, 130, 175),Stroke=Color3.fromRGB(42, 55, 70)},Toxic={Background=Color3.fromRGB(6, 10, 5),ModuleBackground=Color3.fromRGB(10, 18, 8),Accent=Color3.fromRGB(130, 255, 60),SecondaryAccent=Color3.fromRGB(190, 255, 120),Text=Color3.fromRGB(235, 255, 228),TextDark=Color3.fromRGB(140, 205, 120),Highlight=Color3.fromRGB(85, 210, 20),Stroke=Color3.fromRGB(28, 68, 18)},Blush={Background=Color3.fromRGB(14, 10, 11),ModuleBackground=Color3.fromRGB(28, 18, 20),Accent=Color3.fromRGB(255, 155, 170),SecondaryAccent=Color3.fromRGB(255, 200, 210),Text=Color3.fromRGB(255, 245, 247),TextDark=Color3.fromRGB(215, 175, 182),Highlight=Color3.fromRGB(230, 90, 115),Stroke=Color3.fromRGB(90, 40, 50)}};
local ThemeMeta = {Midnight={category="Dark",desc="Deep violet dark"},Rose={category="Dark",desc="Warm crimson bloom"},Sapphire={category="Dark",desc="Cool electric blue"},Emerald={category="Dark",desc="Rich jewel green"},Obsidian={category="Premium",desc="Gold on jet black"},Glacier={category="Premium",desc="Icy arctic blue"},Crimson={category="Premium",desc="Dramatic deep red"},Amber={category="Premium",desc="Warm amber glow"},Cyber={category="Neon",desc="Terminal matrix green"},Neon={category="Neon",desc="Synthwave vibes"},Sunset={category="Neon",desc="Warm dusk orange"},Sakura={category="Pastel",desc="Soft cherry blossom"},Monochrome={category="Minimal",desc="Pure grayscale"},Ash={category="Minimal",desc="Cool blue-grey"},Forest={category="Nature",desc="Deep woodland green"},Ocean={category="Nature",desc="Oceanic deep blue"},Lavender={category="Pastel",desc="Soft lilac dream"},Coffee={category="Warm",desc="Rich espresso tones"},Mint={category="Pastel",desc="Cool minty fresh"},Pink={category="Pastel",desc="Vibrant hot pink"},Purple={category="Dark",desc="Royal amethyst"},Abyss={category="Dark",desc="Bottomless deep blue"},Vanta={category="Minimal",desc="Absolute black"},Coral={category="Warm",desc="Vibrant coral reef"},Arctic={category="Nature",desc="Frozen tundra white"},Void={category="Neon",desc="Ultraviolet darkness"},Dusk={category="Pastel",desc="Twilight purple haze"},Lava={category="Neon",desc="Molten fire red"},Steel={category="Minimal",desc="Industrial blue-grey"},Toxic={category="Neon",desc="Radioactive lime"},Blush={category="Pastel",desc="Warm rosy pink"}};
function convertStringToTable(inputString)
	local result = {};
	for value in string.gmatch(inputString, "([^,]+)") do
		local trimmedValue = value:match("^%s*(.-)%s*$");
		table.insert(result, trimmedValue);
	end
	return result;
end
function convertTableToString(inputTable)
	return table.concat(inputTable, ", ");
end
local UserInputService = cloneref(game:GetService("UserInputService"));
local ContentProvider = cloneref(game:GetService("ContentProvider"));
local TweenService = cloneref(game:GetService("TweenService"));
local HttpService = cloneref(game:GetService("HttpService"));
local TextService = cloneref(game:GetService("TextService"));
local RunService = cloneref(game:GetService("RunService"));
local Lighting = cloneref(game:GetService("Lighting"));
local Players = cloneref(game:GetService("Players"));
local CoreGui = cloneref(game:GetService("CoreGui"));
local Debris = cloneref(game:GetService("Debris"));
local mouse = Players.LocalPlayer:GetMouse();
local Waver = CoreGui:FindFirstChild("BlooperUi");
if Waver then
	Debris:AddItem(Waver, 0);
end
if not isfolder("BlooperUi") then
	makefolder("BlooperUi");
end
local Connections = setmetatable({disconnect=function(self, connection)
	if not self[connection] then
		return;
	end
	self[connection]:Disconnect();
	self[connection] = nil;
end,disconnect_all=function(self)
	for _, value in self do
		if (typeof(value) == "function") then
			continue;
		end
		value:Disconnect();
	end
end}, Connections);
local Util = setmetatable({map=function(self, value, in_minimum, in_maximum, out_minimum, out_maximum)
	return (((value - in_minimum) * (out_maximum - out_minimum)) / (in_maximum - in_minimum)) + out_minimum;
end,viewport_point_to_world=function(self, location, distance)
	local unit_ray = workspace.CurrentCamera:ScreenPointToRay(location.X, location.Y);
	return unit_ray.Origin + (unit_ray.Direction * distance);
end,get_offset=function(self)
	local viewport_size_Y = workspace.CurrentCamera.ViewportSize.Y;
	return self:map(viewport_size_Y, 0, 2560, 8, 56);
end}, Util);
local Tween = {smooth=TweenInfo.new(0.45, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),fast=TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),slow=TweenInfo.new(0.65, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),spring=TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out),fade=TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),snap=TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),snap_in=TweenInfo.new(0.08, Enum.EasingStyle.Quad, Enum.EasingDirection.In),slide=TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),slide_out=TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.In)};
local AcrylicBlur = {};
AcrylicBlur.__index = AcrylicBlur;
AcrylicBlur.new = function(object)
	local self = setmetatable({_object=object,_folder=nil,_frame=nil,_root=nil}, AcrylicBlur);
	self:setup();
	return self;
end;
AcrylicBlur.create_folder = function(self)
	local old_folder = workspace.CurrentCamera:FindFirstChild("AcrylicBlur");
	if old_folder then
		Debris:AddItem(old_folder, 0);
	end
	local folder = Instance.new("Folder");
	folder.Name = "AcrylicBlur";
	folder.Parent = workspace.CurrentCamera;
	self._folder = folder;
end;
AcrylicBlur.create_depth_of_fields = function(self)
	local depth_of_fields = Lighting:FindFirstChild("AcrylicBlur") or Instance.new("DepthOfFieldEffect");
	depth_of_fields.FarIntensity = 0;
	depth_of_fields.FocusDistance = 0.05;
	depth_of_fields.InFocusRadius = 0.1;
	depth_of_fields.NearIntensity = 1;
	depth_of_fields.Name = "AcrylicBlur";
	depth_of_fields.Parent = Lighting;
	for _, object in Lighting:GetChildren() do
		if not object:IsA("DepthOfFieldEffect") then
			continue;
		end
		if (object == depth_of_fields) then
			continue;
		end
		Connections[object] = object:GetPropertyChangedSignal("FarIntensity"):Connect(function()
			object.FarIntensity = 0;
		end);
		object.FarIntensity = 0;
	end
end;
AcrylicBlur.create_frame = function(self)
	local frame = Instance.new("Frame");
	frame.Size = UDim2.new(1, 0, 1, 0);
	frame.Position = UDim2.new(0.5, 0, 0.5, 0);
	frame.AnchorPoint = Vector2.new(0.5, 0.5);
	frame.BackgroundTransparency = 1;
	frame.Parent = self._object;
	self._frame = frame;
end;
AcrylicBlur.create_root = function(self)
	local part = Instance.new("Part");
	part.Name = "Root";
	part.Color = Color3.new(0, 0, 0);
	part.Material = Enum.Material.Glass;
	part.Size = Vector3.new(1, 1, 0);
	part.Anchored = true;
	part.CanCollide = false;
	part.CanQuery = false;
	part.Locked = true;
	part.CastShadow = false;
	part.Transparency = 0.98;
	part.Parent = self._folder;
	local specialMesh = Instance.new("SpecialMesh");
	specialMesh.MeshType = Enum.MeshType.Brick;
	specialMesh.Offset = Vector3.new(0, 0, -0.000001);
	specialMesh.Parent = part;
	self._root = part;
end;
AcrylicBlur.setup = function(self)
	self:create_depth_of_fields();
	self:create_folder();
	self:create_root();
	self:create_frame();
	self:render(0.001);
	self:check_quality_level();
end;
AcrylicBlur.render = function(self, distance)
	local positions = {top_left=Vector2.new(),top_right=Vector2.new(),bottom_right=Vector2.new()};
	local function update_positions(size, position)
		positions.top_left = position;
		positions.top_right = position + Vector2.new(size.X, 0);
		positions.bottom_right = position + size;
	end
	local function update()
		local top_left = positions.top_left;
		local top_right = positions.top_right;
		local bottom_right = positions.bottom_right;
		local top_left3D = Util:viewport_point_to_world(top_left, distance);
		local top_right3D = Util:viewport_point_to_world(top_right, distance);
		local bottom_right3D = Util:viewport_point_to_world(bottom_right, distance);
		local width = (top_right3D - top_left3D).Magnitude;
		local height = (top_right3D - bottom_right3D).Magnitude;
		if not self._root then
			return;
		end
		self._root.CFrame = CFrame.fromMatrix((top_left3D + bottom_right3D) / 2, workspace.CurrentCamera.CFrame.XVector, workspace.CurrentCamera.CFrame.YVector, workspace.CurrentCamera.CFrame.ZVector);
		self._root.Mesh.Scale = Vector3.new(width, height, 0);
	end
	local function on_change()
		local offset = Util:get_offset();
		local size = self._frame.AbsoluteSize - Vector2.new(offset, offset);
		local position = self._frame.AbsolutePosition + Vector2.new(offset / 2, offset / 2);
		update_positions(size, position);
		task.spawn(update);
	end
	Connections['cframe_update'] = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(update);
	Connections['viewport_size_update'] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(update);
	Connections['field_of_view_update'] = workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(update);
	Connections['frame_absolute_position'] = self._frame:GetPropertyChangedSignal("AbsolutePosition"):Connect(on_change);
	Connections['frame_absolute_size'] = self._frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(on_change);
	task.spawn(update);
end;
AcrylicBlur.check_quality_level = function(self)
	local game_settings = UserSettings().GameSettings;
	local quality_level = game_settings.SavedQualityLevel.Value;
	if (quality_level < 8) then
		self:change_visiblity(false);
	end
	Connections['quality_level'] = game_settings:GetPropertyChangedSignal("SavedQualityLevel"):Connect(function()
		local quality_level = UserSettings().GameSettings.SavedQualityLevel.Value;
		self:change_visiblity(quality_level >= 8);
	end);
end;
AcrylicBlur.change_visiblity = function(self, state)
	self._root.Transparency = (state and 0.98) or 1;
end;
local Config = setmetatable({save=function(self, file_name, config)
	local success_save, result = pcall(function()
		local flags = HttpService:JSONEncode(config);
		writefile("Waver/" .. file_name .. ".json", flags);
	end);
	if not success_save then
		warn("failed to save config", result);
	end
end,load=function(self, file_name, config)
	local success_load, result = pcall(function()
		if not isfile("Waver/" .. file_name .. ".json") then
			self:save(file_name, config);
			return;
		end
		local flags = readfile("Waver/" .. file_name .. ".json");
		if not flags then
			self:save(file_name, config);
			return;
		end
		return HttpService:JSONDecode(flags);
	end);
	if not success_load then
		warn("failed to load config", result);
	end
	if not result then
		result = {_flags={},_keybinds={},_library={},_theme="Midnight"};
	end
	return result;
end}, Config);
local Library = {_config=Config:load(game.GameId),_choosing_keybind=false,_device=nil,_ui_open=true,_ui_scale=1,_ui_loaded=false,_ui=nil,_dragging=false,_drag_start=nil,_container_position=nil,_current_theme="Midnight",_themed_elements={Modules={},Strokes={},ActiveToggles={},SliderDrags={},Notifications={},AccentButtons={}}};
Library.__index = Library;
local NotificationContainer = Instance.new("Frame");
NotificationContainer.Name = "NotificationContainer";
NotificationContainer.Size = UDim2.new(0, 320, 0, 0);
NotificationContainer.Position = UDim2.new(0, 20, 1, -20);
NotificationContainer.AnchorPoint = Vector2.new(0, 1);
NotificationContainer.BackgroundTransparency = 1;
NotificationContainer.ClipsDescendants = false;
NotificationContainer.ZIndex = 100;
NotificationContainer.AutomaticSize = Enum.AutomaticSize.Y;
NotificationContainer.Parent = game:GetService("CoreGui"):FindFirstChild("RobloxGui") or game:GetService("CoreGui");
local NotificationListLayout = Instance.new("UIListLayout");
NotificationListLayout.FillDirection = Enum.FillDirection.Vertical;
NotificationListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
NotificationListLayout.Padding = UDim.new(0, 10);
NotificationListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom;
NotificationListLayout.Parent = NotificationContainer;
local function UpdateNotificationContainer()
	local viewportSize = workspace.CurrentCamera.ViewportSize;
	local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled;
	if isMobile then
		NotificationContainer.Size = UDim2.new(0, math.min(260, viewportSize.X * 0.65), 0, 0);
		NotificationContainer.Position = UDim2.new(0, 12, 1, -80);
	else
		NotificationContainer.Size = UDim2.new(0, math.min(320, viewportSize.X * 0.22), 0, 0);
		NotificationContainer.Position = UDim2.new(0, 20, 1, -20);
	end
end
UpdateNotificationContainer();
Connections['notification_viewport'] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateNotificationContainer);
local ActiveNotifications = {};
local function DismissNotification(entry)
	if entry._dismissed then
		return;
	end
	entry._dismissed = true;
	TweenService:Create(entry.InnerFrame, Tween.slide_out, {Position=UDim2.new(-1, -20, 0, 0),BackgroundTransparency=1}):Play();
	TweenService:Create(entry.UIStroke, Tween.fade, {Transparency=1}):Play();
	TweenService:Create(entry.Title, Tween.fade, {TextTransparency=1}):Play();
	TweenService:Create(entry.Body, Tween.fade, {TextTransparency=1}):Play();
	TweenService:Create(entry.AccentBar, Tween.fade, {BackgroundTransparency=1}):Play();
	task.delay(0.4, function()
		for i, v in ipairs(Library._themed_elements.Notifications) do
			if (v.Frame == entry.InnerFrame) then
				table.remove(Library._themed_elements.Notifications, i);
				break;
			end
		end
		for i, v in ipairs(ActiveNotifications) do
			if (v == entry) then
				table.remove(ActiveNotifications, i);
				break;
			end
		end
		if (entry.BlurPart and entry.BlurPart.Parent) then
			entry.BlurPart:Destroy();
		end
		if (entry.BlurFolder and entry.BlurFolder.Parent) then
			entry.BlurFolder:Destroy();
		end
		entry.Root:Destroy();
	end);
end
Library.SendNotification = function(settings)
	local theme = Themes[Library._current_theme] or Themes.Midnight;
	local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled;
	while #ActiveNotifications >= 2 do
		DismissNotification(ActiveNotifications[1]);
		table.remove(ActiveNotifications, 1);
	end
	local Notification = Instance.new("Frame");
	Notification.Size = UDim2.new(1, 0, 0, 0);
	Notification.BackgroundTransparency = 1;
	Notification.BorderSizePixel = 0;
	Notification.Name = "Notification";
	Notification.AutomaticSize = Enum.AutomaticSize.Y;
	Notification.Parent = NotificationContainer;
	local BlurFolder = workspace.CurrentCamera:FindFirstChild("NotifBlur_" .. tostring(tick()));
	if not BlurFolder then
		BlurFolder = Instance.new("Folder");
		BlurFolder.Name = "NotifBlur_" .. tostring(tick());
		BlurFolder.Parent = workspace.CurrentCamera;
	end
	local BlurPart = Instance.new("Part");
	BlurPart.Name = "NotifBlurPart";
	BlurPart.Material = Enum.Material.Glass;
	BlurPart.Color = Color3.new(0, 0, 0);
	BlurPart.Size = Vector3.new(1, 1, 0);
	BlurPart.Anchored = true;
	BlurPart.CanCollide = false;
	BlurPart.CanQuery = false;
	BlurPart.Locked = true;
	BlurPart.CastShadow = false;
	BlurPart.Transparency = 0.92;
	BlurPart.Parent = BlurFolder;
	local BlurMesh = Instance.new("SpecialMesh");
	BlurMesh.MeshType = Enum.MeshType.Brick;
	BlurMesh.Offset = Vector3.new(0, 0, -0.000001);
	BlurMesh.Parent = BlurPart;
	local function UpdateBlurPart(frame)
		local size = frame.AbsoluteSize;
		local pos = frame.AbsolutePosition;
		if ((size.X < 5) or (size.Y < 5)) then
			return;
		end
		local tl = Util:viewport_point_to_world(pos, 0.001);
		local tr = Util:viewport_point_to_world(pos + Vector2.new(size.X, 0), 0.001);
		local br = Util:viewport_point_to_world(pos + size, 0.001);
		local w = (tr - tl).Magnitude;
		local h = (tr - br).Magnitude;
		BlurPart.CFrame = CFrame.fromMatrix((tl + br) / 2, workspace.CurrentCamera.CFrame.XVector, workspace.CurrentCamera.CFrame.YVector, workspace.CurrentCamera.CFrame.ZVector);
		BlurMesh.Scale = Vector3.new(w, h, 0);
	end
	local InnerFrame = Instance.new("Frame");
	InnerFrame.Size = UDim2.new(1, 0, 0, 0);
	InnerFrame.BackgroundColor3 = theme.ModuleBackground;
	InnerFrame.BackgroundTransparency = 0.25;
	InnerFrame.BorderSizePixel = 0;
	InnerFrame.Name = "InnerFrame";
	InnerFrame.AutomaticSize = Enum.AutomaticSize.Y;
	InnerFrame.ZIndex = 101;
	InnerFrame.Parent = Notification;
	local UICorner = Instance.new("UICorner");
	UICorner.CornerRadius = UDim.new(0, 10);
	UICorner.Parent = InnerFrame;
	local UIStroke = Instance.new("UIStroke");
	UIStroke.Color = theme.Stroke;
	UIStroke.Transparency = 0.2;
	UIStroke.Thickness = 1;
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	UIStroke.Parent = InnerFrame;
	local AccentBar = Instance.new("Frame");
	AccentBar.Name = "AccentBar";
	AccentBar.Size = UDim2.new(0, 3, 1, -16);
	AccentBar.Position = UDim2.new(0, 8, 0, 8);
	AccentBar.AnchorPoint = Vector2.new(0, 0);
	AccentBar.BackgroundColor3 = theme.Accent;
	AccentBar.BorderSizePixel = 0;
	AccentBar.ZIndex = 102;
	AccentBar.Parent = InnerFrame;
	local AccentCorner = Instance.new("UICorner");
	AccentCorner.CornerRadius = UDim.new(1, 0);
	AccentCorner.Parent = AccentBar;
	local ContentFrame = Instance.new("Frame");
	ContentFrame.Name = "ContentFrame";
	ContentFrame.Size = UDim2.new(1, -20, 0, 0);
	ContentFrame.Position = UDim2.new(0, 18, 0, 0);
	ContentFrame.BackgroundTransparency = 1;
	ContentFrame.AutomaticSize = Enum.AutomaticSize.Y;
	ContentFrame.ZIndex = 102;
	ContentFrame.Parent = InnerFrame;
	local ContentPadding = Instance.new("UIPadding");
	ContentPadding.PaddingTop = UDim.new(0, 12);
	ContentPadding.PaddingBottom = UDim.new(0, 12);
	ContentPadding.PaddingRight = UDim.new(0, 10);
	ContentPadding.Parent = ContentFrame;
	local ContentLayout = Instance.new("UIListLayout");
	ContentLayout.Padding = UDim.new(0, 3);
	ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	ContentLayout.Parent = ContentFrame;
	local Title = Instance.new("TextLabel");
	Title.Name = "Title";
	Title.Text = settings.title or "Notification";
	Title.TextColor3 = theme.Text;
	Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	Title.TextSize = (isMobile and 12) or 13;
	Title.Size = UDim2.new(1, 0, 0, 0);
	Title.BackgroundTransparency = 1;
	Title.TextXAlignment = Enum.TextXAlignment.Left;
	Title.TextWrapped = true;
	Title.AutomaticSize = Enum.AutomaticSize.Y;
	Title.LayoutOrder = 1;
	Title.TextTransparency = 1;
	Title.ZIndex = 103;
	Title.Parent = ContentFrame;
	local Body = Instance.new("TextLabel");
	Body.Name = "Body";
	Body.Text = settings.text or "";
	Body.TextColor3 = theme.TextDark;
	Body.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	Body.TextSize = (isMobile and 10) or 11;
	Body.Size = UDim2.new(1, 0, 0, 0);
	Body.BackgroundTransparency = 1;
	Body.TextXAlignment = Enum.TextXAlignment.Left;
	Body.TextWrapped = true;
	Body.AutomaticSize = Enum.AutomaticSize.Y;
	Body.LayoutOrder = 2;
	Body.TextTransparency = 1;
	Body.ZIndex = 103;
	Body.Parent = ContentFrame;
	local ProgressClip = Instance.new("Frame");
	ProgressClip.Size = UDim2.new(1, 0, 0, 2);
	ProgressClip.AnchorPoint = Vector2.new(0, 1);
	ProgressClip.Position = UDim2.new(0, 0, 1, 0);
	ProgressClip.BackgroundTransparency = 1;
	ProgressClip.ClipsDescendants = true;
	ProgressClip.BorderSizePixel = 0;
	ProgressClip.ZIndex = 102;
	ProgressClip.Parent = InnerFrame;
	local ProgressBar = Instance.new("Frame");
	ProgressBar.Name = "ProgressBar";
	ProgressBar.Size = UDim2.new(1, 0, 1, 0);
	ProgressBar.BackgroundColor3 = theme.Accent;
	ProgressBar.BackgroundTransparency = 0.25;
	ProgressBar.BorderSizePixel = 0;
	ProgressBar.ZIndex = 102;
	ProgressBar.Parent = ProgressClip;
	local PBCorner = Instance.new("UICorner");
	PBCorner.CornerRadius = UDim.new(0, 2);
	PBCorner.Parent = ProgressBar;
	table.insert(Library._themed_elements.Notifications, {Frame=InnerFrame,Stroke=UIStroke,Accent=AccentBar,Title=Title,Body=Body});
	local entry = {Root=Notification,InnerFrame=InnerFrame,UIStroke=UIStroke,AccentBar=AccentBar,Title=Title,Body=Body,BlurPart=BlurPart,BlurFolder=BlurFolder,_dismissed=false};
	table.insert(ActiveNotifications, entry);
	InnerFrame.Position = UDim2.new(-1, -20, 0, 0);
	InnerFrame.BackgroundTransparency = 0.7;
	AccentBar.BackgroundTransparency = 1;
	TweenService:Create(InnerFrame, Tween.slide, {Position=UDim2.new(0, 0, 0, 0),BackgroundTransparency=0.25}):Play();
	task.delay(0.08, function()
		TweenService:Create(AccentBar, Tween.smooth, {BackgroundTransparency=0}):Play();
		TweenService:Create(Title, Tween.smooth, {TextTransparency=0}):Play();
	end);
	task.delay(0.16, function()
		TweenService:Create(Body, Tween.smooth, {TextTransparency=0}):Play();
	end);
	task.delay(0.05, function()
		UpdateBlurPart(InnerFrame);
	end);
	local blurConn1 = InnerFrame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		UpdateBlurPart(InnerFrame);
	end);
	local blurConn2 = InnerFrame:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
		UpdateBlurPart(InnerFrame);
	end);
	local blurConn3 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(function()
		UpdateBlurPart(InnerFrame);
	end);
	local duration = settings.duration or 5;
	TweenService:Create(ProgressClip, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size=UDim2.new(0, 0, 0, 2)}):Play();
	task.delay(duration, function()
		if entry._dismissed then
			return;
		end
		blurConn1:Disconnect();
		blurConn2:Disconnect();
		blurConn3:Disconnect();
		DismissNotification(entry);
	end);
end;
Library.apply_theme = function(self, theme_name)
	if not Themes[theme_name] then
		return;
	end
	local theme = Themes[theme_name];
	self._current_theme = theme_name;
	Library._config._theme = theme_name;
	Config:save(game.GameId, Library._config);
	local elements = self._themed_elements;
	local ti = Tween.smooth;
	if elements.Container then
		TweenService:Create(elements.Container, ti, {BackgroundColor3=theme.Background}):Play();
	end
	if elements.ContainerStroke then
		TweenService:Create(elements.ContainerStroke, ti, {Color=theme.Stroke}):Play();
	end
	for _, module in ipairs(elements.Modules) do
		if (module and module.Parent) then
			TweenService:Create(module, ti, {BackgroundColor3=theme.ModuleBackground}):Play();
		end
	end
	if elements.Pin then
		TweenService:Create(elements.Pin, ti, {BackgroundColor3=theme.Accent}):Play();
	end
	for _, stroke in ipairs(elements.Strokes) do
		if (stroke and stroke.Parent) then
			TweenService:Create(stroke, ti, {Color=theme.Stroke}):Play();
		end
	end
	for _, toggle_data in ipairs(elements.ActiveToggles) do
		if (toggle_data.Toggle and toggle_data.Toggle.Parent) then
			TweenService:Create(toggle_data.Toggle, ti, {BackgroundColor3=theme.Accent}):Play();
		end
		if (toggle_data.Circle and toggle_data.Circle.Parent) then
			TweenService:Create(toggle_data.Circle, ti, {BackgroundColor3=theme.SecondaryAccent}):Play();
		end
	end
	for _, drag in ipairs(elements.SliderDrags) do
		if (drag and drag.Parent) then
			TweenService:Create(drag, ti, {BackgroundColor3=theme.Accent}):Play();
		end
	end
	for _, btn in ipairs(elements.AccentButtons) do
		if (btn and btn.Parent) then
			TweenService:Create(btn, ti, {BackgroundColor3=theme.Accent}):Play();
		end
	end
	for _, dh in ipairs(elements.DropdownHighlights) do
		if (dh.Highlight and dh.Highlight.Parent) then
			dh.Highlight.BackgroundColor3 = theme.Accent;
		end
		if (dh.Dot and dh.Dot.Parent) then
			dh.Dot.BackgroundColor3 = theme.Accent;
		end
	end
	for _, notif_data in ipairs(elements.Notifications) do
		if (notif_data.Frame and notif_data.Frame.Parent) then
			TweenService:Create(notif_data.Frame, ti, {BackgroundColor3=theme.ModuleBackground}):Play();
		end
		if (notif_data.Stroke and notif_data.Stroke.Parent) then
			TweenService:Create(notif_data.Stroke, ti, {Color=theme.Stroke}):Play();
		end
		if (notif_data.Accent and notif_data.Accent.Parent) then
			TweenService:Create(notif_data.Accent, ti, {BackgroundColor3=theme.Accent}):Play();
		end
		if (notif_data.Title and notif_data.Title.Parent) then
			TweenService:Create(notif_data.Title, ti, {TextColor3=theme.Text}):Play();
		end
		if (notif_data.Body and notif_data.Body.Parent) then
			TweenService:Create(notif_data.Body, ti, {TextColor3=theme.TextDark}):Play();
		end
	end
end;
Library.new = function(title)
	local self = setmetatable({_loaded=false,_tab=0,_title=(title or "Waver"),_themed_elements={Modules={},Strokes={},ActiveToggles={},SliderDrags={},Notifications={},AccentButtons={},DropdownHighlights={}}}, Library);
	self:create_ui();
	return self;
end;
Library.get_screen_scale = function(self)
	local viewport_size_x = workspace.CurrentCamera.ViewportSize.X;
	self._ui_scale = viewport_size_x / 1400;
end;
Library.get_device = function(self)
	local device = "Unknown";
	if (not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled) then
		device = "PC";
	elseif UserInputService.TouchEnabled then
		device = "Mobile";
	elseif UserInputService.GamepadEnabled then
		device = "Console";
	end
	self._device = device;
end;
Library.removed = function(self, action)
	self._ui.AncestryChanged:Once(action);
end;
Library.flag_type = function(self, flag, flag_type)
	if not Library._config._flags[flag] then
		return;
	end
	return typeof(Library._config._flags[flag]) == flag_type;
end;
Library.remove_table_value = function(self, __table, table_value)
	for index, value in __table do
		if (value ~= table_value) then
			continue;
		end
		table.remove(__table, index);
	end
end;
Library.create_ui = function(self)
	local Waver = CoreGui:FindFirstChild("BlooperUi");
	if Waver then
		Debris:AddItem(Waver, 0);
	end
	local WaverGui = Instance.new("ScreenGui");
	WaverGui.ResetOnSpawn = false;
	WaverGui.Name = "BlooperUi";
	WaverGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	WaverGui.Parent = CoreGui;
	local Container = Instance.new("Frame");
	Container.ClipsDescendants = true;
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Container.AnchorPoint = Vector2.new(0.5, 0.5);
	Container.Name = "Container";
	Container.BackgroundTransparency = 0.04;
	Container.BackgroundColor3 = Themes[Library._current_theme].Background;
	Container.Position = UDim2.new(0.5, 0, 0.5, 0);
	Container.Size = UDim2.new(0, 0, 0, 0);
	Container.Active = true;
	Container.BorderSizePixel = 0;
	Container.Parent = WaverGui;
	self._themed_elements.Container = Container;
	local UICorner = Instance.new("UICorner");
	UICorner.CornerRadius = UDim.new(0, 12);
	UICorner.Parent = Container;
	local UIStroke = Instance.new("UIStroke");
	UIStroke.Color = Themes[Library._current_theme].Stroke;
	UIStroke.Transparency = 0.35;
	UIStroke.Thickness = 1;
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	UIStroke.Parent = Container;
	self._themed_elements.ContainerStroke = UIStroke;
	table.insert(self._themed_elements.Strokes, UIStroke);
	local Handler = Instance.new("Frame");
	Handler.BackgroundTransparency = 1;
	Handler.Name = "Handler";
	Handler.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Handler.Size = UDim2.new(0, 698, 0, 479);
	Handler.BorderSizePixel = 0;
	Handler.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Handler.Parent = Container;
	local Tabs = Instance.new("ScrollingFrame");
	Tabs.ScrollBarImageTransparency = 1;
	Tabs.ScrollBarThickness = 0;
	Tabs.Name = "Tabs";
	Tabs.Size = UDim2.new(0, 129, 0, 401);
	Tabs.Selectable = false;
	Tabs.AutomaticCanvasSize = Enum.AutomaticSize.XY;
	Tabs.BackgroundTransparency = 1;
	Tabs.Position = UDim2.new(0.026097271591424942, 0, 0.1111111119389534, 0);
	Tabs.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Tabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Tabs.BorderSizePixel = 0;
	Tabs.CanvasSize = UDim2.new(0, 0, 0.5, 0);
	Tabs.Parent = Handler;
	local UIListLayout = Instance.new("UIListLayout");
	UIListLayout.Padding = UDim.new(0, 4);
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	UIListLayout.Parent = Tabs;
	local ClientName = Instance.new("TextLabel");
	ClientName.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
	ClientName.TextColor3 = Color3.fromRGB(255, 255, 255);
	ClientName.TextTransparency = 0.15;
	ClientName.Text = self._title;
	ClientName.Name = "ClientName";
	ClientName.Size = UDim2.new(0, 40, 0, 13);
	ClientName.AnchorPoint = Vector2.new(0, 0.5);
	ClientName.Position = UDim2.new(0.0560000017285347, 0, 0.054999999701976776, 0);
	ClientName.BackgroundTransparency = 1;
	ClientName.TextXAlignment = Enum.TextXAlignment.Left;
	ClientName.BorderSizePixel = 0;
	ClientName.BorderColor3 = Color3.fromRGB(0, 0, 0);
	ClientName.TextSize = 13;
	ClientName.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	ClientName.Parent = Handler;
	local UIGradient = Instance.new("UIGradient");
	UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 200, 200)),ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))});
	UIGradient.Parent = ClientName;
	local Pin = Instance.new("Frame");
	Pin.Name = "Pin";
	Pin.Position = UDim2.new(0.026000000536441803, 0, 0.13600000739097595, 0);
	Pin.BorderColor3 = Themes[Library._current_theme].Accent;
	Pin.Size = UDim2.new(0, 2, 0, 16);
	Pin.BorderSizePixel = 0;
	Pin.BackgroundColor3 = Themes[Library._current_theme].Accent;
	Pin.Parent = Handler;
	self._themed_elements.Pin = Pin;
	local UICorner2 = Instance.new("UICorner");
	UICorner2.CornerRadius = UDim.new(1, 0);
	UICorner2.Parent = Pin;
	local PinGlow = Instance.new("Frame");
	PinGlow.Name = "Glow";
	PinGlow.Size = UDim2.new(3, 0, 1, 0);
	PinGlow.AnchorPoint = Vector2.new(0.5, 0.5);
	PinGlow.Position = UDim2.new(0.5, 0, 0.5, 0);
	PinGlow.BackgroundColor3 = Themes[Library._current_theme].Accent;
	PinGlow.BackgroundTransparency = 0.85;
	PinGlow.BorderSizePixel = 0;
	PinGlow.ZIndex = 0;
	PinGlow.Parent = Pin;
	local PGCorner = Instance.new("UICorner");
	PGCorner.CornerRadius = UDim.new(1, 0);
	PGCorner.Parent = PinGlow;
	local Icon = Instance.new("ImageLabel");
	Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
	Icon.ScaleType = Enum.ScaleType.Fit;
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Icon.AnchorPoint = Vector2.new(0, 0.5);
	Icon.Image = "rbxassetid://107819132007001";
	Icon.BackgroundTransparency = 1;
	Icon.Position = UDim2.new(0.02500000037252903, 0, 0.054999999701976776, 0);
	Icon.Name = "Icon";
	Icon.Size = UDim2.new(0, 18, 0, 18);
	Icon.BorderSizePixel = 0;
	Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Icon.Parent = Handler;
	local Divider = Instance.new("Frame");
	Divider.Name = "Divider";
	Divider.BackgroundTransparency = 0.7;
	Divider.Position = UDim2.new(0.23499999940395355, 0, 0, 0);
	Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Divider.Size = UDim2.new(0, 1, 0, 479);
	Divider.BorderSizePixel = 0;
	Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Divider.Parent = Handler;
	local Sections = Instance.new("Folder");
	Sections.Name = "Sections";
	Sections.Parent = Handler;
	local Minimize = Instance.new("TextButton");
	Minimize.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	Minimize.TextColor3 = Color3.fromRGB(0, 0, 0);
	Minimize.BorderColor3 = Color3.fromRGB(0, 0, 0);
	Minimize.Text = "";
	Minimize.AutoButtonColor = false;
	Minimize.Name = "Minimize";
	Minimize.BackgroundTransparency = 1;
	Minimize.Position = UDim2.new(0.020057305693626404, 0, 0.02922755666077137, 0);
	Minimize.Size = UDim2.new(0, 24, 0, 24);
	Minimize.BorderSizePixel = 0;
	Minimize.TextSize = 14;
	Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
	Minimize.Parent = Handler;
	local UIScale = Instance.new("UIScale");
	UIScale.Parent = Container;
	self._ui = WaverGui;
	local function on_drag(input, process)
		if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
			self._dragging = true;
			self._drag_start = input.Position;
			self._container_position = Container.Position;
			Connections['container_input_ended'] = input.Changed:Connect(function()
				if (input.UserInputState ~= Enum.UserInputState.End) then
					return;
				end
				Connections:disconnect("container_input_ended");
				self._dragging = false;
			end);
		end
	end
	local function update_drag(input)
		local delta = input.Position - self._drag_start;
		local position = UDim2.new(self._container_position.X.Scale, self._container_position.X.Offset + delta.X, self._container_position.Y.Scale, self._container_position.Y.Offset + delta.Y);
		TweenService:Create(Container, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position=position}):Play();
	end
	local function drag(input, process)
		if not self._dragging then
			return;
		end
		if ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch)) then
			update_drag(input);
		end
	end
	Connections['container_input_began'] = Container.InputBegan:Connect(on_drag);
	Connections['input_changed'] = UserInputService.InputChanged:Connect(drag);
	self:removed(function()
		self._ui = nil;
		Connections:disconnect_all();
	end);
	self.Update1Run = function(self, a)
		if (a == "nil") then
			Container.BackgroundTransparency = 0.04;
		else
			pcall(function()
				Container.BackgroundTransparency = tonumber(a);
			end);
		end
	end;
	self.UIVisiblity = function(self)
		WaverGui.Enabled = not WaverGui.Enabled;
	end;
	self.change_visiblity = function(self, state)
		local Is_Mobile = UserInputService.TouchEnabled;
		if not Is_Mobile then
			Container.Visible = state;
		end
		if state then
			TweenService:Create(Container, Tween.slow, {Size=UDim2.fromOffset(698, 479)}):Play();
		else
			local titleParams = Instance.new("GetTextBoundsParams");
			titleParams.Text = self._title;
			titleParams.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			titleParams.Size = 13;
			titleParams.Width = 10000;
			local titleBounds = TextService:GetTextBoundsAsync(titleParams);
			local minWidth = math.max(104.5, 18 + 14 + 6 + titleBounds.X + 14 + 24 + 10);
			TweenService:Create(Container, Tween.slow, {Size=UDim2.fromOffset(minWidth, 52)}):Play();
		end
	end;
	self.load = function(self)
		local content = {};
		for _, object in WaverGui:GetDescendants() do
			if not object:IsA("ImageLabel") then
				continue;
			end
			table.insert(content, object);
		end
		ContentProvider:PreloadAsync(content);
		self:get_device();
		if ((self._device == "Mobile") or (self._device == "Unknown")) then
			self:get_screen_scale();
			UIScale.Scale = self._ui_scale;
			Connections['ui_scale'] = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				self:get_screen_scale();
				UIScale.Scale = self._ui_scale;
			end);
		end
		TweenService:Create(Container, Tween.slow, {Size=UDim2.fromOffset(698, 479)}):Play();
		AcrylicBlur.new(Container);
		self._ui_loaded = true;
		if (Library._config._theme and Themes[Library._config._theme]) then
			self:apply_theme(Library._config._theme);
		end
	end;
	self.update_tabs = function(self, tab)
		for index, object in Tabs:GetChildren() do
			if (object.Name ~= "Tab") then
				continue;
			end
			if (object == tab) then
				if (object.BackgroundTransparency ~= 0.5) then
					local offset = object.LayoutOrder * (0.113 / 1.3);
					TweenService:Create(Pin, Tween.spring, {Position=UDim2.fromScale(0.026, 0.135 + offset)}):Play();
					TweenService:Create(object, Tween.smooth, {BackgroundTransparency=0.5}):Play();
					TweenService:Create(object.TextLabel, Tween.smooth, {TextTransparency=0.1,TextColor3=Color3.fromRGB(255, 255, 255)}):Play();
					TweenService:Create(object.TextLabel.UIGradient, Tween.smooth, {Offset=Vector2.new(1, 0)}):Play();
					TweenService:Create(object.Icon, Tween.smooth, {ImageTransparency=0.1,ImageColor3=Color3.fromRGB(255, 255, 255)}):Play();
				end
				continue;
			end
			if (object.BackgroundTransparency ~= 1) then
				TweenService:Create(object, Tween.smooth, {BackgroundTransparency=1}):Play();
				TweenService:Create(object.TextLabel, Tween.smooth, {TextTransparency=0.65,TextColor3=Color3.fromRGB(255, 255, 255)}):Play();
				TweenService:Create(object.TextLabel.UIGradient, Tween.smooth, {Offset=Vector2.new(0, 0)}):Play();
				TweenService:Create(object.Icon, Tween.smooth, {ImageTransparency=0.75,ImageColor3=Color3.fromRGB(255, 255, 255)}):Play();
			end
		end
	end;
	self.update_sections = function(self, left_section, right_section)
		for _, object in Sections:GetChildren() do
			if ((object == left_section) or (object == right_section)) then
				object.Visible = true;
				continue;
			end
			object.Visible = false;
		end
	end;
	self.create_theme_dropdown = function(self, parent_module)
		local theme_names = {};
		for name, _ in pairs(Themes) do
			table.insert(theme_names, name);
		end
		table.sort(theme_names);
		parent_module:create_dropdown({title="UI Theme",flag="SelectedTheme",options=theme_names,multi_dropdown=false,maximum_options=#theme_names,callback=function(selected_theme)
			self:apply_theme(selected_theme);
			local meta = ThemeMeta[selected_theme];
			local desc = (meta and meta.desc) or selected_theme;
			Library.SendNotification({title=("Theme · " .. selected_theme),text=desc,duration=2.5});
		end});
	end;
	self.create_tab = function(self, title, icon)
		local lib = self;
		local TabManager = {};
		local LayoutOrderModule = 0;
		local font_params = Instance.new("GetTextBoundsParams");
		font_params.Text = title;
		font_params.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		font_params.Size = 13;
		font_params.Width = 10000;
		local font_size = TextService:GetTextBoundsAsync(font_params);
		local first_tab = not Tabs:FindFirstChild("Tab");
		local Tab = Instance.new("TextButton");
		Tab.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
		Tab.TextColor3 = Color3.fromRGB(0, 0, 0);
		Tab.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Tab.Text = "";
		Tab.AutoButtonColor = false;
		Tab.BackgroundTransparency = 1;
		Tab.Name = "Tab";
		Tab.Size = UDim2.new(0, 129, 0, 38);
		Tab.BorderSizePixel = 0;
		Tab.TextSize = 14;
		Tab.BackgroundColor3 = Color3.fromRGB(22, 28, 38);
		Tab.Parent = Tabs;
		Tab.LayoutOrder = self._tab;
		local UICorner = Instance.new("UICorner");
		UICorner.CornerRadius = UDim.new(0, 7);
		UICorner.Parent = Tab;
		local TextLabel = Instance.new("TextLabel");
		TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
		TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
		TextLabel.TextTransparency = 0.65;
		TextLabel.Text = title;
		TextLabel.Size = UDim2.new(0, font_size.X, 0, 16);
		TextLabel.AnchorPoint = Vector2.new(0, 0.5);
		TextLabel.Position = UDim2.new(0.2400001734495163, 0, 0.5, 0);
		TextLabel.BackgroundTransparency = 1;
		TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
		TextLabel.BorderSizePixel = 0;
		TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
		TextLabel.TextSize = 13;
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		TextLabel.Parent = Tab;
		local UIGradient = Instance.new("UIGradient");
		UIGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(0.7, Color3.fromRGB(155, 155, 155)),ColorSequenceKeypoint.new(1, Color3.fromRGB(58, 58, 58))});
		UIGradient.Parent = TextLabel;
		local Icon = Instance.new("ImageLabel");
		Icon.ScaleType = Enum.ScaleType.Fit;
		Icon.ImageTransparency = 0.75;
		Icon.BorderColor3 = Color3.fromRGB(0, 0, 0);
		Icon.AnchorPoint = Vector2.new(0, 0.5);
		Icon.BackgroundTransparency = 1;
		Icon.Position = UDim2.new(0.10000000149011612, 0, 0.5, 0);
		Icon.Name = "Icon";
		Icon.Image = icon;
		Icon.Size = UDim2.new(0, 12, 0, 12);
		Icon.BorderSizePixel = 0;
		Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		Icon.Parent = Tab;
		Tab.MouseEnter:Connect(function()
			if (Tab.BackgroundTransparency ~= 0.5) then
				TweenService:Create(Tab, Tween.fast, {BackgroundTransparency=0.85}):Play();
			end
		end);
		Tab.MouseLeave:Connect(function()
			if (Tab.BackgroundTransparency ~= 0.5) then
				TweenService:Create(Tab, Tween.fast, {BackgroundTransparency=1}):Play();
			end
		end);
		local LeftSection = Instance.new("ScrollingFrame");
		LeftSection.Name = "LeftSection";
		LeftSection.AutomaticCanvasSize = Enum.AutomaticSize.XY;
		LeftSection.ScrollBarThickness = 0;
		LeftSection.Size = UDim2.new(0, 243, 0, 445);
		LeftSection.Selectable = false;
		LeftSection.AnchorPoint = Vector2.new(0, 0.5);
		LeftSection.ScrollBarImageTransparency = 1;
		LeftSection.BackgroundTransparency = 1;
		LeftSection.Position = UDim2.new(0.2594326436519623, 0, 0.5, 0);
		LeftSection.BorderColor3 = Color3.fromRGB(0, 0, 0);
		LeftSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		LeftSection.BorderSizePixel = 0;
		LeftSection.CanvasSize = UDim2.new(0, 0, 0.5, 0);
		LeftSection.Visible = false;
		LeftSection.Parent = Sections;
		local UIListLayout2 = Instance.new("UIListLayout");
		UIListLayout2.Padding = UDim.new(0, 10);
		UIListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder;
		UIListLayout2.Parent = LeftSection;
		local UIPadding2 = Instance.new("UIPadding");
		UIPadding2.PaddingTop = UDim.new(0, 2);
		UIPadding2.Parent = LeftSection;
		local RightSection = Instance.new("ScrollingFrame");
		RightSection.Name = "RightSection";
		RightSection.AutomaticCanvasSize = Enum.AutomaticSize.XY;
		RightSection.ScrollBarThickness = 0;
		RightSection.Size = UDim2.new(0, 243, 0, 445);
		RightSection.Selectable = false;
		RightSection.AnchorPoint = Vector2.new(0, 0.5);
		RightSection.ScrollBarImageTransparency = 1;
		RightSection.BackgroundTransparency = 1;
		RightSection.Position = UDim2.new(0.6290000081062317, 0, 0.5, 0);
		RightSection.BorderColor3 = Color3.fromRGB(0, 0, 0);
		RightSection.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		RightSection.BorderSizePixel = 0;
		RightSection.CanvasSize = UDim2.new(0, 0, 0.5, 0);
		RightSection.Visible = false;
		RightSection.Parent = Sections;
		local UIListLayout3 = Instance.new("UIListLayout");
		UIListLayout3.Padding = UDim.new(0, 10);
		UIListLayout3.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		UIListLayout3.SortOrder = Enum.SortOrder.LayoutOrder;
		UIListLayout3.Parent = RightSection;
		local UIPadding3 = Instance.new("UIPadding");
		UIPadding3.PaddingTop = UDim.new(0, 2);
		UIPadding3.Parent = RightSection;
		self._tab += 1
		if first_tab then
			self:update_tabs(Tab, LeftSection, RightSection);
			self:update_sections(LeftSection, RightSection);
		end
		Tab.MouseButton1Click:Connect(function()
			self:update_tabs(Tab, LeftSection, RightSection);
			self:update_sections(LeftSection, RightSection);
		end);
		TabManager.create_label = function(self, settings)
			local targetSection = ((settings.section == "right") and RightSection) or LeftSection;
			local LabelFrame = Instance.new("Frame");
			LabelFrame.Name = "IndependentLabel";
			LabelFrame.BackgroundColor3 = Themes[Library._current_theme].ModuleBackground;
			LabelFrame.BackgroundTransparency = 0.45;
			LabelFrame.Size = UDim2.new(0, 241, 0, 0);
			LabelFrame.AutomaticSize = Enum.AutomaticSize.Y;
			LabelFrame.BorderSizePixel = 0;
			LabelFrame.Parent = targetSection;
			table.insert(lib._themed_elements.Modules, LabelFrame);
			local UICorner = Instance.new("UICorner");
			UICorner.CornerRadius = UDim.new(0, 7);
			UICorner.Parent = LabelFrame;
			local UIStroke = Instance.new("UIStroke");
			UIStroke.Color = Themes[Library._current_theme].Stroke;
			UIStroke.Transparency = 0.4;
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			UIStroke.Parent = LabelFrame;
			table.insert(lib._themed_elements.Strokes, UIStroke);
			local Padding = Instance.new("UIPadding");
			Padding.PaddingTop = UDim.new(0, 12);
			Padding.PaddingBottom = UDim.new(0, 12);
			Padding.PaddingLeft = UDim.new(0, 14);
			Padding.PaddingRight = UDim.new(0, 14);
			Padding.Parent = LabelFrame;
			local ContentLayout = Instance.new("UIListLayout");
			ContentLayout.Padding = UDim.new(0, 5);
			ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			ContentLayout.Parent = LabelFrame;
			local TitleLabel = nil;
			if settings.title then
				TitleLabel = Instance.new("TextLabel");
				TitleLabel.Name = "Title";
				TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				TitleLabel.TextColor3 = Themes[Library._current_theme].Text;
				TitleLabel.TextTransparency = 0.1;
				TitleLabel.TextSize = 13;
				TitleLabel.Text = settings.title;
				TitleLabel.Size = UDim2.new(1, 0, 0, 0);
				TitleLabel.AutomaticSize = Enum.AutomaticSize.Y;
				TitleLabel.BackgroundTransparency = 1;
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;
				TitleLabel.TextWrapped = true;
				TitleLabel.LayoutOrder = 1;
				TitleLabel.Parent = LabelFrame;
				if settings.rich then
					TitleLabel.RichText = true;
				end
			end
			local BodyLabel = nil;
			if settings.text then
				BodyLabel = Instance.new("TextLabel");
				BodyLabel.Name = "Body";
				BodyLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				BodyLabel.TextColor3 = Themes[Library._current_theme].TextDark;
				BodyLabel.TextTransparency = 0.2;
				BodyLabel.TextSize = 11;
				BodyLabel.Text = settings.text;
				BodyLabel.Size = UDim2.new(1, 0, 0, 0);
				BodyLabel.AutomaticSize = Enum.AutomaticSize.Y;
				BodyLabel.BackgroundTransparency = 1;
				BodyLabel.TextXAlignment = Enum.TextXAlignment.Left;
				BodyLabel.TextWrapped = true;
				BodyLabel.LayoutOrder = 2;
				BodyLabel.Parent = LabelFrame;
				if settings.rich then
					BodyLabel.RichText = true;
				end
			end
			local LabelManager = {};
			LabelManager.SetText = function(self, newText)
				if BodyLabel then
					BodyLabel.Text = newText;
				end
			end;
			LabelManager.SetTitle = function(self, newTitle)
				if TitleLabel then
					TitleLabel.Text = newTitle;
				end
			end;
			LabelManager.Set = function(self, newSettings)
				if (newSettings.title and TitleLabel) then
					TitleLabel.Text = newSettings.title;
					if newSettings.rich then
						TitleLabel.RichText = true;
					end
				end
				if (newSettings.text and BodyLabel) then
					BodyLabel.Text = newSettings.text;
					if newSettings.rich then
						BodyLabel.RichText = true;
					end
				end
			end;
			LabelManager.Destroy = function(self)
				for i, v in ipairs(lib._themed_elements.Modules) do
					if (v == LabelFrame) then
						table.remove(lib._themed_elements.Modules, i);
						break;
					end
				end
				for i, v in ipairs(lib._themed_elements.Strokes) do
					if (v == UIStroke) then
						table.remove(lib._themed_elements.Strokes, i);
						break;
					end
				end
				LabelFrame:Destroy();
			end;
			return LabelManager;
		end;
		TabManager.create_button = function(self, settings)
			local targetSection = ((settings.section == "right") and RightSection) or LeftSection;
			local ButtonFrame = Instance.new("Frame");
			ButtonFrame.Name = "IndependentButton";
			ButtonFrame.BackgroundColor3 = Themes[Library._current_theme].ModuleBackground;
			ButtonFrame.BackgroundTransparency = 0.45;
			ButtonFrame.Size = UDim2.new(0, 241, 0, 0);
			ButtonFrame.AutomaticSize = Enum.AutomaticSize.Y;
			ButtonFrame.BorderSizePixel = 0;
			ButtonFrame.Parent = targetSection;
			table.insert(lib._themed_elements.Modules, ButtonFrame);
			local UICorner = Instance.new("UICorner");
			UICorner.CornerRadius = UDim.new(0, 7);
			UICorner.Parent = ButtonFrame;
			local UIStroke = Instance.new("UIStroke");
			UIStroke.Color = Themes[Library._current_theme].Stroke;
			UIStroke.Transparency = 0.4;
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			UIStroke.Parent = ButtonFrame;
			table.insert(lib._themed_elements.Strokes, UIStroke);
			local Padding = Instance.new("UIPadding");
			Padding.PaddingTop = UDim.new(0, 12);
			Padding.PaddingBottom = UDim.new(0, 12);
			Padding.PaddingLeft = UDim.new(0, 14);
			Padding.PaddingRight = UDim.new(0, 14);
			Padding.Parent = ButtonFrame;
			local ContentLayout = Instance.new("UIListLayout");
			ContentLayout.Padding = UDim.new(0, 8);
			ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			ContentLayout.Parent = ButtonFrame;
			local TitleLabel = nil;
			if settings.title then
				TitleLabel = Instance.new("TextLabel");
				TitleLabel.Name = "Title";
				TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				TitleLabel.TextColor3 = Themes[Library._current_theme].Text;
				TitleLabel.TextTransparency = 0.1;
				TitleLabel.TextSize = 13;
				TitleLabel.Text = settings.title;
				TitleLabel.Size = UDim2.new(1, 0, 0, 0);
				TitleLabel.AutomaticSize = Enum.AutomaticSize.Y;
				TitleLabel.BackgroundTransparency = 1;
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;
				TitleLabel.TextWrapped = true;
				TitleLabel.LayoutOrder = 1;
				TitleLabel.Parent = ButtonFrame;
				if settings.rich then
					TitleLabel.RichText = true;
				end
			end
			local DescriptionLabel = nil;
			if settings.description then
				DescriptionLabel = Instance.new("TextLabel");
				DescriptionLabel.Name = "Description";
				DescriptionLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				DescriptionLabel.TextColor3 = Themes[Library._current_theme].TextDark;
				DescriptionLabel.TextTransparency = 0.2;
				DescriptionLabel.TextSize = 11;
				DescriptionLabel.Text = settings.description;
				DescriptionLabel.Size = UDim2.new(1, 0, 0, 0);
				DescriptionLabel.AutomaticSize = Enum.AutomaticSize.Y;
				DescriptionLabel.BackgroundTransparency = 1;
				DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left;
				DescriptionLabel.TextWrapped = true;
				DescriptionLabel.LayoutOrder = 2;
				DescriptionLabel.Parent = ButtonFrame;
			end
			local Button = Instance.new("TextButton");
			Button.Name = "Button";
			Button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Button.TextColor3 = Themes[Library._current_theme].Text;
			Button.Text = settings.buttonText or SelectedLanguage.ButtonClick or "Click";
			Button.TextSize = 12;
			Button.Size = UDim2.new(1, 0, 0, 34);
			Button.BackgroundColor3 = Themes[Library._current_theme].Accent;
			Button.BackgroundTransparency = 0.25;
			Button.BorderSizePixel = 0;
			Button.AutoButtonColor = false;
			Button.LayoutOrder = 3;
			Button.Parent = ButtonFrame;
			table.insert(lib._themed_elements.AccentButtons, Button);
			local ButtonCorner = Instance.new("UICorner");
			ButtonCorner.CornerRadius = UDim.new(0, 6);
			ButtonCorner.Parent = Button;
			Button.MouseEnter:Connect(function()
				TweenService:Create(Button, Tween.fast, {BackgroundTransparency=0.05}):Play();
			end);
			Button.MouseLeave:Connect(function()
				TweenService:Create(Button, Tween.fast, {BackgroundTransparency=0.25}):Play();
			end);
			Button.MouseButton1Down:Connect(function()
				TweenService:Create(Button, Tween.snap_in, {BackgroundTransparency=0.5,Size=UDim2.new(1, -4, 0, 32)}):Play();
			end);
			Button.MouseButton1Up:Connect(function()
				TweenService:Create(Button, Tween.spring, {BackgroundTransparency=0.05,Size=UDim2.new(1, 0, 0, 34)}):Play();
			end);
			Button.MouseButton1Click:Connect(function()
				if settings.callback then
					settings.callback();
				end
			end);
			local ButtonManager = {};
			ButtonManager.SetTitle = function(self, newTitle)
				if TitleLabel then
					TitleLabel.Text = newTitle;
				end
			end;
			ButtonManager.SetDescription = function(self, newDesc)
				if DescriptionLabel then
					DescriptionLabel.Text = newDesc;
				end
			end;
			ButtonManager.SetButtonText = function(self, newText)
				Button.Text = newText;
			end;
			ButtonManager.SetCallback = function(self, newCallback)
				settings.callback = newCallback;
			end;
			ButtonManager.Destroy = function(self)
				for i, v in ipairs(lib._themed_elements.Modules) do
					if (v == ButtonFrame) then
						table.remove(lib._themed_elements.Modules, i);
						break;
					end
				end
				for i, v in ipairs(lib._themed_elements.Strokes) do
					if (v == UIStroke) then
						table.remove(lib._themed_elements.Strokes, i);
						break;
					end
				end
				ButtonFrame:Destroy();
			end;
			return ButtonManager;
		end;
		TabManager.create_module = function(self, settings)
			local LayoutOrderModule = 0;
			local ModuleManager = {_state=false,_dropdownSize=0};
			if (settings.section == "right") then
				settings.section = RightSection;
			else
				settings.section = LeftSection;
			end
			local Module = Instance.new("Frame");
			Module.ClipsDescendants = false;
			Module.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Module.BackgroundTransparency = 0.45;
			Module.Position = UDim2.new(0.004115226212888956, 0, 0, 0);
			Module.Name = "Module";
			Module.Size = UDim2.new(0, 241, 0, 0);
			Module.AutomaticSize = Enum.AutomaticSize.Y;
			Module.BorderSizePixel = 0;
			Module.BackgroundColor3 = Themes[Library._current_theme].ModuleBackground;
			Module.Parent = settings.section;
			table.insert(lib._themed_elements.Modules, Module);
			local UIListLayout = Instance.new("UIListLayout");
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayout.Parent = Module;
			local UICorner = Instance.new("UICorner");
			UICorner.CornerRadius = UDim.new(0, 8);
			UICorner.Parent = Module;
			local UIStroke = Instance.new("UIStroke");
			UIStroke.Color = Themes[Library._current_theme].Stroke;
			UIStroke.Transparency = 0.4;
			UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			UIStroke.Parent = Module;
			table.insert(lib._themed_elements.Strokes, UIStroke);
			local Header = Instance.new("TextButton");
			Header.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Header.TextColor3 = Color3.fromRGB(0, 0, 0);
			Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Header.Text = "";
			Header.AutoButtonColor = false;
			Header.BackgroundTransparency = 1;
			Header.Name = "Header";
			Header.Size = UDim2.new(0, 241, 0, 93);
			Header.BorderSizePixel = 0;
			Header.TextSize = 14;
			Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Header.Parent = Module;
			Header.MouseEnter:Connect(function()
				TweenService:Create(Module, Tween.fast, {BackgroundTransparency=0.35}):Play();
			end);
			Header.MouseLeave:Connect(function()
				TweenService:Create(Module, Tween.fast, {BackgroundTransparency=0.45}):Play();
			end);
			local Icon = Instance.new("ImageLabel");
			Icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
			Icon.ScaleType = Enum.ScaleType.Fit;
			Icon.ImageTransparency = 0.65;
			Icon.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Icon.AnchorPoint = Vector2.new(0, 0.5);
			Icon.Image = "rbxassetid://79095934438045";
			Icon.BackgroundTransparency = 1;
			Icon.Position = UDim2.new(0.07100000232458115, 0, 0.8199999928474426, 0);
			Icon.Name = "Icon";
			Icon.Size = UDim2.new(0, 15, 0, 15);
			Icon.BorderSizePixel = 0;
			Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Icon.Parent = Header;
			local ModuleName = Instance.new("TextLabel");
			ModuleName.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			ModuleName.TextColor3 = Color3.fromRGB(255, 255, 255);
			ModuleName.TextTransparency = 0.1;
			if not settings.rich then
				ModuleName.Text = settings.title or "Module";
			else
				ModuleName.RichText = true;
				ModuleName.Text = settings.richtext or "<font color='rgb(255,0,0)'>Waver</font>";
			end
			ModuleName.Name = "ModuleName";
			ModuleName.Size = UDim2.new(0, 205, 0, 13);
			ModuleName.AnchorPoint = Vector2.new(0, 0.5);
			ModuleName.Position = UDim2.new(0.0729999989271164, 0, 0.23999999463558197, 0);
			ModuleName.BackgroundTransparency = 1;
			ModuleName.TextXAlignment = Enum.TextXAlignment.Left;
			ModuleName.BorderSizePixel = 0;
			ModuleName.BorderColor3 = Color3.fromRGB(0, 0, 0);
			ModuleName.TextSize = 13;
			ModuleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			ModuleName.Parent = Header;
			local Description = Instance.new("TextLabel");
			Description.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
			Description.TextColor3 = Color3.fromRGB(255, 255, 255);
			Description.TextTransparency = 0.6;
			Description.Text = settings.description or "";
			Description.Name = "Description";
			Description.Size = UDim2.new(0, 205, 0, 13);
			Description.AnchorPoint = Vector2.new(0, 0.5);
			Description.Position = UDim2.new(0.0729999989271164, 0, 0.41999998688697815, 0);
			Description.BackgroundTransparency = 1;
			Description.TextXAlignment = Enum.TextXAlignment.Left;
			Description.BorderSizePixel = 0;
			Description.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Description.TextSize = 10;
			Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Description.Parent = Header;
			local Toggle = Instance.new("Frame");
			Toggle.Name = "Toggle";
			Toggle.BackgroundTransparency = 0.65;
			Toggle.Position = UDim2.new(0.8199999928474426, 0, 0.7570000290870667, 0);
			Toggle.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Toggle.Size = UDim2.new(0, 28, 0, 14);
			Toggle.BorderSizePixel = 0;
			Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
			Toggle.Parent = Header;
			local ToggleCorner = Instance.new("UICorner");
			ToggleCorner.CornerRadius = UDim.new(1, 0);
			ToggleCorner.Parent = Toggle;
			local Circle = Instance.new("Frame");
			Circle.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Circle.AnchorPoint = Vector2.new(0, 0.5);
			Circle.BackgroundTransparency = 0.1;
			Circle.Position = UDim2.new(0, 1, 0.5, 0);
			Circle.Name = "Circle";
			Circle.Size = UDim2.new(0, 12, 0, 12);
			Circle.BorderSizePixel = 0;
			Circle.BackgroundColor3 = Color3.fromRGB(66, 80, 115);
			Circle.Parent = Toggle;
			local CircleCorner = Instance.new("UICorner");
			CircleCorner.CornerRadius = UDim.new(1, 0);
			CircleCorner.Parent = Circle;
			local Keybind = Instance.new("Frame");
			Keybind.Name = "Keybind";
			Keybind.BackgroundTransparency = 0.65;
			Keybind.Position = UDim2.new(0.15000000596046448, 0, 0.7350000143051147, 0);
			Keybind.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Keybind.Size = UDim2.new(0, 33, 0, 15);
			Keybind.BorderSizePixel = 0;
			Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Keybind.Parent = Header;
			local KeybindCorner = Instance.new("UICorner");
			KeybindCorner.CornerRadius = UDim.new(0, 4);
			KeybindCorner.Parent = Keybind;
			local KeybindLabel = Instance.new("TextLabel");
			KeybindLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
			KeybindLabel.TextColor3 = Color3.fromRGB(209, 222, 255);
			KeybindLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
			KeybindLabel.Text = "None";
			KeybindLabel.AnchorPoint = Vector2.new(0.5, 0.5);
			KeybindLabel.Size = UDim2.new(0, 25, 0, 13);
			KeybindLabel.BackgroundTransparency = 1;
			KeybindLabel.TextXAlignment = Enum.TextXAlignment.Left;
			KeybindLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
			KeybindLabel.BorderSizePixel = 0;
			KeybindLabel.TextSize = 10;
			KeybindLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			KeybindLabel.Parent = Keybind;
			local Divider = Instance.new("Frame");
			Divider.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Divider.AnchorPoint = Vector2.new(0.5, 0);
			Divider.BackgroundTransparency = 0.65;
			Divider.Position = UDim2.new(0.5, 0, 0.6200000047683716, 0);
			Divider.Name = "Divider";
			Divider.Size = UDim2.new(0, 241, 0, 1);
			Divider.BorderSizePixel = 0;
			Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Divider.Parent = Header;
			local Divider2 = Instance.new("Frame");
			Divider2.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Divider2.AnchorPoint = Vector2.new(0.5, 0);
			Divider2.BackgroundTransparency = 0.65;
			Divider2.Position = UDim2.new(0.5, 0, 1, 0);
			Divider2.Name = "Divider";
			Divider2.Size = UDim2.new(0, 241, 0, 1);
			Divider2.BorderSizePixel = 0;
			Divider2.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Divider2.Parent = Header;
			local Options = Instance.new("Frame");
			Options.Name = "Options";
			Options.BackgroundTransparency = 1;
			Options.BorderColor3 = Color3.fromRGB(0, 0, 0);
			Options.Size = UDim2.new(0, 241, 0, 0);
			Options.AutomaticSize = Enum.AutomaticSize.Y;
			Options.BorderSizePixel = 0;
			Options.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			Options.Visible = false;
			Options.Parent = Module;
			local UIPaddingOptions = Instance.new("UIPadding");
			UIPaddingOptions.PaddingTop = UDim.new(0, 8);
			UIPaddingOptions.PaddingBottom = UDim.new(0, 12);
			UIPaddingOptions.Parent = Options;
			local UIListLayoutOptions = Instance.new("UIListLayout");
			UIListLayoutOptions.Padding = UDim.new(0, 6);
			UIListLayoutOptions.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			UIListLayoutOptions.SortOrder = Enum.SortOrder.LayoutOrder;
			UIListLayoutOptions.Parent = Options;
			ModuleManager.change_state = function(self, state)
				self._state = state;
				local toggle_data = {Toggle=Toggle,Circle=Circle};
				if self._state then
					Options.Visible = true;
					TweenService:Create(Toggle, Tween.smooth, {BackgroundColor3=Themes[Library._current_theme].Accent,BackgroundTransparency=0}):Play();
					TweenService:Create(Circle, Tween.spring, {BackgroundColor3=Themes[Library._current_theme].SecondaryAccent,Position=UDim2.fromScale(0.52, 0.5),Size=UDim2.fromOffset(13, 13)}):Play();
					table.insert(lib._themed_elements.ActiveToggles, toggle_data);
				else
					Options.Visible = false;
					TweenService:Create(Toggle, Tween.smooth, {BackgroundColor3=Color3.fromRGB(0, 0, 0),BackgroundTransparency=0.65}):Play();
					TweenService:Create(Circle, Tween.spring, {BackgroundColor3=Color3.fromRGB(66, 80, 115),Position=UDim2.fromScale(0.04, 0.5),Size=UDim2.fromOffset(12, 12)}):Play();
					for i, v in ipairs(lib._themed_elements.ActiveToggles) do
						if (v.Toggle == Toggle) then
							table.remove(lib._themed_elements.ActiveToggles, i);
							break;
						end
					end
				end
				Library._config._flags[settings.flag] = self._state;
				Config:save(game.GameId, Library._config);
				settings.callback(self._state);
			end;
			ModuleManager.connect_keybind = function(self)
				if not Library._config._keybinds[settings.flag] then
					return;
				end
				Connections[settings.flag .. "_keybind"] = UserInputService.InputBegan:Connect(function(input, process)
					if process then
						return;
					end
					if (tostring(input.KeyCode) ~= Library._config._keybinds[settings.flag]) then
						return;
					end
					self:change_state(not self._state);
				end);
			end;
			ModuleManager.scale_keybind = function(self, empty)
				if (Library._config._keybinds[settings.flag] and not empty) then
					local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), "Enum.KeyCode.", "");
					local font_params = Instance.new("GetTextBoundsParams");
					font_params.Text = keybind_string;
					font_params.Font = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold);
					font_params.Size = 10;
					font_params.Width = 10000;
					local font_size = TextService:GetTextBoundsAsync(font_params);
					Keybind.Size = UDim2.fromOffset(font_size.X + 8, 15);
					KeybindLabel.Size = UDim2.fromOffset(font_size.X, 13);
				else
					Keybind.Size = UDim2.fromOffset(31, 15);
					KeybindLabel.Size = UDim2.fromOffset(25, 13);
				end
			end;
			if Library:flag_type(settings.flag, "boolean") then
				ModuleManager._state = true;
				settings.callback(ModuleManager._state);
				Toggle.BackgroundColor3 = Themes[Library._current_theme].Accent;
				Toggle.BackgroundTransparency = 0;
				Circle.BackgroundColor3 = Themes[Library._current_theme].SecondaryAccent;
				Circle.Position = UDim2.fromScale(0.52, 0.5);
				Circle.Size = UDim2.fromOffset(13, 13);
				Options.Visible = true;
				table.insert(lib._themed_elements.ActiveToggles, {Toggle=Toggle,Circle=Circle});
			end
			if Library._config._keybinds[settings.flag] then
				local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), "Enum.KeyCode.", "");
				KeybindLabel.Text = keybind_string;
				ModuleManager:connect_keybind();
				ModuleManager:scale_keybind();
			end
			Connections[settings.flag .. "_input_began"] = Header.InputBegan:Connect(function(input)
				if Library._choosing_keybind then
					return;
				end
				if (input.UserInputType ~= Enum.UserInputType.MouseButton3) then
					return;
				end
				Library._choosing_keybind = true;
				Connections['keybind_choose_start'] = UserInputService.InputBegan:Connect(function(input, process)
					if process then
						return;
					end
					if ((input == Enum.UserInputState) or (input == Enum.UserInputType)) then
						return;
					end
					if (input.KeyCode == Enum.KeyCode.Unknown) then
						return;
					end
					if (input.KeyCode == Enum.KeyCode.Backspace) then
						ModuleManager:scale_keybind(true);
						Library._config._keybinds[settings.flag] = nil;
						Config:save(game.GameId, Library._config);
						KeybindLabel.Text = "None";
						if Connections[settings.flag .. "_keybind"] then
							Connections[settings.flag .. "_keybind"]:Disconnect();
							Connections[settings.flag .. "_keybind"] = nil;
						end
						Connections['keybind_choose_start']:Disconnect();
						Connections['keybind_choose_start'] = nil;
						Library._choosing_keybind = false;
						return;
					end
					Connections['keybind_choose_start']:Disconnect();
					Connections['keybind_choose_start'] = nil;
					Library._config._keybinds[settings.flag] = tostring(input.KeyCode);
					Config:save(game.GameId, Library._config);
					if Connections[settings.flag .. "_keybind"] then
						Connections[settings.flag .. "_keybind"]:Disconnect();
						Connections[settings.flag .. "_keybind"] = nil;
					end
					ModuleManager:connect_keybind();
					ModuleManager:scale_keybind();
					Library._choosing_keybind = false;
					local keybind_string = string.gsub(tostring(Library._config._keybinds[settings.flag]), "Enum.KeyCode.", "");
					KeybindLabel.Text = keybind_string;
				end);
			end);
			Header.MouseButton1Click:Connect(function()
				ModuleManager:change_state(not ModuleManager._state);
			end);
			ModuleManager.create_label = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local LabelFrame = Instance.new("Frame");
				LabelFrame.Name = "ModuleLabel";
				LabelFrame.BackgroundColor3 = Color3.fromRGB(28, 35, 48);
				LabelFrame.BackgroundTransparency = 0.05;
				LabelFrame.Size = UDim2.new(0, 207, 0, 0);
				LabelFrame.AutomaticSize = Enum.AutomaticSize.Y;
				LabelFrame.BorderSizePixel = 0;
				LabelFrame.Parent = Options;
				LabelFrame.LayoutOrder = LayoutOrderModule;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = LabelFrame;
				local Padding = Instance.new("UIPadding");
				Padding.PaddingTop = UDim.new(0, 8);
				Padding.PaddingBottom = UDim.new(0, 8);
				Padding.PaddingLeft = UDim.new(0, 10);
				Padding.PaddingRight = UDim.new(0, 10);
				Padding.Parent = LabelFrame;
				local ContentLayout = Instance.new("UIListLayout");
				ContentLayout.Padding = UDim.new(0, 4);
				ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				ContentLayout.Parent = LabelFrame;
				local TitleLabel = nil;
				if settings.title then
					TitleLabel = Instance.new("TextLabel");
					TitleLabel.Name = "Title";
					TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					TitleLabel.TextColor3 = Color3.fromRGB(215, 215, 215);
					TitleLabel.TextSize = 12;
					TitleLabel.Text = settings.title;
					TitleLabel.Size = UDim2.new(1, 0, 0, 0);
					TitleLabel.AutomaticSize = Enum.AutomaticSize.Y;
					TitleLabel.BackgroundTransparency = 1;
					TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;
					TitleLabel.TextWrapped = true;
					TitleLabel.LayoutOrder = 1;
					TitleLabel.Parent = LabelFrame;
					if settings.rich then
						TitleLabel.RichText = true;
					end
				end
				local BodyLabel = nil;
				if settings.text then
					BodyLabel = Instance.new("TextLabel");
					BodyLabel.Name = "Body";
					BodyLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					BodyLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
					BodyLabel.TextSize = 11;
					BodyLabel.Text = settings.text;
					BodyLabel.Size = UDim2.new(1, 0, 0, 0);
					BodyLabel.AutomaticSize = Enum.AutomaticSize.Y;
					BodyLabel.BackgroundTransparency = 1;
					BodyLabel.TextXAlignment = Enum.TextXAlignment.Left;
					BodyLabel.TextWrapped = true;
					BodyLabel.LayoutOrder = 2;
					BodyLabel.Parent = LabelFrame;
					if settings.rich then
						BodyLabel.RichText = true;
					end
				end
				LabelFrame.MouseEnter:Connect(function()
					TweenService:Create(LabelFrame, Tween.fast, {BackgroundColor3=Color3.fromRGB(38, 46, 62)}):Play();
				end);
				LabelFrame.MouseLeave:Connect(function()
					TweenService:Create(LabelFrame, Tween.fast, {BackgroundColor3=Color3.fromRGB(28, 35, 48)}):Play();
				end);
				local LabelManager = {};
				LabelManager.SetText = function(self, newText)
					if BodyLabel then
						BodyLabel.Text = newText;
					end
				end;
				LabelManager.SetTitle = function(self, newTitle)
					if TitleLabel then
						TitleLabel.Text = newTitle;
					end
				end;
				LabelManager.Set = function(self, newSettings)
					if (newSettings.title and TitleLabel) then
						TitleLabel.Text = newSettings.title;
						if newSettings.rich then
							TitleLabel.RichText = true;
						end
					end
					if (newSettings.text and BodyLabel) then
						BodyLabel.Text = newSettings.text;
						if newSettings.rich then
							BodyLabel.RichText = true;
						end
					end
				end;
				return LabelManager;
			end;
			ModuleManager.create_button = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local ButtonFrame = Instance.new("Frame");
				ButtonFrame.Name = "ModuleButton";
				ButtonFrame.BackgroundColor3 = Color3.fromRGB(28, 35, 48);
				ButtonFrame.BackgroundTransparency = 0.05;
				ButtonFrame.Size = UDim2.new(0, 207, 0, 0);
				ButtonFrame.AutomaticSize = Enum.AutomaticSize.Y;
				ButtonFrame.BorderSizePixel = 0;
				ButtonFrame.Parent = Options;
				ButtonFrame.LayoutOrder = LayoutOrderModule;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = ButtonFrame;
				local Padding = Instance.new("UIPadding");
				Padding.PaddingTop = UDim.new(0, 8);
				Padding.PaddingBottom = UDim.new(0, 8);
				Padding.PaddingLeft = UDim.new(0, 10);
				Padding.PaddingRight = UDim.new(0, 10);
				Padding.Parent = ButtonFrame;
				local ContentLayout = Instance.new("UIListLayout");
				ContentLayout.Padding = UDim.new(0, 6);
				ContentLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				ContentLayout.Parent = ButtonFrame;
				local TitleLabel = nil;
				if settings.title then
					TitleLabel = Instance.new("TextLabel");
					TitleLabel.Name = "Title";
					TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
					TitleLabel.TextColor3 = Color3.fromRGB(215, 215, 215);
					TitleLabel.TextSize = 12;
					TitleLabel.Text = settings.title;
					TitleLabel.Size = UDim2.new(1, 0, 0, 0);
					TitleLabel.AutomaticSize = Enum.AutomaticSize.Y;
					TitleLabel.BackgroundTransparency = 1;
					TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;
					TitleLabel.TextWrapped = true;
					TitleLabel.LayoutOrder = 1;
					TitleLabel.Parent = ButtonFrame;
					if settings.rich then
						TitleLabel.RichText = true;
					end
				end
				local DescriptionLabel = nil;
				if settings.description then
					DescriptionLabel = Instance.new("TextLabel");
					DescriptionLabel.Name = "Description";
					DescriptionLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					DescriptionLabel.TextColor3 = Color3.fromRGB(175, 175, 175);
					DescriptionLabel.TextSize = 10;
					DescriptionLabel.Text = settings.description;
					DescriptionLabel.Size = UDim2.new(1, 0, 0, 0);
					DescriptionLabel.AutomaticSize = Enum.AutomaticSize.Y;
					DescriptionLabel.BackgroundTransparency = 1;
					DescriptionLabel.TextXAlignment = Enum.TextXAlignment.Left;
					DescriptionLabel.TextWrapped = true;
					DescriptionLabel.LayoutOrder = 2;
					DescriptionLabel.Parent = ButtonFrame;
				end
				local Button = Instance.new("TextButton");
				Button.Name = "Button";
				Button.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Button.TextColor3 = Color3.fromRGB(255, 255, 255);
				Button.Text = settings.buttonText or SelectedLanguage.ButtonClick or "Click";
				Button.TextSize = 11;
				Button.Size = UDim2.new(1, 0, 0, 30);
				Button.BackgroundColor3 = Themes[Library._current_theme].Accent;
				Button.BackgroundTransparency = 0.25;
				Button.BorderSizePixel = 0;
				Button.AutoButtonColor = false;
				Button.LayoutOrder = 3;
				Button.Parent = ButtonFrame;
				table.insert(lib._themed_elements.AccentButtons, Button);
				local ButtonCorner = Instance.new("UICorner");
				ButtonCorner.CornerRadius = UDim.new(0, 5);
				ButtonCorner.Parent = Button;
				Button.MouseEnter:Connect(function()
					TweenService:Create(ButtonFrame, Tween.fast, {BackgroundColor3=Color3.fromRGB(38, 46, 62)}):Play();
					TweenService:Create(Button, Tween.fast, {BackgroundTransparency=0.05}):Play();
				end);
				Button.MouseLeave:Connect(function()
					TweenService:Create(ButtonFrame, Tween.fast, {BackgroundColor3=Color3.fromRGB(28, 35, 48)}):Play();
					TweenService:Create(Button, Tween.fast, {BackgroundTransparency=0.25}):Play();
				end);
				Button.MouseButton1Down:Connect(function()
					TweenService:Create(Button, Tween.snap_in, {BackgroundTransparency=0.5,Size=UDim2.new(1, -2, 0, 28)}):Play();
				end);
				Button.MouseButton1Up:Connect(function()
					TweenService:Create(Button, Tween.spring, {BackgroundTransparency=0.05,Size=UDim2.new(1, 0, 0, 30)}):Play();
				end);
				Button.MouseButton1Click:Connect(function()
					if settings.callback then
						settings.callback();
					end
				end);
				local ButtonManager = {};
				ButtonManager.SetTitle = function(self, newTitle)
					if TitleLabel then
						TitleLabel.Text = newTitle;
					end
				end;
				ButtonManager.SetDescription = function(self, newDesc)
					if DescriptionLabel then
						DescriptionLabel.Text = newDesc;
					end
				end;
				ButtonManager.SetButtonText = function(self, newText)
					Button.Text = newText;
				end;
				ButtonManager.SetCallback = function(self, newCallback)
					settings.callback = newCallback;
				end;
				return ButtonManager;
			end;
			ModuleManager.create_paragraph = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local ParagraphManager = {};
				local Paragraph = Instance.new("Frame");
				Paragraph.BackgroundColor3 = Color3.fromRGB(28, 35, 48);
				Paragraph.BackgroundTransparency = 0.05;
				Paragraph.Size = UDim2.new(0, 207, 0, 0);
				Paragraph.AutomaticSize = Enum.AutomaticSize.Y;
				Paragraph.BorderSizePixel = 0;
				Paragraph.Name = "Paragraph";
				Paragraph.Parent = Options;
				Paragraph.LayoutOrder = LayoutOrderModule;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = Paragraph;
				local ParagraphPad = Instance.new("UIPadding");
				ParagraphPad.PaddingTop = UDim.new(0, 7);
				ParagraphPad.PaddingBottom = UDim.new(0, 9);
				ParagraphPad.PaddingLeft = UDim.new(0, 8);
				ParagraphPad.PaddingRight = UDim.new(0, 8);
				ParagraphPad.Parent = Paragraph;
				local ParagraphLayout = Instance.new("UIListLayout");
				ParagraphLayout.Padding = UDim.new(0, 4);
				ParagraphLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				ParagraphLayout.Parent = Paragraph;
				local Title = Instance.new("TextLabel");
				Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Title.TextColor3 = Color3.fromRGB(215, 215, 215);
				Title.Text = settings.title or "Title";
				Title.Size = UDim2.new(1, 0, 0, 0);
				Title.AutomaticSize = Enum.AutomaticSize.Y;
				Title.BackgroundTransparency = 1;
				Title.TextXAlignment = Enum.TextXAlignment.Left;
				Title.TextSize = 12;
				Title.LayoutOrder = 1;
				Title.TextWrapped = true;
				Title.Parent = Paragraph;
				local Body = Instance.new("TextLabel");
				Body.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Body.TextColor3 = Color3.fromRGB(255, 255, 255);
				if not settings.rich then
					Body.Text = settings.text or "Text";
				else
					Body.RichText = true;
					Body.Text = settings.richtext or "<font color='rgb(255,0,0)'>Waver</font>";
				end
				Body.Size = UDim2.new(1, 0, 0, 0);
				Body.AutomaticSize = Enum.AutomaticSize.Y;
				Body.BackgroundTransparency = 1;
				Body.TextXAlignment = Enum.TextXAlignment.Left;
				Body.TextSize = 11;
				Body.TextWrapped = true;
				Body.LayoutOrder = 2;
				Body.Parent = Paragraph;
				Paragraph.MouseEnter:Connect(function()
					TweenService:Create(Paragraph, Tween.fast, {BackgroundColor3=Color3.fromRGB(38, 46, 62)}):Play();
				end);
				Paragraph.MouseLeave:Connect(function()
					TweenService:Create(Paragraph, Tween.fast, {BackgroundColor3=Color3.fromRGB(28, 35, 48)}):Play();
				end);
				return ParagraphManager;
			end;
			ModuleManager.create_text = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local TextManager = {};
				local TextFrame = Instance.new("Frame");
				TextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				TextFrame.BackgroundTransparency = 0.1;
				TextFrame.Size = UDim2.new(0, 207, 0, 0);
				TextFrame.AutomaticSize = Enum.AutomaticSize.Y;
				TextFrame.BorderSizePixel = 0;
				TextFrame.Name = "Text";
				TextFrame.Parent = Options;
				TextFrame.LayoutOrder = LayoutOrderModule;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = TextFrame;
				local TextPad = Instance.new("UIPadding");
				TextPad.PaddingTop = UDim.new(0, 5);
				TextPad.PaddingBottom = UDim.new(0, 5);
				TextPad.PaddingLeft = UDim.new(0, 6);
				TextPad.PaddingRight = UDim.new(0, 6);
				TextPad.Parent = TextFrame;
				local Body = Instance.new("TextLabel");
				Body.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Body.TextColor3 = Color3.fromRGB(255, 255, 255);
				if not settings.rich then
					Body.Text = settings.text or "";
				else
					Body.RichText = true;
					Body.Text = settings.richtext or "";
				end
				Body.Size = UDim2.new(1, 0, 0, 0);
				Body.AutomaticSize = Enum.AutomaticSize.Y;
				Body.BackgroundTransparency = 1;
				Body.TextXAlignment = Enum.TextXAlignment.Left;
				Body.TextSize = 10;
				Body.TextWrapped = true;
				Body.Parent = TextFrame;
				TextManager.Set = function(self, new_settings)
					if not new_settings.rich then
						Body.Text = new_settings.text or "";
					else
						Body.RichText = true;
						Body.Text = new_settings.richtext or "";
					end
				end;
				return TextManager;
			end;
			ModuleManager.create_textbox = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local TextboxManager = {_text=""};
				local Label = Instance.new("TextLabel");
				Label.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				Label.TextColor3 = Color3.fromRGB(255, 255, 255);
				Label.TextTransparency = 0.2;
				Label.Text = settings.title or "Enter text";
				Label.Size = UDim2.new(0, 207, 0, 13);
				Label.BackgroundTransparency = 1;
				Label.TextXAlignment = Enum.TextXAlignment.Left;
				Label.BorderSizePixel = 0;
				Label.TextSize = 10;
				Label.LayoutOrder = LayoutOrderModule;
				Label.Parent = Options;
				LayoutOrderModule = LayoutOrderModule + 1;
				local Textbox = Instance.new("TextBox");
				Textbox.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Textbox.TextColor3 = Color3.fromRGB(255, 255, 255);
				Textbox.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Textbox.PlaceholderText = settings.placeholder or "Enter text...";
				Textbox.Text = Library._config._flags[settings.flag] or "";
				Textbox.Name = "Textbox";
				Textbox.Size = UDim2.new(0, 207, 0, 17);
				Textbox.BorderSizePixel = 0;
				Textbox.TextSize = 10;
				Textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Textbox.BackgroundTransparency = 0.88;
				Textbox.ClearTextOnFocus = false;
				Textbox.LayoutOrder = LayoutOrderModule;
				Textbox.Parent = Options;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = Textbox;
				Textbox.Focused:Connect(function()
					TweenService:Create(Textbox, Tween.fast, {BackgroundTransparency=0.75}):Play();
				end);
				Textbox.FocusLost:Connect(function()
					TweenService:Create(Textbox, Tween.fast, {BackgroundTransparency=0.88}):Play();
					TextboxManager._text = Textbox.Text;
					Library._config._flags[settings.flag] = TextboxManager._text;
					Config:save(game.GameId, Library._config);
					settings.callback(TextboxManager._text);
				end);
				if Library:flag_type(settings.flag, "string") then
					TextboxManager._text = Library._config._flags[settings.flag];
					settings.callback(TextboxManager._text);
				end
				return TextboxManager;
			end;
			ModuleManager.create_checkbox = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local CheckboxManager = {_state=false};
				local Checkbox = Instance.new("TextButton");
				Checkbox.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Checkbox.TextColor3 = Color3.fromRGB(0, 0, 0);
				Checkbox.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Checkbox.Text = "";
				Checkbox.AutoButtonColor = false;
				Checkbox.BackgroundTransparency = 1;
				Checkbox.Name = "Checkbox";
				Checkbox.Size = UDim2.new(0, 207, 0, 16);
				Checkbox.BorderSizePixel = 0;
				Checkbox.TextSize = 14;
				Checkbox.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				Checkbox.LayoutOrder = LayoutOrderModule;
				Checkbox.Parent = Options;
				local TitleLabel = Instance.new("TextLabel");
				TitleLabel.Name = "TitleLabel";
				TitleLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				TitleLabel.TextSize = 11;
				TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
				TitleLabel.TextTransparency = 0.15;
				TitleLabel.Text = settings.title or "Option";
				TitleLabel.Size = UDim2.new(0, 142, 0, 13);
				TitleLabel.AnchorPoint = Vector2.new(0, 0.5);
				TitleLabel.Position = UDim2.new(0, 0, 0.5, 0);
				TitleLabel.BackgroundTransparency = 1;
				TitleLabel.TextXAlignment = Enum.TextXAlignment.Left;
				TitleLabel.Parent = Checkbox;
				local Box = Instance.new("Frame");
				Box.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Box.AnchorPoint = Vector2.new(1, 0.5);
				Box.BackgroundTransparency = 0.88;
				Box.Position = UDim2.new(1, 0, 0.5, 0);
				Box.Name = "Box";
				Box.Size = UDim2.new(0, 15, 0, 15);
				Box.BorderSizePixel = 0;
				Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Box.Parent = Checkbox;
				local BoxCorner = Instance.new("UICorner");
				BoxCorner.CornerRadius = UDim.new(0, 4);
				BoxCorner.Parent = Box;
				local Fill = Instance.new("Frame");
				Fill.AnchorPoint = Vector2.new(0.5, 0.5);
				Fill.BackgroundTransparency = 0.1;
				Fill.Position = UDim2.new(0.5, 0, 0.5, 0);
				Fill.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Fill.Name = "Fill";
				Fill.Size = UDim2.fromOffset(0, 0);
				Fill.BorderSizePixel = 0;
				Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Fill.Parent = Box;
				local FillCorner = Instance.new("UICorner");
				FillCorner.CornerRadius = UDim.new(0, 3);
				FillCorner.Parent = Fill;
				CheckboxManager.change_state = function(self, state)
					self._state = state;
					if self._state then
						TweenService:Create(Box, Tween.smooth, {BackgroundTransparency=0.65}):Play();
						TweenService:Create(Fill, Tween.spring, {Size=UDim2.fromOffset(10, 10)}):Play();
					else
						TweenService:Create(Box, Tween.smooth, {BackgroundTransparency=0.88}):Play();
						TweenService:Create(Fill, Tween.spring, {Size=UDim2.fromOffset(0, 0)}):Play();
					end
					Library._config._flags[settings.flag] = self._state;
					Config:save(game.GameId, Library._config);
					settings.callback(self._state);
				end;
				if Library:flag_type(settings.flag, "boolean") then
					CheckboxManager:change_state(Library._config._flags[settings.flag]);
				end
				Checkbox.MouseButton1Click:Connect(function()
					CheckboxManager:change_state(not CheckboxManager._state);
				end);
				return CheckboxManager;
			end;
			ModuleManager.create_divider = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local OuterFrame = Instance.new("Frame");
				OuterFrame.Size = UDim2.new(0, 207, 0, 18);
				OuterFrame.BackgroundTransparency = 1;
				OuterFrame.Name = "OuterFrame";
				OuterFrame.LayoutOrder = LayoutOrderModule;
				OuterFrame.Parent = Options;
				if (settings and settings.showtopic) then
					local TextLabel = Instance.new("TextLabel");
					TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
					TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
					TextLabel.TextTransparency = 0;
					TextLabel.Text = settings.title;
					TextLabel.Size = UDim2.new(0, 153, 0, 13);
					TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
					TextLabel.BackgroundTransparency = 1;
					TextLabel.TextXAlignment = Enum.TextXAlignment.Center;
					TextLabel.BorderSizePixel = 0;
					TextLabel.AnchorPoint = Vector2.new(0.5, 0.5);
					TextLabel.TextSize = 11;
					TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					TextLabel.ZIndex = 3;
					TextLabel.TextStrokeTransparency = 0;
					TextLabel.Parent = OuterFrame;
				end
				if (not settings or (settings and not settings.disableline)) then
					local Divider = Instance.new("Frame");
					Divider.Size = UDim2.new(1, 0, 0, 1);
					Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
					Divider.BorderSizePixel = 0;
					Divider.Name = "Divider";
					Divider.ZIndex = 2;
					Divider.Position = UDim2.new(0, 0, 0.5, 0);
					Divider.Parent = OuterFrame;
					local Gradient = Instance.new("UIGradient");
					Gradient.Parent = Divider;
					Gradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 1),NumberSequenceKeypoint.new(0.5, 0.3),NumberSequenceKeypoint.new(1, 1)});
					local UICorner = Instance.new("UICorner");
					UICorner.CornerRadius = UDim.new(0, 2);
					UICorner.Parent = Divider;
				end
				return true;
			end;
			ModuleManager.create_slider = function(self, settings)
				LayoutOrderModule = LayoutOrderModule + 1;
				local SliderManager = {};
				local Slider = Instance.new("TextButton");
				Slider.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Slider.TextSize = 14;
				Slider.TextColor3 = Color3.fromRGB(0, 0, 0);
				Slider.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Slider.Text = "";
				Slider.AutoButtonColor = false;
				Slider.BackgroundTransparency = 1;
				Slider.Name = "Slider";
				Slider.Size = UDim2.new(0, 207, 0, 24);
				Slider.BorderSizePixel = 0;
				Slider.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				Slider.LayoutOrder = LayoutOrderModule;
				Slider.Parent = Options;
				local TextLabel = Instance.new("TextLabel");
				TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				TextLabel.TextSize = 11;
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
				TextLabel.TextTransparency = 0.15;
				TextLabel.Text = settings.title;
				TextLabel.Size = UDim2.new(0, 153, 0, 13);
				TextLabel.Position = UDim2.new(0, 0, 0, 0);
				TextLabel.BackgroundTransparency = 1;
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
				TextLabel.BorderSizePixel = 0;
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				TextLabel.Parent = Slider;
				local Value = Instance.new("TextLabel");
				Value.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Value.TextColor3 = Color3.fromRGB(255, 255, 255);
				Value.TextTransparency = 0.15;
				Value.Text = "0";
				Value.Name = "Value";
				Value.Size = UDim2.new(0, 42, 0, 13);
				Value.AnchorPoint = Vector2.new(1, 0);
				Value.Position = UDim2.new(1, 0, 0, 0);
				Value.BackgroundTransparency = 1;
				Value.TextXAlignment = Enum.TextXAlignment.Right;
				Value.BorderSizePixel = 0;
				Value.TextSize = 10;
				Value.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Value.Parent = Slider;
				local Track = Instance.new("Frame");
				Track.Name = "Track";
				Track.AnchorPoint = Vector2.new(0, 1);
				Track.BackgroundTransparency = 0.85;
				Track.Position = UDim2.new(0, 0, 1, 0);
				Track.Size = UDim2.new(0, 207, 0, 4);
				Track.BorderSizePixel = 0;
				Track.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Track.Parent = Slider;
				local TrackCorner = Instance.new("UICorner");
				TrackCorner.CornerRadius = UDim.new(1, 0);
				TrackCorner.Parent = Track;
				local Drag = Instance.new("Frame");
				Drag.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Drag.AnchorPoint = Vector2.new(0, 0.5);
				Drag.BackgroundTransparency = 0;
				Drag.Position = UDim2.new(0, 0, 0.5, 0);
				Drag.Name = "Drag";
				Drag.Size = UDim2.new(0.5, 0, 1, 0);
				Drag.BorderSizePixel = 0;
				Drag.BackgroundColor3 = Themes[Library._current_theme].Accent;
				Drag.Parent = Track;
				table.insert(lib._themed_elements.SliderDrags, Drag);
				local DragCorner = Instance.new("UICorner");
				DragCorner.CornerRadius = UDim.new(1, 0);
				DragCorner.Parent = Drag;
				local Knob = Instance.new("Frame");
				Knob.Name = "Knob";
				Knob.AnchorPoint = Vector2.new(1, 0.5);
				Knob.Position = UDim2.new(1, 0, 0.5, 0);
				Knob.Size = UDim2.fromOffset(10, 10);
				Knob.BorderSizePixel = 0;
				Knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Knob.Parent = Drag;
				local KnobCorner = Instance.new("UICorner");
				KnobCorner.CornerRadius = UDim.new(1, 0);
				KnobCorner.Parent = Knob;
				SliderManager.set_percentage = function(self, percentage)
					local rounded_number;
					if settings.round_number then
						rounded_number = math.floor(percentage + 0.5);
					else
						rounded_number = math.floor(percentage * 10) / 10;
					end
					local pct = (percentage - settings.minimum_value) / (settings.maximum_value - settings.minimum_value);
					local slider_w = math.clamp(pct, 0.02, 1);
					local number_threshold = math.clamp(rounded_number, settings.minimum_value, settings.maximum_value);
					Library._config._flags[settings.flag] = number_threshold;
					Value.Text = number_threshold;
					TweenService:Create(Drag, Tween.fast, {Size=UDim2.new(slider_w, 0, 1, 0)}):Play();
					settings.callback(number_threshold);
				end;
				SliderManager.update = function(self)
					local mouse_position = (mouse.X - Track.AbsolutePosition.X) / Track.Size.X.Offset;
					local percentage = settings.minimum_value + ((settings.maximum_value - settings.minimum_value) * mouse_position);
					self:set_percentage(percentage);
				end;
				SliderManager.input = function(self)
					TweenService:Create(Knob, Tween.fast, {Size=UDim2.fromOffset(13, 13)}):Play();
					SliderManager:update();
					Connections["slider_drag_" .. settings.flag] = mouse.Move:Connect(function()
						SliderManager:update();
					end);
					Connections["slider_input_" .. settings.flag] = UserInputService.InputEnded:Connect(function(input, process)
						if ((input.UserInputType ~= Enum.UserInputType.MouseButton1) and (input.UserInputType ~= Enum.UserInputType.Touch)) then
							return;
						end
						TweenService:Create(Knob, Tween.spring, {Size=UDim2.fromOffset(10, 10)}):Play();
						Connections:disconnect("slider_drag_" .. settings.flag);
						Connections:disconnect("slider_input_" .. settings.flag);
						if not settings.ignoresaved then
							Config:save(game.GameId, Library._config);
						end
					end);
				end;
				if Library:flag_type(settings.flag, "number") then
					if not settings.ignoresaved then
						SliderManager:set_percentage(Library._config._flags[settings.flag]);
					else
						SliderManager:set_percentage(settings.value);
					end
				else
					SliderManager:set_percentage(settings.value);
				end
				Slider.MouseButton1Down:Connect(function()
					SliderManager:input();
				end);
				return SliderManager;
			end;
			ModuleManager.create_dropdown = function(self, settings)
				if not settings.Order then
					LayoutOrderModule = LayoutOrderModule + 1;
				end
				local DropdownManager = {_state=false,_size=0};
				local Dropdown = Instance.new("TextButton");
				Dropdown.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				Dropdown.TextColor3 = Color3.fromRGB(0, 0, 0);
				Dropdown.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Dropdown.Text = "";
				Dropdown.AutoButtonColor = false;
				Dropdown.BackgroundTransparency = 1;
				Dropdown.Name = "Dropdown";
				Dropdown.Size = UDim2.new(0, 207, 0, 39);
				Dropdown.BorderSizePixel = 0;
				Dropdown.TextSize = 14;
				Dropdown.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
				Dropdown.Parent = Options;
				if not settings.Order then
					Dropdown.LayoutOrder = LayoutOrderModule;
				else
					Dropdown.LayoutOrder = settings.OrderValue;
				end
				if not Library._config._flags[settings.flag] then
					Library._config._flags[settings.flag] = {};
				end
				local TextLabel = Instance.new("TextLabel");
				TextLabel.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				TextLabel.TextSize = 11;
				TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
				TextLabel.TextTransparency = 0.15;
				TextLabel.Text = settings.title;
				TextLabel.Size = UDim2.new(0, 207, 0, 13);
				TextLabel.BackgroundTransparency = 1;
				TextLabel.TextXAlignment = Enum.TextXAlignment.Left;
				TextLabel.BorderSizePixel = 0;
				TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0);
				TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				TextLabel.Parent = Dropdown;
				local Box = Instance.new("Frame");
				Box.ClipsDescendants = true;
				Box.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Box.AnchorPoint = Vector2.new(0.5, 0);
				Box.BackgroundTransparency = 0.88;
				Box.Position = UDim2.new(0.5, 0, 1.2000000476837158, 0);
				Box.Name = "Box";
				Box.Size = UDim2.new(0, 207, 0, 22);
				Box.BorderSizePixel = 0;
				Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Box.Parent = TextLabel;
				local UICorner = Instance.new("UICorner");
				UICorner.CornerRadius = UDim.new(0, 5);
				UICorner.Parent = Box;
				local Header = Instance.new("Frame");
				Header.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Header.AnchorPoint = Vector2.new(0.5, 0);
				Header.BackgroundTransparency = 1;
				Header.Position = UDim2.new(0.5, 0, 0, 0);
				Header.Name = "Header";
				Header.Size = UDim2.new(0, 207, 0, 22);
				Header.BorderSizePixel = 0;
				Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Header.Parent = Box;
				local CurrentOption = Instance.new("TextLabel");
				CurrentOption.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
				CurrentOption.TextColor3 = Color3.fromRGB(255, 255, 255);
				CurrentOption.TextTransparency = 0.15;
				CurrentOption.Name = "CurrentOption";
				CurrentOption.Size = UDim2.new(0, 161, 0, 13);
				CurrentOption.AnchorPoint = Vector2.new(0, 0.5);
				CurrentOption.Position = UDim2.new(0.04999988153576851, 0, 0.5, 0);
				CurrentOption.BackgroundTransparency = 1;
				CurrentOption.TextXAlignment = Enum.TextXAlignment.Left;
				CurrentOption.BorderSizePixel = 0;
				CurrentOption.TextSize = 10;
				CurrentOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				CurrentOption.Parent = Header;
				local UIGradient = Instance.new("UIGradient");
				UIGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(0.7, 0),NumberSequenceKeypoint.new(0.88, 0.35),NumberSequenceKeypoint.new(1, 1)});
				UIGradient.Parent = CurrentOption;
				local Arrow = Instance.new("ImageLabel");
				Arrow.BorderColor3 = Color3.fromRGB(0, 0, 0);
				Arrow.AnchorPoint = Vector2.new(0, 0.5);
				Arrow.Image = "rbxassetid://84232453189324";
				Arrow.BackgroundTransparency = 1;
				Arrow.Position = UDim2.new(0.9100000262260437, 0, 0.5, 0);
				Arrow.Name = "Arrow";
				Arrow.Size = UDim2.new(0, 8, 0, 8);
				Arrow.BorderSizePixel = 0;
				Arrow.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				Arrow.Parent = Header;
				local DropOptions = Instance.new("ScrollingFrame");
				DropOptions.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
				DropOptions.Active = true;
				DropOptions.ScrollBarImageTransparency = 1;
				DropOptions.AutomaticCanvasSize = Enum.AutomaticSize.XY;
				DropOptions.ScrollBarThickness = 0;
				DropOptions.Name = "Options";
				DropOptions.Size = UDim2.new(0, 207, 0, 0);
				DropOptions.BackgroundTransparency = 1;
				DropOptions.Position = UDim2.new(0, 0, 1, 0);
				DropOptions.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
				DropOptions.BorderColor3 = Color3.fromRGB(0, 0, 0);
				DropOptions.BorderSizePixel = 0;
				DropOptions.CanvasSize = UDim2.new(0, 0, 0.5, 0);
				DropOptions.Parent = Box;
				local UIListLayout = Instance.new("UIListLayout");
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
				UIListLayout.Parent = DropOptions;
				local UIPadding = Instance.new("UIPadding");
				UIPadding.PaddingTop = UDim.new(0, -1);
				UIPadding.PaddingLeft = UDim.new(0, 10);
				UIPadding.Parent = DropOptions;
				local UIListLayout2 = Instance.new("UIListLayout");
				UIListLayout2.SortOrder = Enum.SortOrder.LayoutOrder;
				UIListLayout2.Parent = Box;
				DropdownManager.update = function(self, option)
					local accent = Themes[Library._current_theme].Accent;
					local function applyHighlight(object, isSelected)
						local sh = object:FindFirstChild("SelectHighlight");
						local sd = object:FindFirstChild("SelectDot");
						if isSelected then
							object.TextTransparency = 0;
							object.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
							if sh then
								TweenService:Create(sh, Tween.fast, {BackgroundTransparency=0.75,BackgroundColor3=accent}):Play();
							end
							if sd then
								TweenService:Create(sd, Tween.spring, {BackgroundTransparency=0,BackgroundColor3=accent}):Play();
							end
						else
							object.TextTransparency = 0.6;
							object.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
							if sh then
								TweenService:Create(sh, Tween.fast, {BackgroundTransparency=1}):Play();
							end
							if sd then
								TweenService:Create(sd, Tween.fast, {BackgroundTransparency=1}):Play();
							end
						end
					end
					if settings.multi_dropdown then
						if not Library._config._flags[settings.flag] then
							Library._config._flags[settings.flag] = {};
						end
						local CurrentTargetValue = nil;
						if (#Library._config._flags[settings.flag] > 0) then
							CurrentTargetValue = convertTableToString(Library._config._flags[settings.flag]);
						end
						local selected = {};
						if CurrentTargetValue then
							for value in string.gmatch(CurrentTargetValue, "([^,]+)") do
								local trimmedValue = value:match("^%s*(.-)%s*$");
								if (trimmedValue ~= "Label") then
									table.insert(selected, trimmedValue);
								end
							end
						else
							for value in string.gmatch(CurrentOption.Text, "([^,]+)") do
								local trimmedValue = value:match("^%s*(.-)%s*$");
								if (trimmedValue ~= "Label") then
									table.insert(selected, trimmedValue);
								end
							end
						end
						local CurrentTextGet = convertStringToTable(CurrentOption.Text);
						local optionSkibidi = ((typeof(option) ~= "string") and option.Name) or option;
						for i, v in pairs(CurrentTextGet) do
							if (v == optionSkibidi) then
								table.remove(CurrentTextGet, i);
								break;
							end
						end
						CurrentOption.Text = table.concat(selected, ", ");
						local OptionsChild = {};
						for _, object in DropOptions:GetChildren() do
							if (object.Name == "Option") then
								table.insert(OptionsChild, object.Text);
								applyHighlight(object, table.find(selected, object.Text) ~= nil);
							end
						end
						local CurrentTargetValue2 = convertStringToTable(CurrentOption.Text);
						for _, v in CurrentTargetValue2 do
							if (not table.find(OptionsChild, v) and table.find(selected, v)) then
								table.remove(selected, _);
							end
						end
						CurrentOption.Text = table.concat(selected, ", ");
						Library._config._flags[settings.flag] = convertStringToTable(CurrentOption.Text);
					else
						CurrentOption.Text = ((typeof(option) == "string") and option) or option.Name;
						for _, object in DropOptions:GetChildren() do
							if (object.Name == "Option") then
								applyHighlight(object, object.Text == CurrentOption.Text);
							end
						end
						Library._config._flags[settings.flag] = option;
					end
					Config:save(game.GameId, Library._config);
					settings.callback(option);
				end;
				DropdownManager.unfold_settings = function(self)
					self._state = not self._state;
					if self._state then
						TweenService:Create(Dropdown, Tween.smooth, {Size=UDim2.fromOffset(207, 39 + self._size)}):Play();
						TweenService:Create(Box, Tween.smooth, {Size=UDim2.fromOffset(207, 22 + self._size)}):Play();
						TweenService:Create(Arrow, Tween.smooth, {Rotation=180}):Play();
					else
						TweenService:Create(Dropdown, Tween.smooth, {Size=UDim2.fromOffset(207, 39)}):Play();
						TweenService:Create(Box, Tween.smooth, {Size=UDim2.fromOffset(207, 22)}):Play();
						TweenService:Create(Arrow, Tween.smooth, {Rotation=0}):Play();
					end
				end;
				if (#settings.options > 0) then
					DropdownManager._size = 3;
					for index, value in settings.options do
						local Option = Instance.new("TextButton");
						Option.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal);
						Option.Active = false;
						Option.TextTransparency = 0.6;
						Option.AnchorPoint = Vector2.new(0, 0.5);
						Option.TextSize = 10;
						Option.Size = UDim2.new(0, 186, 0, 18);
						Option.TextColor3 = Color3.fromRGB(255, 255, 255);
						Option.BorderColor3 = Color3.fromRGB(0, 0, 0);
						Option.Text = ((typeof(value) == "string") and value) or value.Name;
						Option.AutoButtonColor = false;
						Option.Name = "Option";
						Option.BackgroundTransparency = 1;
						Option.TextXAlignment = Enum.TextXAlignment.Left;
						Option.Selectable = false;
						Option.BorderSizePixel = 0;
						Option.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
						Option.Parent = DropOptions;
						local SelectHighlight = Instance.new("Frame");
						SelectHighlight.Name = "SelectHighlight";
						SelectHighlight.Size = UDim2.new(1, 4, 1, 0);
						SelectHighlight.Position = UDim2.new(0, -4, 0, 0);
						SelectHighlight.BackgroundColor3 = Themes[Library._current_theme].Accent;
						SelectHighlight.BackgroundTransparency = 1;
						SelectHighlight.BorderSizePixel = 0;
						SelectHighlight.ZIndex = Option.ZIndex - 1;
						SelectHighlight.Parent = Option;
						local SHCorner = Instance.new("UICorner");
						SHCorner.CornerRadius = UDim.new(0, 4);
						SHCorner.Parent = SelectHighlight;
						local SelectDot = Instance.new("Frame");
						SelectDot.Name = "SelectDot";
						SelectDot.Size = UDim2.fromOffset(4, 4);
						SelectDot.AnchorPoint = Vector2.new(1, 0.5);
						SelectDot.Position = UDim2.new(0, -6, 0.5, 0);
						SelectDot.BackgroundColor3 = Themes[Library._current_theme].Accent;
						SelectDot.BackgroundTransparency = 1;
						SelectDot.BorderSizePixel = 0;
						SelectDot.ZIndex = Option.ZIndex + 1;
						SelectDot.Parent = Option;
						local SDCorner = Instance.new("UICorner");
						SDCorner.CornerRadius = UDim.new(1, 0);
						SDCorner.Parent = SelectDot;
						table.insert(lib._themed_elements.DropdownHighlights, {Highlight=SelectHighlight,Dot=SelectDot});
						local UIGradient = Instance.new("UIGradient");
						UIGradient.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0),NumberSequenceKeypoint.new(0.7, 0),NumberSequenceKeypoint.new(0.88, 0.35),NumberSequenceKeypoint.new(1, 1)});
						UIGradient.Parent = Option;
						Option.MouseEnter:Connect(function()
							if (Option.TextTransparency ~= 0) then
								TweenService:Create(Option, Tween.snap, {TextTransparency=0.3}):Play();
								TweenService:Create(SelectHighlight, Tween.snap, {BackgroundTransparency=0.92}):Play();
							end
						end);
						Option.MouseLeave:Connect(function()
							if (Option.TextTransparency ~= 0) then
								TweenService:Create(Option, Tween.snap, {TextTransparency=0.6}):Play();
								TweenService:Create(SelectHighlight, Tween.snap, {BackgroundTransparency=1}):Play();
							end
						end);
						Option.MouseButton1Click:Connect(function()
							if not Library._config._flags[settings.flag] then
								Library._config._flags[settings.flag] = {};
							end
							if settings.multi_dropdown then
								if table.find(Library._config._flags[settings.flag], value) then
									Library:remove_table_value(Library._config._flags[settings.flag], value);
								else
									table.insert(Library._config._flags[settings.flag], value);
								end
							end
							DropdownManager:update(value);
						end);
						if (index > settings.maximum_options) then
							continue;
						end
						DropdownManager._size += 18
						DropOptions.Size = UDim2.fromOffset(207, DropdownManager._size);
					end
				end
				DropdownManager.New = function(self, value)
					Dropdown:Destroy(true);
					value.OrderValue = Dropdown.LayoutOrder;
					return ModuleManager:create_dropdown(value);
				end;
				if Library:flag_type(settings.flag, "string") then
					DropdownManager:update(Library._config._flags[settings.flag]);
				else
					DropdownManager:update(settings.options[1]);
				end
				Dropdown.MouseButton1Click:Connect(function()
					DropdownManager:unfold_settings();
				end);
				return DropdownManager;
			end;
			return ModuleManager;
		end;
		return TabManager;
	end;
	Connections['library_visiblity'] = UserInputService.InputBegan:Connect(function(input, process)
		if (input.KeyCode ~= Enum.KeyCode.RightShift) then
			return;
		end
		self._ui_open = not self._ui_open;
		self:change_visiblity(self._ui_open);
	end);
	self._ui.Container.Handler.Minimize.MouseButton1Click:Connect(function()
		self._ui_open = not self._ui_open;
		self:change_visiblity(self._ui_open);
	end);
	return self;
end;
local BlooperUi = {};
BlooperUi.CreateWindow = function(self, settings)
	settings = settings or {};
	local title = settings.Title or settings.title or "BlooperUi";
	local theme = settings.Theme or settings.theme;
	if (theme and Themes[theme]) then
		Library._current_theme = theme;
	end
	local window = Library.new(title);
	if (theme and Themes[theme]) then
		Library._config._theme = theme;
	end
	return window;
end;
BlooperUi.SendNotification = function(self, ...)
	Library.SendNotification(...);
end;
BlooperUi._Library = Library;
return BlooperUi;
