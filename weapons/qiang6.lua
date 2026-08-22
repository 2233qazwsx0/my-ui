--require(3747589551)()
game.Players:Chat("-gh 4504231783,5134896593")

wait(0.9)

GlobalFunctions = {}
loadstring(game:HttpGet(('https://pastebin.com/raw/uq6axDFA'),true))()
loadstring(game:GetObjects("rbxassetid://5425999987")[1].Source)()
-- nebula's ezconvert
--[[
PUT YOUR SCRIPTS BELOW HERE VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV	
]]
warn("converted by deia")
wait(1 / 60)
Effects = { }
local Player = game.Players.localPlayer
local Mouse = Player:GetMouse()
local Character = Player.Character
local Humanoid = Character.Humanoid
local Head = Character.Head
local RootPart = Character.HumanoidRootPart
local Torso = Character.Torso
local LeftArm = Character["Left Arm"]
local RightArm = Character["Right Arm"]
local LeftLeg = Character["Left Leg"]
local RightLeg = Character["Right Leg"]
local Camera = game.Workspace.CurrentCamera
local RootJoint = RootPart.RootJoint
local Equipped = false
local Attack = false
local IntroATT = false
local targetnnn = nil
local SecondaryBread = false
local Anim = 'Idle'
local Idle = 0
local Combo = 1
local TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
local Velocity = RootPart.Velocity.y
local Sine = 0
local Change = 1
local maxammo = 6 -- max ammo
local AmmoCount = 6 --ammo in gun
local AmmoUsage = 1 --boolets used
local currentammo = AmmoCount
local RbxUtility = LoadLibrary("RbxUtility")
local Create = RbxUtility.Create
local relodee = false
local UIS = game:GetService("UserInputService")    
local stance = false
local maincol = "Rust"
local skillcolorscheme = BrickColor.new(maincol).Color
local maincol2 = "Grey"
local skillcolorscheme2 = BrickColor.new(maincol2).Color
local desirefont = "SourceSansLight"

local coZ = 6
local coX = 0
local coXZ = 5
local coXC = 8
local coXV = 10
local coC = 20
local coV = 25


local cooldownZ = 0
local cooldownX = 0
local cooldownXZ = 0
local cooldownXC = 0
local cooldownXV = 0
local cooldownC = 0
local cooldownV = 0



local scrn = Instance.new('ScreenGui', Player.PlayerGui)
function makeframe(par, trans, pos, size, color)
	local frame = Instance.new('Frame', par)
	frame.BackgroundTransparency = trans
	frame.BorderSizePixel = 0
	frame.Position = pos
	frame.Size = size
	frame.BackgroundColor3 = color
	return frame
end


