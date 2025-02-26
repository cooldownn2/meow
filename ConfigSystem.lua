local configSystem = {}
local library = nil

function configSystem:Init(uiLibrary)
    library = uiLibrary
    
    -- Add config functions to library
    function library:createConfig()
        local name = library.flags["config_name"]
        if not name or name == "" then 
            library:notify("Please enter a config name!")
            return 
        end
        
        local configs = self:getConfigList()
        if table.find(configs, name..".cfg") then 
            library:notify(name..".cfg already exists!")
            return 
        end

        local config = self:saveConfigToTable()
        writefile("OsirisCFGS/"..name..".cfg", game:GetService("HttpService"):JSONEncode(config))
        library:notify("Created config: "..name..".cfg")
        self:refreshConfigs()
    end

    function library:saveConfig()
        local name = library.flags["selected_config"]
        if not name then return library:notify("No config selected!") end
        
        local config = self:saveConfigToTable()
        writefile("OsirisCFGS/"..name, game:GetService("HttpService"):JSONEncode(config))
        library:notify("Saved config: "..name)
    end

    function library:saveConfigToTable()
        local config = {}
        for flag, value in pairs(library.flags) do
            if library.options[flag] and not library.options[flag].skipflag then
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

    function library:loadConfig()
        local name = library.flags["selected_config"]
        if not name then return library:notify("No config selected!") end
        
        local path = "OsirisCFGS/"..name
        if not isfile(path) then
            return library:notify("Config not found: "..name)
        end

        local success, config = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile(path))
        end)

        if not success then
            return library:notify("Failed to load config: "..name)
        end

        for flag, value in pairs(config) do
            if library.options[flag] then
                local option = library.options[flag]
                if option.type == "colorpicker" then
                    option.changeState(Color3.new(value[1], value[2], value[3]))
                elseif option.type == "keybind" then
                    option.changeState(Enum[value[1]][value[2]])
                else
                    option.changeState(value)
                end
            end
        end
        
        library:notify("Loaded config: "..name)
    end

    function library:getConfigList()
        local files = listfiles("OsirisCFGS")
        local configs = {}
        for _, file in ipairs(files) do
            -- Extract just the filename
            local filename = string.match(file, "[^\\]*$")
            table.insert(configs, filename)
        end
        return configs
    end

    function library:refreshConfigs()
        local configs = self:getConfigList()
        if library.options["selected_config"] then
            library.options["selected_config"].refresh(configs)
        end
    end

    function library:deleteConfig()
        local name = library.flags["selected_config"]
        if not name then return library:notify("No config selected!") end
        
        local path = "OsirisCFGS/"..name
        if isfile(path) then
            delfile(path)
            library:notify("Deleted config: "..name)
            self:refreshConfigs()
        else
            library:notify("Config not found: "..name)
        end
    end
end

return configSystem
