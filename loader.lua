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
    
    -- Execute in specific order
    local success, utils = pcall(function() return loadstring(files.utils)() end)
    if not success then return log("Utils execution failed: " .. tostring(utils)) end
    
    local success, ui = pcall(function() return loadstring(files.ui)() end)
    if not success then return log("UI execution failed: " .. tostring(ui)) end
    
    local success, config = pcall(function() return loadstring(files.config)() end)
    if not success then return log("Config execution failed: " .. tostring(config)) end
    
    local success, tabs = pcall(function() return loadstring(files.tabs)() end)
    if not success then return log("Tabs execution failed: " .. tostring(tabs)) end
    
    -- Store references
    _G.Library = ui
    ui.config = config
    ui.tabs = tabs
    ui.utils = utils
    
    -- Initialize in correct order
    if config then config:init(ui) end
    if tabs then tabs:init(ui) end
    if ui.init then ui:init() end
    
    return ui
end

return loader
