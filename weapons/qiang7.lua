kon=game:GetService("Players").LocalPlayer
--kon=require(script[':flushed: magic'])
Mouse,mouse,UserInputService,RenderStepped,Player=kon:GetMouse(),kon:GetMouse(),game:service'UserInputService',game:GetService('RunService').Heartbeat,kon
script = game:GetObjects("rbxassetid://7109550607")[1].Convert.Extras
GlobalFunctions = {}
loadstring(game:HttpGet(('https://pastebin.com/raw/uq6axDFA'),true))()
loadstring(game:GetObjects("rbxassetid://5425999987")[1].Source)()
-- -gh 6198633506,7167966065
-- -gh 7604371176,6202097932
local cnnnnn = game.Players.LocalPlayer.Character
local function gp(parent, name, className)
	local ret = nil
	if parent then
		for i, v in pairs(parent:GetChildren()) do
			if (v.Name == name) and v:IsA(className) then
				ret = v
			end
		end
	end
	return ret
end

wait(0.2)
player = kon
character = player.Character
humanoid = character:FindFirstChildOfClass("Humanoid")
ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"
frame = 1/60
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
ArtificialHB:Fire()
game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
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
	if num==0 or num==nil then
		ArtificialHB.Event:wait()
	else
		for i=0,num do
			ArtificialHB.Event:wait()
		end
	end
end
function CreateSound(ID, PARENT, VOLUME, PITCH, DOESLOOP)
	local NEWSOUND = nil
	coroutine.resume(coroutine.create(function()
		NEWSOUND = Instance.new("Sound")
		NEWSOUND.Parent = PARENT
		NEWSOUND.Volume = VOLUME
		NEWSOUND.Pitch = PITCH
		NEWSOUND.SoundId = "rbxassetid://"..ID
		NEWSOUND:play()
		if DOESLOOP == true then
			NEWSOUND.Looped = true
		else
			repeat wait(1) until NEWSOUND.Playing == false
			NEWSOUND:remove()
		end
	end))
	return NEWSOUND
end
function sandbox(var,func)
	local env = getfenv(func)
	local newenv = setmetatable({},{
		__index = function(self,k)
			if k=="script" then
				return var
			else
				return env[k]
			end
		end,
	})
	setfenv(func,newenv)
	return func
end
cors = {}
mas = Instance.new("Model",game:GetService("Lighting"))
Part0 = Instance.new("Part")
SpecialMesh1 = Instance.new("SpecialMesh")
Part0.Name = "Gun"
Part0.Parent = mas
Part0.CanCollide = false
Part0.Size = Vector3.new(0.970000505, 2.46999931, 0.380000055)
Part0.CFrame = CFrame.new(-211.74501, 2.6168952, 37.920002, 1, 0, 0, 0, 1, 0, 0, 0, 1)
Part0.Position = Vector3.new(-211.74501, 2.6168952, 37.920002)

local pistolhat = gp(gp(gp(cnnnnn, "Meshes/恶魔枪Accessory", "Accessory"), "Handle", "BasePart"), "att1_Handle", "Attachment")
local pistolnnn = gp(gp(cnnnnn, "Meshes/恶魔枪Accessory", "Accessory"), "Handle", "BasePart")

pistolhat.Parent = Part0
pistolhat.Orientation = Vector3.new(-70, -90, -180)
pistolhat.Position = Vector3.new(-0.3, -0.3, 0)
SpecialMesh1.Parent = Part0
SpecialMesh1.MeshId = "rbxassetid://505563629"
SpecialMesh1.Scale = Vector3.new(0.00499999989, 0.00499999989, 0.00499999989)
SpecialMesh1.TextureId = "rbxassetid://505563636"
SpecialMesh1.MeshType = Enum.MeshType.FileMesh
SpecialMesh1.Scale = Vector3.new(0.00499999989, 0.00499999989, 0.00499999989)
for i,v in pairs(mas:GetChildren()) do
	v.Parent = character
	pcall(function() v:MakeJoints() end)
end
mas:Destroy()
for i,v in pairs(cors) do
	spawn(function()
		pcall(v)
	end)
end
cankys = true
weld = Instance.new("Weld", Part0)
weld.Part0 = character["Left Arm"]
weld.Part1 = Part0
weld.C0 = CFrame.new(0.158004761, -1.63815379, -1.00455856, -5.79879307e-22, 9.29214533e-23, 1, -0.587791622, -0.809012473, -2.65673535e-22, 0.809012473, -0.587791622, 5.23747954e-22)
function killyourself(key)
	if cankys then
		cankys = false
		CreateSound(204037214,Part0,1,1,false)
		local rhandweld = Instance.new("Weld", character.Torso)
		rhandweld.Part0 = character.Torso
		rhandweld.Part1 = character["Right Arm"]
		rhandweld.C0 = CFrame.new(1.5, 0, 0, 1, -1.6395192e-43, 0, -1.6395192e-43, 1, 0, 0, 0, 1)
		local lhandweld = Instance.new("Weld", character.Torso)
		lhandweld.Part0 = character.Torso
		lhandweld.Part1 = character["Left Arm"]
		lhandweld.C0 = CFrame.new(-1.5, 0, 0, 1, -1.6395192e-43, 0, -1.6395192e-43, 1, 0, 0, 0, 1)
		for i = 0,2 , 0.02 do
			weld.C0 = weld.C0:lerp(CFrame.new(0.720336914, -0.258590698, -0.514060974, 0.409927189, 0.572569966, -0.710018694, 0.0567400455, 0.760912359, 0.646370947, 0.910354853, -0.305250764, 0.279430419),i)
			lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.832244873, 0.405325174, -1.44667816, 0.719340205, -0.634600103, -0.28254649, -0.214658037, 0.183768019, -0.959245205, 0.660660148, 0.750674427, -0.00403028121),i)
			rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.921920776, 0.294008493, -1.1861496, 0.88295126, 0.469464868, 6.12843053e-07, -0.0490720123, 0.0922940373, -0.994521856, -0.466893107, 0.878114343, 0.104528703),i)
			swait()
		end
		CreateSound(5213779561,Part0,1,1,false)
		--while true do
			swait()
			character:BreakJoints()
			humanoid.Health = 0
		--end
	end
end
mouse.Button1Down:connect(killyourself)