
-- First define the library
local Library = {}
function Library.new(title, folder)
    local menu = {
        values = {},
        tabs = {}
    }
    
    function menu.new_tab(icon)
        local tab = {
            sections = {}
        }
        -- ... rest of library implementation
        return tab
    end
    
    return menu
end

-- Then load and execute the UI with the local library
local menu
do
    local library = Library
    menu = library.new([[universal <font color="rgb(78, 93, 234)">v1</font>]], "nemv2\\")
    -- ... rest of UI implementation
end
