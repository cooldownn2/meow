local success, library = pcall(function()
    local loaderSource = game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/loader.lua')
    assert(loaderSource, "Failed to fetch loader source")

    local loader = loadstring(loaderSource)()
    assert(loader, "Failed to initialize loader")
    
    local lib = loader:Init()
    assert(lib, "Failed to initialize library")
    
    return lib
end)

if not success or not library then
    warn("Failed to initialize:", library)
    return
end

print("Creating tabs...")

-- Create tabs with debug
local tabs = {
    Legit = library:addTab("Legit"),
    Ragebot = library:addTab("Ragebot"),
    Visuals = library:addTab("Visuals"),
    Skins = library:addTab("Skins"),
    Misc = library:addTab("Misc"),
    Luas = library:addTab("Luas"),
    Settings = library:addTab("Settings")
}

-- Verify tabs were created
for name, tab in pairs(tabs) do
    if not tab then
        warn("Failed to create tab:", name)
    end
end

-- Only continue if we have our config tab
if not tabs.Settings then
    warn("Failed to create Settings tab!")
    return
end

-- Create groups
local createconfigs = tabs.Settings:createGroup('left', 'Create Configs')
local configsettings = tabs.Settings:createGroup('left', 'Config Settings')
local uisettings = tabs.Settings:createGroup('center', 'UI Settings')
local othersettings = tabs.Settings:createGroup('right', 'Other')

-- Now add elements with proper function binding
createconfigs:addTextbox({text = "Name", flag = "config_name"})
createconfigs:addButton({text = "Create", callback = function() 
    if library.createConfig then
        library:createConfig()
    end
end})

configsettings:addConfigbox({flag = 'selected_config',values = {}})
configsettings:addButton({text = "Load",callback = function() 
    if library.loadConfig then
        library:loadConfig()
    end
end})
configsettings:addButton({text = "Save",callback = function() 
    if library.saveConfig then
        library:saveConfig()
    end
end})
configsettings:addButton({text = "Delete",callback = function() 
    if library.deleteConfig then
        library:deleteConfig()
    end
end})
configsettings:addButton({text = "Refresh",callback = function() 
    if library.refreshConfigs then
        library:refreshConfigs()
    end
end})

uisettings:addToggle({text = "Show Game Name",flag = "show game name"})
uisettings:addTextbox({text = "Menu Title",flag = "menutitle"})
uisettings:addTextbox({text = "Domain",flag = "menudomain"})
uisettings:addColorpicker({text = "Domain Accent",ontop = true,flag = "domainaccent",color = Color3.new(1,1,1)})
uisettings:addColorpicker({text = "Menu Accent",ontop = true,flag = "menuaccent",color = Color3.new(1,1,1)})

othersettings:addToggle({text = "Show Keybinds",flag = "show game name"})
configsettings:addButton({text = "Copy Game Invite"})
configsettings:addButton({text = "Rejoin Server"})
configsettings:addButton({text = "Server Hop"})