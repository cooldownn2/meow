local success, result = pcall(function()
    -- Load library
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/Library.lua"))()
    
    -- Load UI
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/cooldownn2/meow/refs/heads/main/UI.lua"))()
end)

if not success then
    warn("Failed to load:", result)
end