frameskZ = makeframe(scrn, .8, UDim2.new(.8, 0, .85, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskX = makeframe(scrn, .8, UDim2.new(.8, 0, .74, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskXZ = makeframe(scrn, .8, UDim2.new(.8, 0, .85, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskXC = makeframe(scrn, .8, UDim2.new(.8, 0, .63, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskXV = makeframe(scrn, .8, UDim2.new(.8, 0, .52, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskC = makeframe(scrn, .8, UDim2.new(.8, 0, .63, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)
frameskV = makeframe(scrn, .8, UDim2.new(.8, 0, .52, 0), UDim2.new(.14, 0, .08, 0), skillcolorscheme)

barZ = makeframe(frameskZ, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barX = makeframe(frameskX, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barXZ = makeframe(frameskXZ, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barXC = makeframe(frameskXC, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barXV = makeframe(frameskXV, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barC = makeframe(frameskC, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
barV = makeframe(frameskV, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)
text1 =  Instance.new('TextLabel', frameskZ)
text1.BackgroundTransparency = 1
text1.Size = UDim2.new(1, 0, 1, 0)
text1.Position = UDim2.new(0, 0, 0, 0)
text1.TextColor3 = Color3.new(255, 255, 255)
text1.TextStrokeTransparency = 0
text1.FontSize = Enum.FontSize.Size18
text1.Font = desirefont
text1.BorderSizePixel = 0
text1.TextScaled = true
text2 =  Instance.new('TextLabel', frameskX)
text2.BackgroundTransparency = 1
text2.Size = UDim2.new(1, 0, 1, 0)
text2.Position = UDim2.new(0, 0, 0, 0)
text2.TextColor3 = Color3.new(255, 255, 255)
text2.TextStrokeTransparency = 0
text2.FontSize = Enum.FontSize.Size18
text2.Font = desirefont
text2.BorderSizePixel = 0
text2.TextScaled = true
text3 =  Instance.new('TextLabel', frameskC)
text3.BackgroundTransparency = 1
text3.Size = UDim2.new(1, 0, 1, 0)
text3.Position = UDim2.new(0, 0, 0, 0)
text3.TextColor3 = Color3.new(255, 255, 255)
text3.TextStrokeTransparency = 0
text3.FontSize = Enum.FontSize.Size18
text3.Font = desirefont
text3.BorderSizePixel = 0
text3.TextScaled = false
text4 =  Instance.new('TextLabel', frameskV)
text4.BackgroundTransparency = 1
text4.Size = UDim2.new(1, 0, 1, 0)
text4.Position = UDim2.new(0, 0, 0, 0)
text4.TextColor3 = Color3.new(255, 255, 255)
text4.TextStrokeTransparency = 0
text4.FontSize = Enum.FontSize.Size18
text4.Font = desirefont
text4.BorderSizePixel = 0
text4.TextScaled = true

text1.Text = "[Z]\n Reposition"
text2.Text = "[X]\n Battle Stance"
text3.Text = "[C]\n Mend"
text4.Text = "[V]\n Unload"

textXZ =  Instance.new('TextLabel', frameskXZ)
textXZ.BackgroundTransparency = 1
textXZ.Size = UDim2.new(1, 0, 1, 0)
textXZ.Position = UDim2.new(0, 0, 0, 0)
textXZ.TextColor3 = Color3.new(255, 255, 255)
textXZ.TextStrokeTransparency = 0
textXZ.FontSize = Enum.FontSize.Size18
textXZ.Font = desirefont
textXZ.BorderSizePixel = 0
textXZ.TextScaled = true
textXC =  Instance.new('TextLabel', frameskXC)
textXC.BackgroundTransparency = 1
textXC.Size = UDim2.new(1, 0, 1, 0)
textXC.Position = UDim2.new(0, 0, 0, 0)
textXC.TextColor3 = Color3.new(255, 255, 255)
textXC.TextStrokeTransparency = 0
textXC.FontSize = Enum.FontSize.Size18
textXC.Font = desirefont
textXC.BorderSizePixel = 0
textXC.TextScaled = true
textXV =  Instance.new('TextLabel', frameskXV)
textXV.BackgroundTransparency = 1
textXV.Size = UDim2.new(1, 0, 1, 0)
textXV.Position = UDim2.new(0, 0, 0, 0)
textXV.TextColor3 = Color3.new(255, 255, 255)
textXV.TextStrokeTransparency = 0
textXV.FontSize = Enum.FontSize.Size18
textXV.Font = desirefont
textXV.BorderSizePixel = 0
textXV.TextScaled = false

textXZ.Text = " "
textXC.Text = " "
textXV.Text = " "



frameskXZ.BackgroundTransparency = 1
frameskXC.BackgroundTransparency = 1
frameskXV.BackgroundTransparency = 1
barXZ.BackgroundTransparency = 1
barXC.BackgroundTransparency = 1
barXV.BackgroundTransparency = 1


reloadframe = makeframe(scrn, .8, UDim2.new(.8, 0, .4, 0), UDim2.new(.14, 0, .05, 0), skillcolorscheme)
reloadbar = makeframe(reloadframe, 0, UDim2.new(0, 0, 0, 0), UDim2.new(1, 0, 1, 0), skillcolorscheme2)

relodetext =  Instance.new('TextLabel', reloadframe)
relodetext.BackgroundTransparency = 1
relodetext.Size = UDim2.new(1, 0, 1, 0)
relodetext.Position = UDim2.new(0, 0, 0, 0)
relodetext.TextColor3 = Color3.new(255, 255, 255)
relodetext.TextStrokeTransparency = 0
relodetext.FontSize = Enum.FontSize.Size24
relodetext.Font = desirefont
relodetext.BorderSizePixel = 0
relodetext.TextScaled = false
relodetext.Text = currentammo..'/'..maxammo




Humanoid.WalkSpeed = 16
Humanoid.JumpPower = 60
Humanoid.Animator.Parent = nil
Character.Animate.Parent = nil

local newMotor = function(part0, part1, c0, c1)
	local w = Create('Motor'){
		Parent = part0,
		Part0 = part0,
		Part1 = part1,
		C0 = c0,
		C1 = c1,
	}
	return w
end



function clerp(a, b, t)
	return a:lerp(b, t)
end

RootCF = CFrame.fromEulerAnglesXYZ(-1.57, 0, 3.14)
NeckCF = CFrame.new(0, 1, 0, -1, -0, -0, 0, 0, 1, 0, 1, 0)

local RW = newMotor(Torso, RightArm, CFrame.new(1.5, 0, 0), CFrame.new(0, 0, 0)) 
local LW = newMotor(Torso, LeftArm, CFrame.new(-1.5, 0, 0), CFrame.new(0, 0, 0))
local RH = newMotor(Torso, RightLeg, CFrame.new(.5, -2, 0), CFrame.new(0, 0, 0))
local LH = newMotor(Torso, LeftLeg, CFrame.new(-.5, -2, 0), CFrame.new(0, 0, 0))
RootJoint.C1 = CFrame.new(0, 0, 0)
RootJoint.C0 = CFrame.new(0, 0, 0)
Torso.Neck.C1 = CFrame.new(0, 0, 0)
Torso.Neck.C0 = CFrame.new(0, 1.5, 0)

local rarmc1 = RW.C1
local larmc1 = LW.C1
local rlegc1 = RH.C1
local llegc1 = LH.C1

local resetc1 = false

function PlayAnimationFromTable(table, speed, bool)
	RootJoint.C0 = clerp(RootJoint.C0, table[1], speed) 
	Torso.Neck.C0 = clerp(Torso.Neck.C0, table[2], speed) 
	RW.C0 = clerp(RW.C0, table[3], speed) 
	LW.C0 = clerp(LW.C0, table[4], speed) 
	RH.C0 = clerp(RH.C0, table[5], speed) 
	LH.C0 = clerp(LH.C0, table[6], speed) 
	if bool == true then
		if resetc1 == false then
			resetc1 = true
			RootJoint.C1 = RootJoint.C1
			Torso.Neck.C1 = Torso.Neck.C1
			RW.C1 = rarmc1
			LW.C1 = larmc1
			RH.C1 = rlegc1
			LH.C1 = llegc1
		end
	end
end

ArtificialHB = Create("BindableEvent"){
	Parent = script,
	Name = "Heartbeat",
}

script:WaitForChild("Heartbeat")

frame = 1 / 35
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.Heartbeat:Fire()

game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			script.Heartbeat:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				script.Heartbeat:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end)

function swait(num)
	if num == 0 or num == nil then
		ArtificialHB.Event:wait()
	else
		for i = 0, num do
			ArtificialHB.Event:wait()
		end
	end
end

local m = Create("Model"){
	Parent = Character,
	Name = "WeaponModel"
}

function RemoveOutlines(part)
	part.TopSurface, part.BottomSurface, part.LeftSurface, part.RightSurface, part.FrontSurface, part.BackSurface = 10, 10, 10, 10, 10, 10
end

CFuncs = {	
	Part = {
		Create = function(Parent, Material, Reflectance, Transparency, BColor, Name, Size)
			local Part = Create("Part"){
				Parent = Parent,
				Reflectance = Reflectance,
				Transparency = Transparency,
				CanCollide = false,
				Locked = true,
				BrickColor = BrickColor.new(tostring(BColor)),
				Name = Name,
				Size = Size,
				Material = Material,
			}
			RemoveOutlines(Part)
			if Size == Vector3.new() then
				Part.Size = Vector3.new(0.2, 0.2, 0.2)
			else
				Part.Size = Size
			end
			return Part
		end;
	};

	Mesh = {
		Create = function(Mesh, Part, MeshType, MeshId, OffSet, Scale)
			local Msh = Create(Mesh){
				Parent = Part,
				Offset = OffSet,
				Scale = Scale,
			}
			if Mesh == "SpecialMesh" then
				Msh.MeshType = MeshType
				Msh.MeshId = MeshId
			end
			return Msh
		end;
	};

	Weld = {
		Create = function(Parent, Part0, Part1, C0, C1)
			local Weld = Create("Weld"){
				Parent = Parent,
				Part0 = Part0,
				Part1 = Part1,
				C0 = C0,
				C1 = C1,
			}
			return Weld
		end;
	};

	Sound = {
		Create = function(id, par, vol, pit) 
			coroutine.resume(coroutine.create(function()
				local S = Create("Sound"){
					Volume = vol,
					Pitch = pit or 1,
					SoundId = "rbxassetid://" .. id,
					Parent = par or workspace,
				}
				wait() 
				S:play() 
				game:GetService("Debris"):AddItem(S, 10)
			end))
		end;
	};

	ParticleEmitter = {
		Create = function(Parent, Color1, Color2, LightEmission, Size, Texture, Transparency, ZOffset, Accel, Drag, LockedToPart, VelocityInheritance, EmissionDirection, Enabled, LifeTime, Rate, Rotation, RotSpeed, Speed, VelocitySpread)
			local Particle = Create("ParticleEmitter"){
				Parent = Parent,
				Color = ColorSequence.new(Color1, Color2),
				LightEmission = LightEmission,
				Size = Size,
				Texture = Texture,
				Transparency = Transparency,
				ZOffset = ZOffset,
				Acceleration = Accel,
				Drag = Drag,
				LockedToPart = LockedToPart,
				VelocityInheritance = VelocityInheritance,
				EmissionDirection = EmissionDirection,
				Enabled = Enabled,
				Lifetime = LifeTime,
				Rate = Rate,
				Rotation = Rotation,
				RotSpeed = RotSpeed,
				Speed = Speed,
				VelocitySpread = VelocitySpread,
			}
			return Particle
		end;
	};

	CreateTemplate = {

	};
}

--Shotgun Model

Handle=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","Handle",Vector3.new(0.230977222, 0.505653977, 0.244424))
HandleWeld=CFuncs.Weld.Create(m,Character["Left Arm"],Handle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.489551544, 0.226313591, 0.00205421448, -0.0140927732, -0.988225222, -0.15235588, -0.120409302, 0.152939469, -0.980872691, 0.992624283, 0.00452187657, -0.121146858))
fHandle=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","fHandle",Vector3.new(0.230977222, 0.505653977, 0.244424))
fHandleWeld=CFuncs.Weld.Create(m,Handle,fHandle,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.489551544, 0.226313591, 0.00205421448, -0.0140927732, -0.988225222, -0.15235588, -0.120409302, 0.152939469, -0.980872691, 0.992624283, 0.00452187657, -0.121146858))
Stockbox=CFuncs.Part.Create(m,Enum.Material.Plastic,0,1,"Medium stone grey","Stockbox",Vector3.new(1.35000181, 1.25999975, 1.21000016))
StockboxWeld=CFuncs.Weld.Create(m,fHandle,Stockbox,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.624462128, -0.121447086, -0.0863800049, 0.0217821598, 0.976389289, 0.214917779, -0.119256809, 0.215971515, -0.969089329, -0.992624402, -0.00452160835, 0.121145353))
Shellmaker=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","Shellmaker",Vector3.new(0.294364125, 0.10708534, 0.0960408598))
ShellmakerWeld=CFuncs.Weld.Create(m,fHandle,Shellmaker,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.01054192, -0.63139534, -0.123239517, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
bulletmaker=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,1,"Medium stone grey","bulletmaker",Vector3.new(0.0773126334, 0.0921989903, 0.084515892))
bulletmakerWeld=CFuncs.Weld.Create(m,fHandle,bulletmaker,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-3.09943199, -0.656896591, -0.0268611908, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.0763523355, 0.74047333, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.020904541, -2.09744072, -0.430066109, 1.1920929e-07, -7.4505806e-07, 1.00000012, 1, -2.98023224e-08, -1.78813934e-07, 2.98023224e-08, 1, 7.59959221e-07))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.678870738))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.182476982, 0.119570628, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0352497101, 0.183197975, -0.0285701752, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.183437362, 0.465309709, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0454616547, -0.0627765656, -0.0285644531, 0.866025507, -0.499999702, -1.78813934e-07, 0.499999762, 0.866025507, 8.04662704e-07, -3.27825546e-07, -8.19563866e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0753918514, 0.119570628, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.129617691, 0.184212685, -0.0285587311, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0753918514, 0.371197164, 0.172873527))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0450191498, 0.00573158264, -0.0285778046, 0.866025507, -0.499999702, -1.78813934e-07, 0.499999762, 0.866025507, 8.04662704e-07, -3.27825546e-07, -8.19563866e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.486446053, 0.144061252))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.084405899, -0.0508937836, -0.0285682678, 0.866025507, -0.499999702, -1.78813934e-07, 0.499999762, 0.866025507, 8.04662704e-07, -3.27825546e-07, -8.19563866e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.0540017299, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.119090639, 0.144061252))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.16843605, 0.182041168, -0.0285587311, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.0540017299, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.154145062, 0.159900382, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.22857666, -0.191133022, -0.0285720825, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0753918514, 0.112847812, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.00222587585, -0.22913456, -0.0285568237, 0.965925932, -0.258819044, 7.74860382e-07, 0.258818984, 0.965925813, 1.57952309e-06, -1.22189522e-06, -1.32620335e-06, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.113808274, 0.144061252))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0371608734, -0.228617668, -0.0285663605, 0.965925932, -0.258819044, 7.74860382e-07, 0.258818984, 0.965925813, 1.57952309e-06, -1.22189522e-06, -1.32620335e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.0540017299, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.113808274, 0.144061252))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.105619431, -0.289684772, -0.0285644531, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.0540017299, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0854762271, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.12963295, -0.276510715, -0.0285644531, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.112847812, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.316268921, -0.173998833, -0.0285587311, 0.500002027, 0.866024256, 2.11596489e-06, -0.866024196, 0.500001967, 5.96046448e-08, -1.07288361e-06, -1.86264515e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.54772383, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.113808274, 0.144061252))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.298994064, -0.173471451, -0.0285644531, 0.500002027, 0.866024256, 2.11596489e-06, -0.866024196, 0.500001967, 5.96046448e-08, -1.07288361e-06, -1.86264515e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.239147544, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0950803086, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.208971024, -0.221178055, -0.0285568237, 0.866025448, 0.499999702, -2.38418579e-07, -0.499999732, 0.866025507, 8.7916851e-07, 6.2584877e-07, -6.55651093e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.146461785, 0.196876034, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.327466965, -0.178565979, -0.0285739899, 0.707106829, 0.70710665, -2.08616257e-07, -0.70710665, 0.707106888, 1.93715096e-07, 2.08616257e-07, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.0622474775, 0.246817216, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.409929276, -0.000652313232, -0.0285587311, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.987445176, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.256908506, 0.250178576, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.0943717957, -0.513149977, -0.0285682678, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.81730479, 0.0997623056, 0.0997624695))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.471679688, -0.463490486, -0.0529289246, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.504212916, 0.0997623056, 0.0997624695))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.374668121, -0.534323692, -0.0529251099, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0744314641, 0.272275418, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.242843628, -0.510847807, -0.0285606384, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0744314641, 1.11887383, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.454176903, -0.655622482, -0.0285568237, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.296285421, 0.194002435))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.280355453, 0.50044775, -0.0285720825, -0.965925932, -0.258818686, 0, 0.258818686, -0.965925872, 9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.200575769, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.283319652, 0.249225661, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.314329147, -0.559855938, -0.0285587311, 0.995653629, 0.0931321532, 2.32458115e-06, -0.0931321681, 0.995653749, 7.5250864e-07, -2.29477882e-06, -9.83476639e-07, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.133496568, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.349269867, -0.24421072, -0.0285644531, 0.866025448, 0.499999702, -2.38418579e-07, -0.499999732, 0.866025507, 8.7916851e-07, 6.2584877e-07, -6.55651093e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.192081362, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.293024063, -0.294204473, -0.0285720825, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0979615301, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.356941223, 0.0116996765, -0.0285701752, 0.707106829, 0.70710665, -2.08616257e-07, -0.70710665, 0.707106888, 1.93715096e-07, 2.08616257e-07, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0979615301, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.28327179, 0.268438339, -0.0285663605, 0.258818686, 0.965925872, 1.57952309e-06, -0.965925932, 0.258818716, -5.66244125e-07, -1.07288361e-06, -1.37090683e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0979615301, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.192222595, 0.423189163, -0.0285587311, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0979615301, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0651254654, 0.542451859, -0.0285663605, -0.500002563, 0.866023898, -1.69873238e-06, -0.866023898, -0.500002503, -5.36441803e-07, -1.37090683e-06, 1.1920929e-06, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0622474775, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.349715233, 0.488988876, -0.0285606384, -0.866025507, 0.499999702, 1.78813934e-07, -0.499999762, -0.866025507, -8.04662704e-07, -3.27825546e-07, -8.19563866e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 0.62486881, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0622474775, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.468893051, 0.414321899, -0.0285682678, -0.965925932, 0.258819044, -7.74860382e-07, -0.258818984, -0.965925813, -1.57952309e-06, -1.22189522e-06, -1.32620335e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 0.62486881, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.166150421, 0.172873542))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.564922333, 0.374081612, -0.0285587311, -0.999999881, 1.49011612e-08, 2.98023224e-08, 1.49011612e-08, -0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.717440903, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.446313858, 0.0350942612, -0.0285625458, 0.707106829, 0.70710665, -2.08616257e-07, -0.70710665, 0.707106888, 1.93715096e-07, 2.08616257e-07, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.393159211, 0.862414598, 0.327713668))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.391670227, -0.236137867, -0.0285568237, 0.965925932, 0.258818686, 0, -0.258818686, 0.965925872, -9.9465251e-07, -3.27825546e-07, 9.53674316e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.393159211, 0.862414598, 0.327713668))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.0622474775, 0.10526102, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.208478928, -0.470833778, -0.0285587311, 0.965925932, -0.258819044, 7.74860382e-07, 0.258818984, 0.965925813, 1.57952309e-06, -1.22189522e-06, -1.32620335e-06, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.393159211, 1, 0.327713668))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.853799939, 0.249225661, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.811216354, -0.600500107, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(1.86222541, 0.142131716, 0.142131925))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.88418007, -0.649424553, -0.0289115906, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.919107974, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.843883514, -0.728718758, -0.0285587311, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.11571791, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.919107974, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.843877792, -0.746054649, -0.0285568237, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.11571791, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.919107974, 0.0622474775, 0.152704939))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.843877792, -0.734283447, -0.0285568237, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.401151627, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.391284943, -0.759021759, -0.0285587311, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.223722026, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.433917999, -0.758702278, -0.0285682678, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.479598999, -0.758406639, -0.0285568237, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.519172668, -0.759467125, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.564876556, -0.759284019, -0.0285587311, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.74656105, -0.757936478, -0.0285720825, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.700839996, -0.758119583, -0.0285701752, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.615558624, -0.759425163, -0.0285568237, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.661268234, -0.759130478, -0.0285720825, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.790523529, -0.757699966, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.10312653, -0.756930351, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.05741501, -0.757115364, -0.0285663605, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.836206436, -0.757403374, -0.0285663605, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.875770569, -0.75846386, -0.0285644531, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.972162247, -0.758422852, -0.0285606384, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.01785469, -0.758123398, -0.0285606384, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.921495438, -0.758282661, -0.0285682678, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.23103142, -0.755340576, -0.0285606384, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.14575386, -0.756649017, -0.0285682678, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.26502037, -0.755158424, -0.0285644531, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.19145584, -0.756355286, -0.0285701752, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.300866187, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.29557228, -0.757285118, -0.0285549164, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.223722026, 0.3008641, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.608816147, 0.439056396, -0.133686066, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.608924866, 0.559501648, -0.141916275, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.609196663, 0.676843643, -0.133676529, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.695789337, 0.558382034, -0.141908646, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.163862169, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.612273216, 0.558391571, -0.141902924, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.164241493, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.612018585, 0.438463211, -0.137260437, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.695731163, 0.438491821, -0.137289047, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.164620817, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.611670494, 0.676483154, -0.133932114, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.695570946, 0.676485062, -0.133947372, -5.96046448e-08, 0.999999881, -1.49011612e-08, -1, -2.98023224e-08, 2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.427860439, 0.156066164, 0.156066418))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.02061081, -0.622268677, -0.0845718384, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0773126855, 0.309250325, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.805314064, -1.1217041, -0.0285644531, 0.866025507, -0.499999702, -1.78813934e-07, 0.499999762, 0.866025507, 8.04662704e-07, -3.27825546e-07, -8.19563866e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.261230201, 0.185357824, 0.158467412))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.552032471, -1.27363014, -0.0285682678, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.983454704, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.876041412, -0.700925827, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.655727208, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.983454704, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.822029114, -0.663985252, -0.0285663605, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.655727208, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.983454704, 0.0622474775, 0.184398398))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.787355423, -0.642092705, -0.0285625458, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.655727208, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(0.228096232, 1.19426513, 0.0672286227))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.572554588, -1.87078285, -0.0285701752, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Earth blue","Part",Vector3.new(1.1721741, 0.0672284812, 0.0672286004))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.94434929, -0.457939148, -0.0285606384, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0960405394, 1.18610215, 0.119090654))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.60875988, -1.8666954, -0.0285606384, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0960405394, 0.837954462, 0.119090654))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.593738556, -1.92202759, -0.0285644531, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.217051655, 0.74047333, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.51939106, -2.09714317, 0.0765304565, 3.62284482e-07, -0.965925813, -0.258818895, 0.99999994, 3.27825546e-07, 8.94069672e-08, 0, -0.258818865, 0.965925932))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.948875785))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.217051655, 0.74047333, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.508298635, -2.09652901, -0.119865417, -1.25169754e-06, -0.965925932, 0.258818418, 1, -1.11758709e-06, 6.85453415e-07, -4.76837158e-07, 0.258818418, 0.965926051))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 1, 0.948875785))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(1.51359856, 0.108333342, 0.108333521))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-1.70987511, -0.587060928, -0.0289077759, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.116297506, 0.126513839, 0.126514062))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.51787376, -0.492711067, -0.0289020538, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.281487226, 0.0818847269, 0.0818848684))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.59470558, -0.490480423, -0.0289134979, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.128214061, 0.210328475, 0.119090654))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.553534508, -2.6796627, -0.0285625458, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.133873656, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0289173126, -0.551986694, -2.5983963, -1.1920929e-07, 7.4505806e-07, -1.00000012, -5.96046448e-08, 1, 7.4505806e-07, 1, 7.4505806e-08, -1.49011612e-07))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.644316077, 0.644317031))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.133873656, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0289115906, -0.555045128, -2.70437813, -1.1920929e-07, 7.4505806e-07, -1.00000012, -5.96046448e-08, 1, 7.4505806e-07, 1, 7.4505806e-08, -1.49011612e-07))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.644316077, 0.644317031))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.133873656, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.0289211273, -0.556861877, -2.75073242, -1.1920929e-07, 7.4505806e-07, -1.00000012, -5.96046448e-08, 1, 7.4505806e-07, 1, 7.4505806e-08, -1.49011612e-07))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(1, 0.644316077, 0.644317031))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.325578123, 0.120581053, 0.120581254))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.89797592, -0.653188705, -0.0289173126, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0812890455, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.78231049, 0.759439468, 0.0285625458, -0.866025448, -0.499999702, 2.38418579e-07, -0.499999732, 0.866025507, 8.7916851e-07, -6.2584877e-07, 6.55651093e-07, -1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.61715281, 1, 0.482340217))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.0622474775, 0.0745662153, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(2.76589775, -0.741744041, 0.0285568237, -0.999999881, 1.49011612e-08, 2.98023224e-08, -1.49011612e-08, 0.999999881, 0, 2.98023224e-08, 0, -1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.61715281, 1, 0.482340217))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Lily white","Part",Vector3.new(0.0622474775, 0.0622474775, 0.0622474775))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-2.76446533, -0.764004707, -0.028553009, 0.999999881, -1.49011612e-08, -2.98023224e-08, -1.49011612e-08, 0.999999881, 0, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.617152989, 0.408864677, 0.339435399))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(1.09150016, 0.159420162, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.903377533, -0.564111233, -0.0285682678, 0.999867797, 0.0162549913, 7.74860382e-07, -0.0162550062, 0.999867916, 8.7916851e-07, -7.15255737e-07, -8.94069672e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.799536645, 0.156538948, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.757575989, -0.625374794, -0.0285549164, 0.985511184, 0.169610262, -6.2584877e-07, -0.169610262, 0.985511243, 3.87430191e-07, 6.85453415e-07, -2.68220901e-07, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.15222393, 0.0696221218, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.413620949, -0.488759995, -0.0285682678, 0.0912402272, 0.995828867, 1.47521496e-06, -0.995828867, 0.0912402719, 5.66244125e-07, 3.27825546e-07, -1.5348196e-06, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.523900926, 0.0622474775, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.716959, -0.339764595, -0.0285701752, 0.995828986, -0.0912401676, -5.06639481e-07, 0.0912401378, 0.995828927, 7.15255737e-07, 3.27825546e-07, -7.89761543e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.523900926, 0.0622474775, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.607765198, -0.601490259, -0.0285663605, 0.908034444, 0.418895423, -5.66244125e-07, -0.418895513, 0.908034563, -2.60770321e-07, 3.57627869e-07, 4.61935997e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.294364095, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.873703957, 0.431451797, -0.0285663605, 0.639640331, -0.768674433, -4.61935997e-07, 0.768674374, 0.639640331, 5.66244125e-07, -1.78813934e-07, -7.30156898e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.294364095, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.909405231, 0.553689957, -0.0285549164, 0.639640331, -0.768674433, -4.61935997e-07, 0.768674374, 0.639640331, 5.66244125e-07, -1.78813934e-07, -7.30156898e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.294364095, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.927492619, 0.657333374, -0.0285587311, 0.639640331, -0.768674433, -4.61935997e-07, 0.768674374, 0.639640331, 5.66244125e-07, -1.78813934e-07, -7.30156898e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.294364095, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.11587906, -0.356192112, -0.028547287, 0.985511184, 0.169610262, -6.2584877e-07, -0.169610262, 0.985511243, 3.87430191e-07, 6.85453415e-07, -2.68220901e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.495088696, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.322112083, -1.28462601, -0.0285587311, 0.345870823, 0.938282073, -7.4505806e-07, -0.938282132, 0.345870882, 1.07288361e-06, 1.25169754e-06, 3.27825546e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.257387787, 0.159420162, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.3693037, 0.223978043, -0.0285739899, 0.874038696, -0.485856384, 3.57627869e-07, 0.485856295, 0.874038756, 3.57627869e-07, -5.66244125e-07, -1.78813934e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.706377685, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.269904137, -1.45611191, -0.0285568237, -0.000838190317, 0.999999642, 7.74860382e-07, -0.999999642, -0.000838235021, 2.38418579e-07, 1.1920929e-07, -7.89761543e-07, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.871611476, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.107085116, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.4155426, 0.194704056, -0.028553009, 0.995828986, -0.0912401676, -5.06639481e-07, 0.0912401378, 0.995828927, 7.15255737e-07, 3.27825546e-07, -7.89761543e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.964184403, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.181996748, 0.0622474775, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.30640793, -0.446501732, -0.0285644531, 0.985511184, 0.169610262, -6.2584877e-07, -0.169610262, 0.985511243, 3.87430191e-07, 6.85453415e-07, -2.68220901e-07, 1))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(1, 0.964184403, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.196883038, 0.188232288, 0.0864367038))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.27062798, -0.612149715, -0.0285511017, 0.985511184, 0.169610262, -6.2584877e-07, -0.169610262, 0.985511243, 3.87430191e-07, 6.85453415e-07, -2.68220901e-07, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.116208896, 0.737585008, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.52254105, -0.293103695, -0.0285682678, 0.999867797, 0.0162549913, 7.74860382e-07, -0.0162550062, 0.999867916, 8.7916851e-07, -7.15255737e-07, -8.94069672e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.116208896, 0.400002003, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.57855415, -0.319172859, -0.0285606384, 0.997218013, -0.0745394826, 8.94069672e-07, 0.0745394677, 0.997218013, -1.1920929e-07, -9.83476639e-07, 1.49011612e-07, 1.00000024))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Really black","Part",Vector3.new(0.112847485, 0.34814018, 0.175754741))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(1.5480423, -0.172746658, -0.0285549164, 0.997943401, 0.0641013086, -2.98023224e-08, -0.0641013458, 0.997943401, 8.49366188e-07, 0, -8.64267349e-07, 1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.696815491, -0.553442001, -0.102174759, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.696748734, -0.673355103, -0.0975265503, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Br. yellowish orange","Part",Vector3.new(0.0622474775, 0.118231699, 0.118231893))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.696596146, -0.435348511, -0.094203949, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
CFuncs.Mesh.Create("SpecialMesh",Part,Enum.MeshType.Cylinder,"",Vector3.new(0, 0, 0),Vector3.new(0.170620233, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.163862169, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.613293648, -0.553445816, -0.102149963, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.164241493, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.613039017, -0.673345566, -0.0975208282, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.609944344, -0.552326202, -0.102172852, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.610219002, -0.434988022, -0.0939350128, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Black","Part",Vector3.new(0.148310468, 0.123276234, 0.12327645))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.609839439, -0.672796249, -0.0939388275, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Cocoa","Part",Vector3.new(0.164620817, 0.112265885, 0.112266079))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(-0.612697601, -0.435344696, -0.0941925049, -5.96046448e-08, 0.999999881, -1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, 2.98023224e-08, 0, -1.00000012))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.0622474775, 0.330372602, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.190822601, -0.254428864, -0.0285701752, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.648010492, 1, 1))
Part=CFuncs.Part.Create(m,Enum.Material.SmoothPlastic,0,0,"Burlap","Part",Vector3.new(0.0622474775, 0.216564372, 0.16326943))
PartWeld=CFuncs.Weld.Create(m,fHandle,Part,CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),CFrame.new(0.217577934, -0.165513992, -0.0285587311, 5.96046448e-08, -0.999999881, 1.49011612e-08, 1, 2.98023224e-08, -2.98023224e-08, -2.98023224e-08, 0, 1.00000012))
CFuncs.Mesh.Create("BlockMesh",Part,"","",Vector3.new(0, 0, 0),Vector3.new(0.648010492, 1, 1))

