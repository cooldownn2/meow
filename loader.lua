-- ...existing code...

function loader:init()
    -- Load components in order
    self.utils = loadFile("Utils", urls.utils)
    if not self.utils then return end
    
    -- Initialize config first
    self.config = loadFile("Config", urls.config)
    if not self.config then return end
    
    -- Load UI after config
    self.ui = loadFile("UI", urls.ui)
    if not self.ui then return end
    
    -- Load tabs last
    self.tabs = loadFile("Tabs", urls.tabs)
    if not self.tabs then return end

    -- Initialize in correct order
    self.config:init(self.ui)
    self.ui.config = self.config
    
    -- Initialize UI 
    if self.ui.init then
        self.ui:init()
    end
    
    -- Initialize tabs after UI
    if self.tabs then
        self.tabs:init(self.ui)
    end
    
    return self.ui
end

-- ...existing code...
