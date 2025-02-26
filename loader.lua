local loader = {}

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

function loader:Init()
    if not self:VerifyURLs() then
        return warn("URL verification failed")
    end

    -- Create necessary folders
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end

    -- Load main UI first
    local mainUI = loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua'))()
    if not mainUI then
        return warn("Failed to load UI")
    end

    -- Load config system after UI
    local configSystem = loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/ConfigSystem.lua'))()
    if configSystem then
        configSystem:Init(mainUI)
    end

    return mainUI
end

return loader
