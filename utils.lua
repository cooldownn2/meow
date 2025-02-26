local utils = {}

function utils.contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

function utils.formatConfigName(filePath)
    return filePath:match("([^/]+)%.cfg$")
end

function utils.getConfigPath(name)
    return "OsirisCFGS/" .. name .. ".cfg"
end

-- Add more utility functions as needed

return utils
