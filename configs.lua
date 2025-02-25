local configs = {}
local HttpService = game:GetService("HttpService")

-- Create config folder if it doesn't exist
if not isfolder("MeowConfigs") then
    makefolder("MeowConfigs")
end

function configs:saveConfig(name, flags, options)
    if not name then return false end
    local configPath = "MeowConfigs/" .. name .. ".cfg"
    local data = {}
    
    for flag, value in pairs(flags) do
        if options[flag] and not options[flag].skipflag then
            if typeof(value) == "Color3" then
                data[flag] = {value.R, value.G, value.B}
            elseif typeof(value) == "EnumItem" then
                data[flag] = {string.split(tostring(value),".")[2], string.split(tostring(value),".")[3]}
            else
                data[flag] = value
            end
        end
    end
    
    writefile(configPath, HttpService:JSONEncode(data))
    return true
end

function configs:loadConfig(name, flags, options)
    if not name then return false end
    local configPath = "MeowConfigs/" .. name .. ".cfg"
    
    if not isfile(configPath) then return false end
    
    local success, data = pcall(function()
        return HttpService:JSONDecode(readfile(configPath))
    end)
    
    if not success or not data then return false end
    
    for flag, value in pairs(data) do
        if options[flag] then
            local option = options[flag]
            if option.type == "colorpicker" then
                option.changeState(Color3.new(value[1], value[2], value[3]))
            elseif option.type == "keybind" then
                option.changeState(Enum[value[1]][value[2]])
            else
                option.changeState(value)
            end
        end
    end
    
    return true
end

function configs:listConfigs()
    local files = {}
    if isfolder("MeowConfigs") then
        for _, file in pairs(listfiles("MeowConfigs")) do
            -- Clean up file path to just get name
            local name = string.match(file, "[^\\]+$") -- Get everything after last backslash
            name = string.gsub(name, ".cfg$", "") -- Remove .cfg extension
            table.insert(files, name)
        end
    end
    return files
end

function configs:deleteConfig(name)
    if not name then return false end
    local configPath = "MeowConfigs/" .. name .. ".cfg"
    
    if isfile(configPath) then
        delfile(configPath)
        return true
    end
    return false
end

return configs
