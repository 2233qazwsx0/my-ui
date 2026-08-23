--------脚本免费开源
repeat task.wait() until game:IsLoaded()
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/2233qazwsx0/my-ui/main/WindUI.lua", true))()
assert(type(WindUI) == "table" and WindUI.CreateWindow, "WindUI 加载失败")
getgenv().WindUI = WindUI

--==================== 欢迎通知 ====================
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "RO脚本",
	Text = "RO脚本-CUA",
	Icon = "rbxassetid://132872684918876",
	Duration = 2,
})

--==================== 反挂机 ====================
local VirtualUserService = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
	VirtualUserService:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	wait(1)
	VirtualUserService:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
end)
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "RO脚本",
	Text = "已自动开启反挂机",
	Icon = "rbxassetid://132872684918876",
	Duration = 2,
	Button1 = "开启成功",
})

--==================== 配置表 ====================
local PlayerConfig = {
	playernamedied = "",
	dropdown = {},
	LoopTeleport = false,
	message = "",
	sayCount = 1,
	sayFast = false,
	autoSay = false,
}
local MovementConfig = {
	tpwalkslow = 0,
	tpwalkmobile = 0,
	tpwalkquick = 0,
	tpwalkslowenable = false,
	tpwalkmobileenable = false,
	tpwalkquickenable = false,
	spinspeed = 0,
	HitboxStatue = false,
	HitboxSize = 0,
	HitboxTransparency = 1,
	HitboxBrickColor = "Really red",
	DefaultFPS = 60,
	CurrentFPS = 60,
	FPSLocked = false,
	FPSVisible = false,
}
local ColorConfig = {
	['红色']= Color3.fromRGB(255, 0, 0),
	['蓝色'] = Color3.fromRGB(0, 0, 255),
	['黄色'] = Color3.fromRGB(255, 255, 0),
	['绿色'] = Color3.fromRGB(0, 255, 0),
	['青色'] = Color3.fromRGB(0, 255, 255),
	['橙色'] = Color3.fromRGB(255, 165, 0),
	['紫色'] = Color3.fromRGB(128, 0, 128),
	['白色'] = Color3.fromRGB(255, 255, 255),
	['黑色'] = Color3.fromRGB(0, 0, 0),
}
local AimConfig = {
	fovsize = 50,
	fovlookAt = false,
	fovcolor = Color3.fromRGB(0, 255, 0),
	fovthickness = 2,
	Visible = false,
	distance = 200,
	ViewportSize = 2,
	Transparency = 5,
	Position = "Head",
	teamCheck = false,
	wallCheck = false,
	aliveCheck = false,
	prejudgingselfsighting = false,
	prejudgingselfsightingdistance = 100,
	smoothness = 5,
	aimSpeed = 5,
	targetLock = false,
	hitMarker = false,
	dynamicFOV = false,
	dynamicFOVScale = 1.5,
	priorityMode = "Smart",
	aimMode = "AI",
	autoFire = false,
	fireRate = 10,
	bulletDelay = 0.1,
	weaponSwitch = false,
	threatPriority = false,
	healthPriority = false,
}
local BodyPartMap = {
	['头部'] = "Head",
	['脖子'] = "HumanoidRootPart",
	['躯干'] = "Torso",
	['左臂'] = "Left Arm",
	['右臂'] = "Right Arm",
	['左腿'] = "Left Leg",
	['右腿'] = "Right Leg",
	['左手'] = "LeftHand",
	['右手'] = "RightHand",
	['左小臂'] = "LeftLowerArm",
	['右小臂'] = "RightLowerArm",
	['左大臂'] = "LeftUpperArm",
	['右大臂'] = "RightUpperArm",
	['左脚'] = "LeftFoot",
	['左小腿'] = "LeftLowerLeg",
	['上半身'] = "UpperTorso",
	['左大腿'] = "LeftUpperLeg",
	['右脚'] = "RightFoot",
	['右小腿'] = "RightLowerLeg",
	['下半身'] = "LowerTorso",
	['右大腿'] = "RightUpperLeg",
}

--==================== 辅助函数 ====================
function shuaxinlb(includeSelf)
	PlayerConfig.dropdown = {}
	if includeSelf == true then
		for _, player in pairs(game.Players:GetPlayers()) do
			table.insert(PlayerConfig.dropdown, player.Name)
		end
	else
		local localPlayer = game.Players.LocalPlayer
		for _, player in pairs(game.Players:GetPlayers()) do
			if player ~= localPlayer then
				table.insert(PlayerConfig.dropdown, player.Name)
			end
		end
	end
end
shuaxinlb(true)

function Notify(title, text, icon, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title,
		Text = text,
		Icon = icon,
		Duration = duration,
	})
end

local function SafeCall(func, ...)
	local success, result = pcall(func, ...)
	if not success then
		return nil
	end
	return result
end

local FOVCircle = nil
local FOVLine1 = nil
local FOVLine2 = nil
local function InitFOV(radius, color, thickness, transparency)
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local Players = game:GetService("Players")
	local Camera = game.Workspace.CurrentCamera
	if FOVCircle then
		FOVCircle:Remove()
		FOVCircle = nil
	end
	FOVCircle = Drawing.new("Circle")
	FOVCircle.Visible = true
	FOVCircle.Thickness = thickness
	FOVCircle.Color = color
	FOVCircle.Filled = false
	FOVCircle.Radius = radius
	FOVCircle.Position = Camera.ViewportSize / 2
	FOVCircle.Transparency = transparency
	FOVLine1 = Drawing.new("Line")
	FOVLine1.Visible = false
	FOVLine1.Thickness = 2
	FOVLine1.Color = Color3.fromRGB(255, 0, 0)
	FOVLine1.Transparency = 1
	FOVLine2 = Drawing.new("Line")
	FOVLine2.Visible = true
	FOVLine2.Thickness = 1
	FOVLine2.Color = Color3.fromRGB(255, 255, 255)
	FOVLine2.Transparency = 1
	local function UpdateFOVDisplay()
		local viewportSize = Camera.ViewportSize
		FOVCircle.Position = viewportSize / 2
		if AimConfig.dynamicFOV then
			FOVCircle.Radius = AimConfig.fovsize * AimConfig.dynamicFOVScale
		else
			FOVCircle.Radius = AimConfig.fovsize
		end
		FOVLine2.From = Vector2.new(viewportSize.X / 2 - 5, viewportSize.Y / 2)
		FOVLine2.To = Vector2.new(viewportSize.X / 2 + 5, viewportSize.Y / 2)
		FOVLine2.From = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 - 5)
		FOVLine2.To = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2 + 5)
	end
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Delete then
			RunService:UnbindFromRenderStep("FOVUpdate")
			if FOVCircle then FOVCircle:Remove() end
			if FOVLine1 then FOVLine1:Remove() end
			if FOVLine2 then FOVLine2:Remove() end
			FOVCircle, FOVLine1, FOVLine2 = nil, nil, nil
		end
	end)
	RunService.RenderStepped:Connect(function()
		UpdateFOVDisplay()
	end)
end

local function CleanupFOV()
	if FOVCircle then FOVCircle:Remove() end
	if FOVLine1 then FOVLine1:Remove() end
	if FOVLine2 then FOVLine2:Remove() end
	FOVCircle, FOVLine1, FOVLine2 = nil, nil, nil
end

local function UpdateFOVSettings()
	if FOVCircle then
		FOVCircle.Thickness = AimConfig.fovthickness
		FOVCircle.Radius = AimConfig.fovsize
		FOVCircle.Color = AimConfig.fovcolor
		FOVCircle.Transparency = AimConfig.Transparency / 10
	end
end

local function IsSameTeam(player)
	return player.Team == game.Players.LocalPlayer.Team
end

local function IsAlive(player)
	return player.Character and player.Character:FindFirstChild("Humanoid") and 0 < player.Character.Humanoid.Health
end

local function CheckWall(player, bodyPart)
	if not AimConfig.wallCheck then
		return true
	end
	local localCharacter = game.Players.LocalPlayer.Character
	if not localCharacter then
		return false
	end
	local targetPart = player.Character and player.Character:FindFirstChild(bodyPart)
	if not targetPart then
		return false
	end
	local ray = Ray.new(game.Workspace.CurrentCamera.CFrame.Position, targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position)
	local workspace = game.Workspace
	local hitPart, hitPosition = workspace:FindPartOnRayWithIgnoreList(ray, {
		localCharacter
	})
	local isVisible
	if hitPart then
		isVisible = hitPart:IsDescendantOf(player.Character)
	else
		isVisible = true
	end
	return isVisible
end

local function PredictPosition(player, part)
	return part.Position + part.AssemblyLinearVelocity * ((part.Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 1000
end

local function IsInFOV(position)
	local camera = game.Workspace.CurrentCamera
	local viewportPoint = camera:WorldToViewportPoint(position)
	return (Vector2.new(viewportPoint.X, viewportPoint.Y) - camera.ViewportSize / 2).Magnitude <= AimConfig.fovsize
end

local function GetBestTarget(bodyPart)
	local bestScore = -math.huge
	local bestTarget = nil
	for _, player in ipairs(game.Players:GetPlayers()) do
		if (not AimConfig.aliveCheck or IsAlive(player)) and player ~= game.Players.LocalPlayer then
			local targetPart = player.Character and player.Character:FindFirstChild(bodyPart)
			if targetPart then
				local distance = (targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position).Magnitude
				local speed = targetPart.AssemblyLinearVelocity.Magnitude
				local camera = workspace.CurrentCamera
				local screenPoint, isVisible = camera:WorldToViewportPoint(targetPart.Position)
				local crosshairDistance = math.huge
				if isVisible and screenPoint then
					local viewportPos = Vector2.new(screenPoint.X, screenPoint.Y)
					crosshairDistance = (viewportPos - camera.ViewportSize / 2).Magnitude
				end
				local priorityScore = 0
				if AimConfig.priorityMode == "Distance" then
					priorityScore = -distance
				elseif AimConfig.priorityMode == "Crosshair" then
					priorityScore = -crosshairDistance
				elseif AimConfig.priorityMode == "Speed" then
					priorityScore = speed
				elseif AimConfig.priorityMode == "Smart" then
					priorityScore = -distance * 0.5 + speed * 0.3 - crosshairDistance * 0.2
				end
				if AimConfig.threatPriority then
					priorityScore = priorityScore * (player:GetAttribute("ThreatLevel") or 1)
				end
				if AimConfig.healthPriority and player.Character.Humanoid then
					priorityScore = priorityScore * 1 / player.Character.Humanoid.Health
				end
				if bestScore < priorityScore and distance <= AimConfig.distance and (not AimConfig.teamCheck or AimConfig.teamCheck and not IsSameTeam(player)) and (not AimConfig.wallCheck or AimConfig.wallCheck and CheckWall(player, bodyPart)) then
					bestScore = priorityScore
					bestTarget = player
				end
			end
		end
	end
	return bestTarget
end

local function AimAI()
	local target = GetBestTarget(AimConfig.Position)
	if target and target.Character and target.Character:FindFirstChild(AimConfig.Position) then
		local targetPart = target.Character[AimConfig.Position]
		local targetPosition = targetPart.Position
		if IsInFOV(targetPosition) then
			if AimConfig.prejudgingselfsighting then
				targetPosition = PredictPosition(target, targetPart)
			end
			if (not AimConfig.teamCheck or not IsSameTeam(target)) and (not AimConfig.wallCheck or CheckWall(target, AimConfig.Position)) then
				local smoothnessFactor = math.max(0.1, 1 / AimConfig.smoothness)
				local aimSpeedFactor = math.max(0.1, AimConfig.aimSpeed * 0.1)
				local currentCFrame = game.Workspace.CurrentCamera.CFrame
				game.Workspace.CurrentCamera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, targetPosition), smoothnessFactor * aimSpeedFactor)
				if FOVLine1 then
					local viewportPoint = game.Workspace.CurrentCamera:WorldToViewportPoint(targetPosition)
					FOVLine1.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
					FOVLine1.To = Vector2.new(viewportPoint.X, viewportPoint.Y)
					FOVLine1.Visible = true
				end
				if AimConfig.autoFire then
					local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
					if tool and 1 / AimConfig.fireRate <= tick() - (tool:GetAttribute("LastFireTime") or 0) then
						tool:Activate()
						tool:SetAttribute("LastFireTime", tick())
					end
				end
			end
		elseif FOVLine1 then
			FOVLine1.Visible = false
		end
	elseif FOVLine1 then
		FOVLine1.Visible = false
	end
end