local lp = game:GetService("Players").LocalPlayer
local cnnn = lp.Character
local function gp(parent, name, className)
	if typeof(parent) == "Instance" then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				return v
			end
		end
	end
	return nil
end
local hatnnn = gp(gp(gp(cnnn, "Red Sci-Fi Scattergun", "Accessory"), "Handle", "BasePart"), "att1_Handle", "Attachment")
hatnnn.Parent = fHandle
hatnnn.Position = Vector3.new(1, 0.32, 0)
hatnnn.Rotation = Vector3.new(-180, -2.03555e-13, 120)



function RayCast(Position, Direction, Range, Ignore)
	return game:service("Workspace"):FindPartOnRay(Ray.new(Position, Direction.unit * (Range or 999.999)), Ignore) 
end 

FindNearestTorso = function(pos)
	local list = (game.Workspace:children())
	local torso = nil
	local dist = 1000
	local temp, human, temp2 = nil, nil, nil
	for x = 1, #list do
		temp2 = list[x]
		if temp2.className == "Model" and temp2.Name ~= Character.Name and temp2 ~= Character.Model then
			temp = temp2:findFirstChild("Torso")
			human = temp2:findFirstChild("Humanoid")
			if temp ~= nil and human ~= nil and human.Health > 0 and (temp.Position - pos).magnitude < dist then
				local dohit = true
				if dohit == true then
					torso = temp
					dist = (temp.Position - pos).magnitude
				end
			end
		end
	end
	return torso, dist
end
spawn(function()
	while game:GetService("RunService").Heartbeat:Wait() do

		if Attack == true and IntroATT == false and AmmoCount > 0 and relodee == false and SecondaryBread == false and targetnnn == nil then

			if lp:GetMouse().Target ~= nil then
				local targetmouse = lp:GetMouse().Target.Parent:FindFirstChildOfClass("Humanoid")

				if targetmouse then

					GlobalFunctions.fling(lp:GetMouse().Target.Parent.Head.Position, 0.03)

				else 

					GlobalFunctions.fling(lp:GetMouse().Hit.p, 0.001)

				end


			end

		end
		if Attack == true and SecondaryBread == true and targetnnn then
			print("A")
			GlobalFunctions.fling(targetnnn, 0.3)
			wait(0.4)
			targetnnn = nil
		end
	end
end)


