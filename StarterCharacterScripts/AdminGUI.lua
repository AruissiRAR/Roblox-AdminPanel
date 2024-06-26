-- // creds vfishyturtle for ui aka xn90ubwbzuqegtn \\ --

repeat wait() until game:IsLoaded()

local super_admin = {1993814692, -1}

local function IsAdmined()
	if game.Players.LocalPlayer:GetAttribute("Admined") or table.find(super_admin, game.Players.LocalPlayer.UserId) then
		return true
	end
end

local TS = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local AdminPanel = Instance.new('ScreenGui', game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
local Main = Instance.new('Frame', AdminPanel)
local MainCorner = Instance.new('UICorner', Main)
local Welcome = Instance.new('Frame', Main)
local PlayerHead = Instance.new('ImageLabel', Welcome)
local PlayerCorner1 = Instance.new('UICorner', PlayerHead)
local PlayerStroke1 = Instance.new('UIStroke', PlayerHead)
local WelcomeText = Instance.new('TextLabel', Welcome)
local OptionsHolder = Instance.new('Frame', Main)
local OptionLayout = Instance.new('UIListLayout', OptionsHolder)
local Ban = Instance.new('ImageButton', OptionsHolder)
local BanCorner = Instance.new('UICorner', Ban)
local BanTitle = Instance.new('TextLabel', Ban)
local BanIcon = Instance.new('ImageLabel', Ban)
local Kick = Instance.new('ImageButton', OptionsHolder)
local KickCorner = Instance.new('UICorner', Kick)
local KickTitle = Instance.new('TextLabel', Kick)
local KickIcon = Instance.new('ImageLabel', Kick)
local Players = Instance.new('Frame', Main)
local PlayersCorner = Instance.new('UICorner', Players)
local PlayersTitle = Instance.new('TextLabel', Players)
local ScrollingFrame = Instance.new('ScrollingFrame', Players)
local PlayersLayout = Instance.new('UIListLayout', ScrollingFrame)
local KickScreen = Instance.new('Frame', Main)
local KickReasonHolder = Instance.new('Frame', KickScreen)
local KreasonCorner = Instance.new('UICorner', KickReasonHolder)
local KickReason = Instance.new('TextBox', KickReasonHolder)
local KReasonText = Instance.new('TextLabel', KickScreen)
local KickConfirm = Instance.new('ImageButton', KickScreen)
local KickConfirmCorner = Instance.new('UICorner', KickConfirm)
local KConfirmText = Instance.new('TextLabel', KickConfirm)


local function CreateDrag(gui)
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		TS:Create(gui, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play();
	end

	local lastEnd = 0
	local lastMoved = 0
	local con
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

		end
	end)

	UIS.InputEnded:Connect(function(input)

		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)


	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
			lastMoved = os.clock()
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

AdminPanel.Name = "AdminPanel"
AdminPanel.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Main.Name = "Main"
Main.Position = UDim2.new(0.3257,0,0.2644,0)
Main.Size = UDim2.new(0,415,0,373)
Main.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
Main.BackgroundTransparency = 0.1
Main.BorderSizePixel = 0
Main.BorderColor3 = Color3.new(0,0,0)
Main.ZIndex = 100
Welcome.Name = "Welcome"
Welcome.Position = UDim2.new(0.0107,0,0.02,0)
Welcome.Size = UDim2.new(0,218,0,37)
Welcome.BackgroundColor3 = Color3.new(1,1,1)
Welcome.BackgroundTransparency = 1
Welcome.BorderSizePixel = 0
Welcome.BorderColor3 = Color3.new(0,0,0)
Welcome.ZIndex = 100
PlayerHead.Name = "PlayerHead"
PlayerHead.Position = UDim2.new(0.0255,0,0.0811,0)
PlayerHead.Size = UDim2.new(0,31,0,31)
PlayerHead.BackgroundColor3 = Color3.new(1,1,1)
PlayerHead.BackgroundTransparency = 1
PlayerHead.BorderSizePixel = 0
PlayerHead.BorderColor3 = Color3.new(0,0,0)

local userId = game.Players.LocalPlayer.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size420x420
local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(userId, thumbType, thumbSize)

local good, bad = pcall(function()
	PlayerHead.Image = (isReady and content)
end)

if not good then
	PlayerHead.Image = game:GetService("Players"):GetUserThumbnailAsync(1, thumbType, thumbSize)
end

PlayerHead.ZIndex = 13
PlayerCorner1.CornerRadius = UDim.new(100,100)
PlayerStroke1.Thickness = 0.6
PlayerStroke1.Color = Color3.new(0.4588,0.4588,0.4706)
WelcomeText.Name = "WelcomeText"
WelcomeText.Position = UDim2.new(0.2136,0,0,0)
WelcomeText.Size = UDim2.new(0,171,0,37)
WelcomeText.BackgroundColor3 = Color3.new(1,1,1)
WelcomeText.BackgroundTransparency = 1
WelcomeText.BorderSizePixel = 0
WelcomeText.BorderColor3 = Color3.new(0,0,0)
WelcomeText.Text = game:GetService("Players").LocalPlayer.Name
WelcomeText.TextColor3 = Color3.new(1,1,1)
WelcomeText.Font = Enum.Font.Gotham
WelcomeText.TextSize = 14
WelcomeText.ZIndex = 101
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
OptionsHolder.Name = "OptionsHolder"
OptionsHolder.Position = UDim2.new(0,0,0.1877,0)
OptionsHolder.Size = UDim2.new(0,415,0,302)
OptionsHolder.BackgroundColor3 = Color3.new(1,1,1)
OptionsHolder.BackgroundTransparency = 1
OptionsHolder.BorderSizePixel = 0
OptionsHolder.BorderColor3 = Color3.new(0,0,0)
OptionsHolder.ZIndex = 103
OptionLayout.Name = "OptionLayout"
OptionLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
OptionLayout.SortOrder = Enum.SortOrder.LayoutOrder
OptionLayout.Padding = UDim.new(0,3)
Ban.Name = "Ban"
Ban.Position = UDim2.new(0.0374,0,0.2627,0)
Ban.Size = UDim2.new(0,382,0,31)
Ban.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
Ban.BackgroundTransparency = 0.5
Ban.BorderSizePixel = 0
Ban.BorderColor3 = Color3.new(0,0,0)
Ban.AutoButtonColor = false
Ban.ZIndex = 102
BanTitle.Name = "BanTitle"
BanTitle.Position = UDim2.new(0.033,0,0,0)
BanTitle.Size = UDim2.new(0,240,0,31)
BanTitle.BackgroundColor3 = Color3.new(1,1,1)
BanTitle.BackgroundTransparency = 1
BanTitle.BorderSizePixel = 0
BanTitle.BorderColor3 = Color3.new(0,0,0)
BanTitle.Text = "Ban"
BanTitle.TextColor3 = Color3.new(1,1,1)
BanTitle.Font = Enum.Font.Gotham
BanTitle.TextSize = 16
BanTitle.ZIndex = 105
BanTitle.TextXAlignment = Enum.TextXAlignment.Left
BanIcon.Name = "BanIcon"
BanIcon.Position = UDim2.new(0.9162,0,0.129,0)
BanIcon.Size = UDim2.new(0,23,0,23)
BanIcon.BackgroundColor3 = Color3.new(1,1,1)
BanIcon.BackgroundTransparency = 1
BanIcon.BorderSizePixel = 0
BanIcon.BorderColor3 = Color3.new(0,0,0)
BanIcon.Image = "rbxassetid://13793170713"
BanIcon.ZIndex = 107
Kick.Name = "Kick"
Kick.Position = UDim2.new(0.0374,0,0.2627,0)
Kick.Size = UDim2.new(0,382,0,31)
Kick.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
Kick.BackgroundTransparency = 0.5
Kick.BorderSizePixel = 0
Kick.BorderColor3 = Color3.new(0,0,0)
Kick.ZIndex = 102
Kick.AutoButtonColor = false
KickTitle.Name = "KickTitle"
KickTitle.Position = UDim2.new(0.033,0,0,0)
KickTitle.Size = UDim2.new(0,240,0,31)
KickTitle.BackgroundColor3 = Color3.new(1,1,1)
KickTitle.BackgroundTransparency = 1
KickTitle.BorderSizePixel = 0
KickTitle.BorderColor3 = Color3.new(0,0,0)
KickTitle.Text = "Kick"
KickTitle.TextColor3 = Color3.new(1,1,1)
KickTitle.Font = Enum.Font.Gotham
KickTitle.TextSize = 16
KickTitle.ZIndex = 105
KickTitle.TextXAlignment = Enum.TextXAlignment.Left
KickIcon.Name = "KickIcon"
KickIcon.Position = UDim2.new(0.9162,0,0.129,0)
KickIcon.Size = UDim2.new(0,23,0,23)
KickIcon.BackgroundColor3 = Color3.new(1,1,1)
KickIcon.BackgroundTransparency = 1
KickIcon.BorderSizePixel = 0
KickIcon.BorderColor3 = Color3.new(0,0,0)
KickIcon.Image = "rbxassetid://9405925508"
KickIcon.ZIndex = 107
Players.Name = "Players"
Players.Position = UDim2.new(1.0217,0,0,0)
Players.Size = UDim2.new(0,293,0,0)
Players.BackgroundColor3 = Color3.new(0.1294,0.1294,0.1294)
Players.BackgroundTransparency = 0.1
Players.BorderSizePixel = 0
Players.Visible = false
Players.BorderColor3 = Color3.new(0,0,0)
Players.ZIndex = 100
PlayersTitle.Name = "PlayersTitle"
PlayersTitle.Position = UDim2.new(0.033,0,0,0)
PlayersTitle.Size = UDim2.new(0,240,0,31)
PlayersTitle.BackgroundColor3 = Color3.new(1,1,1)
PlayersTitle.BackgroundTransparency = 1
PlayersTitle.BorderSizePixel = 0
PlayersTitle.BorderColor3 = Color3.new(0,0,0)
PlayersTitle.Text = "Select Player"
PlayersTitle.TextColor3 = Color3.new(1,1,1)
PlayersTitle.Font = Enum.Font.Gotham
PlayersTitle.TextSize = 16
PlayersTitle.ZIndex = 105
PlayersTitle.TextXAlignment = Enum.TextXAlignment.Left
ScrollingFrame.Position = UDim2.new(0,0,0.0831,0)
ScrollingFrame.Size = UDim2.new(0,293,0,341)
ScrollingFrame.BackgroundColor3 = Color3.new(1,1,1)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.BorderColor3 = Color3.new(0,0,0)
ScrollingFrame.ZIndex = 110
ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollingFrame.ScrollBarThickness = 0
ScrollingFrame.ScrollBarImageColor3 = Color3.new(0,0,0)
PlayersLayout.Name = "PlayersLayout"
PlayersLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
PlayersLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayersLayout.Padding = UDim.new(0,3)
KickScreen.Name = "KickScreen"
KickScreen.Position = UDim2.new(0,0,0.1823,0)
KickScreen.Size = UDim2.new(0,415,0,305)
KickScreen.BackgroundColor3 = Color3.new(1,1,1)
KickScreen.BackgroundTransparency = 1
KickScreen.BorderSizePixel = 0
KickScreen.BorderColor3 = Color3.new(0,0,0)
KickScreen.Visible = false
KickScreen.ZIndex = 120
KickReasonHolder.Name = "KickReasonHolder"
KickReasonHolder.Position = UDim2.new(0.0374,0,0.125,0)
KickReasonHolder.Size = UDim2.new(0,382,0,31)
KickReasonHolder.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
KickReasonHolder.BackgroundTransparency = 0.5
KickReasonHolder.BorderSizePixel = 0
KickReasonHolder.BorderColor3 = Color3.new(0,0,0)
KickReasonHolder.ZIndex = 121
KickReason.Name = "KickReason"
KickReason.Position = UDim2.new(0.0393,0,0,0)
KickReason.Size = UDim2.new(0,367,0,31)
KickReason.BackgroundColor3 = Color3.new(1,1,1)
KickReason.BackgroundTransparency = 1
KickReason.BorderSizePixel = 0
KickReason.BorderColor3 = Color3.new(0,0,0)
KickReason.Text = ""
KickReason.TextColor3 = Color3.new(0.698,0.698,0.698)
KickReason.Font = Enum.Font.Gotham
KickReason.TextSize = 14
KickReason.ZIndex = 122
KickReason.TextXAlignment = Enum.TextXAlignment.Left
KickReason.PlaceholderText = "Reason"
KickReason.PlaceholderColor3 = Color3.new(0.698,0.698,0.698)
KReasonText.Name = "KReasonText"
KReasonText.Position = UDim2.new(0.0566,0,0.023,0)
KReasonText.Size = UDim2.new(0,245,0,31)
KReasonText.BackgroundColor3 = Color3.new(1,1,1)
KReasonText.BackgroundTransparency = 1
KReasonText.BorderSizePixel = 0
KReasonText.BorderColor3 = Color3.new(0,0,0)
KReasonText.Text = "Kick Reason"
KReasonText.TextColor3 = Color3.new(1,1,1)
KReasonText.Font = Enum.Font.Gotham
KReasonText.TextSize = 16
KReasonText.ZIndex = 121
KReasonText.TextXAlignment = Enum.TextXAlignment.Left
KickConfirm.Name = "KickConfirm"
KickConfirm.AutoButtonColor = false
KickConfirm.Position = UDim2.new(0.1892,0,0.8234,0)
KickConfirm.Size = UDim2.new(0,256,0,37)
KickConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
KickConfirm.BackgroundTransparency = 0.5
KickConfirm.BorderSizePixel = 0
KickConfirm.BorderColor3 = Color3.new(0,0,0)
KickConfirm.ZIndex = 121
KConfirmText.Name = "KReasonText"
KConfirmText.Position = UDim2.new(0,0,0.0229,0)
KConfirmText.Size = UDim2.new(0,259,0,36)
KConfirmText.BackgroundColor3 = Color3.new(1,1,1)
KConfirmText.BackgroundTransparency = 1
KConfirmText.BorderSizePixel = 0
KConfirmText.BorderColor3 = Color3.new(0,0,0)
KConfirmText.Text = "Kick {Player}"
KConfirmText.TextColor3 = Color3.new(1,1,1)
KConfirmText.Font = Enum.Font.Gotham
KConfirmText.TextSize = 15
KConfirmText.ZIndex = 121

CreateDrag(Main)

local Lighting          = game:GetService("Lighting")
local camera			= workspace.CurrentCamera

local BLUR_SIZE         = Vector2.new(10, 10)
local PART_SIZE         = 0.01
local PART_TRANSPARENCY = 1 - 1e-7
local START_INTENSITY	= .5

Main:SetAttribute("BlurIntensity", START_INTENSITY)

local BLUR_OBJ          = Instance.new("DepthOfFieldEffect")
BLUR_OBJ.FarIntensity   = 0
BLUR_OBJ.NearIntensity  = Main:GetAttribute("BlurIntensity")
BLUR_OBJ.FocusDistance  = 0.25
BLUR_OBJ.InFocusRadius  = 0
BLUR_OBJ.Parent         = Lighting

local PartsList         = {}
local BlursList         = {}
local BlurObjects       = {}
local BlurredGui        = {}

BlurredGui.__index      = BlurredGui

function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
	local n = planeNormal
	local d = rayDirection
	local v = rayOrigin - planePos

	local num = n.x*v.x + n.y*v.y + n.z*v.z
	local den = n.x*d.x + n.y*d.y + n.z*d.z
	local a = -num / den

	return rayOrigin + a * rayDirection, a
end

function rebuildPartsList()
	PartsList = {}
	BlursList = {}
	for blurObj, part in pairs(BlurObjects) do
		table.insert(PartsList, part)
		table.insert(BlursList, blurObj)
	end
end

function BlurredGui.new(frame, shape)
	local blurPart        = Instance.new("Part")
	blurPart.Size         = Vector3.new(1, 1, 1) * 0.01
	blurPart.Anchored     = true
	blurPart.CanCollide   = false
	blurPart.CanTouch     = false
	blurPart.Material     = Enum.Material.Glass
	blurPart.Transparency = PART_TRANSPARENCY
	blurPart.Parent       = workspace.CurrentCamera

	local mesh
	if (shape == "Rectangle") then
		mesh        = Instance.new("BlockMesh")
		mesh.Parent = blurPart
	elseif (shape == "Oval") then
		mesh          = Instance.new("SpecialMesh")
		mesh.MeshType = Enum.MeshType.Sphere
		mesh.Parent   = blurPart
	end

	local ignoreInset = false
	local currentObj  = frame

	while true do
		currentObj = currentObj.Parent

		if (currentObj and currentObj:IsA("ScreenGui")) then
			ignoreInset = currentObj.IgnoreGuiInset
			break
		elseif (currentObj == nil) then
			break
		end
	end

	local new = setmetatable({
		Frame          = frame;
		Part           = blurPart;
		Mesh           = mesh;
		IgnoreGuiInset = ignoreInset;
	}, BlurredGui)

	BlurObjects[new] = blurPart
	rebuildPartsList()

	game:GetService("RunService"):BindToRenderStep("...", Enum.RenderPriority.Camera.Value + 1, function()
		blurPart.CFrame = camera.CFrame * CFrame.new(0,0,0)
		BlurredGui.updateAll()
	end)
	return new
end

function updateGui(blurObj)
	if (not blurObj.Frame.Visible) then
		blurObj.Part.Transparency = 1
		return
	end

	local camera = workspace.CurrentCamera
	local frame  = blurObj.Frame
	local part   = blurObj.Part
	local mesh   = blurObj.Mesh

	part.Transparency = PART_TRANSPARENCY

	local corner0 = frame.AbsolutePosition + BLUR_SIZE
	local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE*2
	local ray0, ray1

	if (blurObj.IgnoreGuiInset) then
		ray0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
	else
		ray0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
	end

	local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
	local planeNormal = camera.CFrame.LookVector
	local pos0 = rayPlaneIntersect(planeOrigin, planeNormal, ray0.Origin, ray0.Direction)
	local pos1 = rayPlaneIntersect(planeOrigin, planeNormal, ray1.Origin, ray1.Direction)

	local pos0 = camera.CFrame:PointToObjectSpace(pos0)
	local pos1 = camera.CFrame:PointToObjectSpace(pos1)

	local size   = pos1 - pos0
	local center = (pos0 + pos1)/2

	mesh.Offset = center
	mesh.Scale  = size / PART_SIZE
end

function BlurredGui.updateAll()
	BLUR_OBJ.NearIntensity = tonumber(Main:GetAttribute("BlurIntensity"))

	for i = 1, #BlursList do
		updateGui(BlursList[i])
	end

	local cframes = table.create(#BlursList, workspace.CurrentCamera.CFrame)
	workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)

	BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ
end

function BlurredGui:Destroy()
	self.Part:Destroy()
	BlurObjects[self] = nil
	rebuildPartsList()
end

BlurredGui.new(Main, "Rectangle")
BlurredGui.new(Players, "Rectangle")

BlurredGui.updateAll()

local BanScreen = Instance.new('Frame', Main)
local BanReasonHolder = Instance.new('Frame', BanScreen)
local BanReasonCorner = Instance.new('UICorner', BanReasonHolder)
local BanReason = Instance.new('TextBox', BanReasonHolder)
local BanConfirm = Instance.new('ImageButton', BanScreen)
local BanConfirmCorner = Instance.new('UICorner', BanConfirm)
local BConfirmText = Instance.new('TextLabel', BanConfirm)
local BanReasonText = Instance.new('TextLabel', BanScreen)

--Properties

BanScreen.Name = "BanScreen"
BanScreen.Position = UDim2.new(0,0,0.1823,0)
BanScreen.Size = UDim2.new(0,415,0,305)
BanScreen.BackgroundColor3 = Color3.new(1,1,1)
BanScreen.BackgroundTransparency = 1
BanScreen.BorderSizePixel = 0
BanScreen.BorderColor3 = Color3.new(0,0,0)
BanScreen.Visible = false
BanScreen.ZIndex = 120
BanReasonHolder.Name = "BanReasonHolder"
BanReasonHolder.Position = UDim2.new(0.0374,0,0.125,0)
BanReasonHolder.Size = UDim2.new(0,382,0,31)
BanReasonHolder.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
BanReasonHolder.BackgroundTransparency = 0.5
BanReasonHolder.BorderSizePixel = 0
BanReasonHolder.BorderColor3 = Color3.new(0,0,0)
BanReasonHolder.ZIndex = 121
BanReason.Name = "BanReason"
BanReason.Position = UDim2.new(0.0393,0,0,0)
BanReason.Size = UDim2.new(0,367,0,31)
BanReason.BackgroundColor3 = Color3.new(1,1,1)
BanReason.BackgroundTransparency = 1
BanReason.BorderSizePixel = 0
BanReason.BorderColor3 = Color3.new(0,0,0)
BanReason.Text = ""
BanReason.TextColor3 = Color3.new(0.698,0.698,0.698)
BanReason.Font = Enum.Font.Gotham
BanReason.TextSize = 14
BanReason.ZIndex = 122
BanReason.TextXAlignment = Enum.TextXAlignment.Left
BanReason.PlaceholderText = "Reason"
BanReason.PlaceholderColor3 = Color3.new(0.698,0.698,0.698)
BanConfirm.Name = "BanConfirm"
BanConfirm.Position = UDim2.new(0.1892,0,0.8234,0)
BanConfirm.Size = UDim2.new(0,256,0,37)
BanConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
BanConfirm.BackgroundTransparency = 0.5
BanConfirm.BorderSizePixel = 0
BanConfirm.AutoButtonColor = false
BanConfirm.BorderColor3 = Color3.new(0,0,0)
BanConfirm.ZIndex = 121
BConfirmText.Name = "BConfirmText"
BConfirmText.Position = UDim2.new(0,0,0.0229,0)
BConfirmText.Size = UDim2.new(0,259,0,36)
BConfirmText.BackgroundColor3 = Color3.new(1,1,1)
BConfirmText.BackgroundTransparency = 1
BConfirmText.BorderSizePixel = 0
BConfirmText.BorderColor3 = Color3.new(0,0,0)
BConfirmText.Text = "Ban 1auta"
BConfirmText.TextColor3 = Color3.new(1,1,1)
BConfirmText.Font = Enum.Font.Gotham
BConfirmText.TextSize = 15
BConfirmText.ZIndex = 121
BanReasonText.Name = "BanReasonText"
BanReasonText.Position = UDim2.new(0.0566,0,0.023,0)
BanReasonText.Size = UDim2.new(0,245,0,31)
BanReasonText.BackgroundColor3 = Color3.new(1,1,1)
BanReasonText.BackgroundTransparency = 1
BanReasonText.BorderSizePixel = 0
BanReasonText.BorderColor3 = Color3.new(0,0,0)
BanReasonText.Text = "Ban Reason"
BanReasonText.TextColor3 = Color3.new(1,1,1)
BanReasonText.Font = Enum.Font.Gotham
BanReasonText.TextSize = 16
BanReasonText.ZIndex = 121
BanReasonText.TextXAlignment = Enum.TextXAlignment.Left

local HomeButton = Instance.new('ImageButton', Main)

HomeButton.Name = "HomeButton"
HomeButton.Position = UDim2.new(0.8699,0,0.0188,0)
HomeButton.Size = UDim2.new(0,37,0,37)
HomeButton.BackgroundColor3 = Color3.new(1,1,1)
HomeButton.BackgroundTransparency = 1
HomeButton.BorderSizePixel = 0
HomeButton.BorderColor3 = Color3.new(0,0,0)
HomeButton.Image = "rbxassetid://4034483344"
HomeButton.ZIndex = 130

local GoTo = Instance.new('ImageButton', OptionsHolder)
local GoToCorner = Instance.new('UICorner', GoTo)
local GoToTitle = Instance.new('TextLabel', GoTo)
local GoToIcon = Instance.new('ImageLabel', GoTo)

--Properties

GoTo.Name = "GoTo"
GoTo.Position = UDim2.new(0.0374,0,0.2627,0)
GoTo.Size = UDim2.new(0,382,0,31)
GoTo.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
GoTo.BackgroundTransparency = 0.5
GoTo.BorderSizePixel = 0
GoTo.BorderColor3 = Color3.new(0,0,0)
GoTo.ZIndex = 102
GoTo.AutoButtonColor =false
GoToTitle.Name = "GoToTitle"
GoToTitle.Position = UDim2.new(0.033,0,0,0)
GoToTitle.Size = UDim2.new(0,240,0,31)
GoToTitle.BackgroundColor3 = Color3.new(1,1,1)
GoToTitle.BackgroundTransparency = 1
GoToTitle.BorderSizePixel = 0
GoToTitle.BorderColor3 = Color3.new(0,0,0)
GoToTitle.Text = "Go To"
GoToTitle.TextColor3 = Color3.new(1,1,1)
GoToTitle.Font = Enum.Font.Gotham
GoToTitle.TextSize = 16
GoToTitle.ZIndex = 105
GoToTitle.TextXAlignment = Enum.TextXAlignment.Left
GoToIcon.Name = "GoToIcon"
GoToIcon.Position = UDim2.new(0.9162,0,0.129,0)
GoToIcon.Size = UDim2.new(0,23,0,23)
GoToIcon.BackgroundColor3 = Color3.new(1,1,1)
GoToIcon.BackgroundTransparency = 1
GoToIcon.BorderSizePixel = 0
GoToIcon.BorderColor3 = Color3.new(0,0,0)
GoToIcon.Image = "rbxassetid://6723742952"
GoToIcon.ZIndex = 107
local GoToScreen = Instance.new('Frame', Main)
local GotoConfirm = Instance.new('ImageButton', GoToScreen)
local GConfirmHolder = Instance.new('UICorner', GotoConfirm)
local GConfirmtext = Instance.new('TextLabel', GotoConfirm)

--Properties

GoToScreen.Name = "GoToScreen"
GoToScreen.Position = UDim2.new(0,0,0.1823,0)
GoToScreen.Size = UDim2.new(0,415,0,305)
GoToScreen.BackgroundColor3 = Color3.new(1,1,1)
GoToScreen.BackgroundTransparency = 1
GoToScreen.BorderSizePixel = 0
GoToScreen.BorderColor3 = Color3.new(0,0,0)
GoToScreen.Visible = false
GoToScreen.ZIndex = 120
GotoConfirm.Name = "GotoConfirm"
GotoConfirm.AutoButtonColor = false
GotoConfirm.Position = UDim2.new(0.1892,0,0.8234,0)
GotoConfirm.Size = UDim2.new(0,256,0,37)
GotoConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
GotoConfirm.BackgroundTransparency = 0.5
GotoConfirm.BorderSizePixel = 0
GotoConfirm.BorderColor3 = Color3.new(0,0,0)
GotoConfirm.ZIndex = 121
GConfirmtext.Name = "GConfirmtext"
GConfirmtext.Position = UDim2.new(0,0,0.0229,0)
GConfirmtext.Size = UDim2.new(0,259,0,36)
GConfirmtext.BackgroundColor3 = Color3.new(1,1,1)
GConfirmtext.BackgroundTransparency = 1
GConfirmtext.BorderSizePixel = 0
GConfirmtext.BorderColor3 = Color3.new(0,0,0)
GConfirmtext.Text = "Go To 1auta"
GConfirmtext.TextColor3 = Color3.new(1,1,1)
GConfirmtext.Font = Enum.Font.Gotham
GConfirmtext.TextSize = 15
GConfirmtext.ZIndex = 121

local Bring = Instance.new('ImageButton', OptionsHolder)
local BringCorner = Instance.new('UICorner', Bring)
local BringTitle = Instance.new('TextLabel', Bring)
local BringIcon = Instance.new('ImageLabel', Bring)
Bring.Name = "Bring"
Bring.Position = UDim2.new(0.0374,0,0.2627,0)
Bring.Size = UDim2.new(0,382,0,31)
Bring.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
Bring.AutoButtonColor = false
Bring.BackgroundTransparency = 0.5
Bring.BorderSizePixel = 0
Bring.BorderColor3 = Color3.new(0,0,0)
Bring.ZIndex = 102
BringTitle.Name = "BringTitle"
BringTitle.Position = UDim2.new(0.033,0,0,0)
BringTitle.Size = UDim2.new(0,240,0,31)
BringTitle.BackgroundColor3 = Color3.new(1,1,1)
BringTitle.BackgroundTransparency = 1
BringTitle.BorderSizePixel = 0
BringTitle.BorderColor3 = Color3.new(0,0,0)
BringTitle.Text = "Bring"
BringTitle.TextColor3 = Color3.new(1,1,1)
BringTitle.Font = Enum.Font.Gotham
BringTitle.TextSize = 16
BringTitle.ZIndex = 105
BringTitle.TextXAlignment = Enum.TextXAlignment.Left
BringIcon.Name = "BringIcon"
BringIcon.Position = UDim2.new(0.9162,0,0.129,0)
BringIcon.Size = UDim2.new(0,23,0,23)
BringIcon.BackgroundColor3 = Color3.new(1,1,1)
BringIcon.BackgroundTransparency = 1
BringIcon.BorderSizePixel = 0
BringIcon.BorderColor3 = Color3.new(0,0,0)
BringIcon.Image = "rbxassetid://14547726084"
BringIcon.ZIndex = 107

local BringScreen = Instance.new('Frame', Main)
local BringConfirm = Instance.new('ImageButton', BringScreen)
local BConfirmHolder = Instance.new('UICorner', BringConfirm)
local BRConfirmText = Instance.new('TextLabel', BringConfirm)

BringScreen.Name = "BringScreen"
BringScreen.Position = UDim2.new(0,0,0.1823,0)
BringScreen.Size = UDim2.new(0,415,0,305)
BringScreen.BackgroundColor3 = Color3.new(1,1,1)
BringScreen.BackgroundTransparency = 1
BringScreen.BorderSizePixel = 0
BringScreen.BorderColor3 = Color3.new(0,0,0)
BringScreen.Visible = false
BringScreen.ZIndex = 120
BringConfirm.Name = "BringConfirm"
BringConfirm.Position = UDim2.new(0.1892,0,0.8234,0)
BringConfirm.Size = UDim2.new(0,256,0,37)
BringConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
BringConfirm.BackgroundTransparency = 0.5
BringConfirm.BorderSizePixel = 0
BringConfirm.BorderColor3 = Color3.new(0,0,0)
BringConfirm.AutoButtonColor = false
BringConfirm.ZIndex = 121
BRConfirmText.Name = "BConfirmText"
BRConfirmText.Position = UDim2.new(0,0,0.0229,0)
BRConfirmText.Size = UDim2.new(0,259,0,36)
BRConfirmText.BackgroundColor3 = Color3.new(1,1,1)
BRConfirmText.BackgroundTransparency = 1
BRConfirmText.BorderSizePixel = 0
BRConfirmText.BorderColor3 = Color3.new(0,0,0)
BRConfirmText.Text = "Go To 1auta"
BRConfirmText.TextColor3 = Color3.new(1,1,1)
BRConfirmText.Font = Enum.Font.Gotham
BRConfirmText.TextSize = 15
BRConfirmText.ZIndex = 121

local Humanoid = Instance.new('ImageButton', OptionsHolder)
local HumanoidCorner = Instance.new('UICorner', Humanoid)
local HumanoidTitle = Instance.new('TextLabel', Humanoid)
local HumanoidIcon = Instance.new('ImageLabel', Humanoid)

--Properties

Humanoid.Name = "Humanoid"
Humanoid.Position = UDim2.new(0.0374,0,0.2627,0)
Humanoid.Size = UDim2.new(0,382,0,31)
Humanoid.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
Humanoid.BackgroundTransparency = 0.5
Humanoid.BorderSizePixel = 0
Humanoid.BorderColor3 = Color3.new(0,0,0)
Humanoid.ZIndex = 102
Humanoid.AutoButtonColor = false
HumanoidTitle.Name = "HumanoidTitle"
HumanoidTitle.Position = UDim2.new(0.033,0,0,0)
HumanoidTitle.Size = UDim2.new(0,240,0,31)
HumanoidTitle.BackgroundColor3 = Color3.new(1,1,1)
HumanoidTitle.BackgroundTransparency = 1
HumanoidTitle.BorderSizePixel = 0
HumanoidTitle.BorderColor3 = Color3.new(0,0,0)
HumanoidTitle.Text = "Humanoid"
HumanoidTitle.TextColor3 = Color3.new(1,1,1)
HumanoidTitle.Font = Enum.Font.Gotham
HumanoidTitle.TextSize = 16
HumanoidTitle.ZIndex = 105
HumanoidTitle.TextXAlignment = Enum.TextXAlignment.Left
HumanoidIcon.Name = "HumanoidIcon"
HumanoidIcon.Position = UDim2.new(0.9162,0,0.129,0)
HumanoidIcon.Size = UDim2.new(0,23,0,23)
HumanoidIcon.BackgroundColor3 = Color3.new(1,1,1)
HumanoidIcon.BackgroundTransparency = 1
HumanoidIcon.BorderSizePixel = 0
HumanoidIcon.BorderColor3 = Color3.new(0,0,0)
HumanoidIcon.Image = "rbxassetid://7992557358"
HumanoidIcon.ZIndex = 107


local HumanoidScreen = Instance.new('Frame', Main)
local SetHealthTextHolder = Instance.new('Frame', HumanoidScreen)
local SetHealthCorner = Instance.new('UICorner', SetHealthTextHolder)
local SetHealthInput = Instance.new('TextBox', SetHealthTextHolder)
local SetHealthText = Instance.new('TextLabel', HumanoidScreen)
local HumanoidConfirm = Instance.new('ImageButton', HumanoidScreen)
local KickConfirmCorner = Instance.new('UICorner', HumanoidConfirm)
local KReasonText = Instance.new('TextLabel', HumanoidConfirm)
local SetJPValue = Instance.new('TextLabel', HumanoidScreen)
local SetJPValHolder = Instance.new('Frame', HumanoidScreen)
local SetJPCorner = Instance.new('UICorner', SetJPValHolder)
local SetJPInput = Instance.new('TextBox', SetJPValHolder)
local SetWSValue = Instance.new('TextLabel', HumanoidScreen)
local SetWSHolder = Instance.new('Frame', HumanoidScreen)
local SetWSCorner = Instance.new('UICorner', SetWSHolder)
local SetWSInput = Instance.new('TextBox', SetWSHolder)

--Properties

HumanoidScreen.Name = "HumanoidScreen"
HumanoidScreen.Position = UDim2.new(0,0,0.1823,0)
HumanoidScreen.Size = UDim2.new(0,415,0,305)
HumanoidScreen.BackgroundColor3 = Color3.new(1,1,1)
HumanoidScreen.BackgroundTransparency = 1
HumanoidScreen.BorderSizePixel = 0
HumanoidScreen.BorderColor3 = Color3.new(0,0,0)
HumanoidScreen.Visible = false
HumanoidScreen.ZIndex = 120
SetHealthTextHolder.Name = "SetHealthTextHolder"
SetHealthTextHolder.Position = UDim2.new(0.0374,0,0.125,0)
SetHealthTextHolder.Size = UDim2.new(0,382,0,31)
SetHealthTextHolder.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
SetHealthTextHolder.BackgroundTransparency = 0.5
SetHealthTextHolder.BorderSizePixel = 0
SetHealthTextHolder.BorderColor3 = Color3.new(0,0,0)
SetHealthTextHolder.ZIndex = 121
SetHealthInput.Name = "SetHealthInput"
SetHealthInput.Position = UDim2.new(0.0393,0,0,0)
SetHealthInput.Size = UDim2.new(0,367,0,31)
SetHealthInput.BackgroundColor3 = Color3.new(1,1,1)
SetHealthInput.BackgroundTransparency = 1
SetHealthInput.BorderSizePixel = 0
SetHealthInput.BorderColor3 = Color3.new(0,0,0)
SetHealthInput.Text = ""
SetHealthInput.TextColor3 = Color3.new(0.698,0.698,0.698)
SetHealthInput.Font = Enum.Font.Gotham
SetHealthInput.TextSize = 14
SetHealthInput.ZIndex = 122
SetHealthInput.TextXAlignment = Enum.TextXAlignment.Left
SetHealthInput.PlaceholderText = "HP Value"
SetHealthInput.PlaceholderColor3 = Color3.new(0.698,0.698,0.698)
SetHealthText.Name = "SetHealthText"
SetHealthText.Position = UDim2.new(0.0566,0,0.023,0)
SetHealthText.Size = UDim2.new(0,245,0,31)
SetHealthText.BackgroundColor3 = Color3.new(1,1,1)
SetHealthText.BackgroundTransparency = 1
SetHealthText.BorderSizePixel = 0
SetHealthText.BorderColor3 = Color3.new(0,0,0)
SetHealthText.Text = "Set Health Value"
SetHealthText.TextColor3 = Color3.new(1,1,1)
SetHealthText.Font = Enum.Font.Gotham
SetHealthText.TextSize = 16
SetHealthText.ZIndex = 121
SetHealthText.TextXAlignment = Enum.TextXAlignment.Left
HumanoidConfirm.Name = "HumanoidConfirm"
HumanoidConfirm.Position = UDim2.new(0.1892,0,0.8234,0)
HumanoidConfirm.Size = UDim2.new(0,256,0,37)
HumanoidConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
HumanoidConfirm.BackgroundTransparency = 0.5
HumanoidConfirm.BorderSizePixel = 0
HumanoidConfirm.BorderColor3 = Color3.new(0,0,0)
HumanoidConfirm.ZIndex = 121
HumanoidConfirm.AutoButtonColor = false
KReasonText.Name = "KReasonText"
KReasonText.Position = UDim2.new(0,0,0.0229,0)
KReasonText.Size = UDim2.new(0,259,0,36)
KReasonText.BackgroundColor3 = Color3.new(1,1,1)
KReasonText.BackgroundTransparency = 1
KReasonText.BorderSizePixel = 0
KReasonText.BorderColor3 = Color3.new(0,0,0)
KReasonText.Text = "Confirm"
KReasonText.TextColor3 = Color3.new(1,1,1)
KReasonText.Font = Enum.Font.Gotham
KReasonText.TextSize = 15
KReasonText.ZIndex = 121
SetJPValue.Name = "SetJPValue"
SetJPValue.Position = UDim2.new(0.0566,0,0.2262,0)
SetJPValue.Size = UDim2.new(0,245,0,31)
SetJPValue.BackgroundColor3 = Color3.new(1,1,1)
SetJPValue.BackgroundTransparency = 1
SetJPValue.BorderSizePixel = 0
SetJPValue.BorderColor3 = Color3.new(0,0,0)
SetJPValue.Text = "Set JumpPower Value"
SetJPValue.TextColor3 = Color3.new(1,1,1)
SetJPValue.Font = Enum.Font.Gotham
SetJPValue.TextSize = 16
SetJPValue.ZIndex = 121
SetJPValue.TextXAlignment = Enum.TextXAlignment.Left
SetJPValHolder.Name = "SetJPValHolder"
SetJPValHolder.Position = UDim2.new(0.0374,0,0.325,0)
SetJPValHolder.Size = UDim2.new(0,382,0,31)
SetJPValHolder.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
SetJPValHolder.BackgroundTransparency = 0.5
SetJPValHolder.BorderSizePixel = 0
SetJPValHolder.BorderColor3 = Color3.new(0,0,0)
SetJPValHolder.ZIndex = 121
SetJPInput.Name = "SetJPInput"
SetJPInput.Position = UDim2.new(0.0393,0,0,0)
SetJPInput.Size = UDim2.new(0,367,0,31)
SetJPInput.BackgroundColor3 = Color3.new(1,1,1)
SetJPInput.BackgroundTransparency = 1
SetJPInput.BorderSizePixel = 0
SetJPInput.BorderColor3 = Color3.new(0,0,0)
SetJPInput.Text = ""
SetJPInput.TextColor3 = Color3.new(0.698,0.698,0.698)
SetJPInput.Font = Enum.Font.Gotham
SetJPInput.TextSize = 14
SetJPInput.ZIndex = 122
SetJPInput.TextXAlignment = Enum.TextXAlignment.Left
SetJPInput.PlaceholderText = "JP Value"
SetJPInput.PlaceholderColor3 = Color3.new(0.698,0.698,0.698)
SetWSValue.Name = "SetWSValue"
SetWSValue.Position = UDim2.new(0.0566,0,0.4262,0)
SetWSValue.Size = UDim2.new(0,245,0,31)
SetWSValue.BackgroundColor3 = Color3.new(1,1,1)
SetWSValue.BackgroundTransparency = 1
SetWSValue.BorderSizePixel = 0
SetWSValue.BorderColor3 = Color3.new(0,0,0)
SetWSValue.Text = "Set WalkSpeed Value"
SetWSValue.TextColor3 = Color3.new(1,1,1)
SetWSValue.Font = Enum.Font.Gotham
SetWSValue.TextSize = 16
SetWSValue.ZIndex = 121
SetWSValue.TextXAlignment = Enum.TextXAlignment.Left
SetWSHolder.Name = "SetWSHolder"
SetWSHolder.Position = UDim2.new(0.0374,0,0.525,0)
SetWSHolder.Size = UDim2.new(0,382,0,31)
SetWSHolder.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
SetWSHolder.BackgroundTransparency = 0.5
SetWSHolder.BorderSizePixel = 0
SetWSHolder.BorderColor3 = Color3.new(0,0,0)
SetWSHolder.ZIndex = 121
SetWSInput.Name = "SetWSInput"
SetWSInput.Position = UDim2.new(0.0393,0,0,0)
SetWSInput.Size = UDim2.new(0,367,0,31)
SetWSInput.BackgroundColor3 = Color3.new(1,1,1)
SetWSInput.BackgroundTransparency = 1
SetWSInput.BorderSizePixel = 0
SetWSInput.BorderColor3 = Color3.new(0,0,0)
SetWSInput.Text = ""
SetWSInput.TextColor3 = Color3.new(0.698,0.698,0.698)
SetWSInput.Font = Enum.Font.Gotham
SetWSInput.TextSize = 14
SetWSInput.ZIndex = 122
SetWSInput.TextXAlignment = Enum.TextXAlignment.Left
SetWSInput.PlaceholderText = "WS Value"
SetWSInput.PlaceholderColor3 = Color3.new(0.698,0.698,0.698)

local AdminManagement = Instance.new('ImageButton', OptionsHolder)
local AdminCorner = Instance.new('UICorner', AdminManagement)
local AdminTitle = Instance.new('TextLabel', AdminManagement)
local AdminIcon = Instance.new('ImageLabel', AdminManagement)

AdminManagement.Name = "AdminManagement"
AdminManagement.AutoButtonColor = false
AdminManagement.Position = UDim2.new(0.0374,0,0.2627,0)
AdminManagement.Size = UDim2.new(0,382,0,31)
AdminManagement.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
AdminManagement.BackgroundTransparency = 0.5
AdminManagement.BorderSizePixel = 0
AdminManagement.BorderColor3 = Color3.new(0,0,0)
AdminManagement.ZIndex = 102
AdminTitle.Name = "AdminTitle"
AdminTitle.Position = UDim2.new(0.033,0,0,0)
AdminTitle.Size = UDim2.new(0,240,0,31)
AdminTitle.BackgroundColor3 = Color3.new(1,1,1)
AdminTitle.BackgroundTransparency = 1
AdminTitle.BorderSizePixel = 0
AdminTitle.BorderColor3 = Color3.new(0,0,0)
AdminTitle.Text = "Admin Management"
AdminTitle.TextColor3 = Color3.new(1,1,1)
AdminTitle.Font = Enum.Font.Gotham
AdminTitle.TextSize = 16
AdminTitle.ZIndex = 105
AdminTitle.TextXAlignment = Enum.TextXAlignment.Left
AdminIcon.Name = "AdminIcon"
AdminIcon.Position = UDim2.new(0.9162,0,0.129,0)
AdminIcon.Size = UDim2.new(0,23,0,23)
AdminIcon.BackgroundColor3 = Color3.new(1,1,1)
AdminIcon.BackgroundTransparency = 1
AdminIcon.BorderSizePixel = 0
AdminIcon.BorderColor3 = Color3.new(0,0,0)
AdminIcon.Image = "rbxassetid://11322089611"
AdminIcon.ZIndex = 107


local AdminScreen = Instance.new('Frame', Main)
local RemoveAdminConfirm = Instance.new('ImageButton', AdminScreen)
local RemoveCorner = Instance.new('UICorner', RemoveAdminConfirm)
local RAConfirmText = Instance.new('TextLabel', RemoveAdminConfirm)
local MakeAdminConfirm = Instance.new('ImageButton', AdminScreen)
local AdminCornerLol = Instance.new('UICorner', MakeAdminConfirm)
local CAConfirmText = Instance.new('TextLabel', MakeAdminConfirm)

--Properties

AdminScreen.Name = "AdminScreen"
AdminScreen.Position = UDim2.new(0,0,0.1823,0)
AdminScreen.Size = UDim2.new(0,415,0,305)
AdminScreen.BackgroundColor3 = Color3.new(1,1,1)
AdminScreen.BackgroundTransparency = 1
AdminScreen.BorderSizePixel = 0
AdminScreen.BorderColor3 = Color3.new(0,0,0)
AdminScreen.Visible = false
AdminScreen.ZIndex = 120
RemoveAdminConfirm.Name = "RemoveAdminConfirm"
RemoveAdminConfirm.Position = UDim2.new(0.1603,0,0.8201,0)
RemoveAdminConfirm.Size = UDim2.new(0,282,0,37)
RemoveAdminConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
RemoveAdminConfirm.BackgroundTransparency = 0.5
RemoveAdminConfirm.AutoButtonColor = false
RemoveAdminConfirm.BorderSizePixel = 0
RemoveAdminConfirm.BorderColor3 = Color3.new(0,0,0)
RemoveAdminConfirm.ZIndex = 121
RAConfirmText.Name = "RAConfirmText"
RAConfirmText.Position = UDim2.new(-0,0,0.0229,0)
RAConfirmText.Size = UDim2.new(0,282,0,36)
RAConfirmText.BackgroundColor3 = Color3.new(1,1,1)
RAConfirmText.BackgroundTransparency = 1
RAConfirmText.RichText = true
RAConfirmText.BorderSizePixel = 0
RAConfirmText.BorderColor3 = Color3.new(0,0,0)
RAConfirmText.Text = "<font color=\"#ff8686\">Remove Admin</font> : 1auta"
RAConfirmText.TextColor3 = Color3.new(1,1,1)
RAConfirmText.Font = Enum.Font.Gotham
RAConfirmText.TextSize = 15
RAConfirmText.ZIndex = 121
MakeAdminConfirm.Name = "MakeAdminConfirm"
MakeAdminConfirm.AutoButtonColor = false
MakeAdminConfirm.Position = UDim2.new(0.1603,0,0.6726,0)
MakeAdminConfirm.Size = UDim2.new(0,281,0,37)
MakeAdminConfirm.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
MakeAdminConfirm.BackgroundTransparency = 0.5
MakeAdminConfirm.BorderSizePixel = 0
MakeAdminConfirm.BorderColor3 = Color3.new(0,0,0)
MakeAdminConfirm.ZIndex = 121
CAConfirmText.Name = "CAConfirmText"
CAConfirmText.Position = UDim2.new(-0,0,0.0229,0)
CAConfirmText.Size = UDim2.new(0,282,0,36)
CAConfirmText.RichText = true
CAConfirmText.BackgroundColor3 = Color3.new(1,1,1)
CAConfirmText.BackgroundTransparency = 1
CAConfirmText.BorderSizePixel = 0
CAConfirmText.BorderColor3 = Color3.new(0,0,0)
CAConfirmText.Text = "<font color=\"#63ffcb\">Add Admin</font> : 1auta"
CAConfirmText.TextColor3 = Color3.new(1,1,1)
CAConfirmText.Font = Enum.Font.Gotham
CAConfirmText.TextSize = 15
CAConfirmText.ZIndex = 121

game.Players.PlayerAdded:Connect(function(player)

	local PlayerOption = Instance.new('ImageButton', ScrollingFrame)
	local POCorner = Instance.new('UICorner', PlayerOption)
	local POName = Instance.new('TextLabel', PlayerOption)
	local POHead = Instance.new('ImageLabel', PlayerOption)
	local PlayerCorner = Instance.new('UICorner', POHead)
	local PlayerStroke = Instance.new('UIStroke', POHead)

	PlayerOption.Name = "PlayerOption"
	PlayerOption.Position = UDim2.new(0.0374,0,0.3995,0)
	PlayerOption.Size = UDim2.new(0,271,0,46)
	PlayerOption.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
	PlayerOption.BackgroundTransparency = 0.5
	PlayerOption.BorderSizePixel = 0
	PlayerOption.BorderColor3 = Color3.new(0,0,0)
	PlayerOption.AutoButtonColor = false
	PlayerOption.ZIndex = 102
	POName.Name = "POName"
	POName.Position = UDim2.new(0.2064,0,0,0)
	POName.Size = UDim2.new(0,192,0,46)
	POName.BackgroundColor3 = Color3.new(1,1,1)
	POName.BackgroundTransparency = 1
	POName.BorderSizePixel = 0
	POName.BorderColor3 = Color3.new(0,0,0)
	POName.Text = player.Name
	POName.TextColor3 = Color3.new(1,1,1)
	POName.Font = Enum.Font.Gotham
	POName.TextSize = 16
	POName.ZIndex = 105
	POName.TextXAlignment = Enum.TextXAlignment.Left
	POHead.Name = "POHead"
	POHead.Position = UDim2.new(0.0329,0,0.1463,0)
	POHead.Size = UDim2.new(0,31,0,31)
	POHead.BackgroundColor3 = Color3.new(1,1,1)
	POHead.BackgroundTransparency = 1
	POHead.BorderSizePixel = 0
	POHead.BorderColor3 = Color3.new(0,0,0)
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(userId, thumbType, thumbSize)

	local good, bad = pcall(function()
		POHead.Image = (isReady and content)
	end)

	if not good then
		POHead.Image = game:GetService("Players"):GetUserThumbnailAsync(1, thumbType, thumbSize)
	end
	POHead.ZIndex = 120
	PlayerCorner.CornerRadius = UDim.new(100,100)
	PlayerStroke.Thickness = 0.6
	PlayerStroke.Color = Color3.new(0.4588,0.4588,0.4706)

	PlayerOption.MouseButton1Down:Connect(function()
		KConfirmText.Text = "Kick : "..POName.Text
		BConfirmText.Text = "Ban : "..POName.Text
		GConfirmtext.Text = "Go To : "..POName.Text
		BRConfirmText.Text = "Bring : "..POName.Text
		
		_G.Plr = POName.Text
	end)

end)

for i, player in next, game.Players:GetPlayers() do
	if player == game.Players.LocalPlayer then
		continue
	end
	local PlayerOption = Instance.new('ImageButton', ScrollingFrame)
	local POCorner = Instance.new('UICorner', PlayerOption)
	local POName = Instance.new('TextLabel', PlayerOption)
	local POHead = Instance.new('ImageLabel', PlayerOption)
	local PlayerCorner = Instance.new('UICorner', POHead)
	local PlayerStroke = Instance.new('UIStroke', POHead)

	PlayerOption.Name = "PlayerOption"
	PlayerOption.Position = UDim2.new(0.0374,0,0.3995,0)
	PlayerOption.Size = UDim2.new(0,271,0,46)
	PlayerOption.BackgroundColor3 = Color3.new(0.0353,0.0353,0.0353)
	PlayerOption.BackgroundTransparency = 0.5
	PlayerOption.BorderSizePixel = 0
	PlayerOption.BorderColor3 = Color3.new(0,0,0)
	PlayerOption.AutoButtonColor = false
	PlayerOption.ZIndex = 102
	POName.Name = "POName"
	POName.Position = UDim2.new(0.2064,0,0,0)
	POName.Size = UDim2.new(0,192,0,46)
	POName.BackgroundColor3 = Color3.new(1,1,1)
	POName.BackgroundTransparency = 1
	POName.BorderSizePixel = 0
	POName.BorderColor3 = Color3.new(0,0,0)
	POName.Text = player.Name
	POName.TextColor3 = Color3.new(1,1,1)
	POName.Font = Enum.Font.Gotham
	POName.TextSize = 16
	POName.ZIndex = 105
	POName.TextXAlignment = Enum.TextXAlignment.Left
	POHead.Name = "POHead"
	POHead.Position = UDim2.new(0.0329,0,0.1463,0)
	POHead.Size = UDim2.new(0,31,0,31)
	POHead.BackgroundColor3 = Color3.new(1,1,1)
	POHead.BackgroundTransparency = 1
	POHead.BorderSizePixel = 0
	POHead.BorderColor3 = Color3.new(0,0,0)
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(userId, thumbType, thumbSize)

	local good, bad = pcall(function()
		POHead.Image = (isReady and content)
	end)

	if not good then
		POHead.Image = game:GetService("Players"):GetUserThumbnailAsync(1, thumbType, thumbSize)
	end
	POHead.ZIndex = 120
	PlayerCorner.CornerRadius = UDim.new(100,100)
	PlayerStroke.Thickness = 0.6
	PlayerStroke.Color = Color3.new(0.4588,0.4588,0.4706)

	PlayerOption.MouseButton1Down:Connect(function()
		KConfirmText.Text = "Kick : "..POName.Text
		BConfirmText.Text = "Ban : "..POName.Text
		GConfirmtext.Text = "Go To : "..POName.Text
		BRConfirmText.Text = "Bring : "..POName.Text
		
		_G.Plr = POName.Text
	end)
end

-- // This should remove the player option but idfk
UIS.InputBegan:Connect(function(key, gp)
	if gp then return end;

	if key.KeyCode == Enum.KeyCode["LeftControl"] and IsAdmined() then
		Main.Visible = not Main.Visible
		Players.Visible = false
	end
end)

Main.Visible = false
Players.Visible = false

game.Players.PlayerRemoving:Connect(function(player)
	for i, v in pairs(Players:GetDescendants()) do
		if v.Name == "POName" and v.Text == player.Name then
			v.Parent:Destroy()
		end
	end
end)

HomeButton.MouseButton1Down:Connect(function()
	HumanoidScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true
	KickScreen.Visible = false
	BanScreen.Visible = false
	GoToScreen.Visible = false
	BringScreen.Visible = false
	AdminScreen.Visible = false
	Players.Size = UDim2.new(0,293,0,0)
end)

Kick.MouseButton1Down:Connect(function()
	Players.Visible = true
	OptionsHolder.Visible = false
	KickScreen.Visible = true
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Ban.MouseButton1Down:Connect(function()
	BanScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Bring.MouseButton1Down:Connect(function()
	BringScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

GoTo.MouseButton1Down:Connect(function()
	GoToScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Humanoid.MouseButton1Down:Connect(function()
	HumanoidScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)


-- // This should remove the player option but idfk

game.Players.PlayerRemoving:Connect(function(player)
	for i, v in pairs(Players:GetDescendants()) do
		if v.Name == "POName" and v.Text == player.Name then
			v.Parent:Destroy()
		end
	end
end)

HomeButton.MouseButton1Down:Connect(function()
	HumanoidScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true
	KickScreen.Visible = false
	BanScreen.Visible = false
	GoToScreen.Visible = false
	BringScreen.Visible = false
	Players.Size = UDim2.new(0,293,0,0)
end)

Kick.MouseButton1Down:Connect(function()
	Players.Visible = true
	OptionsHolder.Visible = false
	KickScreen.Visible = true
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Ban.MouseButton1Down:Connect(function()
	BanScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

AdminManagement.MouseButton1Down:Connect(function()
	AdminScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Bring.MouseButton1Down:Connect(function()
	BringScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

GoTo.MouseButton1Down:Connect(function()
	GoToScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

Humanoid.MouseButton1Down:Connect(function()
	HumanoidScreen.Visible = true
	Players.Visible = true
	OptionsHolder.Visible = false
	TS:Create(Players, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = UDim2.new(0,293,0,373)}):Play()
end)

-- // Ray you only need to touch this shit

KickConfirm.MouseButton1Down:Connect(function()

	Players.Visible = false
	OptionsHolder.Visible = true
	KickScreen.Visible = false
	Players.Size = UDim2.new(0,293,0,0)

	-- // for the reason just grab the entered text from the var "KickReason"
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(KickReason.Text, _G.Plr, 1)
	
end)

BanConfirm.MouseButton1Down:Connect(function()
	BanScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true

	Players.Size = UDim2.new(0,293,0,0)
	
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(KickReason.Text, _G.Plr, 3)
end)

GotoConfirm.MouseButton1Down:Connect(function()
	GoToScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true
	Players.Size = UDim2.new(0,293,0,0)
	
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, 6)
end)

BringConfirm.MouseButton1Down:Connect(function()
	BringScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true
	Players.Size = UDim2.new(0,293,0,0)

	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, 5)
end)

HumanoidConfirm.MouseButton1Down:Connect(function()
	HumanoidScreen.Visible = false
	Players.Visible = false
	OptionsHolder.Visible = true
	Players.Size = UDim2.new(0,293,0,0)

	if SetHealthInput.Text ~= "" then
		print(SetHealthInput.Text)
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, SetHealthInput.Text, 9)
		SetHealthInput.Text = ""
	end

	if SetWSInput.Text ~= "" then
		print(SetWSInput.Text)
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, SetWSInput.Text, 8)
		SetWSInput.Text = ""
	end

	if SetJPInput.Text ~= "" then
		print(_G.Plr)
		game.ReplicatedStorage.RemoteEvent:FireServer(_G.Plr, SetJPInput.Text, 7)
		SetJPInput.Text = ""
	end
end)

MakeAdminConfirm.MouseButton1Down:Connect(function()
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, 10)
end)

RemoveAdminConfirm.MouseButton1Down:Connect(function()
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(_G.Plr, 11)
end)
