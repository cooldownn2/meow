local loader = {
    init = function()
        -- Create config folder if it doesn't exist
        if not isfolder("OsirisCFGS") then
            makefolder("OsirisCFGS")
        end

        -- Load UI first since it contains the base functionality
        local success, uiContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        end)
        
        if not success then 
            warn("Failed to load UI:", uiContent)
            return
        end

        -- Execute UI module
        local ui = loadstring(uiContent)()
        if not ui then
            warn("Failed to initialize UI")
            return
        end

        -- Set up global reference early
        _G.Library = ui

        -- Let UI initialize itself first
        if ui.init then
            ui:init()
        end

        -- Load and initialize supporting modules after UI is ready
        local modules = {
            config = "config.lua",
            utils = "utils.lua",
            tabs = "tabs.lua"
        }

        for name, file in pairs(modules) do
            local success, content = pcall(function()
                return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/" .. file)
            end)
            
            if success then
                local module = loadstring(content)()
                if module and module.init then
                    module:init(ui)
                    ui[name] = module
                end
            end
        end

        return ui
    end
}

return loader