function Damage(Part, hit, minim, maxim, knockback, Type, Property, Delay, HitSound, HitPitch)
	if hit.Parent == nil then
		return
	end
	local h = hit.Parent:FindFirstChild("Humanoid")
	for _, v in pairs(hit.Parent:children()) do
		if v:IsA("Humanoid") then
			h = v
		end
	end
	if h ~= nil and hit.Parent.Name ~= Character.Name and hit.Parent ~= Character.Model and hit.Parent:FindFirstChild("Torso") ~= nil then
		if hit.Parent:findFirstChild("DebounceHit") ~= nil then
			if hit.Parent.DebounceHit.Value == true then
				return
			end
		end
		targetnnn = hit.Parent
		local c = Create("ObjectValue"){
			Name = "creator",
			Value = game:service("Players").LocalPlayer,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
		if HitSound ~= nil and HitPitch ~= nil then
			CFuncs.Sound.Create(HitSound, hit, 1, HitPitch) 
		end
		local Damage = math.random(minim, maxim)
		local blocked = false
		local block = hit.Parent:findFirstChild("Block")
		if block ~= nil then
			if block.className == "IntValue" then
				if block.Value > 0 then
					blocked = true
					block.Value = block.Value - 1
					print(block.Value)
				end
			end
		end
		if blocked == false then
			--h.Health = h.Health - Damage
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 5)).p + Vector3.new(math.random(-5,5), math.random(3,5),0)), -Damage, 1, BrickColor.new("White").Color)
		else
			--h.Health = h.Health - (Damage / 2)
			ShowDamage((Part.CFrame * CFrame.new(0, 0, (Part.Size.Z / 5)).p + Vector3.new(0, 1.5, 0)), -Damage, 1.5, BrickColor.new("Really black").Color)
		end
		
		if Type == "Knockdown" then
			local hum = hit.Parent.Humanoid
			hum.PlatformStand = true
			coroutine.resume(coroutine.create(function(HHumanoid)
				swait(1)
				HHumanoid.PlatformStand = false
			end), hum)
			local angle = (hit.Position - (Property.Position + Vector3.new(0, 0, 0))).unit
			local bodvol = Create("BodyVelocity"){
				velocity = angle * knockback,
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			local rl = Create("BodyAngularVelocity"){
				P = 3000,
				maxTorque = Vector3.new(500000, 500000, 500000) * 50000000000000,
				angularvelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10)),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodvol, .5)
			game:GetService("Debris"):AddItem(rl, .5)
		elseif Type == "Normal" then
			local vp = Create("BodyVelocity"){
				P = 500,
				maxForce = Vector3.new(math.huge, 0, math.huge),
				velocity = Property.CFrame.lookVector * knockback + Property.Velocity / 1.05,
			}
			if knockback > 0 then
				vp.Parent = hit.Parent.Torso
			end
			game:GetService("Debris"):AddItem(vp, .5)
		elseif Type == "Up" then
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, .5)
		elseif Type == "DarkUp" then
			coroutine.resume(coroutine.create(function()
				for i = 0, 1, 0.1 do
					swait()
					Effects.Block.Create(BrickColor.new("Black"), hit.Parent.Torso.CFrame, 5, 5, 5, 1, 1, 1, .08, 1)
				end
			end))
			local bodyVelocity = Create("BodyVelocity"){
				velocity = Vector3.new(0, 20, 0),
				P = 5000,
				maxForce = Vector3.new(8e+003, 8e+003, 8e+003),
				Parent = hit,
			}
			game:GetService("Debris"):AddItem(bodyVelocity, 1)
		elseif Type == "Snare" then
			local bp = Create("BodyPosition"){
				P = 2000,
				D = 100,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			game:GetService("Debris"):AddItem(bp, 1)
		elseif Type == "Freeze" then
			local BodPos = Create("BodyPosition"){
				P = 50000,
				D = 1000,
				maxForce = Vector3.new(math.huge, math.huge, math.huge),
				position = hit.Parent.Torso.Position,
				Parent = hit.Parent.Torso,
			}
			local BodGy = Create("BodyGyro") {
				maxTorque = Vector3.new(4e+005, 4e+005, 4e+005) * math.huge ,
				P = 20e+003,
				Parent = hit.Parent.Torso,
				cf = hit.Parent.Torso.CFrame,
			}
			hit.Parent.Torso.Anchored = true
			coroutine.resume(coroutine.create(function(Part) 
				swait(1.5)
				Part.Anchored = false
			end), hit.Parent.Torso)
			game:GetService("Debris"):AddItem(BodPos, 3)
			game:GetService("Debris"):AddItem(BodGy, 3)
		end
		if Delay > 0 then
			local debounce = Create("BoolValue"){
				Name = "DebounceHit",
				Parent = hit.Parent,
				Value = true,
			}
			game:GetService("Debris"):AddItem(debounce, Delay)
		end

		c = Create("ObjectValue"){
			Name = "creator",
			Value = Player,
			Parent = h,
		}
		game:GetService("Debris"):AddItem(c, .5)
	end
end

function ShowDamage(Pos, Text, Time, Color)
	local Rate = (1 / 30)
	local Pos = (Pos or Vector3.new(0, 0, 0))
	local Text = (Text or "")
	local Time = (Time or 2)
	local Color = (Color or Color3.new(1, 0, 1))
	local EffectPart = CFuncs.Part.Create(workspace, "SmoothPlastic", 0, 1, BrickColor.new(Color), "Effect", Vector3.new(0, 0, 0))
	EffectPart.Anchored = true
	local BillboardGui = Create("BillboardGui"){
		Size = UDim2.new(3, 0, 3, 0),
		Adornee = EffectPart,
		Parent = EffectPart,
	}
	local TextLabel = Create("TextLabel"){
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Text = Text,
		Font = "SourceSansLight",
		TextColor3 = Color,
		TextScaled = true,
		Parent = BillboardGui,
	}
	game.Debris:AddItem(EffectPart, (Time))
	EffectPart.Parent = game:GetService("Workspace")
	delay(0, function()
		local Frames = (Time / Rate)
		for Frame = 1, Frames do
			wait(Rate)
			local Percent = (Frame / Frames)
			EffectPart.CFrame = CFrame.new(Pos) + Vector3.new(0, Percent, 0)
			TextLabel.TextTransparency = Percent
		end
		if EffectPart and EffectPart.Parent then
			EffectPart:Destroy()
		end
	end)
end

function MagnitudeDamage(Part, Magnitude, MinimumDamage, MaximumDamage, KnockBack, Type, HitSound, HitPitch)
	for _, c in pairs(workspace:children()) do
		local hum = c:findFirstChild("Humanoid")
		if hum ~= nil then
			local head = c:findFirstChild("Torso")
			if head ~= nil then
				local targ = head.Position - Part.Position
				local mag = targ.magnitude
				if mag <= Magnitude and c.Name ~= Player.Name then 
					Damage(head, head, MinimumDamage, MaximumDamage, KnockBack, Type, RootPart, 0, "rbxassetid://" .. HitSound, HitPitch)
				end
			end
		end
	end
end

EffectModel = Create("Model"){
	Parent = Character,
	Name = "EffectModel",
}

Effects = {
	Block = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Type, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			if Type == 1 or Type == nil then
				table.insert(Effects, {
					prt,
					"Block1",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 2 then
				table.insert(Effects, {
					prt,
					"Block2",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			elseif Type == 3 then
				table.insert(Effects, {
					prt,
					"Block3",
					delay,
					x3,
					y3,
					z3,
					msh,
					Part
				})
			elseif Type == 4 then
				table.insert(Effects, {
					prt,
					"Block2Fire",
					delay,
					x3,
					y3,
					z3,
					msh
				})
			end
		end
	};

	Sphere = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, parent)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			if parent == nil then
				prt.Parent = workspace
			else
				prt.Parent = parent
			end
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blood = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Blood",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Blast = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay, Part)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "1323306", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Block4",
				delay,
				x3,
				y3,
				z3,
				msh,
				Part
			})
		end
	};

	Ring = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "3270017", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Cylinder = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Head = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Head", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Wave = {
		Create = function(brickcolor, cframe, x1, y1, z1, x3, y3, z3, delay)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new())
			prt.Anchored = true
			prt.CFrame = cframe
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "FileMesh", "20329976", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			game:GetService("Debris"):AddItem(prt, 10)
			table.insert(Effects, {
				prt,
				"Cylinder",
				delay,
				x3,
				y3,
				z3,
				msh
			})
		end
	};

	Break = {
		Create = function(brickcolor, cframe, x1, y1, z1)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Effect", Vector3.new(0.5, 0.5, 0.5))
			prt.Anchored = true
			prt.CFrame = cframe * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
			game:GetService("Debris"):AddItem(prt, 10)
			local msh = CFuncs.Mesh.Create("SpecialMesh", prt, "Sphere", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
			local num = math.random(10, 50) / 1000
			table.insert(Effects, {
				prt,
				"Shatter",
				num,
				prt.CFrame,
				math.random() - math.random(),
				0,
				math.random(50, 100) / 100
			})
		end
	};

	Elec = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 9
			yval = math.random() / 9
			zval = math.random() / 9
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.05,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Elec2 = {
		Create = function(brickcolor, cff, x, y, z)
			local prt = CFuncs.Part.Create(EffectModel, "Neon", 0, 0, brickcolor, "Part", Vector3.new(1, 1, 1))
			prt.Anchored = true
			prt.CFrame = cff * CFrame.new(math.random(-x * 100, x * 100) / 100, math.random(-y * 100, y * 100) / 100, math.random(-z * 100, z * 100) / 100)
			prt.CFrame = CFrame.new(prt.Position)
			game:GetService("Debris"):AddItem(prt, 10)
			xval = math.random() / 7
			yval = math.random() / 7
			zval = math.random() / 7
			msh = CFuncs.Mesh.Create("BlockMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(xval, yval, zval))
			eul1 = math.random(-50, 50)
			eul2 = math.random(-50, 50)
			eul3 = math.random(-50, 50)
			euld = CFrame.fromEulerAnglesXYZ(eul1, eul2, eul3)
			euld2 = CFrame.fromEulerAnglesXYZ(-eul1, -eul2, -eul3)
			table.insert(Effects, {
				prt,
				"Elec",
				.1,
				x,
				y,
				z,
				xval,
				yval,
				zval,
				msh,
				euld,
				euld2
			})
		end
	};

	Clone = {
		Create = function() 
			for _, v in pairs(Torso.Parent:children()) do
				if v.className == "Part" and v.Name ~= "HumanoidRootPart" then
					local c = CFuncs.Part.Create(EffectModel, "Neon", 0, .5, BrickColor.new("Bright blue"), "Effect", v.Size)
					c.Anchored = true
					c.CFrame = v.CFrame
					game:GetService("Debris"):AddItem(c, 5)
					local cmsh = nil
					if v.Name == "Head" then
						cmsh = CFuncs.Mesh.Create("SpecialMesh", c, "Head", "", Vector3.new(0, 0, 0), v.Mesh.Scale)
					else
						cmsh = CFuncs.Mesh.Create("BlockMesh", c, "", "", Vector3.new(0, 0, 0), Vector3.new(1, 1, 1))
					end
					table.insert(Effects, {
						c,
						"Cylinder",
						0.05,
						0.1,
						0.1,
						0.1,
						cmsh
					})
				end
			end
		end
	};

	EffectTemplate = {

	};
}


Laser = function(brickcolor, reflect, cframe, x1, y1, z1, x3, y3, z3, delay)

	prt = CFuncs.Part.Create(EffectModel, "SmoothPlastic", reflect, 0, brickcolor, "Effect", Vector3.new(.1, 0.5, 0.1))
	prt.Anchored = true
	prt.CFrame = cframe
	prt.Material = "Neon"
	local msh = CFuncs.Mesh.Create("CylinderMesh", prt, "", "", Vector3.new(0, 0, 0), Vector3.new(x1, y1, z1))
	game:GetService("Debris"):AddItem(prt, 1)
	coroutine.resume(coroutine.create(function(Part, Mesh)

		for i = 0, 1, delay do
			swait()
			Part.Transparency = i
			Mesh.Scale = Mesh.Scale + Vector3.new(x3, y3, z3)
		end
		Part.Parent = nil
	end
	), prt, msh)
end

wshoot = function(mouse, aoe , partt, SpreadAmount, multiply)

	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1000
	local num = .5
	coroutine.resume(coroutine.create(function()

		repeat
			swait()
			local hit, pos = RayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude                                                            
			Laser(BrickColor.new("Gold"), 0, CFrame.new((MainPos + pos)/2, pos) * CFrame.Angles(1.57, 0, 0), 5, mag * (speed / (speed / 2)), .2, .2, 0, .2, 0.1)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				if hit.Name == "Torso" or hit.Name == "Right Leg" or hit.Name == "Left Leg" or hit.Name == "Right Arm" or hit.Name == "Left Arm" then
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					local hitsound = math.random(1,3)
					if hitsound == 1 then
						CFuncs.Sound.Create("898398743", refpart, .5, 1)
					elseif hitsound == 2 then
						CFuncs.Sound.Create("898398730", refpart, .5, 1)	
					elseif hitsound == 3 then
						CFuncs.Sound.Create("898398706", refpart, .5, 1)
					end
					local smonk = Instance.new("ParticleEmitter",refpart)
					smonk.LightEmission = .1
					smonk.Size = NumberSequence.new(0.2)
					smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
					aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1)})
					bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
					smonk.Transparency = bbb
					smonk.Size = aaa
					smonk.ZOffset = 0
					smonk.Acceleration = Vector3.new(0, -5, 0)
					smonk.LockedToPart = false
					smonk.EmissionDirection = "Back"
					smonk.Lifetime = NumberRange.new(.1, .5)
					smonk.Rate = 50
					smonk.Rotation = NumberRange.new(-100, 100)
					smonk.RotSpeed = NumberRange.new(-100, 100)
					smonk.Speed = NumberRange.new(4)
					smonk.VelocitySpread = 50
					smonk.Enabled=true
					game:GetService("Debris"):AddItem(smonk, .3)
				elseif hit.Name == "Head" then
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					game:GetService("Debris"):AddItem(refpart, 2)
					local smonk = Instance.new("ParticleEmitter",refpart)
					smonk.LightEmission = .1
					smonk.Size = NumberSequence.new(0.2)
					smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
					aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1.5)})
					bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
					smonk.Transparency = bbb
					smonk.Size = aaa
					smonk.ZOffset = 0
					smonk.Acceleration = Vector3.new(0, -5, 0)
					smonk.LockedToPart = false
					smonk.EmissionDirection = "Back"
					smonk.Lifetime = NumberRange.new(.1, .5)
					smonk.Rate = 50
					smonk.Rotation = NumberRange.new(-100, 100)
					smonk.RotSpeed = NumberRange.new(-100, 100)
					smonk.Speed = NumberRange.new(4)
					smonk.VelocitySpread = 100
					smonk.Enabled=true
					game:GetService("Debris"):AddItem(smonk, .3)
				else
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					CFuncs.Sound.Create("342190504", prt, 1, 1)
					game:GetService("Debris"):AddItem(refpart, 0)		
				end
			end
			do
				if num <= 0 then
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 1, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						--MagnitudeDamage(refpart, 5, 2, 2, .01, "Normal", " ", 1)			
					end
					game:GetService("Debris"):AddItem(refpart, 1)
				end
			end
		until num <= 0
	end
	))
end



shoot = function(mouse, aoe , partt, SpreadAmount, multiply)

	local SpreadVectors = Vector3.new(math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount), math.random(-SpreadAmount, SpreadAmount))
	local MainPos = partt.Position
	local MainPos2 = mouse.Hit.p + SpreadVectors
	local MouseLook = CFrame.new((MainPos + MainPos2) / 2, MainPos2)
	local speed = 1000
	local num = .5
	coroutine.resume(coroutine.create(function()

		repeat
			swait()
			local hit, pos = RayCast(MainPos, MouseLook.lookVector, speed, RootPart.Parent)
			local mag = (MainPos - pos).magnitude                                                            
			Laser(BrickColor.new("Gold"), 0, CFrame.new((MainPos + pos)/2, pos) * CFrame.Angles(1.57, 0, 0), 5, mag * (speed / (speed / 2)), .2, .2, 0, .2, 0.1)
			MainPos = MainPos + MouseLook.lookVector * speed
			num = num - 1
			MouseLook = MouseLook * CFrame.Angles(math.rad(-1), 0, 0)
			if hit ~= nil then
				if hit.Name == "Torso" or hit.Name == "Right Leg" or hit.Name == "Left Leg" or hit.Name == "Right Arm" or hit.Name == "Left Arm" then
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					local hitsound = math.random(1,3)
					if hitsound == 1 then
						CFuncs.Sound.Create("898398743", refpart, .5, 1)
					elseif hitsound == 2 then
						CFuncs.Sound.Create("898398730", refpart, .5, 1)	
					elseif hitsound == 3 then
						CFuncs.Sound.Create("898398706", refpart, .5, 1)
					end
					local smonk = Instance.new("ParticleEmitter",refpart)
					smonk.LightEmission = .1
					smonk.Size = NumberSequence.new(0.2)
					smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
					aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1)})
					bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
					smonk.Transparency = bbb
					smonk.Size = aaa
					smonk.ZOffset = 0
					smonk.Acceleration = Vector3.new(0, -5, 0)
					smonk.LockedToPart = false
					smonk.EmissionDirection = "Back"
					smonk.Lifetime = NumberRange.new(.1, .5)
					smonk.Rate = 50
					smonk.Rotation = NumberRange.new(-100, 100)
					smonk.RotSpeed = NumberRange.new(-100, 100)
					smonk.Speed = NumberRange.new(4)
					smonk.VelocitySpread = 50
					smonk.Enabled=true
					game:GetService("Debris"):AddItem(smonk, .3)
				elseif hit.Name == "Head" then
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					game:GetService("Debris"):AddItem(refpart, 2)
					local smonk = Instance.new("ParticleEmitter",refpart)
					smonk.LightEmission = .1
					smonk.Size = NumberSequence.new(0.2)
					smonk.Texture = "http://www.roblox.com/asset/?ID=256293532"
					aaa = NumberSequence.new({NumberSequenceKeypoint.new(0, .2),NumberSequenceKeypoint.new(1, 1.5)})
					bbb = NumberSequence.new({NumberSequenceKeypoint.new(0, .3),NumberSequenceKeypoint.new(0.0636, 0), NumberSequenceKeypoint.new(1, 1)})
					smonk.Transparency = bbb
					smonk.Size = aaa
					smonk.ZOffset = 0
					smonk.Acceleration = Vector3.new(0, -5, 0)
					smonk.LockedToPart = false
					smonk.EmissionDirection = "Back"
					smonk.Lifetime = NumberRange.new(.1, .5)
					smonk.Rate = 50
					smonk.Rotation = NumberRange.new(-100, 100)
					smonk.RotSpeed = NumberRange.new(-100, 100)
					smonk.Speed = NumberRange.new(4)
					smonk.VelocitySpread = 100
					smonk.Enabled=true
					game:GetService("Debris"):AddItem(smonk, .3)
				else
					num = 0
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 0, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					CFuncs.Sound.Create("342190504", prt, 1, 1)
					game:GetService("Debris"):AddItem(refpart, 0)		
				end
			end
			do
				if num <= 0 then
					local refpart = CFuncs.Part.Create(EffectModel, "SmoothPlastic", 1, 1, "Really black", "Effect", Vector3.new())
					refpart.Anchored = true
					refpart.CFrame = CFrame.new(pos)
					if hit ~= nil then
						--MagnitudeDamage(refpart, 3, 2, 5, 0, "Normal", " ", 1)			
					end
					game:GetService("Debris"):AddItem(refpart, 1)
				end
			end
		until num <= 0
	end
	))
