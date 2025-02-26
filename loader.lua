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
        local success2, result = pcall(function() 
            return loadstring(content)()
        end)
        
        if success2 then
            log(name .. " executed successfully")
            return result
        else
            log(name .. " execution failed: " .. tostring(result))
        end
    else
        log(name .. " failed to load: " .. tostring(content))
    end
    return nil
end

function loader:init()
    log("Initializing loader...")
    
    -- Load components in order
    self.utils = loadFile("Utils", urls.utils)
    if not self.utils then return end
    
    self.ui = loadFile("UI", urls.ui)
    if not self.ui then return end
    
    self.config = loadFile("Config", urls.config)
    if not self.config then return end
    
    self.tabs = loadFile("Tabs", urls.tabs)
    if not self.tabs then return end

    -- Initialize UI with dependencies
    if self.ui.init then
        self.ui:init(self.config, self.tabs)
        log("UI initialized")
    else
        log("UI init function not found")
    end
    
    log("Loader finished")
end

return loader