local function AimFunction()
	local target = GetBestTarget(AimConfig.Position)
	if target and target.Character and target.Character:FindFirstChild(AimConfig.Position) then
		local targetPart = target.Character[AimConfig.Position]
		local targetPosition = targetPart.Position
		if IsInFOV(targetPosition) then
			local timeToTarget = ((targetPart.Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 1000
			local predictedPosition = targetPosition + targetPart.AssemblyLinearVelocity * timeToTarget + 0.5 * Vector3.new(0, -workspace.Gravity, 0) * timeToTarget ^ 2
			if (not AimConfig.teamCheck or not IsSameTeam(target)) and (not AimConfig.wallCheck or CheckWall(target, AimConfig.Position)) then
				local smoothnessFactor = math.max(0.1, 1 / AimConfig.smoothness)
				local aimSpeedFactor = math.max(0.1, AimConfig.aimSpeed * 0.1)
				local currentCFrame = game.Workspace.CurrentCamera.CFrame
				game.Workspace.CurrentCamera.CFrame = currentCFrame:Lerp(CFrame.new(currentCFrame.Position, predictedPosition), smoothnessFactor * aimSpeedFactor)
				if FOVLine1 then
					local viewportPoint = game.Workspace.CurrentCamera:WorldToViewportPoint(predictedPosition)
					FOVLine1.From = Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X / 2, game.Workspace.CurrentCamera.ViewportSize.Y / 2)
					FOVLine1.To = Vector2.new(viewportPoint.X, viewportPoint.Y)
					FOVLine1.Visible = true
				end
				if AimConfig.autoFire then
					local tool = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
					if tool and 1 / AimConfig.fireRate <= tick() - (tool:GetAttribute("LastFireTime") or 0) then
						tool:Activate()
						tool:SetAttribute("LastFireTime", tick())
					end
				end
			end
		elseif FOVLine1 then
			FOVLine1.Visible = false
		end
	elseif FOVLine1 then
		FOVLine1.Visible = false
	end
end

local function UpdateDynamicFOV()
	if AimConfig.dynamicFOV then
		local target = GetBestTarget(AimConfig.Position)
		if target and target.Character and target.Character:FindFirstChild(AimConfig.Position) then
			AimConfig.fovsize = math.clamp(20 / ((target.Character[AimConfig.Position].Position - game.Workspace.CurrentCamera.CFrame.Position)).Magnitude / 50 * (1 + target.Character[AimConfig.Position].AssemblyLinearVelocity.Magnitude / 100), 10, 100)
			UpdateFOVSettings()
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	if AimConfig.fovlookAt then
		if AimConfig.aimMode == "AI" then
			AimAI()
		elseif AimConfig.aimMode == "Function" then
			AimFunction()
		end
		UpdateDynamicFOV()
	end
end)

--==================== 动态模糊 ====================
local MotionBlurEnabled = false
local BlurEffectInstance = nil
local BlurAmount = 15
local BlurAmplifier = 5
local BlurSmoothness = 0.15
local BlurThreshold = 0.05
local BlurIntensity = 1
local BlurColor = Color3.new(0, 0, 0)
local BlurDirection = Vector2.new(1, 0)
local PreviousLookVector = Vector3.zero
local LastUpdateTime = tick()
local CurrentBlurType = "MotionBlur"
local BlurPresets = {
	{ name = "默认", amount = 15, amplifier = 5, smoothness = 0.15, threshold = 0.05 },
	{ name = "强烈", amount = 25, amplifier = 10, smoothness = 0.05, threshold = 0.02 },
	{ name = "柔和", amount = 8, amplifier = 3, smoothness = 0.2, threshold = 0.1 },
}
local function CreateBlurEffect(parent)
	if BlurEffectInstance then
		BlurEffectInstance:Destroy()
	end
	BlurEffectInstance = Instance.new("BlurEffect", parent)
	BlurEffectInstance.Name = "EnhancedMotionBlur"
	BlurEffectInstance.Size = 0
end
local function UpdateMotionBlur(camera, humanoid)
	if not BlurEffectInstance or not MotionBlurEnabled then
		return
	end
	local currentLookVector = camera.CFrame.LookVector
	local lookVectorChange = (currentLookVector - PreviousLookVector).Magnitude
	if BlurThreshold < lookVectorChange then
		BlurEffectInstance.Size = BlurEffectInstance.Size + (math.abs(lookVectorChange) * BlurAmount * BlurAmplifier - BlurEffectInstance.Size) * BlurSmoothness
	else
		BlurEffectInstance.Size = BlurEffectInstance.Size * (1 - BlurSmoothness)
	end
	PreviousLookVector = currentLookVector
end
local function SetBlurType(blurType)
	CurrentBlurType = blurType
	if BlurEffectInstance then
		BlurEffectInstance:Destroy()
		CreateBlurEffect(workspace.CurrentCamera)
	end
end
local function ApplyBlurPreset(preset)
	BlurAmount = preset.amount
	BlurAmplifier = preset.amplifier
	BlurSmoothness = preset.smoothness
	BlurThreshold = preset.threshold
end

--==================== 传送行走 ====================
local TeleportWalkThreads = 5
local TeleportWalkEnabled = false
local TeleportWalkRunning = false
local LocalPlayer = game:GetService("Players").LocalPlayer
local HeartbeatService = game:GetService("RunService").Heartbeat
local function TeleportWalk(character, humanoid)
	if TeleportWalkEnabled == true then
		TeleportWalkRunning = false
		HeartbeatService:Wait()
		task.wait(0.1)
		HeartbeatService:Wait()
		for threadIndex = 1, TeleportWalkThreads, 1 do
			spawn(function()
				TeleportWalkRunning = true
				while TeleportWalkRunning do
					local deltaTime = HeartbeatService:Wait()
					if deltaTime then
						if character then
							if humanoid then
								if humanoid.Parent then
									local moveMagnitude = humanoid.MoveDirection.Magnitude
									if moveMagnitude > 0 then
										character:TranslateBy(humanoid.MoveDirection)
									end
								else
									break
								end
							else
								break
							end
						else
							break
						end
					else
						break
					end
				end
			end)
		end
	end
end
LocalPlayer.CharacterAdded:Connect(function(character)
	local characterInstance = LocalPlayer.Character
	if characterInstance then
		task.wait(0.7)
		if characterInstance.Humanoid then
			characterInstance.Humanoid.PlatformStand = false
		end
		if characterInstance.Animate then
			characterInstance.Animate.Disabled = false
		end
	end
end)

--==================== WindUI 窗口 ====================
local Window = WindUI:CreateWindow({
	Title = "RO脚本",
	Icon = "geist:window",
	Author = "CUA",
	Folder = "RO脚本",
})
Window:SetIconSize(48)
Window:Tag({ Title = "v1.0", Color = Color3.fromHex("#30ff6a") })
local RO_TAG = Window:Tag({ Title = "CUA制作", Color = Color3.fromHex("#315dff") })
--==================== 美化层（彩色Wind风格·仅视觉，不影响功能） ====================
do
	local RunSvc = game:GetService("RunService")
	local ColorHSVA = Color3.fromHSV

	-- 收集所有连接与创建的 Gradient / Stroke，窗口销毁时统一清理
	local connections = {}
	local function scheduleCleanup(destroyed, grads)
		task.spawn(function()
			while not destroyed.Mark do
				if not Window.UIElements or not Window.UIElements.Main or not Window.UIElements.Main:IsDescendantOf(game) then
					destroyed.Mark = true
				end
				task.wait()
			end
			for _, c in ipairs(connections) do pcall(function() c:Disconnect() end) end
			for _, g in ipairs(grads) do pcall(function() g:Destroy() end) end
			connections = {}
			grads = {}
		end)
	end
	local destroyed = { Mark = false }
	local createdObjs = {}

	local function makeRainbowStroke(target, keys)
		if not (target and target.Parent) then return end
		local ok = pcall(function()
			local s = Instance.new("UIStroke")
			s.Thickness = keys.Thickness or 2
			s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			s.Color = Color3.new(1, 1, 1)
			s.LineJoinMode = keys.LineJoinMode or Enum.LineJoinMode.Round
			local grad = Instance.new("UIGradient")
			grad.Color = ColorSequence.new(ColorHSVA(0, 0.9, 1), ColorHSVA(0.5, 0.9, 1))
			grad.Parent = s
			s.Parent = target
			local t = 0
			connections[#connections + 1] = RunSvc.Heartbeat:Connect(function(dt)
				t = t + dt * (keys.Speed or 0.5)
				grad.Rotation = (keys.Rot or 360) * math.sin(t * 0.2)
				grad.Color = ColorSequence.new(ColorHSVA(t % 1, 0.9, 1), ColorHSVA((t + 0.5) % 1, 0.9, 1))
			end)
			createdObjs[#createdObjs + 1] = s
		end)
		return ok
	end

	local function makeRainbowText(label, speed)
		if not (label and label.Parent) then return end
		pcall(function()
			local grad = Instance.new("UIGradient")
			grad.Color = ColorSequence.new(ColorHSVA(0, 0.9, 1), ColorHSVA(0.3, 0.9, 1))
			grad.Parent = label
			local t = 0
			connections[#connections + 1] = RunSvc.Heartbeat:Connect(function(dt)
				t = t + dt * (speed or 0.8)
				grad.Rotation = 60 * math.sin(t * 0.5)
				grad.Color = ColorSequence.new(ColorHSVA(t % 1, 0.9, 1), ColorHSVA((t + 0.3) % 1, 0.9, 1))
			end)
			createdObjs[#createdObjs + 1] = grad
		end)
	end

	-- 1) 主窗口边框彩虹
	local mainContainer = Window.UIElements and Window.UIElements.MainContainer
	if mainContainer then makeRainbowStroke(mainContainer, { Thickness = 2.5, Speed = 0.5 }) end

	-- 2) 标题文字彩虹（优先找文本为 "RO脚本" 的标题标签）
	local foundTitle = false
	local panel = Window.UIElements and Window.UIElements.Main
	if panel then
		for _, obj in ipairs(panel:GetDescendants()) do
			if obj:IsA("TextLabel") and obj.Text and string.find(obj.Text, "RO脚本", 1, true) then
				makeRainbowText(obj, 0.8)
				foundTitle = true
				break
			end
		end
	end
	if not foundTitle and Window.UIElements and Window.UIElements.Title then
		makeRainbowText(Window.UIElements.Title, 0.8)
	end

	-- 3) 悬浮开关按钮彩虹描边
	pcall(function()
		local ob = Window.OpenButtonMain
		if ob and ob.Button then
			local btn = ob.Button:FindFirstChildWhichIsA("TextButton")
			if btn then makeRainbowStroke(btn, { Thickness = 3, Speed = 0.6, Rot = 150 }) end
		end
	end)

	-- 4) 窗口整体淡淡彩虹光晕氛围（保深色主体）
	if panel then
		pcall(function()
			local glow = Instance.new("UIGradient")
			glow.Color = ColorSequence.new(ColorHSVA(0.7, 0.35, 0.05), ColorHSVA(0.1, 0.45, 0.10))
			glow.Rotation = 90
			glow.Parent = panel
			createdObjs[#createdObjs + 1] = glow
		end)
	end

	scheduleCleanup(destroyed, createdObjs)
end

--==================== 『信息』Tab ====================
local InfoTab = Window:Tab({ Title = "信息", Icon = "geist:info" })

-- 玩家信息
InfoTab:Section({ Title = "玩家信息" })
local function PlayerInfoLabels()
	local lp = game.Players.LocalPlayer
	local tbl = {
		{ Title = "注入器", Desc = identifyexecutor and identifyexecutor() or "未知" },
		{ Title = "用户名", Desc = lp.Name },
		{ Title = "名称", Desc = lp.DisplayName },
		{ Title = "服务器ID", Desc = tostring(game.GameId) },
		{ Title = "用户ID", Desc = tostring(lp.UserId) },
		{ Title = "客户端ID", Desc = game:GetService("RbxAnalyticsService"):GetClientId() },
	}
	for _, item in ipairs(tbl) do
		InfoTab:Paragraph({ Title = item.Title, Desc = item.Desc })
	end
end
PlayerInfoLabels()
InfoTab:Toggle({
	Title = "开/关用户名显示",
	Value = false,
	Callback = function(enabled)
		if enabled then
			XM = true
			task.spawn(function()
				while XM do
					local screenGui = Instance.new("ScreenGui", game.CoreGui)
					local textLabel = Instance.new("TextLabel", screenGui)
					local gradient = Instance.new("UIGradient")
					screenGui.Name = "UserGui"
					screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					screenGui.Enabled = true
					textLabel.Name = "UserLabel"
					textLabel.BackgroundColor3 = Color3.new(1, 1, 1)
					textLabel.BackgroundTransparency = 1
					textLabel.BorderColor3 = Color3.new(0, 0, 0)
					textLabel.Position = UDim2.new(0.8, 0.8, 0.0009, 0)
					textLabel.Size = UDim2.new(0, 135, 0, 50)
					textLabel.Font = Enum.Font.GothamSemibold
					textLabel.Text = "尊贵的RO脚本用户: " .. game.Players.LocalPlayer.DisplayName
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextScaled = true
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.Visible = true
					gradient.Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.1, Color3.fromRGB(255, 127, 0)),
						ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 255, 0)),
						ColorSequenceKeypoint.new(0.3, Color3.fromRGB(0, 255, 0)),
						ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 0, 255)),
						ColorSequenceKeypoint.new(0.6, Color3.fromRGB(139, 0, 255)),
						ColorSequenceKeypoint.new(0.7, Color3.fromRGB(255, 0, 0)),
						ColorSequenceKeypoint.new(0.8, Color3.fromRGB(255, 127, 0)),
						ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 255, 0)),
						ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0)),
					})
					gradient.Rotation = 10
					gradient.Parent = textLabel
					game:GetService("TweenService"):Create(gradient, TweenInfo.new(7, Enum.EasingStyle.Linear, Enum.EasingDirection.In, -1), {
						Rotation = 360,
					}):Play()
					wait(0.1)
				end
			end)
		else
			XM = false
		end
	end,
})