end





function fire()
	Attack = true	
	Humanoid.WalkSpeed = 8
	Humanoid.JumpPower = 0
	Humanoid.AutoRotate = false
	local bodygyro = Instance.new("BodyGyro",RootPart)
	bodygyro.MaxTorque = Vector3.new(50000,50000,50000)
	bodygyro.P = 8000
	CFuncs.Sound.Create("873073703", Handle, 1, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.757158816, 0.024620086, -0.316807836, 0.00376787782, -0.197771132, 0.98024106, -0.0522153527, 0.978872001, 0.197695583, -0.998628855, -0.0519285128, -0.00663840771) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),  
			CFrame.new(0.0513084419, 1.52798402, -0.0491129272, 0.503341198, 0.0593924709, -0.862044334, -0.0388650261, 0.998181403, 0.0460789353, 0.86321336, 0.0103099495, 0.504734159) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.62060225, 0.561005533, -0.67263329, 0.184799463, -0.818805337, -0.543513656, -0.980174243, -0.113341682, -0.162518218, 0.0714680403, 0.56277138, -0.823517323) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.181243077, 0.716829836, -0.982703269, 0.117607087, -0.980847061, -0.15526706, -0.30332914, 0.113398649, -0.946114302, 0.945600331, 0.158366859, -0.284183025) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628674686, -1.98509169, -0.25950858, 1.00000024, 0, 0, -7.4505806e-09, 0.98480773, -0.173648342, -2.98023224e-08, 0.173648342, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.442586422, -1.94206905, -0.503501356, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
	end

	AmmoCount = AmmoCount - AmmoUsage
	for i = 0, 9, 1 do
		shoot(Mouse, 3 , bulletmaker, .15 + (Torso.Position - Mouse.Hit.p).magnitude/math.random(17,20) , 0)
	end
	Torso.Velocity=RootPart.CFrame.lookVector*-20
	Effects.Block.Create(BrickColor.new("Flame reddish orange"), bulletmaker.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
	CFuncs.Sound.Create("1132379030", Handle, 1, 1)
	bodygyro:Destroy()
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.588929892, -1.11013651e-06, -0.0153462738, 0.466293842, -0.234925136, 0.85287708, 0.171010062, 0.969846427, 0.17364794, -0.867954016, 0.0648796037, 0.492407978) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.160780251, 1.50000441, 0.0393266231, 0.488946259, -0.0697783977, -0.869518578, -0.125678584, 0.980760813, -0.149376884, 0.863213003, 0.182317138, 0.470769644) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.67061281, 0.704267323, -0.691583157, 0.423231184, -0.709484339, -0.563477933, -0.879032731, -0.472217411, -0.065669328, -0.219492719, 0.52310884, -0.823517084) * CFrame.new(-.2, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.0540117994, 0.73741293, -0.982708097, 0.0631480217, -0.978079677, 0.198425397, -0.319141895, -0.208172753, -0.924560905, 0.945600986, -0.00494170189, -0.325291872) * CFrame.new(0, 1, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.378202379, -1.77786493, -0.298971295, 0.837791204, 0.33804059, -0.428759336, -0.235888705, 0.932314754, 0.274127543, 0.492404819, -0.128522187, 0.860825062) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.773099661, -1.83571112, -0.503498793, 0.964610457, 0.171010062, -0.200704694, -0.200705469, 0.969846427, -0.138258308, 0.171009183, 0.17364794, 0.969846606) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Humanoid.AutoRotate = true
	CFuncs.Sound.Create("131072992", Handle, 1, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.588927984, -1.34110451e-07, -0.0153470635, 0.500004232, -0.15038535, 0.852876961, 0, 0.98480773, 0.173648342, -0.86603415, -0.0868248865, 0.492408037) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.0697273612, 1.49668336, 0.0200494975, 0.503342092, 0.208182395, -0.838634133, -0.0388649404, 0.975015461, 0.218711212, 0.863212883, -0.0774930716, 0.49885726) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.51687121, 0.252128333, -0.305914342, -0.106392592, -0.288472205, -0.951559067, -0.959828019, 0.279683411, 0.0225289911, 0.259636283, 0.915729821, -0.306639969) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.342295825, 0.26239565, -1.10844982, 0.117607087, -0.938983917, -0.323230654, -0.30332914, 0.275967002, -0.912049174, 0.945600331, 0.205308735, -0.2523655) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.54057467, -1.946859, -0.234844446, 0.866025031, 0, -0.500000834, -0.0868243054, 0.98480773, -0.15038377, 0.49240464, 0.173648342, 0.85286808) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258678, -1.94206941, -0.503499508, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	local shell = CFuncs.Part.Create(EffectModel, "SmoothPlastic", .1, 0, "Bright red", "Effect", Vector3.new(.5,.8,.5))
	local shllmsh = CFuncs.Mesh.Create("CylinderMesh", shell, "", "", Vector3.new(0, 0, 0), Vector3.new(.3, .4, .3))
	shell.Anchored = false
	shell.Position = Shellmaker.Position
	shell.CanCollide = true
	shell.Velocity=RootPart.CFrame.rightVector*20
	game:GetService("Debris"):AddItem(shell, 3)
	local shellsound = math.random(1,2)
	if shellsound == 1 then
		CFuncs.Sound.Create("1132378823", shell, .5, 1)
	elseif shellsound  == 2 then
		CFuncs.Sound.Create("1132378791", shell, .5, 1)
	end
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.588927984, -1.34110451e-07, -0.0153470635, 0.500004232, -0.15038535, 0.852876961, 0, 0.98480773, 0.173648342, -0.86603415, -0.0868248865, 0.492408037) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.0697273612, 1.49668336, 0.0200494975, 0.503342092, 0.208182395, -0.838634133, -0.0388649404, 0.975015461, 0.218711212, 0.863212883, -0.0774930716, 0.49885726) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.64014888, 0.224238992, -0.403565288, 0.0212229788, -0.603865683, -0.796803713, -0.989261985, 0.102589145, -0.104097351, 0.144604191, 0.790456831, -0.595203996) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.522896647, 0.315473199, -1.06896186, 0.117607087, -0.938983917, -0.323230654, -0.30332914, 0.275967002, -0.912049174, 0.945600331, 0.205308735, -0.2523655) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.54057467, -1.946859, -0.234844446, 0.866025031, 0, -0.500000834, -0.0868243054, 0.98480773, -0.15038377, 0.49240464, 0.173648342, 0.85286808) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258678, -1.94206941, -0.503499508, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	for i = 0, .2, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.038382329, -2.14204192e-08, -0.0314837135, 0.984807849, 0.0301536452, 0.171009868, 0, 0.98480773, -0.173648119, -0.173647985, 0.171010017, 0.969846368) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0 + 0.005 * math.cos(Sine/25), 0), 
			CFrame.new(-0.00987245888, 1.54137087, -0.232474566, 0.983905733, 0.0593912564, -0.168529823, 0.000888057693, 0.941511214, 0.336980611, 0.17868638, -0.331706822, 0.926305413) * CFrame.new(0, 0, 0) * CFrame.Angles(0 - 0.05 * math.cos(Sine/25), 0, 0), 
			CFrame.new(1.00599754, 0.00645497441, -0.987730443, 0.387630165, 0.322637081, -0.863509297, -0.802340508, 0.579304218, -0.143723249, 0.453864068, 0.748539925, 0.483420581) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.927108586, 0.209949538, -0.179899275, 0.68265909, -0.539921403, -0.492403984, -0.24406442, 0.4666816, -0.850082874, 0.688773632, 0.700495183, 0.18680881) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628665984, -2.00964737, 0.120245621, 1.00000012, 0, 0, 1.86264515e-09, 0.98480773, 0.173648119, 0, -0.173648119, 0.984807849) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258371, -1.99715459, 0.19109571, 0.939692676, 0, 0.342020601, -0.0593912229, 0.98480773, 0.163175851, -0.336824536, -0.173648119, 0.925416529) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false
end


function dryfire()
	Attack = true	
	Humanoid.WalkSpeed = 8
	Humanoid.JumpPower = 0
	Humanoid.AutoRotate = false
	local bodygyro = Instance.new("BodyGyro",RootPart)
	bodygyro.MaxTorque = Vector3.new(50000,50000,50000)
	bodygyro.P = 8000
	CFuncs.Sound.Create("873073703", Handle, 1, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.757158816, 0.024620086, -0.316807836, 0.00376787782, -0.197771132, 0.98024106, -0.0522153527, 0.978872001, 0.197695583, -0.998628855, -0.0519285128, -0.00663840771) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),  
			CFrame.new(0.0513084419, 1.52798402, -0.0491129272, 0.503341198, 0.0593924709, -0.862044334, -0.0388650261, 0.998181403, 0.0460789353, 0.86321336, 0.0103099495, 0.504734159) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.62060225, 0.561005533, -0.67263329, 0.184799463, -0.818805337, -0.543513656, -0.980174243, -0.113341682, -0.162518218, 0.0714680403, 0.56277138, -0.823517323) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.181243077, 0.716829836, -0.982703269, 0.117607087, -0.980847061, -0.15526706, -0.30332914, 0.113398649, -0.946114302, 0.945600331, 0.158366859, -0.284183025) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628674686, -1.98509169, -0.25950858, 1.00000024, 0, 0, -7.4505806e-09, 0.98480773, -0.173648342, -2.98023224e-08, 0.173648342, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.442586422, -1.94206905, -0.503501356, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
	end
	CFuncs.Sound.Create("132464034", Handle, 1, 1)
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.757158816, 0.024620086, -0.316807836, 0.00376787782, -0.197771132, 0.98024106, -0.0522153527, 0.978872001, 0.197695583, -0.998628855, -0.0519285128, -0.00663840771) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),  
			CFrame.new(0.0513084419, 1.52798402, -0.0491129272, 0.503341198, 0.0593924709, -0.862044334, -0.0388650261, 0.998181403, 0.0460789353, 0.86321336, 0.0103099495, 0.504734159) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.62060225, 0.561005533, -0.67263329, 0.184799463, -0.818805337, -0.543513656, -0.980174243, -0.113341682, -0.162518218, 0.0714680403, 0.56277138, -0.823517323) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.181243077, 0.716829836, -0.982703269, 0.117607087, -0.980847061, -0.15526706, -0.30332914, 0.113398649, -0.946114302, 0.945600331, 0.158366859, -0.284183025) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628674686, -1.98509169, -0.25950858, 1.00000024, 0, 0, -7.4505806e-09, 0.98480773, -0.173648342, -2.98023224e-08, 0.173648342, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.442586422, -1.94206905, -0.503501356, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
	end
	bodygyro:Destroy()
	Humanoid.AutoRotate = true
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false
end







function relode()
	relodee = true
	Attack = true
	
	Humanoid.WalkSpeed = 5
	CFuncs.Sound.Create("1132378728", Handle, .5, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.038382329, -2.14204192e-08, -0.0314837135, 0.984807849, 0.0301536452, 0.171009868, 0, 0.98480773, -0.173648119, -0.173647985, 0.171010017, 0.969846368) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0 + 0.005 * math.cos(Sine/25), 0),  
			CFrame.new(-0.100350231, 1.4967103, -0.061891377, 0.64132297, 0.208182856, -0.738488197, -0.0762534291, 0.975015342, 0.208640277, 0.763472557, -0.0774935335, 0.641174316) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),  
			CFrame.new(1.07593381, -0.046435535, 0.399106979, -0.603867352, -0.0212483108, -0.796801686, 0.102590129, 0.989258587, -0.104129925, 0.790455341, -0.144624621, -0.595201015) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.52289784, 0.315474898, -1.0689652, 0.117606997, -0.938983917, -0.323230416, -0.303329468, 0.275966793, -0.912049174, 0.945600212, 0.205308646, -0.252365857) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628665984, -2.00964737, 0.120245621, 1.00000012, 0, 0, 1.86264515e-09, 0.98480773, 0.173648119, 0, -0.173648119, 0.984807849) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258371, -1.99715459, 0.19109571, 0.939692676, 0, 0.342020601, -0.0593912229, 0.98480773, 0.163175851, -0.336824536, -0.173648119, 0.925416529) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(5), math.rad(90)), 0.3)
	end	
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.038382329, -2.14204192e-08, -0.0314837135, 0.984807849, 0.0301536452, 0.171009868, 0, 0.98480773, -0.173648119, -0.173647985, 0.171010017, 0.969846368) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0 + 0.005 * math.cos(Sine/25), 0),  
			CFrame.new(-0.100350231, 1.4967103, -0.061891377, 0.64132297, 0.208182856, -0.738488197, -0.0762534291, 0.975015342, 0.208640277, 0.763472557, -0.0774935335, 0.641174316) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.28816545, 0.371927321, -0.785959482, 0.833941579, -0.0145216882, -0.551661849, -0.529568017, -0.302267253, -0.79258585, -0.155239552, 0.953112662, -0.25976342) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.522895455, 0.31547451, -1.06896842, -0.0472328961, -0.986910462, -0.154198274, -0.250799775, 0.161142588, -0.954532683, 0.966886103, -0.0064124465, -0.255128086) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.628665984, -2.00964737, 0.120245621, 1.00000012, 0, 0, 1.86264515e-09, 0.98480773, 0.173648119, 0, -0.173648119, 0.984807849) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258371, -1.99715459, 0.19109571, 0.939692676, 0, 0.342020601, -0.0593912229, 0.98480773, 0.163175851, -0.336824536, -0.173648119, 0.925416529) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(5), math.rad(90)), 0.3)
	end
	AmmoCount = AmmoCount + AmmoUsage
	print(AmmoCount)
	CFuncs.Sound.Create("1001714844", Handle, 1, 1)
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	
	Attack = false
	relodee = false
