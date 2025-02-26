local tabs = {}

function tabs:init(library)
    self.library = library
    self.tabs = {}
    
    -- Let UI handle tab creation
    if library and library.addTab then
        -- Create default tabs
        local defaultTabs = {"Legit", "Ragebot", "Visuals", "Misc", "Settings"}
        for _, name in ipairs(defaultTabs) do
            self:createTab(name)
        end
    end
end

function tabs:createTab(name)
    if not self.library then return end
    local tab = self.library:addTab(name)
    if tab then
        self.tabs[name] = tab
    end
    return tab
end

return tabs
