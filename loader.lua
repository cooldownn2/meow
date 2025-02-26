local loader = {
    init = function()
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

        return ui
    end
}

return loader