end


function hop()
	SecondaryBread = true
	Attack = true
	CFuncs.Sound.Create("158149887", Torso, 1, 1)
	Humanoid.Jump = true
	Humanoid.JumpPower = 60
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Torso.Velocity=RootPart.CFrame.lookVector*100
	for i = 0, .9, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.708232701, 0.127894983, 0.246774122, 0.76604414, -0.111618884, 0.633022666, 0, 0.984807849, 0.173648044, -0.642788053, -0.13302207, 0.754406214) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.0324593484, 1.43977821, -0.119624585, 0.995960355, -0.0868238062, -0.0229113102, 0.0894833133, 0.938373625, 0.333838284, -0.00748568773, -0.334539831, 0.942351937) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.69410944, 0.329396009, -0.667013586, 0.977326989, -0.133022755, 0.164733544, 0.196574897, 0.280932605, -0.939380229, 0.0786799788, 0.95046401, 0.30071193) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.50714529, 0.0157378055, -0.431941032, 0.884520769, 0.235685706, -0.402585804, -0.362369925, 0.890611291, -0.274772465, 0.29378742, 0.388926923, 0.873169541) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.618915975, -1.85825384, -0.515439391, 0.98480773, 0.173648864, -1.81794167e-06, -0.17101045, 0.969846725, 0.173646331, 0.0301553011, -0.171007901, 0.984808087) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.523646474, -1.39458823, -0.171092927, 0.939692676, 0.342020273, 3.57627869e-07, -0.262003183, 0.719847083, 0.642786682, 0.219845772, -0.604022026, 0.766045213) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Torso.Velocity=RootPart.CFrame.upVector*0
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false	
	SecondaryBread = false
end



function pump()
	relodee = true
	Attack = true
	
	Humanoid.WalkSpeed = 8
	CFuncs.Sound.Create("131072992", Handle, 1, 1)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.588927984, -1.34110451e-07, -0.0153470635, 0.500004232, -0.15038535, 0.852876961, 0, 0.98480773, 0.173648342, -0.86603415, -0.0868248865, 0.492408037) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.0697273612, 1.49668336, 0.0200494975, 0.503342092, 0.208182395, -0.838634133, -0.0388649404, 0.975015461, 0.218711212, 0.863212883, -0.0774930716, 0.49885726) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.51687121, 0.252128333, -0.305914342, -0.106392592, -0.288472205, -0.951559067, -0.959828019, 0.279683411, 0.0225289911, 0.259636283, 0.915729821, -0.306639969) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.342295825, 0.26239565, -1.10844982, 0.117607087, -0.938983917, -0.323230654, -0.30332914, 0.275967002, -0.912049174, 0.945600331, 0.205308735, -0.2523655) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.54057467, -1.946859, -0.234844446, 0.866025031, 0, -0.500000834, -0.0868243054, 0.98480773, -0.15038377, 0.49240464, 0.173648342, 0.85286808) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258678, -1.94206941, -0.503499508, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-5), math.rad(90)), 0.3)
	end
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.588927984, -1.34110451e-07, -0.0153470635, 0.500004232, -0.15038535, 0.852876961, 0, 0.98480773, 0.173648342, -0.86603415, -0.0868248865, 0.492408037) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.0697273612, 1.49668336, 0.0200494975, 0.503342092, 0.208182395, -0.838634133, -0.0388649404, 0.975015461, 0.218711212, 0.863212883, -0.0774930716, 0.49885726) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.64014888, 0.224238992, -0.403565288, 0.0212229788, -0.603865683, -0.796803713, -0.989261985, 0.102589145, -0.104097351, 0.144604191, 0.790456831, -0.595203996) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.522896647, 0.315473199, -1.06896186, 0.117607087, -0.938983917, -0.323230654, -0.30332914, 0.275967002, -0.912049174, 0.945600331, 0.205308735, -0.2523655) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.54057467, -1.946859, -0.234844446, 0.866025031, 0, -0.500000834, -0.0868243054, 0.98480773, -0.15038377, 0.49240464, 0.173648342, 0.85286808) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.44258678, -1.94206941, -0.503499508, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-5), math.rad(90)), 0.3)
	end	
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false
	relodee = false
end


function patchedup()
	Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
	for i = 0, .5, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.0266105551, -0.00228797412, -0.00301300199, 0.984924495, 0.00856173038, 0.172772706, -0.0739319623, 0.923793733, 0.375685036, -0.156389832, -0.382794857, 0.91050005) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.0833636597, 1.5589056, -0.0514357612, 0.983785033, 0.098459132, -0.149909437, -0.0804414302, 0.989283204, 0.121852726, 0.160300359, -0.107818037, 0.98116219) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.75938904, 0.357653558, -0.556756616, 0.863215625, -0.470763803, -0.182319537, -0.20867531, -0.00388178229, -0.977977395, 0.459688604, 0.882250845, -0.101587564) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.14530098, -0.0176402628, -0.497072637, 0.927982748, -0.326782674, -0.179056004, 0.238273218, 0.889843524, -0.389107317, 0.286485285, 0.318420619, 0.903622985) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.600150764, -1.42493248, -0.842450619, 0.983785033, 0.0984595343, -0.149909154, -0.0804414302, 0.989282846, 0.121855408, 0.160300359, -0.10782069, 0.981161833) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.608668685, -1.83582413, -0.778081357, 0.983785033, 0.0412500128, -0.174543589, -0.0804414302, 0.971299112, -0.22384648, 0.160300359, 0.234257326, 0.958867729) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end

	local heals2 = Instance.new("ParticleEmitter",LeftArm)
	heals2.Size = NumberSequence.new(.5,0)
	heals2.Texture = "rbxassetid://242856226"
	heals2.ZOffset = 0
	heals2.Acceleration = Vector3.new(0, -5, 0)
	heals2.Lifetime = NumberRange.new(1)
	heals2.Rate = 5
	heals2.Rotation = NumberRange.new(0, 0)
	heals2.RotSpeed = NumberRange.new(0, 0)
	heals2.Speed = NumberRange.new(2)
	heals2.VelocitySpread = 10
	heals2.Enabled=true
	heals2.EmissionDirection = "Front"
	local particol1 = Color3.new(0,1,0)
	local particol2 = Color3.new(1,1,1)
	heals2.Color = ColorSequence.new(particol1,particol2)
	game:GetService("Debris"):AddItem(heals2, 3.5)
	CFuncs.Sound.Create("1489909826", LeftArm, 1, .9)
	for i = 0, 4, 1 do
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(-0, -1.04790533, -1.78813934e-07, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0 + 0.005 * math.cos(Sine/25), 0), 
				CFrame.new(0, 1.53909004, -0.194619089, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0 - 0.08 * math.cos(Sine/25), 0), 
				CFrame.new(0.587695718, 0.719740391, -0.886763453, -0.226821065, 0.740158081, -0.633023083, -0.919379234, -0.377204776, -0.111617722, -0.321394086, 0.556670964, 0.766043901) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.178292572, 0.354673386, -1.05802333, 0.173647001, -0.984807968, 0, 0, 0, -1, 0.984807968, 0.173647001, 0) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.05 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.50897241, 0.416451782, 1, 0, 0, 0, 0.173647985, 0.984807849, 0, -0.984807849, 0.173647985) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.0367974, -0.558902025, 1, 0, -0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
		end
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(-0, -1.04790533, -1.78813934e-07, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0 + 0.005 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.53909004, -0.194619089, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0 - 0.08 * math.cos(Sine/25), 0), 
				CFrame.new(0.579867244, 0.441816211, -1.01476061, 0.218706101, 0.498854131, -0.838637173, -0.975016475, 0.0774877518, -0.208179355, -0.0388670191, 0.863215089, 0.503337979) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.178292572, 0.354673386, -1.05802333, 0.173647001, -0.984807968, 0, 0, 0, -1, 0.984807968, 0.173647001, 0) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.05 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.50897241, 0.416451782, 1, 0, 0, 0, 0.173647985, 0.984807849, 0, -0.984807849, 0.173647985) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.0367974, -0.558902025, 1, 0, -0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
		end
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({         
				CFrame.new(-0, -1.04790533, -1.78813934e-07, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0 + 0.005 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.53909004, -0.194619089, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0 - 0.08 * math.cos(Sine/25), 0), 
				CFrame.new(0.684166193, 0.417331696, -0.85110873, 0.302008986, 0.453297824, -0.838636816, -0.946748018, 0.245620534, -0.208179712, 0.111619003, 0.856849909, 0.503338397) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.178292572, 0.354673386, -1.05802333, 0.173647001, -0.984807968, 0, 0, 0, -1, 0.984807968, 0.173647001, 0) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.05 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.50897241, 0.416451782, 1, 0, 0, 0, 0.173647985, 0.984807849, 0, -0.984807849, 0.173647985) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.0367974, -0.558902025, 1, 0, -0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
		end
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(-0, -1.04790533, -1.78813934e-07, 1, 0, 0, 0, 0.984807849, 0.173647985, 0, -0.173647985, 0.984807849) * CFrame.new(0, 0 + 0.005 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.53909004, -0.194619089, 1, 0, 0, 0, 0.939692736, 0.342019886, 0, -0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0 - 0.08 * math.cos(Sine/25), 0), 
				CFrame.new(0.889964521, 0.489984095, -0.478169471, 0.218706101, 0.498854131, -0.838637173, -0.975016475, 0.0774877518, -0.208179355, -0.0388670191, 0.863215089, 0.503337979) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.178292572, 0.354673386, -1.05802333, 0.173647001, -0.984807968, 0, 0, 0, -1, 0.984807968, 0.173647001, 0) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.05 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.50897241, 0.416451782, 1, 0, 0, 0, 0.173647985, 0.984807849, 0, -0.984807849, 0.173647985) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.0367974, -0.558902025, 1, 0, -0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
		end
	end
	Attack = false
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	for i = 0, 9, 1 do
		if Humanoid.Health < 100 then 
			Humanoid.Health = Humanoid.Health + 2
			ShowDamage((Head.CFrame * CFrame.new(0, 0, (Torso.Size.Z / 4)).p + Vector3.new(0, 2, 0)), "+2", 1, BrickColor.new("Lime green").Color)			
			CFuncs.Sound.Create("588737722", Torso, .5, 1)
			wait(1)
		end
	end
end


function fireatwill()
	Attack = true	
	Humanoid.WalkSpeed = 8
	Humanoid.AutoRotate = false
	local bodygyro = Instance.new("BodyGyro",RootPart)
	bodygyro.MaxTorque = Vector3.new(50000,50000,50000)
	bodygyro.P = 8000	

	for i = 0, 6, 1 do
		if AmmoCount <= 0 then 
			break
		end	
		Torso.Velocity=RootPart.CFrame.lookVector*-5
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(0.757158816, 0.024620086, -0.316807836, 0.00376787782, -0.197771132, 0.98024106, -0.0522153527, 0.978872001, 0.197695583, -0.998628855, -0.0519285128, -0.00663840771) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),  
				CFrame.new(0.0513084419, 1.52798402, -0.0491129272, 0.503341198, 0.0593924709, -0.862044334, -0.0388650261, 0.998181403, 0.0460789353, 0.86321336, 0.0103099495, 0.504734159) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(1.62060225, 0.561005533, -0.67263329, 0.184799463, -0.818805337, -0.543513656, -0.980174243, -0.113341682, -0.162518218, 0.0714680403, 0.56277138, -0.823517323) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.181243077, 0.716829836, -0.982703269, 0.117607087, -0.980847061, -0.15526706, -0.30332914, 0.113398649, -0.946114302, 0.945600331, 0.158366859, -0.284183025) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.628674686, -1.98509169, -0.25950858, 1.00000024, 0, 0, -7.4505806e-09, 0.98480773, -0.173648342, -2.98023224e-08, 0.173648342, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.442586422, -1.94206905, -0.503501356, 0.984808087, 0, -0.173647165, -0.0301535428, 0.98480773, -0.171010256, 0.171009004, 0.173648342, 0.969846487) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
		end			
		Effects.Block.Create(BrickColor.new("Flame reddish orange"), bulletmaker.CFrame, .5, .5, .5, .5, .5, .5, .1, 1)
		CFuncs.Sound.Create("1132379030", Handle, 1, 1)
		AmmoCount = AmmoCount - AmmoUsage
		for i = 0, 9, 1 do
			wshoot(Mouse, 3 , bulletmaker, .15 + (Torso.Position - Mouse.Hit.p).magnitude/15 , 0)
		end
		for i = 0, .5, 0.1 do
			swait()
			PlayAnimationFromTable({
				CFrame.new(0.588929892, -1.11013651e-06, -0.0153462738, 0.466293842, -0.234925136, 0.85287708, 0.171010062, 0.969846427, 0.17364794, -0.867954016, 0.0648796037, 0.492407978) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.160780251, 1.50000441, 0.0393266231, 0.488946259, -0.0697783977, -0.869518578, -0.125678584, 0.980760813, -0.149376884, 0.863213003, 0.182317138, 0.470769644) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(1.67061281, 0.704267323, -0.691583157, 0.423231184, -0.709484339, -0.563477933, -0.879032731, -0.472217411, -0.065669328, -0.219492719, 0.52310884, -0.823517084) * CFrame.new(-.2, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.0540117994, 0.73741293, -0.982708097, 0.0631480217, -0.978079677, 0.198425397, -0.319141895, -0.208172753, -0.924560905, 0.945600986, -0.00494170189, -0.325291872) * CFrame.new(0, 1, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.378202379, -1.77786493, -0.298971295, 0.837791204, 0.33804059, -0.428759336, -0.235888705, 0.932314754, 0.274127543, 0.492404819, -0.128522187, 0.860825062) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.773099661, -1.83571112, -0.503498793, 0.964610457, 0.171010062, -0.200704694, -0.200705469, 0.969846427, -0.138258308, 0.171009183, 0.17364794, 0.969846606) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			bodygyro.CFrame = CFrame.new(RootPart.Position, Vector3.new(Mouse.Hit.p.X, RootPart.Position.Y, Mouse.Hit.p.Z))
		end
	end
	bodygyro:Destroy()
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Humanoid.AutoRotate = true
	Attack = false

