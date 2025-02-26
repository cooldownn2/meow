local loader = {}

local function log(msg)
    print("[LOADER] " .. tostring(msg))
end

function loader.init()
    local content = game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua")
    if not content then
        log("Failed to fetch UI module")
        return
    end

    local success, result = pcall(function()
        local ui = loadstring(content)()
        _G.Library = ui
        if type(ui) ~= "table" then
            error("UI module must return a table")
        end
        -- Create essential UI properties if they don't exist
        ui.flags = ui.flags or {}
        ui.options = ui.options or {}
        ui.tabs = ui.tabs or {}
        return ui
    end)
    if not success then
        log("Failed to initialize UI: " .. tostring(result))
        return
    end

    return result
end

return loader
