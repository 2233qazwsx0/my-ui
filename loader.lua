--[[
    WindUI 自用 loader（防删库单文件版）
    用法：loadstring(game:HttpGet("https://raw.githubusercontent.com/你的Github用户名/你的仓库名/main/loader.lua"))()
    之后全局 getgenv().WindUI 就是可用的 UI 库。
]]

-- 单文件直链（无镜像，避免减速）
local URL = "https://raw.githubusercontent.com/你的Github用户名/你的仓库名/main/WindUI.lua"

local WindUI = loadstring(game:HttpGet(URL, true))()

-- 校验加载结果
assert(type(WindUI) == "table" and WindUI.CreateWindow, "WindUI 加载失败，请检查仓库文件是否已上传为 WindUI.lua")

-- 挂到全局，方便所有脚本复用同一个 UI 库实例
getgenv().WindUI = WindUI

return WindUI