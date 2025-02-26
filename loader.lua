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
        local success2, result = pcall(loadstring(content))
        
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
    -- Load UI first since it contains core functionality
    self.ui = loadFile("UI", urls.ui)
    if not self.ui then return end

    -- Load other modules
    self.utils = loadFile("Utils", urls.utils)
    self.config = loadFile("Config", urls.config)
    self.tabs = loadFile("Tabs", urls.tabs)

    -- Initialize the UI library first
    if type(self.ui) == "table" then
        self.ui:init()
    end

    -- Initialize other modules after UI is ready
    if self.config then self.config:init(self.ui) end
    if self.tabs then self.tabs:init(self.ui) end

    return self.ui
end

return loader
