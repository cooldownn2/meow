local success, lib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/lib.lua"))()
end)

if not success then
    warn("[SPICE ERROR] Failed to load library: " .. tostring(lib))
    return
end

local window = lib:new({
    name = "SPICE", 
    textsize = 13,
    color = Color3.fromRGB(244, 95, 115)
})

if not window then
    warn("[SPICE ERROR] Failed to create window")
    return
end

-- Create tabs
local AimingTab = window:page({name = "Legit"})
local RageTab = window:page({name = "Rage"})
local VisualTab = window:page({name = "Visuals"})
local MiscTab = window:page({name = "Misc"})

-- Initialize sections
local SAimSection = AimingTab:section({
    name = "Silent Aim",
    side = "left",
    size = 320
})

-- Add your settings
local PuppySettings = {
    SilentAim = {
        Enabled = false,
        -- ...rest of settings...
    }
}

-- Create UI elements
SAimSection:toggle({
    name = "Silent Aim Enabled",
    def = false,
    callback = function(Boolean)
        PuppySettings.SilentAim.Enabled = Boolean
    end
})

-- Open default page
AimingTab:openpage()
