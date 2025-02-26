local loader = {}

-- Log function for debugging
local function log(msg)
    print("[LOADER] " .. tostring(msg))
end

-- Updated GitHub raw URLs with correct paths
local urls = {
    ui = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua",
    config = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua",
    tabs = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/tabs.lua", 
    utils = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/utils.lua"
}

-- Load a file from GitHub
local function loadFile(name, url)
    log("Loading " .. name .. "...")
    
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        log(name .. " content loaded")
        -- Return the content instead of executing it
        return content
    end
    log(name .. " failed to load: " .. tostring(content))
    return nil
end

function loader:init()
    -- First load all file contents
    local files = {}
    for name, url in pairs(urls) do
        files[name] = loadFile(name, url)
        if not files[name] then
            log("Failed to load " .. name)
            return
        end
    end
    
    -- Execute UI directly first
    local success, ui = pcall(function() 
        local fn = loadstring(files.ui)
        return fn()  -- Execute UI without custom environment
    end)
    if not success then 
        return log("UI execution failed: " .. tostring(ui)) 
    end
    
    -- Store UI reference
    self.ui = ui
    _G.Library = ui
    
    -- Execute remaining modules
    local success, utils = pcall(loadstring(files.utils))
    if not success then return log("Utils execution failed: " .. tostring(utils)) end
    self.utils = utils
    
    local success, config = pcall(loadstring(files.config))
    if not success then return log("Config execution failed: " .. tostring(config)) end
    self.config = config
    
    local success, tabs = pcall(loadstring(files.tabs))
    if not success then return log("Tabs execution failed: " .. tostring(tabs)) end
    self.tabs = tabs
    
    -- Initialize modules after UI is loaded
    if self.utils then ui.utils = self.utils end
    if self.config then 
        ui.config = self.config
        self.config:init(ui)
    end
    if self.tabs then
        ui.tabs = self.tabs 
        self.tabs:init(ui)
    end
    
    return ui
end

return loader
