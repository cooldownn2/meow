-- Create our module
local UI = {}

-- Load libraries safely
local function loadLibrary(url)
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if not success then
        warn("[SPICE ERROR] Failed to load library: " .. tostring(result))
        return nil
    end
    return result
end

-- Initialize loader
function UI.new(config)
    local lib = loadLibrary("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/lib.lua")
    if not lib then 
        warn("[SPICE ERROR] Failed to load main library")
        return
    end
    
    local window = lib:new({
        name = config.name or "SPICE",
        textsize = config.textsize or 13,
        color = config.color or Color3.fromRGB(244, 95, 115)
    })
    
    if not window then
        warn("[SPICE ERROR] Failed to create window")
        return 
    end
    
    -- Create base tabs
    local AimbotTab = window:page({name = "Aimbot"})
    local VisualsTab = window:page({name = "Visuals"}) 
    
    -- Initialize default sections
    local AimbotSection = AimbotTab:section({
        name = "Silent Aim",
        side = "left",
        size = 320
    })
    
    -- Add your UI elements here
    -- ...

    return window
end

-- Return the module
return UI
