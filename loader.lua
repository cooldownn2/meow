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

function loader:init()
    -- Load base UI directly first
    local success, uiContent = pcall(function()
        return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
    end)
    
    if not success or not uiContent then
        return log("Failed to load UI: " .. tostring(uiContent))
    end
    
    -- Execute UI first to create base library
    local success, ui = pcall(function()
        return loadstring(uiContent)()
    end)
    
    if not success or not ui then
        return log("Failed to execute UI: " .. tostring(ui))
    end
    
    -- Store UI reference globally first
    _G.Library = ui
    self.ui = ui
    
    -- Initialize key UI components
    ui.flags = ui.flags or {}
    ui.options = ui.options or {}
    
    -- Initialize core functions
    if type(ui.createConfig) ~= "function" then
        ui.createConfig = function() end
    end
    
    -- Now load and initialize supporting modules
    for name, url in pairs({
        utils = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/utils.lua",
        config = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua",
        tabs = "https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/tabs.lua"
    }) do
        local success, content = pcall(function() return game:HttpGet(url) end)
        if success then
            local success2, module = pcall(loadstring(content))
            if success2 and module then
                self[name] = module
                ui[name] = module
                if type(module.init) == "function" then
                    module:init(ui)
                end
            end
        end
    end
    
    log("Initialization complete")
    return ui
end

return loader
