local config = {}
local utils = require("utils")

function config:init(library)
    self.library = library
    
    -- Create config folder
    if not isfolder("OsirisCFGS") then
        makefolder("OsirisCFGS")
    end
end

function config:getConfigPath(name)
    return "OsirisCFGS/" .. name .. ".cfg"
end

function config:formatConfigName(filePath)
    return filePath:match("([^/]+)%.cfg$")
end

function config:create()
    local name = self.library.flags["config_name"]
    if not name or name == "" then return self.library:notify("Please enter a config name") end

    local configPath = self:getConfigPath(name)
    if isfile(configPath) then return self.library:notify("Config already exists!") end

    local config = {}
    for i,v in next, self.library.flags do
        if self.library.options[i] and not self.library.options[i].skipflag then
            if typeof(v) == "Color3" then
                config[i] = {v.R,v.G,v.B}
            elseif typeof(v) == "EnumItem" then
                config[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
            else
                config[i] = v
            end
        end
    end

    writefile(configPath, game:GetService("HttpService"):JSONEncode(config))
    self.library:notify("Created config: " .. name)
    self:refresh()
end

-- Move other config functions here (save, load, refresh, delete)
-- ...rest of config functions...

return config
