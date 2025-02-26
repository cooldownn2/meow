local loader = {}

function loader:Init()
    -- Create necessary folders
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end

    -- Load each component with error handling
    local success, mainUI = pcall(function()
        return loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua'))()
    end)
    
    if not success then
        warn("Failed to load UI:", mainUI)
        return
    end

    local success2, configSystem = pcall(function() 
        return loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/ConfigSystem.lua'))()
    end)
    
    if not success2 then
        warn("Failed to load Config System:", configSystem)
        return
    end

    -- Initialize config system
    if configSystem and configSystem.Init then
        configSystem:Init(mainUI)
    else
        warn("Config system missing Init function")
        return
    end
    
    return mainUI
end

function loader:VerifyURLs()
    local urls = {
        UI = 'https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua',
        Config = 'https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/ConfigSystem.lua',
        Main = 'https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/main.lua'
    }
    
    for name, url in pairs(urls) do
        local success, result = pcall(function()
            return game:HttpGet(url)
        end)
        if not success then
            warn(string.format("Failed to verify %s URL: %s", name, url))
            return false
        end
    end
    return true
end

return loader
