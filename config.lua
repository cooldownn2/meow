local config = {}

function config:init(library)
    self.library = library
    -- Create config folder if it doesn't exist
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end
end

function config:getConfig(name)
    local path = "OsirisCFGS/" .. tostring(name) .. ".cfg"
    if not isfile(path) then return nil end
    local success, data = pcall(function()
        return game:GetService("HttpService"):JSONDecode(readfile(path))
    end)
    return success and data or nil
end

function config:saveConfig(name, data)
    local path = "OsirisCFGS/" .. tostring(name) .. ".cfg"
    local success, err = pcall(function()
        writefile(path, game:GetService("HttpService"):JSONEncode(data))
    end)
    return success
end

function config:getConfigs()
    local files = {}
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
        return files
    end
    
    for _, file in ipairs(listfiles("OsirisCFGS")) do
        if file:sub(-4) == ".cfg" then
            table.insert(files, file:match("([^/\\]+)%.cfg$"))
        end
    end
    return files
end

function config:refresh()
    if not self.library or not self.library.options or not self.library.options["selected_config"] then
        return
    end
    
    local configs = self:getConfigs()
    if self.library.options["selected_config"].refresh then
        self.library.options["selected_config"].refresh(configs)
    end
end

return config
