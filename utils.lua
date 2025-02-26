local utils = {}

function utils:init(library)
    self.library = library
end

function utils.formatConfigName(filePath)
    return filePath:match("([^/]+)%.cfg$")
end

function utils.contains(list, x)
    for _, v in pairs(list) do
        if v == x then return true end
    end
    return false
end

return utils
