local loader = {}

-- GitHub raw URLs for each component
local urls = {
    ui = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua",
    config = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua",
    tabs = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/tabs.lua",
    utils = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/utils.lua"
}

-- Load a file from GitHub
local function loadFile(url)
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        local func = loadstring(content)
        if func then
            return func()
        end
    end
    return nil
end

function loader:init()
    -- Load components in order
    self.utils = loadFile(urls.utils)
    self.ui = loadFile(urls.ui) 
    self.config = loadFile(urls.config)
    self.tabs = loadFile(urls.tabs)
    
    -- Initialize UI
    if self.ui then
        self.ui:init()
    end
end

return loader