end	

function stanceintro()
	IntroATT = true
	Attack = true
	Humanoid.WalkSpeed = 0
	swait()
	PlayAnimationFromTable({
		CFrame.new(0.401558101, -0.0234151632, 0.119796708, 0.764670074, 0.00020499996, 0.644422114, 0.024826102, 0.999248326, -0.02977648, -0.643943787, 0.0387676619, 0.764090121) * CFrame.new(0,0 + .05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
		CFrame.new(0.0190042555, 1.53773534, -0.193438619, 0.64132297, 0.076782994, -0.763419509, 0.0574810207, 0.987376094, 0.147595912, 0.765114963, -0.138538778, 0.628813386) * CFrame.new(0, 0, 0) * CFrame.Angles(0 - 0.05 * math.cos(Sine/25), 0, 0), 
		CFrame.new(1.56287539, 0.196361139, -0.218576014, -0.0478557944, -0.26976496, -0.961736321, -0.464462936, 0.858424187, -0.217674509, 0.884298742, 0.436273903, -0.166376382) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
		CFrame.new(-0.354559392, 0.216858774, -0.992860973, -0.0544251502, -0.876319766, -0.478645861, -0.108326986, 0.481708944, -0.86961019, 0.992624402, 0.00452160835, -0.121146157) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
		CFrame.new(0.540573061, -1.95806193, 0.106789596, 0.93969214, 0, -0.342021883, 0, 1, 0, 0.342021853, 0, 0.93969208) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
		CFrame.new(-0.461303771, -1.99999595, -0.0524673536, 1.00000012, 0, 0, 0, 1, 0, 0, 0, 1.00000012) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
	}, .3, false)
	fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(90)), 0.3)
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false
	IntroATT = false
end


function quickkick()
	SecondaryBread = true
	Attack = true
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 20
	Humanoid.Jump = true
	for i = 0, .3, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0, 0, -0, 1, 0, -0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.50351071, 0.0460739173, 1, 0, -0, 0, 1.00000012, 0, -0, 0, 1.00000012) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.50000381, 0.0324970335, 0.425725073, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.5, -0.159844279, 0.285122991, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.5, -1.15181708, -0.124861211, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.5, -1.8810792, 0.500639379, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	CFuncs.Sound.Create("200632136", Handle, 1, 1)
	local con = RightLeg.Touched:connect(function(hit)
		Damage(RightLeg, hit, 8, 12, 5, "Normal", RootPart, 0.2, "743521272", 1)end)
	Torso.Velocity=RootPart.CFrame.lookVector*50
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0, 0, -0, 1, 0, -0, 0, 0.939692736, -0.342019886, 0, 0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.56996083, -0.261622638, 1, 0, 0, 0, 0.939692736, 0.342019916, -0, -0.342019886, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.50000381, 0.27931872, 0.728133559, 1, 0, 0, 0, 0.499999821, 0.866025627, -0, -0.866025567, 0.499999821) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.5, 0.34596175, 0.570588231, 1, 0, 0, 0, 0.499999821, 0.866025627, -0, -0.866025567, 0.499999821) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.5, -1.39599705, -1.111431, 1, 0, -0, 0, 0.642786562, -0.766045451, -0, 0.766045451, 0.642786503) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.5, -1.70923471, 0.977958977, 1, 0, 0, 0, 0.499999821, 0.866025627, -0, -0.866025567, 0.499999821) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Torso.Velocity=RootPart.CFrame.lookVector*0
	con:Disconnect()
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	Attack = false
	SecondaryBread = false
end

function hedbap()
	SecondaryBread = true
	Attack = true
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(-0, -0.115550078, 0.250714004, 1, 0, -0, 0, 0.939692736, -0.342019886, 0, 0.342019916, 0.939692736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.51567197, 0.00248532044, 1, 0, -0, 0, 1, 2.98023224e-08, -0, 2.98023224e-08, 1) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.00599754, 0.00645497441, -0.987730443, 0.387630165, 0.322637081, -0.863509297, -0.802340508, 0.579304218, -0.143723249, 0.453864068, 0.748539925, 0.483420581) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.927108586, 0.209949538, -0.179899275, 0.68265909, -0.539921403, -0.492403984, -0.24406442, 0.4666816, -0.850082874, 0.688773632, 0.700495183, 0.18680881) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.5, -1.48346758, 0.057243526, 1, 0, 0, 0, 0.766044796, 0.642787218, -0, -0.642787218, 0.766044855) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.499999523, -1.82032359, 0.395741045, 0.984807849, 0, 0.173647985, -0.0593910702, 0.939692736, 0.33682391, -0.163175747, -0.342019886, 0.925416768) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Torso.Velocity=RootPart.CFrame.lookVector*40
	CFuncs.Sound.Create("200632136", Handle, 1, 1)
	local con = Head.Touched:connect(function(hit)
		
		--print(hit)
		Damage(RightLeg, hit, 15, 18, 3, "Knockdown", RootPart, 0.2, "1296132303", 1) 
		--Humanoid.Health = Humanoid.Health - 5 
	end)
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0, 0.0488227382, -0.156543747, 1, 0, 0, 0, 0.76604414, 0.642788053, 0, -0.642788053, 0.76604414) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0, 1.52236009, -0.201607227, 1, 0, 0, 0, 0.939692438, 0.34202075, 0, -0.34202075, 0.939692438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.00599754, 0.00645497441, -0.987730443, 0.387630165, 0.322637081, -0.863509297, -0.802340508, 0.579304218, -0.143723249, 0.453864068, 0.748539925, 0.483420581) * CFrame.new(0, 0 - 0.1 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.927108586, 0.209949538, -0.179899275, 0.68265909, -0.539921403, -0.492403984, -0.24406442, 0.4666816, -0.850082874, 0.688773632, 0.700495183, 0.18680881) * CFrame.new(0, 0 - 0.1 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.5, -2.03161407, -0.00965765119, 1, 0, 0, 0, 0.98480773, 0.173648447, 0, -0.173648447, 0.98480773) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.5, -1.83802676, -0.920656502, 1, 0, 0, 0, 0.939692438, -0.342020959, 0, 0.342020929, 0.939692438) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	Attack = false
	con:Disconnect()
	SecondaryBread = false
end


function stockcrash()
	SecondaryBread = true
	Attack = true
	Humanoid.WalkSpeed = 5
	Humanoid.JumpPower = 0
	CFuncs.Sound.Create("1073355392", Stockbox, 1, 1)
	for i = 0, 1.5, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.0377655476, -0, -0.109542102, 0.64278698, 0, -0.766044974, 0, 1, 0, 0.766044974, 0, 0.64278698) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-4.17232513e-07, 1.49999011, -3.93390656e-06, 0.856849194, 0.197328225, -0.476309896, -0.163177073, 0.980159342, 0.112521209, 0.489063263, -0.0186908543, 0.87204814) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.75000632, 0.42197898, -0.563352466, 0.766044974, -0.64278698, -0, 0, 0, -1, 0.64278698, 0.766044974, 0) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.420839459, 0.476516426, -1.11699474, 0.418066114, -0.903488457, -0.09449514, -0.139175028, 0.0390909165, -0.989495933, 0.897692144, 0.42682609, -0.109400436) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.637096405, -1.86514843, -0.291526765, 1, 0, 0, 0, 0.984807849, 0.173648059, 0, -0.173648059, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.48112309, -1.99999511, 0.0593808591, 0.766043782, 0, 0.64278847, 0, 1, 0, -0.64278847, 0, 0.766043782) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(3, .5, 1) * CFrame.Angles(math.rad(-80), math.rad(0), math.rad(-100)), 0.3)
	end
	CFuncs.Sound.Create("1073356365", Stockbox, 1, 1)
	local con = Stockbox.Touched:connect(function(hit)
		Damage(Stockbox, hit, 18, 23, 5, "Knockdown", RootPart, 1, "146163534", 1) end)
	for i = 0, .2, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.441541791, 2.43237423e-07, 0.00331187248, 0.336825132, -0.0593909472, 0.939692259, 0.173648059, 0.984807849, -3.82394944e-07, -0.92541635, 0.163175866, 0.342021108) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.104509205, 1.59855092, -0.215072125, 0.890994191, 0.0636333674, -0.449533641, 0.0275982097, 0.980707407, 0.193524063, 0.453175396, -0.184835091, 0.872048259) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(1.75627017, 0.431958854, -0.449601173, 0.754407525, -0.653558016, -0.0610871017, -0.13302204, -0.0610866398, -0.989228785, 0.642786741, 0.754407406, -0.133021802) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.367935598, 0.648825228, -1.07648134, 0.387547314, -0.915556669, -0.107533015, -0.209657595, 0.0260535926, -0.977427781, 0.897691965, 0.401344508, -0.181856394) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.358966112, -1.63310397, -0.651200593, 0.984807909, 0.17100957, 0.0301558673, -0.173648059, 0.969846368, 0.171010047, -2.23517418e-06, -0.173648521, 0.98480773) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.654243588, -1.85264969, 0.148285508, 0.754406095, -0.0533300862, 0.654238164, -0.133022279, 0.963592768, 0.231935903, -0.642788172, -0.262002051, 0.71984601) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
	end
	for i = 0, 1, 0.1 do
		swait()
		PlayAnimationFromTable({
			CFrame.new(0.278367251, 9.0772329e-07, 0.0731263831, 0.633022964, -0.111618958, 0.766043842, 0.173647985, 0.984807849, 5.96214491e-08, -0.754405856, 0.133021936, 0.64278841) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.104512498, 1.59855139, -0.215077341, 0.727161527, 0.0636337325, 0.683510542, -0.172414482, 0.980707347, 0.0921231061, -0.664461732, -0.184835523, 0.724103987) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.400077015, 0.238431826, -1.01036751, 0.518464565, 0.840397179, 0.157882661, -0.035381794, 0.205562487, -0.978004277, -0.854366899, 0.50147438, 0.13631162) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-1.62448943, 0.329740167, -0.818884015, 0.598198533, 0.795001924, 0.100649826, -0.176135838, 0.25297159, -0.95130527, -0.781751156, 0.551341355, 0.29135555) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(0.302916914, -1.95092583, 0.295360684, 0.98480773, 0.171009585, 0.0301554501, -0.173648, 0.969846547, 0.1710096, -1.81794167e-06, -0.173648, 0.984807909) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			CFrame.new(-0.801789224, -1.60096383, -0.361114919, 0.974819183, 0.117734738, 0.189383537, -0.166570976, 0.949086845, 0.267373323, -0.148262233, -0.292186439, 0.944799304) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
		}, .3, false)
		fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(1, 1, 0) * CFrame.Angles(math.rad(-90), math.rad(0), math.rad(-50)), 0.3)
	end
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 60
	con:Disconnect()
	Attack = false
	SecondaryBread = false
end






Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
	while Attack == false and UIS:IsKeyDown(Enum.KeyCode.R) and AmmoCount >= 0 and AmmoCount <= maxammo - 1 do
		relode()
		if Attack == false and AmmoCount == maxammo then
			pump() 
		end			
	end
end)


Mouse.KeyDown:connect(function(Key)
	Key = Key:lower()
	while Attack == false and UIS:IsKeyDown(Enum.KeyCode.X) and cooldownX >=coX do
		stanceintro()
		textXZ.Text = "[X+Z]\n Quick Kick"
		text2.Text = "[X]\n HOLD"
		textXC.Text = "[X+C]\n Headbutt"
		textXV.Text = "[X+V]\n Stock Swing"

		text1.Text = " "
		text3.Text = " "
		text4.Text = " "
		frameskXZ.BackgroundTransparency = .5
		frameskXC.BackgroundTransparency = .5
		frameskXV.BackgroundTransparency = .5
		barXZ.BackgroundTransparency = 0
		barXC.BackgroundTransparency = 0
		barXV.BackgroundTransparency = 0

		frameskZ.BackgroundTransparency = 1
		frameskC.BackgroundTransparency = 1
		frameskV.BackgroundTransparency = 1
		barZ.BackgroundTransparency = 1
		barC.BackgroundTransparency = 1
		barV.BackgroundTransparency = 1


		if UIS:IsKeyDown(Enum.KeyCode.X) and UIS:IsKeyDown(Enum.KeyCode.Z) and cooldownXZ >=coXZ then
			quickkick()
			cooldownXZ = 0
		elseif UIS:IsKeyDown(Enum.KeyCode.X) and UIS:IsKeyDown(Enum.KeyCode.C) and cooldownXC >=coXC then
			hedbap()
			cooldownXC = 0
		elseif UIS:IsKeyDown(Enum.KeyCode.X) and UIS:IsKeyDown(Enum.KeyCode.V) and cooldownXV >=coXV then
			stockcrash()
			cooldownXV = 0
		end
	end
end)



