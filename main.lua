local success, library = pcall(function()
    local loaderSource = game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/loader.lua')
    assert(loaderSource, "Failed to fetch loader source")

    local loader = loadstring(loaderSource)()
    assert(loader, "Failed to initialize loader")
    
    local lib = loader.Init()
    assert(lib, "Failed to initialize library")
    
    return lib
end)

if not success then
    warn("Failed to initialize:", library)
    return
end

-- Create tabs first
local aimbotTab = library:addTab("Legit")
local visualsTab = library:addTab("Ragebot")
local miscTab = library:addTab("Visuals")
local skinTab = library:addTab("Skins")
local miscTab = library:addTab("Misc")
local luaTab = library:addTab("Luas")
local configTab = library:addTab("Settings")

-- Then create groups
local createconfigs = configTab:createGroup('left', 'Create Configs')
local configsettings = configTab:createGroup('left', 'Config Settings')
local uisettings = configTab:createGroup('center', 'UI Settings')
local othersettings = configTab:createGroup('right', 'Other')

-- Now add elements to groups
createconfigs:addTextbox({text = "Name",flag = "config_name"})
createconfigs:addButton({text = "Create",callback = function() library:createConfig() end})

configsettings:addConfigbox({flag = 'selected_config',values = {}})
configsettings:addButton({text = "Load",callback = function() library:loadConfig() end})
configsettings:addButton({text = "Save",callback = function() library:saveConfig() end})
configsettings:addButton({text = "Delete",callback = function() library:deleteConfig() end})
configsettings:addButton({text = "Refresh",callback = function() library:refreshConfigs() end})

uisettings:addToggle({text = "Show Game Name",flag = "show game name"})
uisettings:addTextbox({text = "Menu Title",flag = "menutitle"})
uisettings:addTextbox({text = "Domain",flag = "menudomain"})
uisettings:addColorpicker({text = "Domain Accent",ontop = true,flag = "domainaccent",color = Color3.new(1,1,1)})
uisettings:addColorpicker({text = "Menu Accent",ontop = true,flag = "menuaccent",color = Color3.new(1,1,1)})

othersettings:addToggle({text = "Show Keybinds",flag = "show game name"})
configsettings:addButton({text = "Copy Game Invite"})
configsettings:addButton({text = "Rejoin Server"})
configsettings:addButton({text = "Server Hop"})