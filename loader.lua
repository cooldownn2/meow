if not isfolder("MeowConfigs") then
    makefolder("MeowConfigs")
end

-- Load main UI
loadstring(game:HttpGet('https://raw.githubusercontent.com/cooldownn2/meow/main/meow/UI.lua'))()
