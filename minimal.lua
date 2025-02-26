local library = {}

-- Initialize library directly without loading
do
    library.new = function(title, folder)
        local menu = {
            values = {},
            tabs = {}
        }
        
        function menu.new_tab(icon)
            local tab = {
                sections = {}
            }
            return tab
        end
        
        return menu
    end
end

-- Initialize UI
local menu = library.new([[universal <font color="rgb(78, 93, 234)">v1</font>]], "nemv2\\")

-- Run the rest of the UI code
loadstring(game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua"))()