-- 作者信息
InfoTab:Section({ Title = "作者信息" })
local AuthorInfo = {
	"RO脚本",
	"作者: CUA&kw0948😵",
	"脚本永久免费",
	"请勿倒卖",
}
for _, line in ipairs(AuthorInfo) do
	InfoTab:Paragraph({ Title = line })
end

-- UI 设置
InfoTab:Section({ Title = "UI 设置" })
InfoTab:Button({
	Title = "关闭脚本",
	Callback = function()
		Window:Destroy()
	end,
})
InfoTab:Section({ Title = "WindUI" })
InfoTab:Paragraph({ Title = "RO脚本 WindUI", Desc = "作者CUA&kw0948😵" })

--==================== 『通用』Tab ====================
local GeneralTab = Window:Tab({ Title = "通用", Icon = "geist:layers" })

-- 本地玩家
GeneralTab:Section({ Title = "本地玩家" })
general_current_wspeed = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.WalkSpeed or 16
GeneralTab:Slider({
	Title = "设置速度",
	Value = { Min = 16, Max = 400, Default = general_current_wspeed },
	Callback = function(walkSpeed)
		task.spawn(function()
			while task.wait() do
				local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
				if humanoid then
					humanoid.WalkSpeed = walkSpeed
				end
			end
		end)
	end,
})
general_current_jump = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.JumpPower or 50
GeneralTab:Slider({
	Title = "设置跳跃高度",
	Flag = "JumpPower",
	Value = { Min = 50, Max = 400, Default = general_current_jump },
	Callback = function(jumpPower)
		task.spawn(function()
			while task.wait() do
				local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
				if humanoid then
					humanoid.JumpPower = jumpPower
				end
			end
		end)
	end,
})
GeneralTab:Slider({
	Title = "设置血量",
	Value = { Min = 100, Max = 10000, Default = 100 },
	Callback = function(health)
		local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		if hum then hum.Health = health end
	end,
})
GeneralTab:Slider({
	Title = "设置血量上限",
	Value = { Min = 100, Max = 10000, Default = 100 },
	Callback = function(maxHealth)
		local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
		if hum then hum.MaxHealth = maxHealth end
	end,
})
GeneralTab:Slider({
	Title = "设置缩放距离",
	Value = { Min = 128, Max = 200000, Default = 128 },
	Callback = function(zoomDistance)
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = zoomDistance
	end,
})
GeneralTab:Slider({
	Title = "设置缩放焦距(正常70)",
	Value = { Min = 0.1, Max = 250, Default = 70 },
	Callback = function(fieldOfView)
		game.Workspace.CurrentCamera.FieldOfView = fieldOfView
	end,
})
GeneralTab:Slider({
	Title = "设置帧率FPS",
	Value = { Min = 300, Max = 100000, Default = 300 },
	Callback = function(fps)
		if setfpscap then setfpscap(fps) end
	end,
})
general_headsize_hook = nil
GeneralTab:Slider({
	Title = "设置玩家头部大小",
	Value = { Min = 0, Max = 1000, Default = 1 },
	Callback = function(headSize)
		local Players = game:GetService("Players")
		local localPlayer = Players.LocalPlayer
		local function headIsAlive(player)
			if not player then return false end
			local character = player.Character
			if not character then return false end
			local head = character:FindFirstChild("Head")
			local humanoid = character:FindFirstChildWhichIsA("Humanoid")
			if head and humanoid and humanoid.Health and humanoid.Health > 0 then
				return true
			end
			return false
		end
		for _, player in pairs(Players:GetPlayers()) do
			if player ~= localPlayer and headIsAlive(player) then
				player.Character.Head.Massless = true
				player.Character.Head.Size = Vector3.new(headSize, headSize, headSize)
			end
			player.CharacterAdded:Connect(function()
				while not headIsAlive(player) do wait() end
				player.Character.Head.Massless = true
				player.Character.Head.Size = Vector3.new(headSize, headSize, headSize)
			end)
		end
		Players.PlayerAdded:Connect(function(newPlayer)
			newPlayer.CharacterAdded:Wait()
			if headIsAlive(newPlayer) then
				newPlayer.Character.Head.Massless = true
				newPlayer.Character.Head.Size = Vector3.new(headSize, headSize, headSize)
			end
			newPlayer.CharacterAdded:Connect(function()
				while not headIsAlive(newPlayer) do wait() end
				newPlayer.Character.Head.Massless = true
				newPlayer.Character.Head.Size = Vector3.new(headSize, headSize, headSize)
			end)
		end)
	end,
})
GeneralTab:Input({
	Title = "设置重力",
	Placeholder = "输入重力值",
	Callback = function(gravity)
		task.spawn(function()
			while task.wait() do
				game.Workspace.Gravity = tonumber(gravity) or game.Workspace.Gravity
			end
		end)
	end,
})
Speed = 16
GeneralTab:Input({
	Title = "设置快速跑步",
	Placeholder = "输入速度",
	Callback = function(speedValue)
		Speed = tonumber(speedValue) or Speed
	end,
})
sudu = nil
GeneralTab:Toggle({
	Title = "开启快速跑步(开/关)",
	Value = false,
	Callback = function(enabled)
		if enabled then
			sudu = game:GetService("RunService").Heartbeat:Connect(function()
				local lp = game:GetService("Players").LocalPlayer
				if lp.Character and lp.Character.Humanoid and lp.Character.Humanoid.Parent and 0 < lp.Character.Humanoid.MoveDirection.Magnitude then
					lp.Character:TranslateBy(lp.Character.Humanoid.MoveDirection * Speed / 0.5)
				end
			end)
		elseif not enabled and sudu then
			sudu:Disconnect()
			sudu = nil
		end
	end,
})

-- 通用功能
GeneralTab:Section({ Title = "通用" })
GeneralTab:Toggle({
	Title = "夜视",
	Value = false,
	Callback = function(enabled)
		task.spawn(function()
			while task.wait() do
				local lighting = game.Lighting
				if enabled then
					lighting.Ambient = Color3.new(1, 1, 1)
				else
					lighting.Ambient = Color3.new(0, 0, 0)
				end
			end
		end)
	end,
})
GeneralTab:Button({
	Title = "透视",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/LE2hzECZ/raw"))()
	end,
})
GeneralTab:Dropdown({
	Title = "选择帧率FPS",
	Values = { "FPS 5", "FPS 15", "FPS 30", "FPS 45", "FPS 60", "FPS 90", "FPS 120", "FPS 240", "最大FPS" },
	Callback = function(selectedFPS)
		local map = { ["FPS 5"]=5, ["FPS 15"]=15, ["FPS 30"]=30, ["FPS 45"]=45, ["FPS 60"]=60, ["FPS 90"]=90, ["FPS 120"]=120, ["FPS 240"]=240, ["最大FPS"]=10000 }
		if setfpscap and map[selectedFPS] then setfpscap(map[selectedFPS]) end
	end,
})
local function KillAura(enabled)
	local Players = nil
	local isRunning = nil
	if enabled then
		local existingConnections = getgenv().configs and getgenv().configs.connections
		if existingConnections then
			local disableEvent = getgenv().configs.Disable
			for _, connection in pairs(existingConnections) do
				connection:Disconnect()
			end
			disableEvent:Fire()
			disableEvent:Destroy()
			table.clear(getgenv().configs)
		end
		local disableEvent = Instance.new("BindableEvent")
		getgenv().configs = {
			connections = {},
			Disable = disableEvent,
			Size = Vector3.new(10, 10, 10),
			DeathCheck = true,
		}
		Players = game:GetService("Players")
		local RunService = game:GetService("RunService")
		local localPlayer = Players.LocalPlayer
		isRunning = true
		local overlapParams = OverlapParams.new()
		overlapParams.FilterType = Enum.RaycastFilterType.Include
		local function GetCharacter(player)
			if not player then player = localPlayer end
			return player.Character
		end
		local function GetHumanoid(model)
			if not model then return nil end
			if type(model) == "userdata" and model.IsA then
				if model:IsA("Player") then model = GetCharacter(model) end
				if model and type(model) == "userdata" and model.IsA then
					if model:IsA("Model") then
						return model:FindFirstChildWhichIsA("Humanoid") or model:FindFirstChild("Humanoid")
					elseif model:IsA("Humanoid") then
						return model
					end
				end
			end
			return nil
		end
		local function AF_alive(humanoid)
			return humanoid and 0 < humanoid.Health
		end
		local function HasTouchTransmitter(tool)
			return tool and tool:FindFirstChildWhichIsA("TouchTransmitter", true)
		end
		local function GetOtherCharacters(excludeCharacter)
			local characters = {}
			for _, player in pairs(Players:GetPlayers()) do
				table.insert(characters, GetCharacter(player))
			end
			for index, character in pairs(characters) do
				if character == excludeCharacter then
					table.remove(characters, index)
					break
				end
			end
			return characters
		end
		local function ActivateTool(tool, part, targetPart)
			if tool:IsDescendantOf(workspace) then
				tool:Activate()
				firetouchinterest(part, targetPart, 1)
				firetouchinterest(part, targetPart, 0)
			end
		end
		table.insert(getgenv().configs.connections, disableEvent.Event:Connect(function()
			isRunning = false
		end))
		while isRunning do
			local localCharacter = GetCharacter()
			if AF_alive(GetHumanoid(localCharacter)) then
				local tool = localCharacter and localCharacter:FindFirstChildWhichIsA("Tool")
				local touchTransmitter = tool and HasTouchTransmitter(tool)
				if touchTransmitter then
					local toolPart = touchTransmitter.Parent
					local otherCharacters = GetOtherCharacters(localCharacter)
					overlapParams.FilterDescendantsInstances = otherCharacters
					for _, part in pairs(workspace:GetPartBoundsInBox(toolPart.CFrame, toolPart.Size + getgenv().configs.Size, overlapParams)) do
						local characterModel = part:FindFirstAncestorWhichIsA("Model")
						if table.find(otherCharacters, characterModel) then
							if getgenv().configs.DeathCheck and AF_alive(GetHumanoid(characterModel)) then
								ActivateTool(tool, toolPart, part)
							elseif not getgenv().configs.DeathCheck then
								ActivateTool(tool, toolPart, part)
							end
						end
					end
				end
			end
			RunService.Heartbeat:Wait()
		end
	else
		local disableEvent = getgenv().configs and getgenv().configs.Disable
		if disableEvent then
			disableEvent:Fire()
			disableEvent:Destroy()
		end
		local configs = getgenv().configs
		local connections = configs and configs.connections
		if connections then
			for _, connection in pairs(connections) do
				connection:Disconnect()
			end
			table.clear(connections)
		end
		Run = false
	end
end
GeneralTab:Toggle({
	Title = "开启杀戮光环",
	Value = false,
	Callback = function(enabled)
		KillAura(enabled)
	end,
})
GeneralTab:Button({
	Title = "隐身道具",
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)", true))()
	end,
})
general_hfloop = false
GeneralTab:Toggle({
	Title = "循环恢复血量",
	Value = false,
	Callback = function(enabled)
		general_hfloop = enabled
		if enabled then
			task.spawn(function()
				while general_hfloop do
					local lp = game.Players.LocalPlayer
					local hum = lp and lp.Character and lp.Character:FindFirstChildWhichIsA("Humanoid")
					if hum and hum.Parent then
						hum.Health = 9000000000
					end
					task.wait(0.5)
				end
			end)
		end
	end,
})
GeneralTab:Button({
	Title = "锁定视野",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/nekmtvpA/raw"))()
	end,
})
function Cam2()
	while Cam1 do
		wait(0.1)
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 9000000000
	end
	while not Cam1 do
		wait(0.1)
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 32
	end
end
Cam1 = false
GeneralTab:Toggle({
	Title = "解锁最大视野",
	Value = false,
	Callback = function(enabled)
		Cam1 = enabled
		if Cam1 then Cam2() end
	end,
})
oldnamecall = nil
oldindex = nil
silent_installed = false
GeneralTab:Toggle({
	Title = "子弹追踪",
	Value = false,
	Callback = function(enabled)
		local camera = workspace.CurrentCamera
		local Players = game.Players
		local localPlayer = Players.LocalPlayer
		local mouse = localPlayer:GetMouse()
		function ClosestPlayer()
			local closestDistance = math.huge
			local closestPlayer = nil
			for _, player in pairs(Players:GetPlayers()) do
				if player ~= localPlayer and player.Team ~= localPlayer.Team and player.Character then
					local head = player.Character:FindFirstChild("Head")
					if head then
						local screenPoint, isVisible = camera:WorldToScreenPoint(head.Position)
						if isVisible then
							local distance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)).Magnitude
							if distance < closestDistance then
								closestDistance = distance
								closestPlayer = player
							end
						end
					end
				end
			end
			return closestPlayer
		end
		if enabled and not silent_installed then
			local metatable = getrawmetatable(game)
			if metatable then
				oldnamecall = metatable.__namecall
				oldindex = metatable.__index
				setreadonly(metatable, false)
				metatable.__namecall = newcclosure(function(self, ...)
					local args = { ... }
					if getnamecallmethod() == "FindPartOnRayWithIgnoreList" and not checkcaller() then
						local targetPlayer = ClosestPlayer()
						if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
							args[1] = Ray.new(camera.CFrame.Position, ((targetPlayer.Character.Head.Position - camera.CFrame.Position)).Unit * 1000)
							return oldnamecall(self, unpack(args))
						end
					end
					return oldnamecall(self, ...)
				end)
				metatable.__index = newcclosure(function(self, key)
					if key == "Clips" then
						return workspace.Map
					end
					return oldindex(self, key)
				end)
				setreadonly(metatable, true)
				silent_installed = true
			end
		end
	end,
})
GeneralTab:Button({
	Title = "查看所有玩家(含血量条)",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/G2zb992X", true))()
	end,
})
GeneralTab:Button({
	Title = "工具包",
	Callback = function()
		loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()
	end,
})
GeneralTab:Button({
	Title = "老外传送至玩家身边",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua"))()
	end,
})
GeneralTab:Button({
	Title = "点击传送道具",
	Callback = function()
		loadstring(game:HttpGet("https://pastefy.app/Jf2QXOwa/raw"))()
	end,
})
GeneralTab:Button({
	Title = "Dex",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/renlua/Script-Tutorial/refs/heads/main/dex.lua"))()
	end,
})
Clipon = false
Stepped = nil
GeneralTab:Toggle({
	Title = "穿墙",
	Value = false,
	Callback = function(enabled)
		if enabled then
			Clipon = true
		else
			Clipon = false
		end
		if Stepped then Stepped:Disconnect() end
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if Clipon then
				for _, child in pairs(workspace:GetChildren()) do
					if child.Name == game.Players.LocalPlayer.Name then
						for _, part in pairs(child:GetChildren()) do
							if part:IsA("BasePart") then
								part.CanCollide = false
							end
						end
					end
				end
			end
		end)
	end,
})

