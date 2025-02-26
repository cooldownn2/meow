local loader = {
    init = function()
        -- Initialize base UI table
        local ui = {
            flags = {},
            options = {
                selected_config = {
                    values = {},
                    refresh = function(configs)
                        ui.options.selected_config.values = configs
                        if ui.options.selected_config.updateList then
                            ui.options.selected_config.updateList(configs)
                        end
                    end,
                    updateList = nil -- Will be set by the UI
                }
            },
            tabs = {},
            toInvis = {},
            multiZindex = 200,
            libColor = Color3.fromRGB(69, 23, 255),
            
            -- Add config methods directly to UI
            createConfig = function(self)
                local name = self.flags["config_name"]
                if not name or name == "" then 
                    return self:notify("Please enter a config name")
                end
                local path = "OsirisCFGS/" .. name .. ".cfg"
                if isfile(path) then
                    return self:notify("Config already exists!")
                end
                local data = {}
                for i,v in pairs(self.flags) do
                    if self.options[i] and not self.options[i].skipflag then
                        data[i] = v
                    end
                end
                writefile(path, game:GetService("HttpService"):JSONEncode(data))
                self:notify("Created config: " .. name)
                self:refreshConfigs()
            end,

            refreshConfigs = function(self)
                local configs = {}
                for _, file in ipairs(listfiles("OsirisCFGS")) do
                    local name = file:match("([^/\\]+)%.cfg$")
                    if name then
                        table.insert(configs, name)
                    end
                end
                self.options.selected_config.refresh(configs)
            end
        }

        -- Create config folder
        if not isfolder("OsirisCFGS") then
            makefolder("OsirisCFGS")
        end

        -- Load UI module
        local success, uiContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        end)

        if success then
            local uiModule = loadstring(uiContent)()
            -- Merge UI module with our base UI table
            for k, v in pairs(uiModule) do
                ui[k] = v
            end
        end

        -- Set up essential UI methods
        ui.notify = ui.notify or function(self, text)
            print("[UI]", text)
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
