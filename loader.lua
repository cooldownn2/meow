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
    
    -- Execute files with proper environment setup
    local env = getfenv()
    env.require = function(module)
        if module == "utils" then
            return self.utils
        elseif module == "config" then
            return self.config
        elseif module == "tabs" then
            return self.tabs
        end
    end
    
    -- Load modules in order
    local success, utils = pcall(function() 
        local fn = loadstring(files.utils)
        setfenv(fn, env)
        return fn()
    end)
    if not success then return log("Utils execution failed: " .. tostring(utils)) end
    self.utils = utils
    
    local success, ui = pcall(function() 
        local fn = loadstring(files.ui)
        setfenv(fn, env)
        return fn()
    end)
    if not success then return log("UI execution failed: " .. tostring(ui)) end
    self.ui = ui
    
    local success, config = pcall(function()
        local fn = loadstring(files.config)
        setfenv(fn, env)
        return fn()
    end)
    if not success then return log("Config execution failed: " .. tostring(config)) end
    self.config = config
    
    local success, tabs = pcall(function()
        local fn = loadstring(files.tabs)
        setfenv(fn, env)
        return fn()
    end)
    if not success then return log("Tabs execution failed: " .. tostring(tabs)) end
    self.tabs = tabs
    
    -- Store UI globally
    _G.Library = self.ui
    
    -- Initialize modules
    if self.config then self.config:init(self.ui) end
    if self.tabs then self.tabs:init(self.ui) end
    if self.ui then
        self.ui.config = self.config
        self.ui.tabs = self.tabs
        self.ui.utils = self.utils
    end
    
    return self.ui
end

return loader
