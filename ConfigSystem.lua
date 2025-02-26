local configSystem = {
    initialized = false
}

function configSystem:Init(uiLibrary)
    if self.initialized then return end
    self.initialized = true
    
    -- Add config functions directly to the library
    uiLibrary.createConfig = function(self)
        local name = self.flags["config_name"]
        if not name or name == "" then 
            self:notify("Please enter a config name!")
            return 
        end
        
        local configs = self:getConfigList()
        if table.find(configs, name..".cfg") then 
            self:notify(name..".cfg already exists!")
            return 
        end

        local config = self:saveConfigToTable()
        writefile("OsirisCFGS/"..name..".cfg", game:GetService("HttpService"):JSONEncode(config))
        self:notify("Created config: "..name..".cfg")
        self:refreshConfigs()
    end

    uiLibrary.saveConfig = function(self)
        local name = self.flags["selected_config"]
        if not name then return self:notify("No config selected!") end
        
        local config = self:saveConfigToTable()
        writefile("OsirisCFGS/"..name, game:GetService("HttpService"):JSONEncode(config))
        self:notify("Saved config: "..name)
    end

    uiLibrary.saveConfigToTable = function(self)
        local config = {}
        for flag, value in pairs(self.flags) do
            if self.options[flag] and not self.options[flag].skipflag then
                if typeof(value) == "Color3" then
                    config[flag] = {value.R, value.G, value.B}
                elseif typeof(value) == "EnumItem" then
                    config[flag] = {string.split(tostring(value),".")[2], string.split(tostring(value),".")[3]}
                else
                    config[flag] = value
                end
            end
        end
        return config
    end

    uiLibrary.loadConfig = function(self)
        local name = self.flags["selected_config"]
        if not name then return self:notify("No config selected!") end
        
        local path = "OsirisCFGS/"..name
        if not isfile(path) then
            return self:notify("Config not found: "..name)
        end

        local success, config = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile(path))
        end)

        if not success then
            return self:notify("Failed to load config: "..name)
        end

        for flag, value in pairs(config) do
            if self.options[flag] then
                local option = self.options[flag]
                if option.type == "colorpicker" then
                    option.changeState(Color3.new(value[1], value[2], value[3]))
                elseif option.type == "keybind" then
                    option.changeState(Enum[value[1]][value[2]])
                else
                    option.changeState(value)
                end
            end
        end
        
        self:notify("Loaded config: "..name)
    end

    uiLibrary.getConfigList = function(self)
        local files = listfiles("OsirisCFGS")
        local configs = {}
        for _, file in ipairs(files) do
            -- Extract just the filename
            local filename = string.match(file, "[^\\]*$")
            table.insert(configs, filename)
        end
        return configs
    end

    uiLibrary.refreshConfigs = function(self)
        if not self.options or not self.options["selected_config"] then return end
        local configs = {}
        for _, file in ipairs(listfiles("OsirisCFGS")) do
            local filename = string.match(file, "[^\\]*$")
            table.insert(configs, filename)
        end
        self.options["selected_config"].refresh(configs)
    end

    uiLibrary.deleteConfig = function(self)
        local name = self.flags["selected_config"]
        if not name then return self:notify("No config selected!") end
        
        local path = "OsirisCFGS/"..name
        if isfile(path) then
            delfile(path)
            self:notify("Deleted config: "..name)
            self:refreshConfigs()
        else
            self:notify("Config not found: "..name)
        end
    end

    return uiLibrary
end

return configSystem