Mouse.KeyDown:connect(function(Key)
	if Attack == false and Key == 'z' and cooldownZ >=coZ then
		cooldownZ = 0		
		hop()
	elseif Attack == false and Key == 'c' and cooldownC >=coC and Humanoid.Health < 100 then
		cooldownC = 0
		patchedup()
	elseif Attack == false and Key == 'v' and cooldownV >=coV then
		cooldownV = 0
		fireatwill()

	end
end)


Mouse.Button1Down:connect(function()
	if Attack == false and AmmoCount > 0 then
		fire()
	elseif Attack == false and AmmoCount == 0 then
		dryfire()
	end
end)


function updateskills1()
	if cooldownZ <= coZ then
		cooldownZ = cooldownZ + 1 / 35
	end
	if cooldownX <= coX then
		cooldownX = cooldownX + 1 / 35
	end
	if cooldownXZ <= coXZ then
		cooldownXZ = cooldownXZ + 1 / 35
	end
	if cooldownXC <= coXC then
		cooldownXC = cooldownXC + 1 / 35
	end
	if cooldownXV <= coXV then
		cooldownXV = cooldownXV + 1 / 35
	end
	if cooldownC <= coC then
		cooldownC = cooldownC + 1 / 35
	end
	if cooldownV <= coV then
		cooldownV = cooldownV + 1 / 35
	end
end


while true do
	swait()
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA("Part") then
			v.Material = "SmoothPlastic"
		elseif v:IsA("Accessory") then
			v:WaitForChild("Handle").Material = "SmoothPlastic"
		end
	end
	for i, v in pairs(Character:GetChildren()) do
		if v:IsA'Model' then
			for _, c in pairs(v:GetChildren()) do
				if c:IsA'Part' then
					c.CustomPhysicalProperties = PhysicalProperties.new(0.001, 0.001, 0.001, 0.001, 0.001)
				end
			end
		end
	end
	updateskills1()
	barZ:TweenSize(UDim2.new(1 * (cooldownZ / coZ), 0, 1, 0), 'Out', 'Quad', .5)
	barX:TweenSize(UDim2.new(1 * (cooldownX / coX), 0, 1, 0), 'Out', 'Quad', .5)
	barXZ:TweenSize(UDim2.new(1 * (cooldownXZ / coXZ), 0, 1, 0), 'Out', 'Quad', .5)
	barXC:TweenSize(UDim2.new(1 * (cooldownXC / coXC), 0, 1, 0), 'Out', 'Quad', .5)
	barXV:TweenSize(UDim2.new(1 * (cooldownXV / coXV), 0, 1, 0), 'Out', 'Quad', .5)
	barC:TweenSize(UDim2.new(1 * (cooldownC / coC), 0, 1, 0), 'Out', 'Quad', .5)
	barV:TweenSize(UDim2.new(1 * (cooldownV / coV), 0, 1, 0), 'Out', 'Quad', .5)

	if AmmoCount ~= 0 then
		relodetext.Text = '[ '..AmmoCount..' / '..maxammo..' ]'
	elseif AmmoCount == 0 then 
		relodetext.Text = '[ Hold R to Reload. ]'
	end


	if UIS:IsKeyDown(Enum.KeyCode.X) == false then
		text1.Text = "[Z]\n Reposition"
		text2.Text = "[X]\n Battle Stance"
		text3.Text = "[C]\n Mend"
		text4.Text = "[V]\n Unload"
		textXZ.Text = " "
		textXC.Text = " "
		textXV.Text = " "
		frameskZ.BackgroundTransparency = .5
		frameskC.BackgroundTransparency = .5
		frameskV.BackgroundTransparency = .5
		barZ.BackgroundTransparency = 0
		barC.BackgroundTransparency = 0
		barV.BackgroundTransparency = 0

		frameskXZ.BackgroundTransparency = 1
		frameskXC.BackgroundTransparency = 1
		frameskXV.BackgroundTransparency = 1
		barXZ.BackgroundTransparency = 1
		barXC.BackgroundTransparency = 1
		barXV.BackgroundTransparency = 1
	end
	TorsoVelocity = (RootPart.Velocity * Vector3.new(1, 0, 1)).magnitude 
	Velocity = RootPart.Velocity.y
	Sine = Sine + Change
	local hit, pos = RayCast(RootPart.Position, (CFrame.new(RootPart.Position, RootPart.Position - Vector3.new(0, 1, 0))).lookVector, 4, Character)
	if RootPart.Velocity.y > 1 and hit == nil then 
		Anim = "Jump"
		if Attack == false then
			Change = 1
			PlayAnimationFromTable({
				CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(1.80887365, 0.563777864, 0.393151999, 0.642787039, -0.766044915, -1.2109125e-06, 0.754407167, 0.633021533, 0.173648313, -0.133021653, -0.111619815, 0.984807789) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-1.67181289, 0.594474256, -0.03263852, 0.499999285, 0.866025865, 1.98491279e-07, -0.750001073, 0.433012605, -0.499998599, -0.43301177, 0.249998808, 0.866026282) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.80666828, -0.689023316, 1, 0, 0, 0, 0.984807849, 0.173648134, 0, -0.173648164, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.42673647, -0.144118369, 1, 0, 0, 0, 0.766044736, 0.642787457, 0, -0.642787457, 0.766044736) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(90)), 0.3)
		end	
	elseif RootPart.Velocity.y < -1 and hit == nil then 
		Anim = "Fall"
		if Attack == false then
			Change = 1
			PlayAnimationFromTable({
				CFrame.new(-0, -1.01481628, -8.04662704e-07, 1, 0, 0, 0, 0.866025686, 0.499999642, -0, -0.499999642, 0.866025686) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0, 1.45637476, -0.213752031, 1, 0, 0, 0, 0.939692676, 0.342020601, 0, -0.342020601, 0.939692676) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(1.53209591, 0.16416876, 0.0263971146, 0.98480773, -0.173648164, -1.55591565e-07, 0.171010092, 0.969846427, 0.173648164, -0.0301535316, -0.171010077, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-1.64498818, 0.287739754, -0.209731221, 0.86602509, 0.500000656, 7.92254752e-07, -0.433013529, 0.750000894, -0.499998152, -0.25, 0.433010578, 0.86602664) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -1.26449406, -1.10387921, 1, 0, 0, 0, 0.984807849, -0.173647985, 0, 0.173647985, 0.984807849) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.5, -1.24956489, -0.292783707, 1, 0, 0, 0, 0.642787695, 0.766044557, 0, -0.766044557, 0.642787695) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(90)), 0.3)
		end		
	elseif TorsoVelocity < 1 and hit ~= nil then
		Anim = "Idle"
		if Attack == false then
			Change = 1
			PlayAnimationFromTable({
				CFrame.new(0.038382329, -2.14204192e-08, -0.0314837135, 0.984807849, 0.0301536452, 0.171009868, 0, 0.98480773, -0.173648119, -0.173647985, 0.171010017, 0.969846368) * CFrame.new(0, 0 + 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0 + 0.005 * math.cos(Sine/25), 0), 
				CFrame.new(-0.00987245888, 1.54137087, -0.232474566, 0.983905733, 0.0593912564, -0.168529823, 0.000888057693, 0.941511214, 0.336980611, 0.17868638, -0.331706822, 0.926305413) * CFrame.new(0, 0, 0) * CFrame.Angles(0 - 0.05 * math.cos(Sine/25), 0, 0), 
				CFrame.new(1.00599754, 0.00645497441, -0.987730443, 0.387630165, 0.322637081, -0.863509297, -0.802340508, 0.579304218, -0.143723249, 0.453864068, 0.748539925, 0.483420581) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.927108586, 0.209949538, -0.179899275, 0.68265909, -0.539921403, -0.492403984, -0.24406442, 0.4666816, -0.850082874, 0.688773632, 0.700495183, 0.18680881) * CFrame.new(0, 0 + 0.02 * math.cos(Sine/25), 0 + 0.01 * math.cos(Sine/25)) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.628665984, -2.00964737, 0.120245621, 1.00000012, 0, 0, 1.86264515e-09, 0.98480773, 0.173648119, 0, -0.173648119, 0.984807849) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.44258371, -1.99715459, 0.19109571, 0.939692676, 0, 0.342020601, -0.0593912229, 0.98480773, 0.163175851, -0.336824536, -0.173648119, 0.925416529) * CFrame.new(0, 0 - 0.05 * math.cos(Sine/25), 0) * CFrame.Angles(0, 0, 0), 
			}, .3, false)
			fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(90)), 0.3)
		end
	elseif TorsoVelocity > 2 and hit ~= nil then
		Anim = "Walk"
		if Attack == false then
			PlayAnimationFromTable({
				CFrame.new(-0, -0, 0, 1, 0, 0, 0, 0.996187985, 0.0871556774, 0, -0.0871556699, 0.996194661) * CFrame.new(0, 0 + .05 * math.cos(Sine/25), 0) * CFrame.Angles(-.2 + 0.05 * math.cos(Sine/25), 0 + 0.05 * math.cos(Sine/5), 0),
				CFrame.new(0, 1.49999499, 1.11760201e-08, 1, 0, 0, 0, 0.999998331, -7.45067918e-09, 0, 7.45069251e-09, 1) * CFrame.new(0, 0, 0 + 0.05 * math.cos(Sine/30)) * CFrame.Angles(0 + 0.05 * math.cos(Sine/15), 0, 0),
				CFrame.new(1.00599754, 0.00645497441, -0.987730443, 0.387630165, 0.322637081, -0.863509297, -0.802340508, 0.579304218, -0.143723249, 0.453864068, 0.748539925, 0.483420581) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(-0.927108586, 0.209949538, -0.179899275, 0.68265909, -0.539921403, -0.492403984, -0.24406442, 0.4666816, -0.850082874, 0.688773632, 0.700495183, 0.18680881) * CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0), 
				CFrame.new(0.5, -2.00000334, 2.67028881e-005, 1, 0, 0, 0, 1.00000024, 0, 0, 0, 1.00000024) * CFrame.new(0, .21 - .1 * math.cos((Sine) / 2), -.1 + 1 * math.cos((Sine) / 4)) * CFrame.Angles(math.rad(1 - 50 * math.cos((Sine) / 4)), math.rad(0), math.rad(0 - .5 * math.cos((Sine) / 5))),
				CFrame.new(-0.5, -2.00000334, 2.67028881e-005, 1, 0, 0, 0, 1.00000024, 0, 0, 0, 1.00000024) * CFrame.new(0, .21 - .1 * math.cos((Sine) / 2), .1 - 1 * math.cos((Sine) / 4)) * CFrame.Angles(math.rad(-1 + 50 * math.cos((Sine) / 4)), math.rad(0), math.rad(0 + .5 * math.cos((Sine) / 5))),
			}, .3, false)
			fHandleWeld.C0 = clerp(fHandleWeld.C0, CFrame.new(-.4, .2, 0) * CFrame.Angles(math.rad(90), math.rad(-10), math.rad(90)), 0.3)
		end
	end
	if #Effects > 0 then
		for e = 1, #Effects do
			if Effects[e] ~= nil then
				local Thing = Effects[e]
				if Thing ~= nil then
					local Part = Thing[1]
					local Mode = Thing[2]
					local Delay = Thing[3]
					local IncX = Thing[4]
					local IncY = Thing[5]
					if Thing[1].Transparency <= 1 then
						if Thing[2] == "Block1" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Ice" then
							if Thing[6] <= Thing[5] then
								Thing[6] = Thing[6] + .05
								Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, .4, 0)
							else
								Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							end
						elseif Thing[2] == "Shatter" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[4] = Thing[4] * CFrame.new(0, Thing[7], 0)
							Thing[1].CFrame = Thing[4] * CFrame.fromEulerAnglesXYZ(Thing[6], 0, 0)
							Thing[6] = Thing[6] + Thing[5]
						elseif Thing[2] == "Block2" then
							Thing[1].CFrame = Thing[1].CFrame
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block3" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block4" then
							Thing[1].CFrame = Thing[8].CFrame * CFrame.new(0, -Thing[7].Scale.Y, 0) * CFrame.fromEulerAnglesXYZ(3.14, 0, 0)
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Block2Fire" then
							Thing[1].CFrame = Thing[1].CFrame * CFrame.fromEulerAnglesXYZ(math.random(-50, 50), math.random(-50, 50), math.random(-50, 50))
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							if Thing[1].Transparency >= .3 then
								Thing[1].BrickColor = BrickColor.new("Bright red")
							else
								Thing[1].BrickColor = BrickColor.new("Bright yellow")
							end
						elseif Thing[2] == "Cylinder" then
							Mesh = Thing[7]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Blood" then
							Mesh = Thing[7]
							Thing[1].CFrame = Thing[1].CFrame * CFrame.new(0, -.5, 0)
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[4], Thing[5], Thing[6])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						elseif Thing[2] == "Elec" then
							Mesh = Thing[10]
							Mesh.Scale = Mesh.Scale + Vector3.new(Thing[7], Thing[8], Thing[9])
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
							Thing[1].CFrame = Thing[1].CFrame * Thing[11] * CFrame.new(0, 0, .2)
							Thing[1].Rotation = Vector3.new(0, 0, 0)
						elseif Thing[2] == "Disappear" then
							Thing[1].Transparency = Thing[1].Transparency + Thing[3]
						end
					else
						Part.Parent = nil
						table.remove(Effects, e)
					end
				end
			end
		end
	end	
end