--==================== 通用功能增强（手搓·纯本地, 作者: CUA） ====================
GeneralTab:Section({ Title = "通用增强" })

-- 无限跳跃
local _infJumpConn = nil
GeneralTab:Toggle({
	Title = "无限跳跃",
	Value = false,
	Callback = function(v)
		if v then
			if not _infJumpConn then
				_infJumpConn = game:GetService("RunService").Heartbeat:Connect(function()
					local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
					if hum and hum.Parent then
						local s = hum:GetState()
						if s == Enum.HumanoidStateType.Running or s == Enum.HumanoidStateType.RunningNoPhysics or s == Enum.HumanoidStateType.Freefall then
							hum:ChangeState(Enum.HumanoidStateType.Jumping)
						end
					end
				end)
			end
		else
			if _infJumpConn then _infJumpConn:Disconnect(); _infJumpConn = nil end
		end
	end,
})

-- 反重力气流（低重力浮空）
local _antiGravConn = nil
GeneralTab:Toggle({
	Title = "反重力气流(浮空)",
	Value = false,
	Callback = function(v)
		if v then
			if not _antiGravConn then
				_antiGravConn = game:GetService("RunService").Heartbeat:Connect(function()
					local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if hrp then
						hrp.AssemblyLinearVelocity = Vector3.new(0, 60, 0)
					end
				end)
			end
		else
			if _antiGravConn then _antiGravConn:Disconnect(); _antiGravConn = nil end
		end
	end,
})

-- 上帝模式（锁血 + 复活 + 防摔）
local _godConn = nil
GeneralTab:Toggle({
	Title = "上帝模式",
	Value = false,
	Callback = function(v)
		if v then
			if not _godConn then
				_godConn = game:GetService("RunService").Heartbeat:Connect(function()
					pcall(function()
						local char = LocalPlayer.Character
						local hum = char and char:FindFirstChildWhichIsA("Humanoid")
						if hum and hum.Parent then
							if hum.Health <= 0 then
								hum.Health = hum.MaxHealth or 100
							end
							hum.MaxHealth = math.max(hum.MaxHealth or 100, 100)
							hum.Health = hum.MaxHealth
						end
						local hrp = char and char:FindFirstChild("HumanoidRootPart")
						if hrp then
							local vel = hrp.AssemblyLinearVelocity
							if vel.Y < -100 then
								hrp.AssemblyLinearVelocity = Vector3.new(vel.X, -60, vel.Z)
							end
						end
					end)
				end)
			end
		else
			if _godConn then _godConn:Disconnect(); _godConn = nil end
		end
	end,
})

-- 自我弹射（Self Fling）
GeneralTab:Button({
	Title = "自我弹射(Self Fling)",
	Callback = function()
		pcall(function()
			local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not hrp then return end
			for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
				if p:IsA("BasePart") then p.CanCollide = false end
			end
			local dir = (hrp.CFrame.LookVector + Vector3.new(0, 1.2, 0)).Unit
			hrp.AssemblyLinearVelocity = dir * 300 + Vector3.new(0, 200, 0)
		end)
	end,
})

-- 吸物（把附近物品吸到自己脚下）
local _bringConn = nil
GeneralTab:Toggle({
	Title = "吸物(吸附附近物品)",
	Value = false,
	Callback = function(v)
		if v then
			if not _bringConn then
				_bringConn = game:GetService("RunService").Heartbeat:Connect(function()
					pcall(function()
						local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
						if not hrp then return end
						for _, obj in ipairs(workspace:GetDescendants()) do
							if obj:IsA("BasePart") and obj.Anchored == false and obj.Parent ~= LocalPlayer.Character then
								local isToolPart = obj:FindFirstAncestorWhichIsA("Tool") ~= nil
								local isCharPart = obj:FindFirstAncestorWhichIsA("Model") and obj:FindFirstAncestorWhichIsA("Model"):FindFirstChildWhichIsA("Humanoid") ~= nil
								if not isCharPart and not isToolPart then
									local d = (obj.Position - hrp.Position).Magnitude
									if d < 50 then
										obj.Velocity = (hrp.Position - obj.Position).Unit * 40
									end
								end
							end
						end
					end)
				end)
			end
		else
			if _bringConn then _bringConn:Disconnect(); _bringConn = nil end
		end
	end,
})

-- 传送所有玩家到自己
GeneralTab:Button({
	Title = "传送所有玩家到自己",
	Callback = function()
		pcall(function()
			local myHrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if not myHrp then return end
			for _, p in ipairs(game.Players:GetPlayers()) do
				if p ~= LocalPlayer then
					local hrp = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
					if hrp then hrp.CFrame = myHrp.CFrame end
				end
			end
		end)
	end,
})

-- 自动刷屏聊天
local _chatMsg = ""
local _chatConn = nil
GeneralTab:Input({
	Title = "刷屏内容",
	Placeholder = "输入要发送的话",
	Callback = function(text)
		_chatMsg = text
	end,
})
local function SayChat(msg)
	pcall(function()
		local TCS = game:GetService("TextChatService")
		if TCS.ChatVersion ~= Enum.ChatVersion.TextChatService then
			local RS = game:GetService("ReplicatedStorage")
			local chatSys = RS:FindFirstChild("DefaultChatSystemChatEvents")
			local sayReq = chatSys and chatSys:FindFirstChild("SayMessageRequest")
			if sayReq then sayReq:FireServer(msg, "All") end
		else
			TCS.TextChannels.RBXGeneral:SendAsync(msg)
		end
	end)
end
GeneralTab:Toggle({
	Title = "自动刷屏聊天",
	Value = false,
	Callback = function(v)
		if v then
			if not _chatConn then
				_chatConn = task.spawn(function()
					while _chatConn do
						if _chatMsg ~= "" then SayChat(_chatMsg) end
						task.wait(1)
					end
				end)
			end
		else
			if _chatConn then _chatConn = nil end
		end
	end,
})

-- ESP 玩家方框+血条+名字（Drawing，本地视觉）
local function newQuad()
	local d = Drawing.new("Quad")
	d.Thickness = 1
	d.Transparency = 1
	return d
end
local _espEnabled = false
local _espConn = nil
local _espBoxes = {}
local function _updateEsp()
	pcall(function()
		local cam = workspace.CurrentCamera
		if not cam or not LocalPlayer.Character then return end
		local vp = cam.ViewportSize
		for _, plr in ipairs(game.Players:GetPlayers()) do
			if plr ~= LocalPlayer then
				local char = plr.Character
				if char then
					local hum = char:FindFirstChildWhichIsA("Humanoid")
					local hrp = char:FindFirstChild("HumanoidRootPart")
					local head = char:FindFirstChild("Head")
					if hrp and head then
						-- 数据按玩家缓存
						local key = plr.UserId
						local box = _espBoxes[key]
						if not box then
							box = { quad = newQuad(), line = Drawing.new("Line"), label = Drawing.new("Text") }
							box.line.Thickness = 2
							box.line.Transparency = 1
							box.label.Size = 13
							box.label.Center = true
							box.label.Transparency = 1
							_espBoxes[key] = box
						end
						local headPos, scr = cam:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))
						local footPos = cam:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
						if headPos.Z > 0 and footPos.Z > 0 then
							local h = (footPos.Y - headPos.Y)
							local w = h * 0.45
							local x = headPos.X - w / 2
							local y = headPos.Y
							box.quad.Visible = true
							box.quad.PointA = Vector2.new(x, y)
							box.quad.PointB = Vector2.new(x + w, y)
							box.quad.PointC = Vector2.new(x + w, y + h)
							box.quad.PointD = Vector2.new(x, y + h)
							box.quad.Color = Color3.fromRGB(0, 255, 60)
							-- 血条
							local hp = (hum and hum.MaxHealth > 0) and (hum.Health / hum.MaxHealth) or 1
							box.line.Visible = true
							box.line.From = Vector2.new(x - 6, y + h)
							box.line.To = Vector2.new(x - 6, y + h - h * math.clamp(hp, 0, 1))
							box.line.Color = hp > 0.5 and Color3.fromRGB(0, 255, 0) or (hp > 0.25 and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(255, 40, 40))
							-- 名字
							box.label.Visible = true
							box.label.Text = plr.Name .. " [" .. math.floor((hum and hum.Health or 0) + 0.5) .. "]"
							box.label.Position = Vector2.new(headPos.X, y - 16)
							box.label.Color = Color3.fromRGB(255, 255, 255)
						else
							box.quad.Visible = false
							box.line.Visible = false
							box.label.Visible = false
						end
					end
				end
			end
		end
	end)
end
GeneralTab:Toggle({
	Title = "ESP(方框+血条+名字)",
	Value = false,
	Callback = function(v)
		_espEnabled = v
		if v then
			if not _espConn then
				_espConn = game:GetService("RunService").RenderStepped:Connect(_updateEsp)
			end
		else
			if _espConn then _espConn:Disconnect(); _espConn = nil end
			for _, d in pairs(_espBoxes) do
				d.quad:Remove(); d.line:Remove(); d.label:Remove()
			end
			_espBoxes = {}
		end
	end,
})

-- 高亮玩家（透视）
local _highlightConn = nil
GeneralTab:Toggle({
	Title = "高亮玩家(透视)",
	Value = false,
	Callback = function(v)
		if v then
			if not _highlightConn then
				local function addHighlight(char)
					if not char:FindFirstChild("_ESPHighlight") then
						local h = Instance.new("Highlight")
						h.Name = "_ESPHighlight"
						h.FillColor = Color3.fromRGB(255, 0, 60)
						h.FillTransparency = 0.6
						h.OutlineColor = Color3.fromRGB(255, 0, 60)
						h.OutlineTransparency = 0
						h.Adornee = char
						h.Parent = char
					end
				end
				for _, plr in ipairs(game.Players:GetPlayers()) do
					if plr ~= LocalPlayer and plr.Character then addHighlight(plr.Character) end
				end
				_highlightConn = game.Players.PlayerAdded:Connect(function(plr)
					plr.CharacterAdded:Connect(function(char)
						if _highlightConn then addHighlight(char) end
					end)
				end)
			end
		else
			if _highlightConn then _highlightConn:Disconnect(); _highlightConn = nil end
			for _, plr in ipairs(game.Players:GetPlayers()) do
				if plr.Character then
					local h = plr.Character:FindFirstChild("_ESPHighlight")
					if h then h:Destroy() end
				end
			end
		end
	end,
})

-- 无雾 / 画质调亮（改 Lighting）
local _fogDefault = nil
local _fogConn = nil
GeneralTab:Toggle({
	Title = "无雾&画面调亮",
	Value = false,
	Callback = function(v)
		if v then
			if not _fogConn then
				_fogDefault = {
					FogEnd = workspace.FogEnd,
					Brightness = game.Lighting.Brightness,
				}
				workspace.FogEnd = 100000
				game.Lighting.Brightness = 3
				game.Lighting:ClearAllChildren()
				_fogConn = game:GetService("RunService").RenderStepped:Connect(function()
					workspace.FogEnd = 100000
					game.Lighting.Brightness = 3
				end)
			end
		else
			if _fogConn then _fogConn:Disconnect(); _fogConn = nil end
			if _fogDefault then
				workspace.FogEnd = _fogDefault.FogEnd
				game.Lighting.Brightness = _fogDefault.Brightness
			end
		end
	end,
})

-- 连点器（UIS 模拟鼠标点击）
local _autoclickConn = nil
GeneralTab:Toggle({
	Title = "连点器(左键连发)",
	Value = false,
	Callback = function(v)
		if v then
			if not _autoclickConn then
				_autoclickConn = task.spawn(function()
					while _autoclickConn do
						pcall(function()
							local uis = game:GetService("UserInputService")
							uis:ClickButton2Down(Vector2.new(0, 0), false)
							task.wait(0.05)
							uis:ClickButton2Up(Vector2.new(0, 0), false)
						end)
						task.wait(0.05)
					end
				end)
			end
		else
			if _autoclickConn then _autoclickConn = nil end
		end
	end,
})

