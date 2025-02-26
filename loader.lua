local loader = {
    init = function()
        -- Initialize core UI flags and options first
        _G.Library = {
            flags = {},
            options = {},
            tabs = {},
            toInvis = {},
            libColor = Color3.fromRGB(69, 23, 255),
            multiZindex = 200,
            tabbuttons = {}
        }

        -- Load UI
        local success, uiContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        end)
        
        if success then
            local ui = loadstring(uiContent)()
            if ui then
                -- Merge UI properties
                for k, v in pairs(ui) do
                    _G.Library[k] = v
                end
                
                -- Initialize config first
                local configSuccess, configContent = pcall(function()
                    return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/config.lua")
                end)
                
                if configSuccess then
                    local config = loadstring(configContent)()
                    if config then
                        config:init(_G.Library)
                        _G.Library.config = config
                    end
                end

                -- Initialize UI after config
                if _G.Library.init then
                    _G.Library:init()
                end

                return _G.Library
            end
        end
        
        warn("Failed to initialize UI")
        return nil
    end
}

return loader
