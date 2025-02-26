local loader = {}

local function log(msg)
    print("[LOADER] " .. tostring(msg))
end

local urls = {
    ui = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua",
    config = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua",
    tabs = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/tabs.lua", 
    utils = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/utils.lua"
}

local function loadModule(name)
    log("Loading " .. name)
    local success, content = pcall(function()
        return game:HttpGet(urls[string.lower(name)])
    end)
    
    if success then
        log(name .. " content loaded")
        local chunk, err = loadstring(content)
        if chunk then
            local success, module = pcall(chunk)
            if success and module then
                log(name .. " initialized")
                return module
            end
            log(name .. " execution failed: " .. tostring(module))
        end
        log(name .. " compilation failed: " .. tostring(err))
    end
    log(name .. " failed to load: " .. tostring(content))
    return nil
end

function loader.init()
    -- Set up global environment
    _G.Library = {}
    
    -- Load UI first
    local ui = loadModule("UI")
    if not ui then return end
    
    -- Load supporting modules
    local config = loadModule("Config")
    local utils = loadModule("Utils")
    local tabs = loadModule("Tabs")
    
    -- Initialize modules
    if config then 
        ui.config = config
        config:init(ui)
    end
    
    if utils then
        ui.utils = utils
    end
    
    if tabs then
        ui.tabs = tabs
        tabs:init(ui)
    end
    
    -- Store UI reference globally
    _G.Library = ui
    
    return ui
end

return loader
