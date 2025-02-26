local loader = {}

local function log(msg)
    print("[LOADER] " .. tostring(msg))
end

-- Load UI directly first
function loader.init()
    -- Set up global environment
    _G.Library = {}
    
    -- Load and execute UI
    local success, content = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
    end)
    
    if not success then
        log("Failed to load UI: " .. tostring(content))
        return
    end
    
    local ui = loadstring(content)()
    if not ui then
        log("Failed to execute UI")
        return
    end
    
    -- Store UI reference globally
    _G.Library = ui
    
    return ui
end

return loader
