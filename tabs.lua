local tabs = {}

function tabs:init(library)
    self.library = library
    
    -- Create main tabs
    local aimbotTab = library:addTab("Legit")
    local visualsTab = library:addTab("Ragebot") 
    local miscTab = library:addTab("Visuals")
    local miscTab = library:addTab("Misc")
    local configTab = library:addTab("Settings")

    -- Setup config tab
    self:setupConfigTab(configTab)
end

function tabs:setupConfigTab(configTab)
    local createConfigs = configTab:createGroup('left', 'Create Configs')
    local configSettings = configTab:createGroup('left', 'Config Settings')
    local uiSettings = configTab:createGroup('right', 'UI Settings')
    local otherSettings = configTab:createGroup('right', 'Other')

    -- Setup config section
    createConfigs:addTextbox({text = "Name", flag = "config_name"})
    createConfigs:addButton({text = "Load", callback = function()
        self.library.config:load()
    end})

    -- ... rest of config tab setup ...
end

return tabs
