local success, result = pcall(function()
    local loaderSource = game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/loader.lua')
    local loader = loadstring(loaderSource)()
    assert(loader, "Loader failed to load")
    assert(type(loader.Init) == "function", "Loader missing Init function")
    
    local library = loader.Init()
    assert(library, "Library failed to initialize")
    
    return library
end)

if not success then
    warn("Failed to initialize:", result)
    return
end

local library = result

-- Your UI code goes here
local aimbotTab = library:addTab("Legit")
local visualsTab = library:addTab("Ragebot")
local miscTab = library:addTab("Visuals")
local skinTab = library:addTab("Skins")
local miscTab = library:addTab("Misc")
local luaTab = library:addTab("Luas")
local configTab = library:addTab("Settings")
local createconfigs = configTab:createGroup('left', 'Create Configs')
local configsettings = configTab:createGroup('left', 'Config Settings')
local uisettings = configTab:createGroup('center', 'UI Settings')
local othersettings = configTab:createGroup('right', 'Other')

createconfigs:addTextbox({text = "Name",flag = "config_name"})
createconfigs:addButton({text = "Load",callback = library.loadConfig})

configsettings:addConfigbox({flag = 'test',values = {}})
configsettings:addButton({text = "Load",callback = library.loadConfig})
configsettings:addButton({text = "Update",callback = library.saveConfig})
configsettings:addButton({text = "Delete",callback = library.deleteConfig})
configsettings:addButton({text = "Refresh",callback = library.refreshConfigs})
uisettings:addToggle({text = "Show Game Name",flag = "show game name"})
uisettings:addTextbox({text = "Menu Title",flag = "menutitle"})
uisettings:addTextbox({text = "Domain",flag = "menudomain"})
uisettings:addColorpicker({text = "Domain Accent",ontop = true,flag = "domainaccent",color = Color3.new(1,1,1)})
uisettings:addColorpicker({text = "Menu Accent",ontop = true,flag = "menuaccent",color = Color3.new(1,1,1)})

othersettings:addToggle({text = "Show Keybinds",flag = "show game name"})
configsettings:addButton({text = "Copy Game Invite"})
configsettings:addButton({text = "Rejoin Server"})
configsettings:addButton({text = "Server Hop"})