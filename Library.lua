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
        
        function tab.new_section(name)
            local section = {
                sectors = {}
            }
            
            function section.new_sector(name, side)
                local sector = {
                    elements = {}
                }
                
                function sector.element(type, name, data, callback)
                    local element = {
                        value = data and data.default or nil,
                        callback = callback,
                    }
                    
                    function element:add_keybind(default, callback)
                        return element
                    end
                    
                    function element:add_color(data, transparency, callback)
                        return element
                    end
                    
                    function element:set_value(value)
                        element.value = value
                        if callback then
                            callback(value)
                        end
                    end
                    
                    menu.values[#menu.tabs] = menu.values[#menu.tabs] or {}
                    menu.values[#menu.tabs][name] = menu.values[#menu.tabs][name] or {}
                    menu.values[#menu.tabs][name][sector] = menu.values[#menu.tabs][name][sector] or {}
                    
                    return element
                end
                
                return sector
            end
            
            return section
        end
        
        table.insert(menu.tabs, tab)
        return tab
    end
    
    function menu.load_cfg()
    end
    
    function menu.save_cfg()
    end
    
    return menu
end

return Library
