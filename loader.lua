local loader = {
    init = function()
        -- Create config folder first
        if not isfolder("OsirisCFGS") then
            makefolder("OsirisCFGS")
        end

        -- Load UI
        local ui = {
            flags = {},
            options = {},
            tabs = {},
            toInvis = {},
            colorpicking = false,
            multiZindex = 200,
            tabbuttons = {},
            libColor = Color3.fromRGB(69, 23, 255),
            disabledcolor = Color3.fromRGB(233, 0, 0)
        }

        -- Load and execute UI module
        local success, uiModule = pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua"))()
        end)

        if success and uiModule then
            -- Merge UI module with our base UI table
            for k, v in pairs(uiModule) do
                ui[k] = v
            end
        end

        -- Set up essential UI methods
        ui.notify = ui.notify or function(self, text)
            print("[UI]", text)
        end

        ui.refreshConfigs = function(self)
            local configs = {}
            for _, file in ipairs(listfiles("OsirisCFGS")) do
                local name = file:match("([^/\\]+)%.cfg$")
                if name then
                    table.insert(configs, name)
                end
            end
            
            if self.options and self.options["selected_config"] then
                if type(self.options["selected_config"].refresh) == "function" then
                    self.options["selected_config"].refresh(configs)
                end
            end
        end

        -- Store UI reference globally
        _G.Library = ui
        
        -- Initialize UI
        if ui.init then
            ui:init()
        end

        return ui
    end
}

return loader
