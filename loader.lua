local loader = {
    init = function()
        -- Create config folder
        if not isfolder("OsirisCFGS") then
            makefolder("OsirisCFGS")
        end

        -- Load UI first
        local success, uiContent = pcall(function()
            return game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        end)

        if not success then
            warn("Failed to load UI:", uiContent)
            return
        end

        local success2, ui = pcall(loadstring(uiContent))
        if not success2 or not ui then
            warn("Failed to execute UI:", ui)
            return
        end

        -- Initialize required tables
        ui.flags = ui.flags or {}
        ui.options = ui.options or {}
        ui.tabs = ui.tabs or {}
        ui.toInvis = ui.toInvis or {}
        ui.multiZindex = 200
        ui.tabbuttons = ui.tabbuttons or {}
        ui.libColor = Color3.fromRGB(69, 23, 255)
        ui.disabledcolor = Color3.fromRGB(233, 0, 0)

        -- Add essential UI methods
        ui.notify = ui.notify or function(self, text)
            print("[UI]", text or "")
        end

        ui.createConfig = ui.createConfig or function(self)
            if not self.flags then return self:notify("No flags table") end
            local name = self.flags["config_name"]
            if not name or name == "" then 
                return self:notify("Enter config name")
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
        end

        ui.refreshConfigs = ui.refreshConfigs or function(self)
            local configs = {}
            for _, file in ipairs(listfiles("OsirisCFGS")) do
                local name = file:match("([^/\\]+)%.cfg$")
                if name then
                    table.insert(configs, name)
                end
            end
            self.options.selected_config.refresh(configs)
        end

        -- Store UI reference globally
        _G.Library = ui

        -- Auto-initialize if init function exists
        if type(ui.init) == "function" then
            ui:init()
        end

        return ui
    end
}

return loader
