local loader = {
    init = function()
        -- Load modules in correct order
        local success, uiContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        end)
        
        if not success then return end

        local success, configContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua")
        end)

        -- Initialize UI first
        local ui = loadstring(uiContent)()
        if not ui then return end
        
        -- Initialize config if loaded successfully
        if success then
            local config = loadstring(configContent)()
            if config then
                config:init(ui)
                ui.config = config
                
                -- Link config functions to UI
                ui.createConfig = function(self)
                    if not self.flags["config_name"] then 
                        return self:notify("Enter config name")
                    end
                    return config:saveConfig(self.flags["config_name"], self.flags)
                end
                
                ui.refreshConfigs = function(self)
                    config:refresh()
                end
            end
        end

        -- Store UI reference globally
        _G.Library = ui
        
        -- Initialize UI with defaults
        ui.flags = ui.flags or {}
        ui.options = ui.options or {}
        ui.tabs = ui.tabs or {}
        
        if type(ui.init) == "function" then
            ui:init()
        end

        return ui
    end
}

return loader
