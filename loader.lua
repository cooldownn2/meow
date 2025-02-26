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

    -- Create empty UI global to allow cross-references
    _G.Library = {}
    
    -- Execute modules in order
    local success, utils = pcall(loadstring(files.utils))
    if not success then return log("Utils execution failed: " .. tostring(utils)) end
    
    local success, config = pcall(loadstring(files.config))
    if not success then return log("Config execution failed: " .. tostring(config)) end
    
    local success, tabs = pcall(loadstring(files.tabs))
    if not success then return log("Tabs execution failed: " .. tostring(tabs)) end
    
    -- Execute UI last since it depends on other modules
    local success, ui = pcall(function()
        local fn = loadstring(files.ui)
        return fn()
    end)
    if not success then return log("UI execution failed: " .. tostring(ui)) end

    -- Store all modules
    self.ui = ui
    self.utils = utils
    self.config = config 
    self.tabs = tabs
    
    -- Update global reference
    _G.Library = ui
    
    -- Initialize modules in correct order
    log("Initializing modules...")
    
    -- Initialize UI first
    ui.utils = utils
    ui.config = config
    ui.tabs = tabs
    
    -- Then initialize supporting modules
    if config and config.init then config:init(ui) end
    if tabs and tabs.init then tabs:init(ui) end
    
    log("Initialization complete")
    return ui
end

return loader
