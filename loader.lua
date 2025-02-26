local loader = {
    init = function()
        -- Create config folder first
        if not isfolder("OsirisCFGS") then
            makefolder("OsirisCFGS")
        end

        -- Load UI
        local content = game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
        if not content then
            print("[LOADER] Failed to fetch UI module")
            return
        end

        local ui = loadstring(content)()
        if not ui then
            print("[LOADER] Failed to execute UI module")
            return
        end

        -- Initialize UI properties
        _G.Library = ui
        ui.flags = ui.flags or {}
        ui.options = ui.options or {}
        ui.tabs = ui.tabs or {}
        
        -- Add config methods to UI
        ui.createConfig = function()
            local name = ui.flags["config_name"]
            if not name or name == "" then 
                return ui:notify("Please enter a config name")
            end

            local configPath = "OsirisCFGS/" .. name .. ".cfg"
            if isfile(configPath) then
                return ui:notify("Config already exists!")
            end

            local config = {}
            for i,v in next, ui.flags do
                if ui.options[i] and not ui.options[i].skipflag then
                    if typeof(v) == "Color3" then
                        config[i] = {v.R,v.G,v.B}
                    elseif typeof(v) == "EnumItem" then
                        config[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}
                    else
                        config[i] = v
                    end
                end
            end

            writefile(configPath, game:GetService("HttpService"):JSONEncode(config))
            ui:notify("Created config: " .. name)
            ui:refreshConfigs()
        end

        ui.refreshConfigs = function()
            local configs = {}
            for _, file in ipairs(listfiles("OsirisCFGS")) do
                if file:sub(-4) == ".cfg" then
                    table.insert(configs, file:match("([^/\\]+)%.cfg$"))
                end
            end
            if ui.options["selected_config"] and ui.options["selected_config"].refresh then
                ui.options["selected_config"].refresh(configs)
            end
        end

        ui.deleteConfig = function()
            local name = ui.flags["selected_config"]
            if not name then return ui:notify("No config selected") end
            
            local path = "OsirisCFGS/" .. name .. ".cfg"
            if isfile(path) then
                delfile(path)
                ui:notify("Deleted config: " .. name)
                ui:refreshConfigs()
            end
        end

        ui.saveConfig = function()
            local name = ui.flags["selected_config"]
            if not name then return ui:notify("No config selected") end
            
            -- ... rest of save config code ...
        end

        ui.loadConfig = function()
            local name = ui.flags["selected_config"]
            if not name then return ui:notify("No config selected") end
            
            -- ... rest of load config code ...
        end

        -- Initialize configs
        ui:refreshConfigs()

        return ui
    end
}

return loader
