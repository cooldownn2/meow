-- Load dependencies
local configs = loadstring(readfile("meow/configs.lua"))()

-- Create config folder if it doesn't exist
if not isfolder("MeowConfigs") then
    makefolder("MeowConfigs")
end

-- Load and initialize UI
local UI = loadstring(readfile("meow/UI.lua"))()
configs.init(UI)

return UI