-- 光影 / RTX 美化（往 Lighting 注入后期 Effect，可逆）
local function _rtxMake(cls)
	local e = Instance.new(cls)
	e.Name = "_RTX_" .. cls
	return e
end
local _rtxBackup = nil
GeneralTab:Toggle({
	Title = "光影(RTX美化)",
	Value = false,
	Callback = function(v)
		local L = game.Lighting
		if v then
			if not L:FindFirstChild("_RTX_BloomEffect") then
				_rtxBackup = {
					Ambient = L.Ambient,
					OutdoorAmbient = L.OutdoorAmbient,
					GlobalShadows = L.GlobalShadows,
					ShadowSoftness = L.ShadowSoftness,
				}
				local bloom = _rtxMake("BloomEffect")
				bloom.Intensity = 1.2
				bloom.Size = 32
				bloom.Threshold = 0.6
				bloom.Parent = L
				local cc = _rtxMake("ColorCorrectionEffect")
				cc.Brightness = 0.05
				cc.Contrast = 0.25
				cc.Saturation = 0.25
				cc.TintColor = Color3.fromRGB(255, 240, 220)
				cc.Parent = L
				local sr = _rtxMake("SunRaysEffect")
				sr.Intensity = 0.3
				sr.Spread = 0.4
				sr.Parent = L
				L.Ambient = Color3.fromRGB(40, 40, 50)
				L.OutdoorAmbient = Color3.fromRGB(60, 60, 70)
				L.GlobalShadows = true
				L.ShadowSoftness = 0.5
			end
		else
			for _, n in ipairs({ "_RTX_BloomEffect", "_RTX_ColorCorrectionEffect", "_RTX_SunRaysEffect" }) do
				local e = L:FindFirstChild(n)
				if e then e:Destroy() end
			end
			if _rtxBackup then
				L.Ambient = _rtxBackup.Ambient
				L.OutdoorAmbient = _rtxBackup.OutdoorAmbient
				L.GlobalShadows = _rtxBackup.GlobalShadows
				L.ShadowSoftness = _rtxBackup.ShadowSoftness
				_rtxBackup = nil
			end
		end
	end,
})

--==================== ro飞行 / ro飞车（手搓·触屏飞行面板，作者: CUA） ====================
-- 纯 ScreenGui 实现：移动端可触屏，浮动按钮控制上下/水平冲刺，不依赖 WindUI 弹窗
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local lp = Players.LocalPlayer

	local flyGui = nil       -- 触屏飞行面板
	local flying = false
	local ascendDir = 0      -- -1 下 / 0 停 / 1 上
	local conn = nil
	local MOVE_SPEED = 60    -- 水平速度
	local ASCEND_SPEED = 45  -- 升降速度

	-- 关闭飞行并销毁面板
	local function stopFly()
		flying = false
		ascendDir = 0
		if conn then conn:Disconnect() conn = nil end
	end

	local function createFlyPanel()
		-- 若已存在则直接启用
		if flyGui and flyGui.Parent ~= nil then
			flyGui.Enabled = true
			return
		end

		flyGui = Instance.new("ScreenGui")
		flyGui.Name = "PiFeiXing_Panel"
		flyGui.ResetOnSpawn = false
		flyGui.Parent = lp:WaitForChild("PlayerGui")

		local panel = Instance.new("Frame")
		panel.Size = UDim2.new(0, 180, 0, 230)
		panel.Position = UDim2.new(0.9, -190, 0.5, -115)
		panel.BackgroundColor3 = Color3.fromRGB(22,22,30)
		panel.BackgroundTransparency = 0.15
		panel.BorderSizePixel = 0
		panel.Parent = flyGui
		local uic = Instance.new("UICorner"); uic.CornerRadius = UDim.new(0,12); uic.Parent = panel

		-- 按钮工厂
		local function mkBtn(text, pos, size, color)
			local b = Instance.new("TextButton")
			b.Text = text; b.TextSize = 20; b.Font = Enum.Font.GothamBold
			b.Position = pos; b.Size = size
			b.BackgroundColor3 = color; b.BorderSizePixel = 0
			b.TextColor3 = Color3.new(1,1,1)
			local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0.3,0); c.Parent = b
			b.Parent = panel
			return b
		end

		-- 上升/下降按钮
		local upBtn = mk("▲", UDim2.new(0.5,-22,0,4), UDim2.new(0,44,0,40), Color3.fromRGB(50,160,90))
		local downBtn = mk("▼", UDim2.new(0.5,-22,0,48), UDim2.new(0,44,0,40), Color3.fromRGB(190,70,70))
		upBtn.MouseButton1Down:Connect(function() ascendDir = 1 end)
		upBtn.MouseButton1Up:Connect(function() ascendDir = 0 end)
		downBtn.MouseButton1Down:Connect(function() ascendDir = -1 end)
		downBtn.MouseButton1Up:Connect(function() ascendDir = 0 end)

		-- 悬浮总开关
		local flyToggle = mk("悬浮ON", UDim2.new(0.5,-65,0,92), UDim2.new(0,130,0,34), Color3.fromRGB(70,120,220))
		local toggleOn = false
		flyToggle.MouseButton1Click:Connect(function()
			toggleOn = not toggleOn
			flyToggle.Text = toggleOn and "悬浮ON" or "悬浮OFF"
			flyToggle.BackgroundColor3 = toggleOn and Color3.fromRGB(50,170,90) or Color3.fromRGB(70,120,220)
		end)

		-- 说明
		local info = Instance.new("TextLabel")
		info.Text = "▲▼升降 | WASD移动"
		info.TextSize = 12; info.TextColor3 = Color3.new(0.85,0.85,0.85)
		info.BackgroundTransparency = 1
		info.Position = UDim2.new(0,10,0,200); info.Size = UDim2.new(0,160,0,20)
		info.Parent = panel

		-- 关闭
		local close = Instance.new("TextButton")
		close.Text = "✕"; close.TextSize = 14
		close.Size = UDim2.new(0,24,0,24); close.Position = UDim2.new(1,-28,0,4)
		close.BackgroundColor3 = Color3.fromRGB(200,60,60); close.TextColor3 = Color3.new(1,1,1); close.BorderSizePixel = 0
		close.Parent = panel
		close.MouseButton1Click:Connect(function()
			stopFly()
			if flyGui then flyGui:Destroy() flyGui = nil end
		end)

		-- 飞行循环
		if not conn then
			conn = RunService.RenderStepped:Connect(function(dt)
				if not toggleOn then return end
				local char = lp and lp.Character
				local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart"))
				if not hrp then return end
				local cam = workspace.CurrentCamera
				local mv = Vector3.zero
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then mv = mv + cam.CFrame.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then mv = mv - cam.CFrame.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then mv = mv + cam.CFrame.RightVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then mv = mv - cam.CFrame.RightVector end
				if mv.Magnitude > 0 then mv = mv.Unit * MOVE_SPEED * dt end
				hrp.CFrame = hrp.CFrame + mv + Vector3.new(0, ascendDir * ASCEND_SPEED * dt, 0)
			end)
		end
	end

	-- 入口按钮
	GeneralTab:Button({
		Title = "ro飞行（触屏）",
		Callback = function()
			createFlyPanel()
		end,
	})
end

--==================== ro飞车（手搓·触屏驾驶面板，作者: CUA） ====================
-- 触屏油门/刹车/转向；若坐在载具内则驱动载具 Seat，否则以飞行车姿态控制角色
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UIS = game:GetService("UserInputService")
	local lplr2 = Players.LocalPlayer

	local gui2
	local gas = 0        -- 0~1 油门
	local turning = 0    -- -1左 /0 /1右
	local driving = false
	local conn2

	local function stopCar()
		driving = false
		gas = 0; turning = 0
		if conn2 then conn2:Disconnect() conn2 = nil end
	end

	local function createCarPanel()
		if gui2 and gui2.Parent ~= nil then gui2.Enabled = true return end

		gui2 = Instance.new("ScreenGui")
		gui2.Name = "PiFeiChe_Panel"
		gui2.ResetOnSpawn = false
		gui2.Parent = lplr2:WaitForChild("PlayerGui")

		local panel = Instance.new("Frame")
		panel.Size = UDim2.new(0, 200, 0, 260)
		panel.Position = UDim2.new(0.5, -100, 0.8, -130)
		panel.BackgroundColor3 = Color3.fromRGB(24,24,34)
		panel.BackgroundTransparency = 0.12
		panel.BorderSizePixel = 0
		panel.Parent = gui2
		local uic = Instance.new("UICorner"); uic.CornerRadius = UDim.new(0,12); uic.Parent = panel

		local function mkBtn(text, pos, size, color)
			local b = Instance.new("TextButton")
			b.Text = text; b.TextSize = 18; b.Font = Enum.Font.GothamBold
			b.Position = pos; b.Size = size
			b.BackgroundColor3 = color; b.BorderSizePixel = 0
			b.TextColor3 = Color3.new(1,1,1)
			local c = Instance.new("UICorner"); c.CornerRadius = UDim.new(0.3,0); c.Parent = b
			b.Parent = panel
			return b
		end

		-- 油门（按住加速）
		local gasBtn = mkBtn("油门 ▸", UDim2.new(0.5,18,0,90), UDim2.new(0,70,0,60), Color3.fromRGB(60,150,220))
		gasBtn.MouseButton1Down:Connect(function() gas = 1 end)
		gasBtn.MouseButton1Up:Connect(function() gas = 0 end)
		-- 刹车
		local brakeBtn = mkBtn("刹车 ⏹", UDim2.new(0.5,-88,0,90), UDim2.new(0,70,0,60), Color3.fromRGB(200,70,70))
		brakeBtn.MouseButton1Down:Connect(function() gas = -1 end)
		brakeBtn.MouseButton1Up:Connect(function() gas = 0 end)
		-- 左/右转向
		local leftBtn = mkBtn("◀ 左", UDim2.new(0.5,-55,0,156), UDim2.new(0,50,0,40), Color3.fromRGB(120,120,140))
		leftBtn.MouseButton1Down:Connect(function() turning = -1 end)
		leftBtn.MouseButton1Up:Connect(function() turning = 0 end)
		local rightBtn = mkBtn("右 ▶", UDim2.new(0.5,5,0,156), UDim2.new(0,50,0,40), Color3.fromRGB(120,120,140))
		rightBtn.MouseButton1Down:Connect(function() turning = 1 end)
		rightBtn.MouseButton1Up:Connect(function() turning = 0 end)

		-- 驾驶开关
		local toggle = mkBtn("驾驶ON", UDim2.new(0.5,-65,0,8), UDim2.new(0,130,0,34), Color3.fromRGB(70,120,220))
		toggle.MouseButton1Click:Connect(function()
			driving = not driving
			toggle.Text = driving and "驾驶ON" or "驾驶OFF"
			toggle.BackgroundColor3 = driving and Color3.fromRGB(50,170,90) or Color3.fromRGB(70,120,220)
		end)

		-- 说明
		local info = Instance.new("TextLabel")
		info.Text = "油门/刹车 | 左右转向"
		info.TextSize = 12; info.TextColor3 = Color3.new(0.85,0.85,0.85)
		info.BackgroundTransparency = 1
		info.Position = UDim2.new(0,10,0,230); info.Size = UDim2.new(0,180,0,20)
		info.Parent = panel

		-- 关闭
		local close = Instance.new("TextButton")
		close.Text = "✕"; close.TextSize = 14
		close.Size = UDim2.new(0,24,0,24); close.Position = UDim2.new(1,-28,0,4)
		close.BackgroundColor3 = Color3.fromRGB(200,60,60); close.TextColor3 = Color3.new(1,1,1); close.BorderSizePixel = 0
		close.Parent = panel
		close.MouseButton1Click:Connect(function()
			stopCar()
			if gui2 then gui2:Destroy() gui2 = nil end
		end)

		-- 驾驶循环
		if not conn2 then
			conn2 = RunService.RenderStepped:Connect(function(dt)
				if not driving then return end
				local char = lplr2.Character
				if not char then return end
				local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
				if not hrp then return end
				-- 转向（按 Y 轴旋转）
				if turning ~= 0 then
					hrp.CFrame = hrp.CFrame * CFrame.Angles(0, turning * 1.6 * dt, 0)
				end
				-- 前进/后退
				if gas ~= 0 then
					local look = hrp.CFrame.LookVector
					hrp.CFrame = hrp.CFrame + look * gas * 60 * dt
				end
			end)
		end
	end

	GeneralTab:Button({
		Title = "ro飞车（触屏）",
		Callback = function()
			createCarPanel()
		end,
	})
end

