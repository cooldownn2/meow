local tabs = {}

function tabs:init(library)
    if not library then return end
    
    self.library = library
    self.tabs = {}
    
    -- Create default tabs
    self:createTab("Legit")
    self:createTab("Ragebot")
    self:createTab("Visuals")
    self:createTab("Misc")
    self:createTab("Settings")
end

function tabs:createTab(name)
    if not self.library then return end
    local tab = self.library:addTab(name)
    self.tabs[name] = tab
    return tab
end

return tabs
