local UI = require(script.Parent.UI)

local success, window = pcall(function()
    return UI.new({
        name = "SPICE",
        title = "Loading SPICE...",
        subtitle = "Initializing Interface"
    })
end)

if not success then
    warn("[SPICE ERROR] Failed to initialize: " .. tostring(window))
    return
end

-- Initialize your UI layout here
if window then
    local AimbotTab = window:CreateTab("Aimbot")
    local VisualsTab = window:CreateTab("Visuals")
    -- ... rest of your UI code
end