--==================== ro自瞄（内嵌, 作者: CUA） ====================
do
	local Camera = workspace.CurrentCamera
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local LocalPlayer = Players.LocalPlayer
	local Holding = false

	-- 可调整设置：
	local AimEnabled = true          -- 自瞄总开关
	local TeamCheck = false          -- 只瞄敌方
	local AimPart = "Head"           -- 锁定部位
	local Sensitivity = 0.15         -- 锁头平滑秒数
	local CircleRadius = 120         -- FOV 圈半径

	local FOVCircle = Drawing.new("Circle")
	FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
	FOVCircle.Radius = CircleRadius
	FOVCircle.Color = Color3.fromRGB(255,255,255)
	FOVCircle.Transparency = 0.7
	FOVCircle.Visible = true

	local function GetClosestPlayer()
		local Max = CircleRadius
		local Target = nil
		for _, v in next, Players:GetPlayers() do
			if v ~= LocalPlayer then
				if (not TeamCheck) or (v.Team ~= LocalPlayer.Team) then
					local char = v.Character
					local hrp = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart"))
					local hum = char and char:FindFirstChildWhichIsA("Humanoid")
					if hrp and hum and hum.Health > 0 then
						local sp = Camera:WorldToScreenPoint(hrp.Position)
						local d = (UserInputService:GetMouseLocation() - Vector2.new(sp.X, sp.Y)).Magnitude
						if d < Max then Max = d; Target = v end
					end
				end
			end
		end
		return Target
	end

	UserInputService.InputBegan:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then Holding = true end
	end)
	UserInputService.InputEnded:Connect(function(Input)
		if Input.UserInputType == Enum.UserInputType.MouseButton2 then Holding = false end
	end)

	RunService.RenderStepped:Connect(function()
		FOVCircle.Position = UserInputService:GetMouseLocation()
		FOVCircle.Radius = CircleRadius
		if Holding and AimEnabled then
			local T = GetClosestPlayer()
			if T and T.Character and T.Character[AimPart] then
				local part = T.Character[AimPart]
				TweenService:Create(Camera, TweenInfo.new(0.01, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, part.Position)}):Play()
			end
		end
	end)

	-- 通用区开关
	local aimToggleOn = false
	GeneralTab:Toggle({
		Title = "ro自瞄（右键锁定）",
		Value = false,
		Callback = function(on)
			aimToggleOn = on
			AimEnabled = on
			FOVCircle.Visible = on
		end,
	})
end

--==================== 甩飞（手搓·内置, 作者: CUA） ====================
-- 选中目标后把其角色 ragdoll（断开关节并抛飞），本地端模拟，依赖角色可客户端移动
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local lpX = Players.LocalPlayer
	local throwing = false
	local throwConn
	local targetBlacklist = {}

	local function stopThrow()
		throwing = false
		if throwConn then throwConn:Disconnect() throwConn = nil end
		-- 恢复选中目标关节（简单做法：让它重生会恢复）
	end

	local function doThrow(tp)
		if not tp or not tp.Character then return end
		local char = tp.Character
		-- 漂浮物：抛向远方前，先把它所有 BasePart 设为不可碰撞避免卡墙内
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
		-- 把它往相机前方+上方丢出去
		local hrp = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChildWhichIsA("BasePart")
		if hrp then
			local dir = (hrp.CFrame.LookVector + Vector3.new(0, 0.6, 0)).Unit
			for i = 1, 40 do
				hrp.CFrame = hrp.CFrame + dir * 1.2
				RunService.Stepped:Wait()
			end
		end
	end

	local guiT -- 甩飞选择面板

	function createThrowPanel()
		if guiT and guiT.Parent ~= nil then guiT.Enabled = true return end
		guiT = Instance.new("ScreenGui")
		guiT.Name = "PiShuaiFei_Panel"
		guiT.ResetOnSpawn = false
		guiT.Parent = lpX:WaitForChild("PlayerGui")

		local panel = Instance.new("Frame")
		panel.Size = UDim2.new(0, 240, 0, 160)
		panel.Position = UDim2.new(0.5, -120, 0.2, -80)
		panel.BackgroundColor3 = Color3.fromRGB(22,22,30)
		panel.BackgroundTransparency = 0.15
		panel.BorderSizePixel = 0
		panel.Parent = guiT
		local uic = Instance.new("UICorner"); uic.CornerRadius = UDim.new(0,12); uic.Parent = panel

		local input = Instance.new("TextBox")
		input.PlaceholderText = "输入要甩飞的玩家名"
		input.Size = UDim2.new(0, 200, 0, 36)
		input.Position = UDim2.new(0, 20, 0, 24)
		input.BackgroundColor3 = Color3.fromRGB(40,40,50)
		input.TextColor3 = Color3.new(1,1,1)
		input.Font = Enum.Font.Gotham; input.TextSize = 16
		input.Parent = panel

		local btn = Instance.new("TextButton")
		btn.Text = "甩飞!"
		btn.Size = UDim2.new(0, 200, 0, 40)
		btn.Position = UDim2.new(0, 20, 0, 70)
		btn.BackgroundColor3 = Color3.fromRGB(60,150,220)
		btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 18
		btn.Parent = panel
		btn.MouseButton1Click:Connect(function()
			local tp = Players:FindFirstChild(input.Text)
			if not tp then
				-- 模糊匹配
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Name:lower():find(input.Text:lower()) then tp = p break end
				end
			end
			if tp then spawn(function() doThrow(tp) end) end
		end)
	end

	GeneralTab:Button({
		Title = "ro甩飞（输入玩家名）",
		Callback = function()
			createThrowPanel()
		end,
	})
end

