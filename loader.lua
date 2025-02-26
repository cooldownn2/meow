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
        local func = loadstring(content)
        if func then
            local success2, result = pcall(func)
            if success2 then
                log(name .. " executed successfully")
                return result
            else
                log(name .. " execution failed: " .. tostring(result))
            end
        end
    else
        log(name .. " failed to load: " .. tostring(content))
    end
    return nil
end

function loader:init()
    -- Load modules in order
    self.utils = loadFile("Utils", urls.utils)
    self.config = loadFile("Config", urls.config)
    self.tabs = loadFile("Tabs", urls.tabs)
    
    -- Load and initialize UI last since it depends on other modules
    local ui = loadFile("UI", urls.ui)
    if ui then
        _G.Library = ui -- Store UI library globally to persist
        
        -- Initialize modules with UI reference
        if self.config then self.config:init(ui) end
        if self.tabs then self.tabs:init(ui) end
        
        return ui
    end
end

return loader
