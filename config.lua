local config = {}

function config:init(library)
    if not library then return end
    self.library = library

    -- Create config folder
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end

    -- Initialize default config values
    library.flags = library.flags or {}
    library.flags["config_name"] = ""
    library.flags["selected_config"] = ""
    
    -- Initialize config options
    library.options = library.options or {}
    library.options["selected_config"] = {
        values = {},
        refresh = function(tbl)
            library.options["selected_config"].values = tbl or {}
        end
    }

    -- Add config methods
    library.createConfig = function(self)
        return config:create(self.flags["config_name"], self.flags)
    end

    -- Initialize other library methods
    library.saveConfig = self.saveConfig
    library.loadConfig = self.loadConfig
    library.refreshConfigs = self.refresh
    
    -- Do initial config refresh
    self:refresh()
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