--==================== ro踢人（手搓·内置, 作者: CUA） ====================
-- 选中目标后循环将其抛向高空使之坠落死亡/强制出局；本地端模拟，依赖游戏重力
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local plrT = Players.LocalPlayer
	local guiT
	local kickConn
	local kickOn = false
	local kickTarget

	local function stopKick()
		kickOn = false
		kickTarget = nil
		if kickConn then kickConn:Disconnect() kickConn = nil end
	end

	local function createKickPanel()
		if guiT and guiT.Parent ~= nil then guiT.Enabled = true return end

		guiT = Instance.new("ScreenGui")
		guiT.Name = "roTiRen_Panel"
		guiT.ResetOnSpawn = false
		guiT.Parent = plrT:WaitForChild("PlayerGui")

		local panel = Instance.new("Frame")
		panel.Size = UDim2.new(0, 240, 0, 180)
		panel.Position = UDim2.new(0.5, -120, 0.25, -90)
		panel.BackgroundColor3 = Color3.fromRGB(22,22,30)
		panel.BackgroundTransparency = 0.15
		panel.BorderSizePixel = 0
		panel.Parent = guiT
		local uic = Instance.new("UICorner"); uic.CornerRadius = UDim.new(0,12); uic.Parent = panel

		local input = Instance.new("TextBox")
		input.PlaceholderText = "输入要踢出的玩家名"
		input.Size = UDim2.new(0, 200, 0, 36)
		input.Position = UDim2.new(0, 20, 0, 20)
		input.BackgroundColor3 = Color3.fromRGB(40,40,50)
		input.TextColor3 = Color3.new(1,1,1)
		input.Font = Enum.Font.Gotham; input.TextSize = 16
		input.Parent = panel

		local btn = Instance.new("TextButton")
		btn.Text = "踢出!"
		btn.Size = UDim2.new(0, 200, 0, 40)
		btn.Position = UDim2.new(0, 20, 0, 66)
		btn.BackgroundColor3 = Color3.fromRGB(200,70,70)
		btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 18
		btn.Parent = panel
		btn.MouseButton1Click:Connect(function()
			local tp = Players:FindFirstChild(input.Text)
			if not tp then
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Name:lower():find(input.Text:lower()) then tp = p break end
				end
			end
			if tp then kickTarget = tp; kickOn = true end
		end)

		local stopBtn = Instance.new("TextButton")
		stopBtn.Text = "停止"
		stopBtn.Size = UDim2.new(0, 200, 0, 32)
		stopBtn.Position = UDim2.new(0, 20, 0, 114)
		stopBtn.BackgroundColor3 = Color3.fromRGB(90,90,110)
		stopBtn.TextColor3 = Color3.new(1,1,1); stopBtn.Font = Enum.Font.Gotham; stopBtn.TextSize = 15
		stopBtn.Parent = panel
		stopBtn.MouseButton1Click:Connect(stopKick)

		if not kickConn then
			kickConn = RunService.RenderStepped:Connect(function()
				if not kickOn or not kickTarget then return end
				if not kickTarget.Character then kickTarget = nil; return end
				local hrp = kickTarget.Character:FindFirstChild("HumanoidRootPart") or kickTarget.Character:FindFirstChildWhichIsA("BasePart")
				if not hrp then return end
				-- 持续上抛 + 不可碰撞，逼其坠落/窒息
				for _, part in ipairs(kickTarget.Character:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
				hrp.CFrame = hrp.CFrame + Vector3.new(0, 50, 0) * (1/60)
			end)
		end
	end

	GeneralTab:Button({
		Title = "ro踢人（输入玩家名）",
		Callback = function()
			createKickPanel()
		end,
	})
end

--==================== ro死亡笔记（手搓·内置, 作者: CUA） ====================
-- 输入玩家名，持续把目标抛向高空使其坠落扣血直至死亡；本地端模拟
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local plrD = Players.LocalPlayer
	local guiD
	local noteConn
	local noteOn = false
	local noteTarget

	local function stopNote()
		noteOn = false
		noteTarget = nil
		if noteConn then noteConn:Disconnect() noteConn = nil end
	end

	local function createNotePanel()
		if guiD and guiD.Parent ~= nil then guiD.Enabled = true return end

		guiD = Instance.new("ScreenGui")
		guiD.Name = "roSiWangBiJi_Panel"
		guiD.ResetOnSpawn = false
		guiD.Parent = plrD:WaitForChild("PlayerGui")

		local panel = Instance.new("Frame")
		panel.Size = UDim2.new(0, 240, 0, 180)
		panel.Position = UDim2.new(0.5, -120, 0.35, -90)
		panel.BackgroundColor3 = Color3.fromRGB(22,22,30)
		panel.BackgroundTransparency = 0.15
		panel.BorderSizePixel = 0
		panel.Parent = guiD
		local uic = Instance.new("UICorner"); uic.CornerRadius = UDim.new(0,12); uic.Parent = panel

		local input = Instance.new("TextBox")
		input.PlaceholderText = "输入要写入笔记的玩家名"
		input.Size = UDim2.new(0, 200, 0, 36)
		input.Position = UDim2.new(0, 20, 0, 20)
		input.BackgroundColor3 = Color3.fromRGB(40,40,50)
		input.TextColor3 = Color3.new(1,1,1)
		input.Font = Enum.Font.Gotham; input.TextSize = 16
		input.Parent = panel

		local btn = Instance.new("TextButton")
		btn.Text = "写上名字!"
		btn.Size = UDim2.new(0, 200, 0, 40)
		btn.Position = UDim2.new(0, 20, 0, 66)
		btn.BackgroundColor3 = Color3.fromRGB(60,150,220)
		btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 18
		btn.Parent = panel
		btn.MouseButton1Click:Connect(function()
			local tp = Players:FindFirstChild(input.Text)
			if not tp then
				for _, p in ipairs(Players:GetPlayers()) do
					if p.Name:lower():find(input.Text:lower()) then tp = p break end
				end
			end
			if tp then noteTarget = tp; noteOn = true end
		end)

		local stopBtn = Instance.new("TextButton")
		stopBtn.Text = "抹掉名字"
		stopBtn.Size = UDim2.new(0, 200, 0, 32)
		stopBtn.Position = UDim2.new(0, 20, 0, 114)
		stopBtn.BackgroundColor3 = Color3.fromRGB(90,90,110)
		stopBtn.TextColor3 = Color3.new(1,1,1); stopBtn.Font = Enum.Font.Gotham; stopBtn.TextSize = 15
		stopBtn.Parent = panel
		stopBtn.MouseButton1Click:Connect(stopNote)

		if not noteConn then
			noteConn = RunService.RenderStepped:Connect(function()
				if not noteOn or not noteTarget then return end
				if not noteTarget.Character then noteTarget = nil; return end
				local hum = noteTarget.Character:FindFirstChildWhichIsA("Humanoid")
				local hrp = noteTarget.Character:FindFirstChild("HumanoidRootPart") or noteTarget.Character:FindFirstChildWhichIsA("BasePart")
				if not hrp then return end
				for _, part in ipairs(noteTarget.Character:GetDescendants()) do
					if part:IsA("BasePart") then part.CanCollide = false end
				end
				-- 先抛高再让其坠落，借助坠落伤害扣血
				hrp.CFrame = hrp.CFrame + Vector3.new(0, 40, 0) * (1/60)
				if hum then hum.Health = math.max(hum.Health - 0.01, 0) end
			end)
		end
	end

	GeneralTab:Button({
		Title = "ro死亡笔记（输入玩家名）",
		Callback = function()
			createNotePanel()
		end,
	})
end

--==================== 『自然灾害』独立 Tab ====================
-- 功能来源: GitHub TestForCry/robloxhacks (natural disaster survival)
-- 核心: SurvivalTag 实时预测灾难 + 自动存活(传安全塔) + 移除危险物 + 防跌落
-- 全部本地实现，不依赖外网 loadstring
do
	local DisTab = Window:Tab({ Title = "自然灾害", Icon = "geist:zap" })

	--=== 灾难英文 -> 中文 ===
	local function DisCN(en)
		local map = {
			["Blizzard"] = "暴风雪",
			["Sandstorm"] = "沙尘暴",
			["Tornado"] = "龙卷风",
			["Volcanic Eruption"] = "火山",
			["Flash Flood"] = "洪水",
			["Deadly Virus"] = "病毒",
			["Tsunami"] = "海啸",
			["Acid Rain"] = "酸雨",
			["Fire"] = "火焰",
			["Meteor Shower"] = "流星雨",
			["Earthquake"] = "地震",
			["Thunder Storm"] = "暴风雨",
		}
		return map[en] or (en ~= "" and en or "未知")
	end

	--=== 获取本地玩家当前灾难(SurvivalTag) ===
	local function GetCurDisaster()
		local lp = game.Players.LocalPlayer
		if not lp then return "" end
		local name = lp.Name
		local mdl = workspace:FindFirstChild(name)
		local tag = mdl and mdl:FindFirstChild("SurvivalTag")
		if tag then return tostring(tag.Value) end
		local charTag = lp.Character and lp.Character:FindFirstChild("SurvivalTag")
		if charTag then return tostring(charTag.Value) end
		return ""
	end

	--=== 段落显示当前灾难 ===
	local DisPara = DisTab:Paragraph({
		Title = "当前灾难预测",
		Desc = "未开启",
		Icon = "geist:cloud",
	})
	DisTab:Toggle({
		Title = "开启灾难预测显示",
		Value = false,
		Callback = function(v)
			_G.NDS_Predict = v
			if not v then return end
			task.spawn(function()
				while _G.NDS_Predict do
					pcall(function()
						local en = GetCurDisaster()
						DisPara:SetDesc(en == "" and "等待SurvivalTag..." or (DisCN(en) .. " (" .. en .. ")"))
					end)
					wait(0.5)
				end
			end)
		end,
	})
	-- 灾难预测通知（首帧+变化时）
	local _lastDis = ""
	DisTab:Toggle({
		Title = "灾难预测通知",
		Value = false,
		Callback = function(v)
			_G.NDS_Notify = v
			if not v then _lastDis = "" return end
			task.spawn(function()
				while _G.NDS_Notify do
					pcall(function()
						local en = GetCurDisaster()
						if en ~= "" and en ~= _lastDis then
							_lastDis = en
							game:GetService("StarterGui"):SetCore("SendNotification", {
								Title = "自然灾害",
								Text = "本局灾难: " .. DisCN(en),
								Duration = 3,
							})
						end
					end)
					wait(0.5)
				end
			end)
		end,
	})
	-- 灾难预测聊天通知
	local _lastChat = ""
	local function Say(msg)
		local TCS = game:GetService("TextChatService")
		local RS = game:GetService("ReplicatedStorage")
		if TCS.ChatVersion ~= Enum.ChatVersion.TextChatService then
			local chatSys = RS:FindFirstChild("DefaultChatSystemChatEvents")
		local sayReq = chatSys and chatSys:FindFirstChild("SayMessageRequest")
		if sayReq then
			sayReq:FireServer(msg, "All")
		end
		else
			pcall(function() TCS.TextChannels.RBXGeneral:SendAsync(msg) end)
		end
	end
	DisTab:Toggle({
		Title = "灾难预测聊天通知",
		Value = false,
		Callback = function(v)
			_G.NDS_Chat = v
			if not v then _lastChat = "" return end
			task.spawn(function()
				while _G.NDS_Chat do
					pcall(function()
						local en = GetCurDisaster()
						if en ~= "" and en ~= _lastChat then
							_lastChat = en
							Say("本局灾难: " .. DisCN(en))
						end
					end)
					wait(0.5)
				end
			end)
		end,
	})

	DisTab:Section({ Title = "自动存活" })
	-- 自动存活：读取灾难，若不安全则传送安全塔；配合防跌落
	local _autoSurvive = false
	DisTab:Toggle({
		Title = "自动存活(传送安全塔)",
		Value = false,
		Callback = function(v)
			_autoSurvive = v
			if not v then return end
			task.spawn(function()
				while _autoSurvive do
					pcall(function()
						local lp = game.Players.LocalPlayer
						local hrp = lp and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
						if hrp then
							local en = GetCurDisaster()
							-- 针对位移性灾难，站到出塔高空安全位
							hrp.CFrame = CFrame.new(-236, 180, 360)
						end
					end)
					wait(0.3)
				end
			end)
		end,
	})

	DisTab:Section({ Title = "防御" })
	-- 移除危险物(洪水/岩浆/酸雨/落石)
	DisTab:Button({
		Title = "移除危险物(水/岩浆/酸)",
		Icon = "geist:trash",
		Callback = function()
			pcall(function()
				for _, v in ipairs(workspace:GetDescendants()) do
					if v:IsA("BasePart") then
						local n = v.Name:lower()
						if n == "water" or n == "lava" or n == "acid" or n == "meteor" or n == "rock" then
							pcall(function() v:Destroy() end)
						end
					end
				end
			end)
		end,
	})
	-- 防跌落伤害：销毁游戏脚本 + 落地速度钳制
	local _ndsFallConn = nil
	local _ndsFallChar = nil
	DisTab:Toggle({
		Title = "防跌落伤害",
		Value = false,
		Callback = function(v)
			if v then
				local lp = game.Players.LocalPlayer
				local char = lp.Character
				if char then
					pcall(function()
						local fd = char:FindFirstChild("FallDamageScript")
						if fd then fd:Destroy() end
					end)
				end
				if not _ndsFallConn then
					_ndsFallConn = game:GetService("RunService").Heartbeat:Connect(function()
						pcall(function()
							local lp = game.Players.LocalPlayer
							local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
							if hrp and hrp.Parent then
								local vel = hrp.AssemblyLinearVelocity
								if vel and vel.Y < -60 then
									hrp.AssemblyLinearVelocity = Vector3.new(vel.X, -60, vel.Z)
								end
							end
						end)
					end)
				end
			else
				if _ndsFallConn then _ndsFallConn:Disconnect(); _ndsFallConn = nil end
			end
		end,
	})
	-- 禁用暴风雪/沙尘暴特效
	local _ndsWConn = nil
	DisTab:Toggle({
		Title = "禁用暴风雪/沙尘暴特效",
		Value = false,
		Callback = function(v)
			_G.NDS_NoWeather = v
			if v then
				if not _ndsWConn then
					_ndsWConn = game:GetService("RunService").Heartbeat:Connect(function()
						if not _G.NDS_NoWeather then return end
						pcall(function()
							local pg = game.Players.LocalPlayer.PlayerGui
							for _, n in ipairs({ "BlizzardGui", "SandStormGui", "Snow", "Fog" }) do
								local g = pg:FindFirstChild(n)
								if g then g:Destroy() end
							end
						end)
					end)
				end
			elseif _ndsWConn then
				_ndsWConn:Disconnect(); _ndsWConn = nil
			end
		end,
	})
	-- 在地图投票UI
	DisTab:Toggle({
		Title = "地图投票用户界面",
		Value = false,
		Callback = function(v)
			pcall(function()
				local lp = game.Players.LocalPlayer
				local gui = lp and lp.PlayerGui and lp.PlayerGui:FindFirstChild("MainGui")
				local vote = gui and gui:FindFirstChild("MapVotePage")
				if vote then vote.Visible = v end
			end)
		end,
	})
	-- 水上行走
	DisTab:Toggle({
		Title = "在水上行走",
		Value = false,
		Callback = function(v)
			pcall(function()
				local wl = workspace:FindFirstChild("WaterLevel")
				if wl and wl:IsA("BasePart") then
					wl.CanCollide = v
					wl.Size = v and Vector3.new(5000, 1, 5000) or Vector3.new(10, 1, 10)
				end
			end)
		end,
	})
	-- 悬崖石头碰撞
	DisTab:Button({
		Title = "开启游戏岛悬崖碰撞体积",
		Icon = "geist:block",
		Callback = function()
			pcall(function()
				for _, v in ipairs(workspace:GetDescendants()) do
					if v.Name == "LowerRocks" and v:IsA("BasePart") then
						v.CanCollide = true
					end
				end
			end)
		end,
	})

	DisTab:Section({ Title = "传送" })
	local function TP(cf)
		pcall(function()
			local lp = game.Players.LocalPlayer
			local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CFrame = cf end
		end)
	end
	DisTab:Button({
		Title = "传送到出生塔",
		Icon = "geist:tower",
		Callback = function() TP(CFrame.new(-279.6720275878906, 180.40802001953125, 340.8188171386719)) end,
	})
	DisTab:Button({
		Title = "传送到游戏岛",
		Icon = "geist:island",
		Callback = function() TP(CFrame.new(-83.5, 38.5, -27.5)) end,
	})
	DisTab:Button({
		Title = "传送到出塔安全位",
		Icon = "geist:shield",
		Callback = function() TP(CFrame.new(-236, 180, 360)) end,
	})
	DisTab:Button({
		Title = "传送到地图中心",
		Icon = "geist:map",
		Callback = function() TP(CFrame.new(-115.828506, 65.4863434, 18.8461514)) end,
	})
end

--==================== 『伐木大亨』Tab（Lumber Tycoon 2） ====================
-- 整合自 ShiRo Hub v2，纯本地实现，无外部 loadstring 依赖
do
	local LT2Tab = Window:Tab({ Title = "伐木大亨", Icon = "geist:axe" })

	local lp = game.Players.LocalPlayer

	-- 通用传送：跳到空中避免卡地形
	local function TP(cf)
		pcall(function()
			local char = lp.Character
			if not char then return end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then hum.Jump = true end
			task.wait(0.1)
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CFrame = cf end
		end)
	end

	-- 卖货：把资源拖到商店坐标瞬间出售
	local SHOP_CF = CFrame.new(315, -0.296, 85.791) * CFrame.Angles(math.rad(90), 0, 0)
	local function DragSell(model)
		pcall(function()
			local section = model:FindFirstChild("WoodSection") or model:FindFirstChild("MainCFrame") or model
			for _ = 1, 20 do
				task.wait()
				game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(section)
			end
		end)
	end

	--========== 卖货 ==========
	LT2Tab:Section({ Title = "卖货" })

	LT2Tab:Button({
		Title = "卖全部木头",
		Icon = "geist:dollar-sign",
		Callback = function()
			for _, Log in pairs(workspace.LogModels:GetChildren()) do
				if Log.Name:sub(1, 6) == "Loose_" and Log:FindFirstChild("Owner") and Log.Owner.Value == lp then
					for _, v in pairs(Log:GetChildren()) do
						if v.Name == "WoodSection" then
							task.spawn(function()
								for _ = 1, 10 do
									task.wait()
									v.CFrame = SHOP_CF
								end
							end)
						end
					end
					task.spawn(function() DragSell(Log) end)
				end
			end
		end,
	})

	LT2Tab:Button({
		Title = "卖全部木板",
		Icon = "geist:dollar-sign",
		Callback = function()
			for _, Plank in pairs(workspace.PlayerModels:GetChildren()) do
				if Plank.Name == "Plank" and Plank:FindFirstChild("Owner") and Plank.Owner.Value == lp then
					for _, v in pairs(Plank:GetChildren()) do
						if v.Name == "WoodSection" then
							task.spawn(function()
								for _ = 1, 10 do
									task.wait()
									v.CFrame = SHOP_CF
								end
							end)
						end
					end
					task.spawn(function() DragSell(Plank) end)
				end
			end
		end,
	})

	--========== 资源操作 ==========
	LT2Tab:Section({ Title = "资源操作" })

	LT2Tab:Button({
		Title = "传送木头到身边",
		Icon = "geist:arrow-up",
		Callback = function()
			pcall(function()
				local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
				if not hrp then return end
				for _, Log in pairs(workspace.LogModels:GetChildren()) do
					if Log.Name:sub(1, 6) == "Loose_" and Log:FindFirstChild("Owner") and Log.Owner.Value == lp then
						Log:MoveTo(hrp.Position + Vector3.new(0, 20, 0))
						for _ = 1, 100 do
							game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Log)
						end
					end
				end
			end)
		end,
	})

	LT2Tab:Button({
		Title = "传送木板(点选地面)",
		Icon = "geist:mouse-pointer",
		Callback = function()
			pcall(function()
				game.ReplicatedStorage.Notices.SendUserNotice:Fire("点击一个位置传送全部木板")
				local conn
				conn = lp:GetMouse().Button1Down:Connect(function()
					local target = lp:GetMouse().Target
					if target and (target.Name == "OriginSquare" or target.Name == "Square") then
						conn:Disconnect()
						for _, Plank in pairs(workspace.PlayerModels:GetChildren()) do
							if Plank.Name == "Plank" and Plank:FindFirstChild("Owner") and Plank.Owner.Value == lp then
								Plank:MoveTo(target.Position)
								for _ = 1, 100 do
									game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Plank)
								end
							end
						end
					end
				end)
			end)
		end,
	})

	LT2Tab:Button({
		Title = "改木头(转换所有权)",
		Icon = "geist:repeat",
		Callback = function()
			for _, Log in pairs(workspace.LogModels:GetChildren()) do
				if Log.Name:sub(1, 6) == "Loose_" and Log:FindFirstChild("Owner") and Log.Owner.Value == lp then
					for _, v in pairs(Log:GetChildren()) do
						if v.Name == "WoodSection" then
							task.spawn(function()
								for _ = 1, 10 do
									task.wait()
									v.CFrame = SHOP_CF
								end
							end)
						end
					end
					task.spawn(function()
						for _ = 1, 20 do
							task.wait()
							game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Log.WoodSection)
							game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Log.WoodSection)
						end
					end)
				end
			end
			task.wait(2)
			for _, Log in pairs(workspace.LogModels:GetChildren()) do
				if Log.Name:sub(1, 6) == "Loose_" and Log:FindFirstChild("Owner") and Log.Owner.Value == lp then
					pcall(function()
						Log:MoveTo(lp.Character.HumanoidRootPart.Position)
						for _ = 1, 20 do
							game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(Log.WoodSection)
							game.ReplicatedStorage.Interaction.ClientRequestOwnership:FireServer(Log.WoodSection)
						end
					end)
				end
			end
		end,
	})

	LT2Tab:Button({
		Title = "删除所有树木",
		Icon = "geist:trash",
		Callback = function()
			for _, v in pairs(workspace:GetDescendants()) do
				if v.Name == "WoodSection" and v.Parent:FindFirstChild("CutEvent") then
					game.ReplicatedStorage.Interaction.ClientIsDragging:FireServer(v.Parent)
					game.ReplicatedStorage.Interaction.DestroyStructure:FireServer(v.Parent)
				end
			end
		end,
	})

	--========== 传送 ==========
	LT2Tab:Section({ Title = "传送" })

	local TP_POINTS = {
		{ "Wood R Us", CFrame.new(265, 5, 57) },
		{ "Link's Logic", CFrame.new(4607, 9, -798) },
		{ "Spawn", CFrame.new(155, 5, 74) },
		{ "Ice Wood", CFrame.new(1451.66248, 412.208405, 3183.47607) },
		{ "Land Store", CFrame.new(258, 5, -99) },
		{ "Fine Arts", CFrame.new(5207, -156, 719) },
		{ "Volcano", CFrame.new(-1585, 625, 1140) },
		{ "Palm", CFrame.new(2549, 5, -42) },
		{ "Boxed Cars", CFrame.new(509, 5.2, -1463) },
		{ "Bob's Shack", CFrame.new(260, 10, -2542) },
		{ "Swamp", CFrame.new(-1209, 138, -801) },
		{ "End Times", CFrame.new(113, -204, -951) },
		{ "Fancy Furnishings", CFrame.new(491, 13, -1720) },
		{ "Strange Man", CFrame.new(1061, 20, 1131) },
		{ "Yellow Wood", CFrame.new(-1124.91565, 1.10021782, -943.932129) },
		{ "Cave", CFrame.new(3581, -177, 430) },
		{ "Green Box", CFrame.new(-1668.39197, 349.601929, 1475.36255) },
		{ "Lodge", CFrame.new(1244, 66, 2306) },
		{ "Dock", CFrame.new(1114, 3.2, -197) },
		{ "Bridge", CFrame.new(113, 15, -977) },
	}

	for _, point in ipairs(TP_POINTS) do
		LT2Tab:Button({
			Title = "传送到 " .. point[1],
			Icon = "geist:map-pin",
			Callback = function() TP(point[2]) end,
		})
	end

	--========== 移动/通用 ==========
	LT2Tab:Section({ Title = "移动 / 通用" })

	local flying = false
	LT2Tab:Toggle({
		Title = "飞行",
		Value = false,
		Callback = function(v)
			flying = v
			if v then
				task.spawn(function()
					local ctrl = { f = 0, b = 0, l = 0, r = 0 }
					local lastctrl = { f = 0, b = 0, l = 0, r = 0 }
					local maxspeed = 200
					local speed = 0
					local mouse = lp:GetMouse()
					local keys = {}
					local keyDown = mouse.KeyDown:Connect(function(key)
						local k = key:lower()
						if k == "w" then ctrl.f = 1 elseif k == "s" then ctrl.b = -1
						elseif k == "a" then ctrl.l = -1 elseif k == "d" then ctrl.r = 1 end
					end)
					local keyUp = mouse.KeyUp:Connect(function(key)
						local k = key:lower()
						if k == "w" then ctrl.f = 0 elseif k == "s" then ctrl.b = 0
						elseif k == "a" then ctrl.l = 0 elseif k == "d" then ctrl.r = 0 end
					end)
					while flying and task.wait() do
						pcall(function()
							local char = lp.Character
							if not char then return end
							local torso = char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
							local hum = char:FindFirstChildOfClass("Humanoid")
							if not torso or not hum then return end
							hum.PlatformStand = true
							local bg = torso:FindFirstChild("FlyGyro") or Instance.new("BodyGyro", torso)
							bg.Name = "FlyGyro"; bg.P = 9e4; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
							bg.CFrame = torso.CFrame
							local bv = torso:FindFirstChild("FlyVel") or Instance.new("BodyVelocity", torso)
							bv.Name = "FlyVel"; bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
							local cam = workspace.CurrentCamera
							if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
								speed = math.min(speed + 0.5 + speed / maxspeed, maxspeed)
								bv.Velocity = (cam.CFrame.LookVector * (ctrl.f + ctrl.b) + cam.CFrame.RightVector * (ctrl.l + ctrl.r)) * speed
								lastctrl = { f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r }
							elseif speed ~= 0 then
								speed = math.max(speed - 1, 0)
								bv.Velocity = (cam.CFrame.LookVector * (lastctrl.f + lastctrl.b) + cam.CFrame.RightVector * (lastctrl.l + lastctrl.r)) * speed
							else
								bv.Velocity = Vector3.new(0, 0.1, 0)
							end
							bg.CFrame = cam.CFrame
						end)
					end
					keyDown:Disconnect(); keyUp:Disconnect()
				end)
			else
				pcall(function()
					local char = lp.Character
					if char then
						local torso = char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
						local hum = char:FindFirstChildOfClass("Humanoid")
						if torso then
							local bg = torso:FindFirstChild("FlyGyro"); if bg then bg:Destroy() end
							local bv = torso:FindFirstChild("FlyVel"); if bv then bv:Destroy() end
						end
						if hum then hum.PlatformStand = false end
					end
				end)
			end
		end,
	})

	local infJump = false
	LT2Tab:Toggle({
		Title = "无限跳",
		Value = false,
		Callback = function(v)
			infJump = v
		end,
	})
	game:GetService("UserInputService").JumpRequest:Connect(function()
		if infJump then
			pcall(function()
				lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		end
	end)

	local noclip = false
	game:GetService("RunService").Stepped:Connect(function()
		if noclip then
			pcall(function()
				lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState(11)
			end)
		end
	end)
	LT2Tab:Toggle({
		Title = "穿墙",
		Value = false,
		Callback = function(v) noclip = v end,
	})

	-- 金斧：本地快速砍树（含斧头伤害表 + CutEvent）
	local GAxe = false
	LT2Tab:Toggle({
		Title = "金斧(点击快速砍树)",
		Value = false,
		Callback = function(v) GAxe = v end,
	})

	local function GetAxe()
		if lp.Character and lp.Character:FindFirstChild("Tool") then
			return lp.Character.Tool
		end
		return false
	end

	local function GetDamage(axe, treeClass)
		local t = axe and axe.ToolTip
		if t == "Fire Axe" then return treeClass ~= "Volcano" and 0.6 or 6.35
		elseif t == "End Times Axe" then return treeClass ~= "LoneCave" and 1.58 or 10000000
		elseif t == "Gingerbread Axe" then
			if treeClass == "Walnut" then return 8.5 elseif treeClass == "Koa" then return 11 else return 1.2 end
		elseif t == "Bird Axe" then
			if treeClass == "Volcano" then return 2.5 elseif treeClass == "CaveCrawler" then return 3.9 else return 1.65 end
		end
		return 1.5 -- 默认较高伤害兜底
	end

	local function CutTree(tree)
		if GetAxe() == false then return end
		local dmg = GetDamage(GetAxe(), tree.TreeClass and tree.TreeClass.Value)
		local args = {
			sectionId = 1,
			faceVector = Vector3.new(0, 0, -1),
			height = 0.5,
			hitPoints = dmg,
			cooldown = 0,
			cuttingClass = "Axe",
			tool = GetAxe(),
		}
		for _ = 1, 50 do
			game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(tree.CutEvent, args)
		end
	end

	-- 维护树列表
	local TreeList = {}
	for _, region in pairs(workspace:GetChildren()) do
		if region.Name == "TreeRegion" then
			region.ChildAdded:Connect(function(t) table.insert(TreeList, t) end)
			for _, child in pairs(region:GetChildren()) do
				if child.Name == "Model" then table.insert(TreeList, child) end
			end
		end
	end

	-- 点击砍树（金斧开启时）
	lp:GetMouse().Button1Down:Connect(function()
		if not GAxe then return end
		if GetAxe() == false then return end
		local target = lp:GetMouse().Target
		if target then
			pcall(function()
				local tree = target.Parent
				if tree and tree:FindFirstChild("CutEvent") then
					local dmg = GetDamage(GetAxe(), tree:FindFirstChild("TreeClass") and tree.TreeClass.Value)
					local args = {
						sectionId = target:FindFirstChild("ID") and target.ID.Value or 1,
						faceVector = Vector3.new(0, 0, -1),
						height = target.CFrame:pointToObjectSpace(lp:GetMouse().Hit.p).Y + target.Size.Y / 2,
						hitPoints = dmg,
						cooldown = 0,
						cuttingClass = "Axe",
						tool = GetAxe(),
					}
					for _ = 1, 50 do
						game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(tree.CutEvent, args)
					end
				end
			end)
		end
	end)

	-- Ctrl+点击传送
	game:GetService("UserInputService").InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
			pcall(function()
				lp.Character:MoveTo(lp:GetMouse().Hit.p)
			end)
		end
	end)

	--========== 基地 ==========
	LT2Tab:Section({ Title = "基地" })

	LT2Tab:Button({
		Title = "解锁全部蓝图",
		Icon = "geist:clipboard",
		Callback = function()
			pcall(function()
				for _, v in pairs(game.ReplicatedStorage.Purchasables.Structures.BlueprintStructures:GetChildren()) do
					local clone = v:Clone()
					clone.Parent = lp.PlayerBlueprints.Blueprints
				end
			end)
		end,
	})

	LT2Tab:Toggle({
		Title = "水上行走",
		Value = false,
		Callback = function(v)
			pcall(function()
				for _, water in pairs(workspace.Water:GetChildren()) do
					water.CanCollide = v
				end
			end)
		end,
	})

	LT2Tab:Button({
		Title = "清除迷雾",
		Icon = "geist:cloud",
		Callback = function()
			game.Lighting.Changed:Connect(function()
				game.Lighting.TimeOfDay = "12:00:00"
				game.Lighting.FogEnd = 9999
				game.Lighting.Brightness = 2
			end)
			game.Lighting.TimeOfDay = "12:00:00"
			game.Lighting.FogEnd = 9999
			game.Lighting.Brightness = 2
		end,
	})
