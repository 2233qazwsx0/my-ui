repeat task.wait() until game:IsLoaded()

--==== RO 加载器：选择一代 / 二代 ====

-- 一代直链
local URL_GEN1 = "https://raw.githubusercontent.com/2233qazwsx0/my-ui/main/RO.lua"
-- 二代直链（占位符，上线后替换）
local URL_GEN2 = "" -- TODO: 二代 URL 待填

local WINDUI_URL = "https://raw.githubusercontent.com/2233qazwsx0/my-ui/main/WindUI.lua"

local function NotifyUI(txt)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "RO加载器", Text = txt, Duration = 3,
			Icon = "rbxassetid://121484904532293",
		})
	end)
end

-- 拉取并执行远程脚本
local function runScript(url)
	if not url or url == "" then
		NotifyUI("二代未上线，敬请期待")
		return
	end
	NotifyUI("正在加载脚本...")
	task.spawn(function()
		local ok, err = pcall(function()
			loadstring(game:HttpGet(url, true))()
		end)
		if not ok then
			NotifyUI("脚本执行失败：" .. tostring(err))
		end
	end)
end

-- 拉取 WindUI
local WindUI
do
	local ok, src = pcall(function() return game:HttpGet(WINDUI_URL, true) end)
	if ok and type(src) == "string" and #src > 1000 then
		local ok2, lib = pcall(function() return loadstring(src)() end)
		if ok2 and type(lib) == "table" and lib.CreateWindow then
			WindUI = lib
		end
	end
end

if not WindUI or not WindUI.CreateWindow then
	NotifyUI("WindUI 加载失败，请检查网络后重新注入")
	return
end

local Window = WindUI:CreateWindow({
	Title = "RO脚本",
	Icon = "geist:window",
	Folder = "RO脚本",
	Background = "rbxassetid://121484904532293",
})
Window:SetIconSize(48)
Window:Tag({ Title = "CUA", Color = Color3.fromHex("#30ff6a") })
Window:Tag({ Title = "kw0498", Color = Color3.fromHex("#315dff") })
Window:Tag({ Title = "司空", Color = Color3.fromHex("#ff6a00") })

local Tab = Window:Tab({ Title = "加载", Icon = "zap" })

Tab:Button({
	Title = "一代",
	Icon = "geist:window",
	Callback = function()
		runScript(URL_GEN1)
	end,
})

Tab:Button({
	Title = "二代",
	Icon = "geist:window",
	Callback = function()
		runScript(URL_GEN2)
	end,
})

NotifyUI("加载器已就绪，请选择一代或二代")
