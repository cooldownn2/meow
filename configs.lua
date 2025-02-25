local configs = {}

-- Create configs folder if it doesn't exist
if not isfolder("MeowConfigs") then
    makefolder("MeowConfigs")
end

function configs.getConfigList()
    local files = {}
    for _, file in ipairs(listfiles("MeowConfigs")) do
        local fileName = string.match(file, "[^\\]+$")
        if string.sub(fileName, -4) == ".cfg" then
            table.insert(files, string.sub(fileName, 1, -5))
        end
    end
    return files
end

function configs.init(library)
    library.createConfig = function()
        local name = library.flags["config_name"]
        if not name or name == "" then return library:notify("Please enter a config name") end
        
        if isfile("MeowConfigs/" .. name .. ".cfg") then 
            return library:notify("Config already exists!") 
        end
        
        local data = {}
        for flag, value in pairs(library.flags) do
            if library.options[flag] and not library.options[flag].skipflag then
                if typeof(value) == "Color3" then
                    data[flag] = {value.R, value.G, value.B}
                elseif typeof(value) == "EnumItem" then
                    data[flag] = {string.split(tostring(value),".")[2], string.split(tostring(value),".")[3]}
                else
                    data[flag] = value
                end
            end
        end
        
        writefile("MeowConfigs/" .. name .. ".cfg", game:GetService("HttpService"):JSONEncode(data))
        library:notify("Created config: " .. name)
        library:refreshConfigs()
    end

    library.saveConfig = function()
        local name = library.flags["selected_config"]
        if not name then
            library:notify("No config selected!")
            return
        end

        local data = {}
        for flag, value in pairs(library.flags) do
            if library.options[flag] and not library.options[flag].skipflag then
                if typeof(value) == "Color3" then
                    data[flag] = {value.R, value.G, value.B}
                elseif typeof(value) == "EnumItem" then
                    data[flag] = {string.split(tostring(value),".")[2], string.split(tostring(value),".")[3]}
                else
                    data[flag] = value
                end
            end
        end

        writefile("MeowConfigs/" .. name .. ".cfg", game:GetService("HttpService"):JSONEncode(data))
        library:notify("Saved config: " .. name)
    end

    library.loadConfig = function()
        local name = library.flags["selected_config"]
        if not name then
            library:notify("No config selected!")
            return
        end

        if not isfile("MeowConfigs/" .. name .. ".cfg") then
            library:notify("Config doesn't exist!")
            return
        end

        local success, data = pcall(function()
            return game:GetService("HttpService"):JSONDecode(readfile("MeowConfigs/" .. name .. ".cfg"))
        end)

        if not success or not data then
            library:notify("Failed to load config!")
            return
        end

        for flag, value in pairs(data) do
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
        library:notify("Loaded config: " .. name)
    end

    library.deleteConfig = function()
        local name = library.flags["selected_config"]
        if not name then
            library:notify("No config selected!")
            return
        end

        if isfile("MeowConfigs/" .. name .. ".cfg") then
            delfile("MeowConfigs/" .. name .. ".cfg")
            library:notify("Deleted config: " .. name)
            
            -- Refresh config list
            if library.options["selected_config"] then
                library.options["selected_config"].refresh(configs.getConfigList())
            end
        end
    end

    library.refreshConfigs = function()
        if library.options["selected_config"] then
            library.options["selected_config"].refresh(configs.getConfigList())
        end
    end

    return library
end

return configs