end

--==================== 『武器库』Tab ====================
-- 通用召唤武器，源码托管在 GitHub raw（2233qazwsx0/my-ui/weapons/）
-- 点击按钮 loadstring 远程加载，失败时弹通知
do
	local WepTab = Window:Tab({ Title = "武器库", Icon = "geist:sword" })

	local WepBase = "https://raw.githubusercontent.com/2233qazwsx0/my-ui/main/weapons/"
	local function LoadWepSafe(name, file)
		local ok, err = pcall(function()
			local code = game:HttpGet(WepBase .. file, true)
			loadstring(code)()
		end)
		if ok then
			Notify("武器库", "已加载: " .. name, "rbxassetid://132872684918876", 3)
		else
			Notify("武器库", "加载失败: " .. name, "rbxassetid://132872684918876", 3)
			warn("[武器库] " .. name .. " 失败: " .. tostring(err))
		end
	end

	--========== 近战武器 ==========
	WepTab:Section({ Title = "近战武器" })

	local melee = {
		{ "千刀", "qiandao.lua", "geist:swords" },
		{ "百刀", "baidao.lua", "geist:swords" },
		{ "巨眼", "juyan.lua", "geist:eye" },
		{ "月刃", "yueren.lua", "geist:moon" },
		{ "死神", "sishen.lua", "geist:skull" },
		{ "年刀", "niandao.lua", "geist:knife" },
		{ "锤子", "chuizi.lua", "geist:hammer" },
		{ "雷神之锤", "leishenzhichui.lua", "geist:zap" },
		{ "小刀fe", "xiaodaofe.lua", "geist:knife" },
		{ "一拳", "yiquan2.lua", "geist:fist" },
	}
	for _, w in ipairs(melee) do
		WepTab:Button({
			Title = w[1],
			Icon = w[3],
			Callback = function()
				LoadWepSafe(w[1], w[2])
			end,
		})
	end

	--========== 远程 / 道具 ==========
	WepTab:Section({ Title = "远程 / 特殊道具" })

	local ranged = {
		{ "枪6", "qiang6.lua", "geist:gun" },
		{ "枪7", "qiang7.lua", "geist:gun" },
		{ "物理枪", "wuliqiang.lua", "geist:gun" },
		{ "半条命吸枪", "bantiaomingxiqiang.lua", "geist:magnet" },
		{ "玩家控制", "wanjiakongzhi.lua", "geist:user" },
		{ "死亡笔记", "siwangbiji.lua", "geist:book" },
		{ "音响2", "yinxiang2.lua", "geist:music" },
		{ "核导弹", "hedaodan.lua", "geist:triangle" },
	}
	for _, w in ipairs(ranged) do
		WepTab:Button({
			Title = w[1],
			Icon = w[3],
			Callback = function()
				LoadWepSafe(w[1], w[2])
			end,
		})
	end

	WepTab:Paragraph({ Title = "说明", Desc = "武器源码托管于 GitHub raw，点击后远程加载生成。加载失败请检查网络/注入器是否放行 game:HttpGet。" })
end
