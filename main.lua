local success, library = pcall(function()
    local loaderSource = game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/loader.lua')
    assert(loaderSource, "Failed to fetch loader source")

    local loader = loadstring(loaderSource)()
    assert(loader, "Failed to initialize loader")
    
    -- Changed from loader.Init() to loader:Init()
    local lib = loader:Init()
    assert(lib, "Failed to initialize library")
    
    return lib
end)

if not success then
    warn("Failed to initialize:", library)
    return
end

local library = result

-- First show error if library isn't loaded
if not library then
    warn("Library failed to initialize!")
    return
end

-- Create tabs with error handling
local function addTab(name)
    if not library.addTab then
        warn("Library missing addTab function!")
        return
    end
    return library:addTab(name)
end

local aimbotTab = addTab("Legit")
local visualsTab = addTab("Ragebot") 
local miscTab = addTab("Visuals")
local skinTab = addTab("Skins")
local miscTab = addTab("Misc")
local luaTab = addTab("Luas")
local configTab = addTab("Settings")

-- Don't continue if config tab failed to create
if not configTab then
    warn("Failed to create config tab!")
    return
end

-- Create groups with error checking
local createconfigs = configTab:createGroup('left', 'Create Configs')
local configsettings = configTab:createGroup('left', 'Config Settings')
local uisettings = configTab:createGroup('center', 'UI Settings')
local othersettings = configTab:createGroup('right', 'Other')

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