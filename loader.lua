local loader = {}

function loader:Init()
    -- Create necessary folders
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end

    -- Load main UI
    local mainUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/yourusername/meow/main/UI.lua'))()
    
    -- Load config system
    local configSystem = loadstring(game:HttpGet('https://raw.githubusercontent.com/yourusername/meow/main/ConfigSystem.lua'))()
    
    -- Initialize config system
    configSystem:Init(mainUI)
    
    return mainUI
end

return loader
