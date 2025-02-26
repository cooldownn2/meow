
local Settings = {
    -- Add validation rules
    Validate = function(self, settings)
        if type(settings) ~= "table" then
            return false, "Invalid settings format"
        end
        
        -- Validate FOV settings
        if settings.FOV then
            if type(settings.FOV.SilentAimSize) ~= "number" then
                settings.FOV.SilentAimSize = 100
            end
            settings.FOV.SilentAimSize = math.clamp(settings.FOV.SilentAimSize, 0, 1000)
        end
        
        -- Validate prediction settings
        if settings.SilentAimSettings then
            if type(settings.SilentAimSettings.MovementPredictionAmount) ~= "number" then
                settings.SilentAimSettings.MovementPredictionAmount = 0.165
            end
        end
        
        return true, settings
    end,

    -- Add save/load with validation
    SaveSettings = function(self, settings)
        local success, validated = self:Validate(settings)
        if not success then return false end
        
        return pcall(function()
            writefile("spice_settings.json", game:GetService("HttpService"):JSONEncode(validated))
        end)
    end,
    
    LoadSettings = function(self)
        return pcall(function()
            local data = readfile("spice_settings.json")
            local decoded = game:GetService("HttpService"):JSONDecode(data)
            local success, validated = self:Validate(decoded)
            if success then
                return validated
            end
        end)
    end
}

return Settings
