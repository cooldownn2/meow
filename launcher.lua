
-- Start with debug info
local function debugPrint(...)
    print("[DEBUG]", ...)
end

debugPrint("Starting launcher...")

-- Create necessary folders
if not isfolder("OsirisCFGS") then
    makefolder("OsirisCFGS")
    debugPrint("Created OsirisCFGS folder")
end

-- Load UI with error handling
local success, UI = pcall(function()
    local source = game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua')
    debugPrint("UI source loaded:", #source > 0)
    return loadstring(source)()
end)

if not success or not UI then
    warn("Failed to load UI:", UI)
    return
end

debugPrint("UI loaded successfully")

-- Initialize UI
local success, error = pcall(function()
    local aimbotTab = UI:addTab("Legit")
    local rageTab = UI:addTab("Ragebot")
    local visualsTab = UI:addTab("Visuals")
    local skinsTab = UI:addTab("Skins")
    local luasTab = UI:addTab("Luas")
    local settingsTab = UI:addTab("Settings")
end)

if not success then
    warn("Failed to initialize UI:", error)
    return
end

debugPrint("Launcher completed successfully")
return UI
