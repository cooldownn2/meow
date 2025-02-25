-- Create config folder if it doesn't exist
if not isfolder("MeowConfigs") then
    makefolder("MeowConfigs")
end

-- Load UI
local UI = loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/main/meow/UI.lua'))()
