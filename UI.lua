local inputService   = game:GetService("UserInputService")
local runService     = game:GetService("RunService")
local tweenService   = game:GetService("TweenService")
local players        = game:GetService("Players")
local localPlayer    = players.LocalPlayer
local mouse          = localPlayer:GetMouse()

local menu           = game:GetObjects("rbxassetid://12705540680")[1]

-- Handle different exploit environments
local function protectGui(gui)
    if syn then
        syn.protect_gui(gui)
    elseif protect_gui then
        protect_gui(gui)
    elseif gethui then
        gui.Parent = gethui()
        return
    end
    gui.Parent = game:GetService("CoreGui")
end

protectGui(menu)
menu.bg.Position     = UDim2.new(0.5,-menu.bg.Size.X.Offset/2,0.5,-menu.bg.Size.Y.Offset/2)
menu.bg.pre.Text = 'Seere<font color="#4517ff">.vip</font> - fiji was here!!!!'

local library = {cheatname = "";ext = "";gamename = "";colorpicking = false;tabbuttons = {};tabs = {};options = {};flags = {};scrolling = false;notifyText = Drawing.new("Text");playing = false;multiZindex = 200;toInvis = {};libColor = Color3.fromRGB(69, 23, 255);disabledcolor = Color3.fromRGB(233, 0, 0);blacklisted = {Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.UserInputType.MouseMovement}}

function draggable(a)local b=inputService;local c;local d;local e;local f;local function g(h)if not library.colorpicking then local i=h.Position-e;a.Position=UDim2.new(f.X.Scale,f.X.Offset+i.X,f.Y.Scale,f.Y.Offset+i.Y)end end;a.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch then c=true;e=h.Position;f=a.Position;h.Changed:Connect(function()if h.UserInputState==Enum.UserInputState.End then c=false end end)end end)a.InputChanged:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseMovement or h.UserInputType==Enum.UserInputType.Touch then d=h end end)b.InputChanged:Connect(function(h)if h==d and c then g(h)end end)end
draggable(menu.bg)sirisCFGS") then
    makefolder("OsirisCFGS")
local tabholder = menu.bg.bg.bg.bg.main.group
local tabviewer = menu.bg.bg.bg.bg.tabbuttons
-- Config system helper functions
local function formatConfigName(name)
    return name:gsub(".cfg", ""):gsub("OsirisCFGS/", "")
inputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.RightShift then
        menu.Enabled = not menu.Enabled
        library.scrolling = falsetConfigName(name) .. ".cfg"
        library.colorpicking = false

function draggable(a)local b=inputService;local c;local d;local e;local f;local function g(h)if not library.colorpicking then local i=h.Position-e;a.Position=UDim2.new(f.X.Scale,f.X.Offset+i.X,f.Y.Scale,f.Y.Offset+i.Y)end end;a.InputBegan:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseButton1 or h.UserInputType==Enum.UserInputType.Touch then c=true;e=h.Position;f=a.Position;h.Changed:Connect(function()if h.UserInputState==Enum.UserInputState.End then c=false end end)end end)a.InputChanged:Connect(function(h)if h.UserInputType==Enum.UserInputType.MouseMovement or h.UserInputType==Enum.UserInputType.Touch then d=h end end)b.InputChanged:Connect(function(h)if h==d and c then g(h)end end)end
draggable(menu.bg)

local tabholder = menu.bg.bg.bg.bg.main.group
local tabviewer = menu.bg.bg.bg.bg.tabbuttons



inputService.InputEnded:Connect(function(key)
    if key.KeyCode == Enum.KeyCode.RightShift then
        menu.Enabled = not menu.Enabled
        library.scrolling = false
        library.colorpicking = false
        for i,v in next, library.toInvis do
            v.Visible = false
        end
    end
end)

local keyNames = {
    [Enum.KeyCode.LeftAlt] = 'LALT';
    [Enum.KeyCode.RightAlt] = 'RALT';
    [Enum.KeyCode.LeftControl] = 'LCTRL';
    [Enum.KeyCode.RightControl] = 'RCTRL';
    [Enum.KeyCode.LeftShift] = 'LSHIFT';
    [Enum.KeyCode.RightShift] = 'RSHIFT';
    [Enum.KeyCode.Underscore] = '_';
    [Enum.KeyCode.Minus] = '-';
    [Enum.KeyCode.Plus] = '+';
    [Enum.KeyCode.Period] = '.';
    [Enum.KeyCode.Slash] = '/';
    [Enum.KeyCode.BackSlash] = '\\';
    [Enum.KeyCode.Question] = '?';
    [Enum.UserInputType.MouseButton1] = 'MB1';
    [Enum.UserInputType.MouseButton2] = 'MB2';
    [Enum.UserInputType.MouseButton3] = 'MB3';
}

library.notifyText.Font = 2
library.notifyText.Size = 13
library.notifyText.Outline = true
library.notifyText.Color = Color3.new(1,1,1)
library.notifyText.Position = Vector2.new(10,60)

function library:Tween(...)
    tweenService:Create(...):Play()
end

function library:notify(text)
    if playing then return end
    playing = true
    library.notifyText.Text = text
    library.notifyText.Transparency = 0
    library.notifyText.Visible = true
    for i = 0,1,0.1 do wait()
        library.notifyText.Transparency = i
    end
    spawn(function()
        wait(3)
        for i = 1,0,-0.1 do wait()
            library.notifyText.Transparency = i
        end
        playing = false
        library.notifyText.Visible = false
    end)
end

function library:addTab(name)
    local newTab = tabholder.tab:Clone()
    local newButton = tabviewer.button:Clone()

    table.insert(library.tabs,newTab)
    newTab.Parent = tabholder
    newTab.Visible = false

    table.insert(library.tabbuttons,newButton)
    newButton.Parent = tabviewer
    newButton.Modal = true
    newButton.Visible = true
    newButton.text.Text = name
    newButton.MouseButton1Click:Connect(function()
        for i,v in next, library.tabs do
            v.Visible = v == newTab
        end
        for i,v in next, library.toInvis do
            v.Visible = false
        end
        for i,v in next, library.tabbuttons do
            local state = v == newButton
            if state then
                v.element.Visible = true
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.000})
                v.text.TextColor3 = Color3.fromRGB(244, 244, 244)
            else
                library:Tween(v.element, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1.000})
                v.text.TextColor3 = Color3.fromRGB(144, 144, 144)
            end
        end
    end)

    local tab = {}
    local groupCount = 0
    local jigCount = 0
    local topStuff = 2000
  
    function tab:createGroup(pos,groupname) -- newTab[pos == 0 and "left" or "right"] 
        local groupbox = Instance.new("Frame")
        local grouper = Instance.new("Frame")
        local UIListLayout = Instance.new("UIListLayout")
        local UIPadding = Instance.new("UIPadding")
        local element = Instance.new("Frame")
        local title = Instance.new("TextLabel")
        local backframe = Instance.new("Frame")

        groupCount -= 1

        groupbox.Parent = newTab[pos]
        groupbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        groupbox.BorderColor3 = Color3.fromRGB(50, 50, 50)
        groupbox.BorderSizePixel = 2
        groupbox.Size = UDim2.new(0, 215, 0, 8)
        groupbox.ZIndex = groupCount

        grouper.Parent = groupbox
        grouper.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        grouper.BorderColor3 = Color3.fromRGB(0, 0, 0)
        grouper.Size = UDim2.new(1, 0, 1, 0)

        UIListLayout.Parent = grouper
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        UIPadding.Parent = grouper
        UIPadding.PaddingBottom = UDim.new(0, 4)
        UIPadding.PaddingTop = UDim.new(0, 7)

        element.Name = "element"
        element.Parent = groupbox
        element.BackgroundColor3 = library.libColor
        element.BorderSizePixel = 0
        element.Size = UDim2.new(1, 0, 0, 1)

        title.Parent = groupbox
        title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        title.BackgroundTransparency = 1.000
        title.BorderSizePixel = 0
        title.Position = UDim2.new(0, 17, 0, 0)
        title.ZIndex = 2
        title.Font = Enum.Font.Code
        title.Text = groupname or ""
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
            groupbox.Size += UDim2.new(0, 0, 0, 20)
        title.TextStrokeTransparency = 0.000
            local toggleframe = Instance.new("Frame")ft
            local tobble = Instance.new("Frame")
            local mid = Instance.new("Frame")
            local front = Instance.new("Frame")mRGB(20, 20, 20)
            local text = Instance.new("TextLabel")
            local button = Instance.new("TextButton")
        backframe.Size = UDim2.new(0, 13 + title.TextBounds.X, 0, 3)
            jigCount -= 1
            library.multiZindex -= 1
        function group:addToggle(args)
            toggleframe.Name = "toggleframe"hen args.flag = args.text end
            toggleframe.Parent = grouper warn("⚠️ incorrect arguments ⚠️ - missing args on recent toggle") end
            toggleframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            toggleframe.BackgroundTransparency = 1.000
            toggleframe.BorderSizePixel = 0w("Frame")
            toggleframe.Size = UDim2.new(1, 0, 0, 20)
            toggleframe.ZIndex = library.multiZindex
            local front = Instance.new("Frame")
            tobble.Name = "tobble"new("TextLabel")
            tobble.Parent = toggleframe("TextButton")
            tobble.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            tobble.BorderColor3 = Color3.fromRGB(0, 0, 0)
            tobble.BorderSizePixel = 3
            tobble.Position = UDim2.new(0.0299999993, 0, 0.272000015, 0)
            tobble.Size = UDim2.new(0, 10, 0, 10)
            toggleframe.Parent = grouper
            mid.Name = "mid"groundColor3 = Color3.fromRGB(255, 255, 255)
            mid.Parent = tobbleundTransparency = 1.000
            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
            mid.BorderSizePixel = 2brary.multiZindex
            mid.Size = UDim2.new(0, 10, 0, 10)
            tobble.Name = "tobble"
            front.Name = "front"leframe
            front.Parent = midolor3 = Color3.fromRGB(255, 255, 255)
            front.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            front.BorderColor3 = Color3.fromRGB(0, 0, 0)
            front.Size = UDim2.new(0, 10, 0, 10)9993, 0, 0.272000015, 0)
            tobble.Size = UDim2.new(0, 10, 0, 10)
            text.Name = "text"
            text.Parent = toggleframe
            text.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            text.BackgroundTransparency = 1.000GB(69, 23, 255)
            text.Position = UDim2.new(0, 22, 0, 0)60, 60)
            text.Size = UDim2.new(0, 0, 1, 2)
            text.Font = Enum.Font.Code, 0, 10)
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(155, 155, 155)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000mRGB(30, 30, 30)
            text.TextXAlignment = Enum.TextXAlignment.Left
            front.Size = UDim2.new(0, 10, 0, 10)
            button.Name = "button"
            button.Parent = toggleframe
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000B(55, 55, 55)
            button.BorderSizePixel = 0y = 1.000
            button.Size = UDim2.new(0, 101, 1, 0))
            button.Font = Enum.Font.SourceSans
            button.Text = "".Font.Code
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000.fromRGB(155, 155, 155)
            text.TextSize = 13.000
            if args.disabled thenarency = 0.000
                button.Visible = false.TextXAlignment.Left
                text.TextColor3 = library.disabledcolor
                text.Text = args.text
            return endent = toggleframe
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            local state = falseansparency = 1.000
            function toggle(newState)0
                state = newStatenew(0, 101, 1, 0)
                library.flags[args.flag] = state
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback then
                    args.callback(state)
                end.disabled then
            end button.Visible = false
            button.MouseButton1Click:Connect(function()
                state = not statetext
                front.Name = state and "accent" or "back"
                library.flags[args.flag] = state
                mid.BorderColor3 = Color3.fromRGB(60,60, 60)
                front.BackgroundColor3 = state and library.libColor or Color3.fromRGB(35, 35, 35)
                text.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
                if args.callback thenag] = state
                    args.callback(state) state and library.libColor or Color3.fromRGB(35, 35, 35)
                endt.TextColor3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
            end)if args.callback then
            button.MouseEnter:connect(function()
                mid.BorderColor3 = library.libColor
			end)     end
            button.MouseLeave:connect(function()ction()
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)         front.Name = state and "accent" or "back"
                library.flags[args.flag] = state
            library.flags[args.flag] = falseomRGB(60,60, 60)
            library.options[args.flag] = {type = "toggle",changeState = toggle,skipflag = args.skipflag,oldargs = args}
            local toggle = {}r3 = state and Color3.fromRGB(244, 244, 244) or Color3.fromRGB(144, 144, 144)
            function toggle:addKeybind(args)
                if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                local next = false
                
                local keybind = Instance.new("Frame")
                local button = Instance.new("TextButton")
			end)
                keybind.Parent = toggleframeon()
                keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                keybind.BackgroundTransparency = 1.000
                keybind.BorderColor3 = Color3.fromRGB(0, 0, 0)
                keybind.BorderSizePixel = 0e
                keybind.Position = UDim2.new(0.720000029, 4, 0.272000015, 0)le,skipflag = args.skipflag,oldargs = args}
                keybind.Size = UDim2.new(0, 51, 0, 10)
                tion toggle:addKeybind(args)
                button.Parent = keybindeturn warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end
                button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)
                button.BackgroundTransparency = 1.000
                button.BorderSizePixel = 0ew("Frame")
                button.Position = UDim2.new(-0.270902753, 0, 0, 0)
                button.Size = UDim2.new(1.27090275, 0, 1, 0)
                button.Font = Enum.Font.Code
                button.Text = ""ndColor3 = Color3.fromRGB(255, 255, 255)
                button.TextColor3 = Color3.fromRGB(155, 155, 155)
                button.TextSize = 13.000olor3.fromRGB(0, 0, 0)
                button.TextStrokeTransparency = 0.000
                button.TextXAlignment = Enum.TextXAlignment.Right2000015, 0)
                keybind.Size = UDim2.new(0, 51, 0, 10)
                function updateValue(val)
                    if library.colorpicking then return end
                    library.flags[args.flag] = valromRGB(187, 131, 255)
                    button.Text = keyNames[val] or val.Name
                endton.BorderSizePixel = 0
                inputService.InputBegan:Connect(function(key)0, 0)
                    local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode
                    if next thenum.Font.Code
                        if not table.find(library.blacklisted,key) then
                            next = falser3.fromRGB(155, 155, 155)
                            library.flags[args.flag] = key
                            button.Text = keyNames[key] or key.Name
                            button.TextColor3 = Color3.fromRGB(155, 155, 155)
                        end
                    endn updateValue(val)
                    if not next and key == library.flags[args.flag] and args.callback then
                        args.callback()flag] = val
                    endton.Text = keyNames[val] or val.Name
                end)
                inputService.InputBegan:Connect(function(key)
                button.MouseButton1Click:Connect(function().Unknown and key.UserInputType or key.KeyCode
                    if library.colorpicking then return end
                    library.flags[args.flag] = Enum.KeyCode.Unknownthen
                    button.Text = "--"se
                    button.TextColor3 = library.libColorey
                    next = trueton.Text = keyNames[key] or key.Name
                end)        button.TextColor3 = Color3.fromRGB(155, 155, 155)
                        end
                library.flags[args.flag] = Enum.KeyCode.Unknown
                library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                        args.callback()
                updateValue(args.key or Enum.KeyCode.Unknown)
            end end)
            function toggle:addColorpicker(args)
                if not args.flag and args.text then args.flag = args.text end
                if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
                local colorpicker = Instance.new("Frame")de.Unknown
                local mid = Instance.new("Frame")
                local front = Instance.new("Frame")Color
                local button2 = Instance.new("TextButton")
                local colorFrame = Instance.new("Frame")
                local colorFrame_2 = Instance.new("Frame")
                local hueframe = Instance.new("Frame")e.Unknown
                local main = Instance.new("Frame") = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                local hue = Instance.new("ImageLabel")
                local pickerframe = Instance.new("Frame")own)
                local main_2 = Instance.new("Frame")
                local picker = Instance.new("ImageLabel")
                local clr = Instance.new("Frame")en args.flag = args.text end
                local copy = Instance.new("TextButton")ncorrect arguments ⚠️") end
                local colorpicker = Instance.new("Frame")
                library.multiZindex -= 1("Frame")
                jigCount -= 1 Instance.new("Frame")
                topStuff -= 1 --args.secondw("TextButton")
                local colorFrame = Instance.new("Frame")
                colorpicker.Parent = toggleframew("Frame")
                colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                colorpicker.BorderSizePixel = 3Label")
                colorpicker.Position = args.second and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                colorpicker.Size = UDim2.new(0, 20, 0, 10)
                local picker = Instance.new("ImageLabel")
                mid.Name = "mid"ance.new("Frame")
                mid.Parent = colorpickerw("TextButton")
                mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)
                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                mid.BorderSizePixel = 2
                mid.Size = UDim2.new(1, 0, 1, 0)
                
                front.Name = "front" toggleframe
                front.Parent = midoundColor3 = Color3.fromRGB(255, 255, 255)
                front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)
                front.BorderColor3 = Color3.fromRGB(0, 0, 0)
                front.Size = UDim2.new(1, 0, 1, 0) and UDim2.new(0.720000029, 4, 0.272000015, 0) or UDim2.new(0.860000014, 4, 0.272000015, 0)
                colorpicker.Size = UDim2.new(0, 20, 0, 10)
                button2.Name = "button2"
                button2.Parent = front
                button2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                button2.BackgroundTransparency = 1.00069, 23, 255)
                button2.Size = UDim2.new(1, 0, 1, 0), 60, 60)
                button2.Text = ""el = 2
                button2.Font = Enum.Font.SourceSans
                button2.TextColor3 = Color3.fromRGB(0, 0, 0)
                button2.TextSize = 14.000
                front.Parent = mid
				colorFrame.Name = "colorFrame"lor3 = Color3.fromRGB(240, 142, 214)
				colorFrame.Parent = toggleframe= Color3.fromRGB(0, 0, 0)
				colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
				colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
				colorFrame.BorderSizePixel = 2tton2"
				colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)
				colorFrame.Size = UDim2.new(0, 137, 0, 128)r3.fromRGB(255, 255, 255)
                button2.BackgroundTransparency = 1.000
				colorFrame_2.Name = "colorFrame".new(1, 0, 1, 0)
				colorFrame_2.Parent = colorFrame
				colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
				colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)0)
				colorFrame_2.Size = UDim2.new(1, 0, 1, 0)

				hueframe.Name = "hueframe"ame"
				hueframe.Parent = colorFrame_2e
				hueframe.Parent = colorFrame_2Color3.fromRGB(35, 35, 35)
                hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                hueframe.BorderSizePixel = 2957, 0, 0.75, 0)
                hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)
                hueframe.Size = UDim2.new(0, 100, 0, 100)
    colorFrame_2.Name = "colorFrame"
                main.Name = "main"me
                main.Parent = hueframelor3.fromRGB(20, 20, 20)
                main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main.Size = UDim2.new(0, 100, 0, 100)
                main.ZIndex = 6
    hueframe.Parent = colorFrame_2
                picker.Name = "picker"
                picker.Parent = mainolor3 = Color3.fromRGB(34, 34, 34)
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                picker.BorderColor3 = Color3.fromRGB(0, 0, 0)
                picker.BorderSizePixel = 0new(-0.0930000022, 18, -0.0599999987, 30)
                picker.Size = UDim2.new(0, 100, 0, 100)0)
                picker.ZIndex = 104
                picker.Image = "rbxassetid://2615689005"
                main.Parent = hueframe
                pickerframe.Name = "pickerframe"romRGB(18, 18, 18)
                pickerframe.Parent = colorFrameRGB(0, 0, 0)
                pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
                pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)
                pickerframe.BorderSizePixel = 2
                pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)
                pickerframe.Size = UDim2.new(0, 20, 0, 100)
                picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)
                main_2.Name = "main"= Color3.fromRGB(0, 0, 0)
                main_2.Parent = pickerframe
                main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
                main_2.Size = UDim2.new(0, 20, 0, 100)5"
                main_2.ZIndex = 6
                pickerframe.Name = "pickerframe"
                hue.Name = "hue"nt = colorFrame
                hue.Parent = main_2undColor3 = Color3.fromRGB(34, 34, 34)
                hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)60)
                hue.BorderColor3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0UDim2.new(0.711000025, 14, -0.0599999987, 30)
                hue.Size = UDim2.new(0, 20, 0, 100) 0, 100)
                hue.ZIndex = 104
                hue.Image = "rbxassetid://2615692420"
                main_2.Parent = pickerframe
                clr.Name = "clr"dColor3 = Color3.fromRGB(18, 18, 18)
                clr.Parent = colorFrameolor3.fromRGB(0, 0, 0)
                clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                clr.BackgroundTransparency = 1.000
                clr.BorderColor3 = Color3.fromRGB(60, 60, 60)
                clr.BorderSizePixel = 2
                clr.Position = UDim2.new(0.0280000009, 0, 0, 2)
                clr.Size = UDim2.new(0, 129, 0, 14)GB(255, 0, 178)
                clr.ZIndex = 5r3 = Color3.fromRGB(0, 0, 0)
                hue.BorderSizePixel = 0
                copy.Name = "copy"ew(0, 20, 0, 100)
                copy.Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                copy.BackgroundTransparency = 1.000
                copy.BorderSizePixel = 0
                copy.Size = UDim2.new(0, 129, 0, 14)
                copy.ZIndex = 5olor3 = Color3.fromRGB(35, 35, 35)
                copy.Font = Enum.Font.SourceSans00
                copy.Text = args.text or args.flag60, 60, 60)
                copy.TextColor3 = Color3.fromRGB(100, 100, 100)
                copy.TextSize = 14.000ew(0.0280000009, 0, 0, 2)
                copy.TextStrokeTransparency = 0.000
                clr.ZIndex = 5
                copy.MouseButton1Click:Connect(function() -- "  "..args.text or "  "..args.flag
                    colorFrame.Visible = false
                end).Parent = clr
                copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
                button2.MouseButton1Click:Connect(function()
                    colorFrame.Visible = not colorFrame.Visible
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end).ZIndex = 5
                copy.Font = Enum.Font.SourceSans
                button2.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor00, 100)
                end).TextSize = 14.000
                button2.MouseLeave:connect(function()
                    mid.BorderColor3 = Color3.fromRGB(60, 60, 60)
                end).MouseButton1Click:Connect(function() -- "  "..args.text or "  "..args.flag
                    colorFrame.Visible = false
                local function updateValue(value,fakevalue)
                    if typeof(value) == "table" then value = fakevalue end
                    library.flags[args.flag] = valuenction()
                    front.BackgroundColor3 = valueFrame.Visible
                    if args.callback thenlor3.fromRGB(60, 60, 60)
                        args.callback(value)
                    end
                endton2.MouseEnter:connect(function()
                    mid.BorderColor3 = library.libColor
                local white, black = Color3.new(1,1,1), Color3.new(0,0,0)
                local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                local heartbeat = game:GetService("RunService").Heartbeat
                end)
                local pickerX,pickerY,hueY = 0,0,0
                local oldpercentX,oldpercentY = 0,0kevalue)
                    if typeof(value) == "table" then value = fakevalue end
                hue.MouseEnter:Connect(function()lue
                    local input = hue.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                                local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                                local startC = colors[math.floor(num)],0)
                                local endC = colors[math.ceil(num)],Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}
                                local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                                picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)
                                updateValue(color)
                            endtX,oldpercentY = 0,0
                            library.colorpicking = false
                        endter:Connect(function()
                    end)l input = hue.InputBegan:connect(function(key)
                    local leaveUserInputType == Enum.UserInputType.MouseButton1 then
                    leave = hue.MouseLeave:connect(function()ervice:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                        input:disconnect()lorpicking = true
                        leave:disconnect()ent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y
                    end)        local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))
                end)            local startC = colors[math.floor(num)]
                                local endC = colors[math.ceil(num)]
                picker.MouseEnter:Connect(function()lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)
                    local input = picker.InputBegan:connect(function(key)C, num-math.floor(num)) or Color3.new(0, 0, 0)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                library.colorpicking = true
                                local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                                local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                                updateValue(color)(function()
                                oldpercentX,oldpercentY = xPercent,yPercent
                            endisconnect()
                            library.colorpicking = false
                        end
                    end)
                    local leaveer:Connect(function()
                    leave = picker.MouseLeave:connect(function()tion(key)
                        input:disconnect()pe == Enum.UserInputType.MouseButton1 then
                        leave:disconnect()t:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                    end)        library.colorpicking = true
                end)            local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X
                                local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y
                hue.MouseMoved:connect(function(_, y)erp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)
                    hueY = y    updateValue(color)
                end)            oldpercentX,oldpercentY = xPercent,yPercent
                            end
                picker.MouseMoved:connect(function(x, y)
                    pickerX,pickerY = x,y
                end)end)
                    local leave
                table.insert(library.toInvis,colorFrame)nction()
                library.flags[args.flag] = Color3.new(1,1,1)
                library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
                    end)
                updateValue(args.color or Color3.new(1,1,1))
            end
            return toggleMoved:connect(function(_, y)
        end         hueY = y
        function group:addButton(args)
            if not args.callback or not args.text then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 22)x, y)
                    pickerX,pickerY = x,y
            local buttonframe = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")olorFrame)
            local button = Instance.new("TextButton")(1,1,1)
            local gradient = Instance.new("UIGradient")olorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}

            buttonframe.Name = "buttonframe"lor3.new(1,1,1))
            buttonframe.Parent = grouper
            buttonframe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            buttonframe.BackgroundTransparency = 1.000
            buttonframe.BorderSizePixel = 0
            buttonframe.Size = UDim2.new(1, 0, 0, 21)n return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 22)
            bg.Name = "bg"
            bg.Parent = buttonframetance.new("Frame")
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2e.new("TextButton")
            bg.Position = UDim2.new(0.0299999993, -1, 0.140000001, 0)
            bg.Size = UDim2.new(0, 205, 0, 15)
            buttonframe.Name = "buttonframe"
            main.Name = "main" = grouper
            main.Parent = bggroundColor3 = Color3.fromRGB(255, 255, 255)
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0), 0, 21)
            
            button.Name = "button"
            button.Parent = mainame
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.BackgroundTransparency = 1.000, 0)
            button.BorderSizePixel = 0
            button.Size = UDim2.new(1, 0, 1, 0)3, -1, 0.140000001, 0)
            button.Font = Enum.Font.Code0, 15)
            button.Text = args.text or args.flag
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.TextSize = 13.000
            button.TextStrokeTransparency = 0.000B(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.MouseButton1Click:Connect(function()
                if not library.colorpicking then
                    args.callback()(1, 0, 1, 0)
                endFont = Enum.Font.Code
            end)on.Text = args.text or args.flag
            button.MouseEnter:connect(function()55, 255, 255)
                main.BorderColor3 = library.libColor
			end)     button.TextStrokeTransparency = 0.000
			button.MouseLeave:connect(function()
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)ypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
			end)     gradient.Rotation = 90
        end gradient.Name = "gradient"
        function group:addSlider(args,sub)
            if not args.flag or not args.max then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 30)on()
                if not library.colorpicking then
            local slider = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("Frame")
            local fill = Instance.new("Frame")()
            local button = Instance.new("TextButton")
            local valuetext = Instance.new("TextLabel")
            local UIGradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")(60, 60, 60)
			end)
            slider.Name = "slider"
            slider.Parent = groupergs,sub)
            slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)ncorrect arguments ⚠️") end
            slider.BackgroundTransparency = 1.0000)
            slider.BorderSizePixel = 0
            slider.Size = UDim2.new(1, 0, 0, 30)
            local bg = Instance.new("Frame")
            bg.Name = "bg"nstance.new("Frame")
            bg.Parent = slidernce.new("Frame")
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)")
            bg.BorderSizePixel = 2tance.new("UIGradient")
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 10)
            slider.Name = "slider"
            main.Name = "main"ouper
            main.Parent = bgdColor3 = Color3.fromRGB(255, 255, 255)
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(50, 50, 50)
            main.Size = UDim2.new(1, 0, 1, 0)30)
            
            fill.Name = "fill"
            fill.Parent = main
            fill.BackgroundColor3 = library.libColor 35, 35)
            fill.BackgroundTransparency = 0.200 0, 0)
            fill.BorderColor3 = Color3.fromRGB(60, 60, 60)
            fill.BorderSizePixel = 00.0299999993, -1, 0, 16)
            fill.Size = UDim2.new(0.617238641, 13, 1, 0)
            
            button.Name = "button"
            button.Parent = main
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000, 50, 50)
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""l"
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000library.libColor
            fill.BackgroundTransparency = 0.200
            valuetext.Parent = mainor3.fromRGB(60, 60, 60)
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000, 0)
            valuetext.Position = UDim2.new(0.5, 0, 0.5, 0)
            valuetext.Font = Enum.Font.Code
            valuetext.Text = "0.9172/10"
            valuetext.TextColor3 = Color3.fromRGB(255, 255, 255)55)
            valuetext.TextSize = 14.000cy = 1.000
            valuetext.TextStrokeTransparency = 0.000
            button.Font = Enum.Font.SourceSans
            UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(113, 113, 113))}
            UIGradient.Rotation = 90r3.fromRGB(0, 0, 0)
            UIGradient.Parent = main
            
            text.Name = "text" main
            text.Parent = sliderColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000 0, 0.5, 0)
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 2= "0.9172/10"
            text.Font = Enum.Font.Codeor3.fromRGB(255, 255, 255)
            text.Text = args.text or args.flag
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000
            text.TextStrokeTransparency = 0.000w{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(113, 113, 113))}
            text.TextXAlignment = Enum.TextXAlignment.Left
            UIGradient.Parent = main
            local entered = false
			local scrolling = falseext"
			local amount = 0rent = slider
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            local function updateValue(value)00
                if library.colorpicking then return end 0, 7)
				if value ~= 0 thenx = 2
					fill:TweenSize(UDim2.new(value/args.max,0,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
				else    text.Text = args.text or args.flag
					fill:TweenSize(UDim2.new(0,1,1,0),Enum.EasingDirection.In,Enum.EasingStyle.Sine,0.01)
                endxtSize = 13.000
                valuetext.Text = value..sub.000
                library.flags[args.flag] = valuenment.Left
                if args.callback then
                    args.callback(value)
                end= false
			endal amount = 0
			local function updateScroll()
                if scrolling or library.scrolling or not newTab.Visible or library.colorpicking then return end
                while inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do runService.RenderStepped:Wait()
                    library.scrolling = true
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)on.In,Enum.EasingStyle.Sine,0.01)
					scrolling = true
					local value = args.min + ((mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X) * (args.max - args.min)
					if value < 0 then value = 0 end
					if value > args.max then value = args.max end
                    if value < args.min then value = args.min end
					updateValue(math.floor(value))en
                end args.callback(value)
                if scrolling and not entered then
                    valuetext.TextColor3 = Color3.fromRGB(255,255,255)
                endpdateScroll()
                if not menu.Enabled thenscrolling or not newTab.Visible or library.colorpicking then return end
                    entered = falseIsMouseButtonPressed(Enum.UserInputType.MouseButton1) and menu.Enabled do runService.RenderStepped:Wait()
                end library.scrolling = true
                scrolling = falsetColor3 = Color3.fromRGB(255,255,255)
                library.scrolling = false
			endocal value = args.min + ((mouse.X - button.AbsolutePosition.X) / button.AbsoluteSize.X) * (args.max - args.min)
			button.MouseEnter:connect(function()
                if library.colorpicking then return end
				if scrolling or entered then return endn value = args.min end
                entered = truelue))
                main.BorderColor3 = library.libColor
				while entered do wait()g and not entered then
					updateScroll() valuetext.TextColor3 = Color3.fromRGB(255,255,255)
				end         end
			end)         if not menu.Enabled then
			button.MouseLeave:connect(function()
                entered = false
                main.BorderColor3 = Color3.fromRGB(60, 60, 60)
			end)         library.scrolling = false
            if args.value then
                updateValue(args.value)
            end if library.colorpicking then return end
            library.flags[args.flag] = 0end
            library.options[args.flag] = {type = "slider",changeState = updateValue,skipflag = args.skipflag,oldargs = args}
            updateValue(args.value or 0)ary.libColor
        endntered do wait()
        function group:addTextbox(args)
            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 35)
			button.MouseLeave:connect(function()
            local textbox = Instance.new("Frame")
            local bg = Instance.new("Frame")romRGB(60, 60, 60)
            local main = Instance.new("ScrollingFrame")
            local box = Instance.new("TextBox")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")
            library.flags[args.flag] = 0
            box:GetPropertyChangedSignal('Text'):Connect(function(val)= updateValue,skipflag = args.skipflag,oldargs = args}
                if library.colorpicking then return end
                library.flags[args.flag] = box.Text
                args.value = box.Texts)
                if args.callback thenurn warn("⚠️ incorrect arguments ⚠️") end
                    args.callback()new(0, 0, 0, 35)
                end
            end)l textbox = Instance.new("Frame")
            textbox.Name = "textbox""Frame")
            textbox.Parent = grouperw("ScrollingFrame")
            textbox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            textbox.BackgroundTransparency = 1.000ent")
            textbox.BorderSizePixel = 0TextLabel")
            textbox.Size = UDim2.new(1, 0, 0, 35)
            textbox.ZIndex = 10gedSignal('Text'):Connect(function(val)
                if library.colorpicking then return end
            bg.Name = "bg"ags[args.flag] = box.Text
            bg.Parent = textboxx.Text
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)
            textbox.Parent = grouper
            main.Name = "main"Color3 = Color3.fromRGB(255, 255, 255)
            main.Parent = bgndTransparency = 1.000
            main.Active = truePixel = 0
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            box.Name = "box"= Color3.fromRGB(0, 0, 0)
            box.Parent = mainl = 2
            box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            box.BackgroundTransparency = 1.000
            box.Selectable = false
            box.Size = UDim2.new(1, 0, 1, 0)
            box.Font = Enum.Font.Code
            box.Text = args.value or ""
            box.TextColor3 = Color3.fromRGB(255, 255, 255) 35)
            box.TextSize = 13.000olor3.fromRGB(60, 60, 60)
            box.TextStrokeTransparency = 0.000
            box.TextXAlignment = Enum.TextXAlignment.Left
            main.ScrollBarThickness = 0
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90
            gradient.Name = "gradient"
            gradient.Parent = main Color3.fromRGB(255, 255, 255)
            box.BackgroundTransparency = 1.000
            text.Name = "text"alse
            text.Parent = textbox1, 0, 1, 0)
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)
            text.ZIndex = 213.000
            text.Font = Enum.Font.Code = 0.000
            text.Text = args.text or args.flaggnment.Left
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000Sequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            gradient.Parent = main

            library.flags[args.flag] = args.value or ""
            library.options[args.flag] = {type = "textbox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
        end text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        function group:addDivider(args) = 1.000
            groupbox.Size += UDim2.new(0, 0, 0, 10) -1, 0, 7)
            text.ZIndex = 2
            local div = Instance.new("Frame")
            local bg = Instance.new("Frame")ag
            local main = Instance.new("Frame")44, 244, 244)
            text.TextSize = 13.000
            div.Name = "div"ransparency = 0.000
            div.Parent = grouper= Enum.TextXAlignment.Left
            div.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            div.BackgroundTransparency = 1.000
            div.BorderSizePixel = 0] = args.value or ""
            div.Position = UDim2.new(0, 0, 0.743662, 0)ox",changeState = function(text) box.Text = text end,skipflag = args.skipflag,oldargs = args}
            div.Size = UDim2.new(0, 202, 0, 10)
            tion group:addDivider(args)
            bg.Name = "bg"+= UDim2.new(0, 0, 0, 10)
            bg.Parent = div
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2new("Frame")
            bg.Position = UDim2.new(0.0240000002, 0, 0, 4)
            bg.Size = UDim2.new(0, 191, 0, 1)
            div.Parent = grouper
            main.Name = "main"r3 = Color3.fromRGB(255, 255, 255)
            main.Parent = bgansparency = 1.000
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(0, 191, 0, 1)
        end 
        function group:addList(args)
            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
            groupbox.Size += UDim2.new(0, 0, 0, 35), 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
--args.multiselect and "..." or ""
            library.multiZindex -= 10.0240000002, 0, 0, 4)
            bg.Size = UDim2.new(0, 191, 0, 1)
            local list = Instance.new("Frame")
            local bg = Instance.new("Frame")
            local main = Instance.new("ScrollingFrame")
            local button = Instance.new("TextButton"), 35, 35)
            local dumbtriangle = Instance.new("ImageLabel")
            local valuetext = Instance.new("TextLabel")
            local gradient = Instance.new("UIGradient")
            local text = Instance.new("TextLabel")
            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end
            local frame = Instance.new("Frame") 35)
            local holder = Instance.new("Frame")
            local UIListLayout = Instance.new("UIListLayout")
            library.multiZindex -= 1
            list.Name = "list"
            list.Parent = grouper.new("Frame")
            list.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            list.BackgroundTransparency = 1.000gFrame")
            list.BorderSizePixel = 0new("TextButton")
            list.Size = UDim2.new(1, 0, 0, 35)"ImageLabel")
            list.ZIndex = library.multiZindexextLabel")
            local gradient = Instance.new("UIGradient")
            bg.Name = "bg"nstance.new("TextLabel")
            bg.Parent = list
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            bg.BorderColor3 = Color3.fromRGB(0, 0, 0)
            bg.BorderSizePixel = 2nstance.new("UIListLayout")
            bg.Position = UDim2.new(0.0299999993, -1, 0, 16)
            bg.Size = UDim2.new(0, 205, 0, 15)
            list.Parent = grouper
            main.Name = "main"or3 = Color3.fromRGB(255, 255, 255)
            main.Parent = bgransparency = 1.000
            main.Active = trueel = 0
            main.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            main.Size = UDim2.new(1, 0, 1, 0)
            main.CanvasSize = UDim2.new(0, 0, 0, 0)
            main.ScrollBarThickness = 0
            bg.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            button.Name = "button"r3.fromRGB(0, 0, 0)
            button.Parent = main 2
            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            button.BackgroundTransparency = 1.000
            button.Size = UDim2.new(0, 191, 1, 0)
            button.Font = Enum.Font.SourceSans
            button.Text = ""
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.TextSize = 14.000Color3.fromRGB(35, 35, 35)
            main.BorderColor3 = Color3.fromRGB(60, 60, 60)
            dumbtriangle.Name = "dumbtriangle"
            dumbtriangle.Parent = mainw(0, 0, 0, 0)
            dumbtriangle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BackgroundTransparency = 1.000
            dumbtriangle.BorderColor3 = Color3.fromRGB(0, 0, 0)
            dumbtriangle.BorderSizePixel = 0
            dumbtriangle.Position = UDim2.new(1, -11, 0.5, -3) 255)
            dumbtriangle.Size = UDim2.new(0, 7, 0, 6)
            dumbtriangle.ZIndex = 3(0, 191, 1, 0)
            dumbtriangle.Image = "rbxassetid://8532000591"
            button.Text = ""
            valuetext.Name = "valuetext"romRGB(0, 0, 0)
            valuetext.Parent = main0
            valuetext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            valuetext.Position = UDim2.new(0.00200000009, 2, 0, 7)
            valuetext.ZIndex = 2undColor3 = Color3.fromRGB(0, 0, 0)
            valuetext.Font = Enum.Font.Codeency = 1.000
            valuetext.Text = ""Color3 = Color3.fromRGB(0, 0, 0)
            valuetext.TextColor3 = Color3.fromRGB(244, 244, 244)
            valuetext.TextSize = 13.000m2.new(1, -11, 0.5, -3)
            valuetext.TextStrokeTransparency = 0.000)
            valuetext.TextXAlignment = Enum.TextXAlignment.Left
            dumbtriangle.Image = "rbxassetid://8532000591"
            gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            gradient.Rotation = 90etext"
            gradient.Name = "gradient"
            gradient.Parent = mainlor3 = Color3.fromRGB(255, 255, 255)
            valuetext.BackgroundTransparency = 1.000
            text.Name = "text" = UDim2.new(0.00200000009, 2, 0, 7)
            text.Parent = list 2
            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            text.BackgroundTransparency = 1.000
            text.Position = UDim2.new(0.0299999993, -1, 0, 7)44)
            text.ZIndex = 2ize = 13.000
            text.Font = Enum.Font.Codearency = 0.000
            text.Text = args.text or args.flagxtXAlignment.Left
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            text.TextSize = 13.000Sequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(171, 171, 171))}
            text.TextStrokeTransparency = 0.000
            text.TextXAlignment = Enum.TextXAlignment.Left
            gradient.Parent = main
            frame.Name = "frame"
            frame.Parent = list
            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)255, 255)
            frame.BorderSizePixel = 2cy = 1.000
            frame.Position = UDim2.new(0.0299999993, -1, 0.605000019, 15)
            frame.Size = UDim2.new(0, 203, 0, 0)
            frame.Visible = false.Code
            frame.ZIndex = library.multiZindex
            text.TextColor3 = Color3.fromRGB(244, 244, 244)
            holder.Name = "holder"
            holder.Parent = framearency = 0.000
            holder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
            holder.BorderColor3 = Color3.fromRGB(60, 60, 60)
            holder.Size = UDim2.new(1, 0, 1, 0)
            frame.Parent = list
            UIListLayout.Parent = holderor3.fromRGB(35, 35, 35)
            UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            frame.BorderSizePixel = 2
			local function updateValue(value)ew(0.0299999993, -1, 0.605000019, 15)
                if value == nil then valuetext.Text = "nil" return end
				if args.multiselect thenfalse
                    if type(value) == "string" then
                        if not table.find(library.options[args.flag].values,value) then return end
                        if table.find(library.flags[args.flag],value) then
                            for i,v in pairs(library.flags[args.flag]) do                                if v == value then                                    table.remove(library.flags[args.flag],i)                                end                            end                        else                            table.insert(library.flags[args.flag],value)                        end                    else                        library.flags[args.flag] = value                    end					local buttonText = ""					for i,v in pairs(library.flags[args.flag]) do						local jig = i ~= #library.flags[args.flag] and "," or ""						buttonText = buttonText..v..jig					end                    if buttonText == "" then buttonText = "..." end					for i,v in next, holder:GetChildren() do						if v.ClassName ~= "Frame" then continue end						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)						for _i,_v in next, library.flags[args.flag] do							if v.Name == _v then								v.off.TextColor3 = Color3.new(1,1,1)							end						end					end					valuetext.Text = buttonText					if args.callback then						args.callback(library.flags[args.flag])					end				else                    if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end                    library.flags[args.flag] = value					for i,v in next, holder:GetChildren() do						if v.ClassName ~= "Frame" then continue end						v.off.TextColor3 = Color3.new(0.65,0.65,0.65)                        if v.Name == library.flags[args.flag] then                            v.off.TextColor3 = Color3.new(1,1,1)                        end					end					frame.Visible = false                    if library.flags[args.flag] then                        valuetext.Text = library.flags[args.flag]                        if args.callback then                            args.callback(library.flags[args.flag])                        end                    end				end			end            function refresh(tbl)                for i,v in next, holder:GetChildren() do                    if v.ClassName == "Frame" then                        v:Destroy()                    end					frame.Size = UDim2.new(0, 203, 0, 0)                end                for i,v in pairs(tbl) do                    frame.Size += UDim2.new(0, 0, 0, 20)                    local option = Instance.new("Frame")                    local button_2 = Instance.new("TextButton")                    local text_2 = Instance.new("TextLabel")                    option.Name = v                    option.Parent = holder                    option.BackgroundColor3 = Color3.fromRGB(255, 255, 255)                    option.BackgroundTransparency = 1.000                    option.Size = UDim2.new(1, 0, 0, 20)                    button_2.Name = "button"                    button_2.Parent = option                    button_2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)                    button_2.BackgroundTransparency = 0.850                    button_2.BorderSizePixel = 0                    button_2.Size = UDim2.new(1, 0, 1, 0)                    button_2.Font = Enum.Font.SourceSans                    button_2.Text = ""                    button_2.TextColor3 = Color3.fromRGB(0, 0, 0)                    button_2.TextSize = 14.000                    text_2.Name = "off"                    text_2.Parent = option                    text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)                    text_2.BackgroundTransparency = 1.000                    text_2.Position = UDim2.new(0, 4, 0, 0)                    text_2.Size = UDim2.new(0, 0, 1, 0)                    text_2.Font = Enum.Font.Code                    text_2.Text = v                    text_2.TextColor3 = args.multiselect and Color3.new(0.65,0.65,0.65) or Color3.new(1,1,1)                    text_2.TextSize = 14.000                    text_2.TextStrokeTransparency = 0.000                    text_2.TextXAlignment = Enum.TextXAlignment.Left                        button_2.MouseButton1Click:Connect(function()                        updateValue(v)                    end)                end                library.options[args.flag].values = tbl                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])            end            button.MouseButton1Click:Connect(function()                if not library.colorpicking then                    frame.Visible = not frame.Visible                end            end)            button.MouseEnter:connect(function()                main.BorderColor3 = library.libColor			end)			button.MouseLeave:connect(function()                main.BorderColor3 = Color3.fromRGB(60, 60, 60)			end)                        table.insert(library.toInvis,frame)            library.flags[args.flag] = args.multiselect and {} or ""            library.options[args.flag] = {type = "list",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}            refresh(args.values)            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")        end        function group:addConfigbox(args)            if not args.flag or not args.values then return warn("⚠️ incorrect arguments ⚠️") end            groupbox.Size += UDim2.new(0, 0, 0, 138)            library.multiZindex -= 1                        local list2 = Instance.new("Frame")            local frame = Instance.new("Frame")            local main = Instance.new("Frame")            local holder = Instance.new("ScrollingFrame")            local UIListLayout = Instance.new("UIListLayout")            local dwn = Instance.new("ImageLabel")            local up = Instance.new("ImageLabel")                    list2.Name = "list2"            list2.Parent = grouper            list2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            list2.BackgroundTransparency = 1.000            list2.BorderSizePixel = 0            list2.Position = UDim2.new(0, 0, 0.108108111, 0)            list2.Size = UDim2.new(1, 0, 0, 138)                        frame.Name = "frame"            frame.Parent = list2            frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)            frame.BorderColor3 = Color3.fromRGB(0, 0, 0)            frame.BorderSizePixel = 2            frame.Position = UDim2.new(0.0299999993, -1, 0.0439999998, 0)            frame.Size = UDim2.new(0, 205, 0, 128)                        main.Name = "main"            main.Parent = frame            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)            main.BorderColor3 = Color3.fromRGB(60, 60, 60)            main.Size = UDim2.new(1, 0, 1, 0)                        holder.Name = "holder"            holder.Parent = main            holder.Active = true            holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            holder.BackgroundTransparency = 1.000            holder.BorderSizePixel = 0            holder.Position = UDim2.new(0, 0, 0.00571428565, 0)            holder.Size = UDim2.new(1, 0, 1, 0)            holder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"            holder.CanvasSize = UDim2.new(0, 0, 0, 0)            holder.ScrollBarThickness = 0            holder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"            holder.AutomaticCanvasSize = Enum.AutomaticSize.Y            holder.ScrollingEnabled = true            holder.ScrollBarImageTransparency = 0                        UIListLayout.Parent = holder                        dwn.Name = "dwn"            dwn.Parent = frame            dwn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)            dwn.BackgroundTransparency = 1.000            dwn.BorderColor3 = Color3.fromRGB(0, 0, 0)            dwn.BorderSizePixel = 0            dwn.Position = UDim2.new(0.930000007, 4, 1, -9)            dwn.Size = UDim2.new(0, 7, 0, 6)            dwn.ZIndex = 3            dwn.Image = "rbxassetid://8548723563"            dwn.Visible = false                        up.Name = "up"            up.Parent = frame            up.BackgroundColor3 = Color3.fromRGB(0, 0, 0)            up.BackgroundTransparency = 1.000            up.BorderColor3 = Color3.fromRGB(0, 0, 0)            up.BorderSizePixel = 0            up.Position = UDim2.new(0, 3, 0, 3)            up.Size = UDim2.new(0, 7, 0, 6)            up.ZIndex = 3            up.Image = "rbxassetid://8548757311"            up.Visible = false            local function updateValue(value)                if value == nil then return end                if not table.find(library.options[args.flag].values,value) then value = library.options[args.flag].values[1] end                library.flags[args.flag] = value                        for i,v in next, holder:GetChildren() do                    if v.ClassName ~= "Frame" then continue end                    if v.text.Text == library.flags[args.flag] then                        v.text.TextColor3 = library.libColor                    else                        v.text.TextColor3 = Color3.fromRGB(255,255,255)                    end                end                if library.flags[args.flag] then                    if args.callback then                        args.callback(library.flags[args.flag])                    end                end                holder.Visible = true            end            holder:GetPropertyChangedSignal("CanvasPosition"):Connect(function()                up.Visible = (holder.CanvasPosition.Y > 1)                dwn.Visible = (holder.CanvasPosition.Y + 1 < (holder.AbsoluteCanvasSize.Y - holder.AbsoluteSize.Y))            end)                            function refresh(tbl)                for i,v in next, holder:GetChildren() do                    if v.ClassName == "Frame" then                        v:Destroy()                    end                end                for i,v in pairs(tbl) do                    local item = Instance.new("Frame")                    local button = Instance.new("TextButton")                    local text = Instance.new("TextLabel")                            item.Name = v                    item.Parent = holder                    item.Active = true                    item.BackgroundColor3 = Color3.fromRGB(0, 0, 0)                    item.BackgroundTransparency = 1.000                    item.BorderColor3 = Color3.fromRGB(0, 0, 0)                    item.BorderSizePixel = 0                    item.Size = UDim2.new(1, 0, 0, 18)                                        button.Parent = item                    button.BackgroundColor3 = Color3.fromRGB(18, 18, 18)                    button.BackgroundTransparency = 1                    button.BorderColor3 = Color3.fromRGB(0, 0, 0)                    button.BorderSizePixel = 0                    button.Size = UDim2.new(1, 0, 1, 0)                    button.Text = ""                    button.TextTransparency = 1.000                                        text.Name = 'text'                    text.Parent = item                    text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)                    text.BackgroundTransparency = 1.000                    text.Size = UDim2.new(1, 0, 0, 18)                    text.Font = Enum.Font.Code                    text.Text = v                    text.TextColor3 = Color3.fromRGB(255, 255, 255)                    text.TextSize = 14.000                    text.TextStrokeTransparency = 0.000                            button.MouseButton1Click:Connect(function()                        updateValue(v)                    end)                end                        holder.Visible = true                library.options[args.flag].values = tbl                updateValue(table.find(library.options[args.flag].values,library.flags[args.flag]) and library.flags[args.flag] or library.options[args.flag].values[1])            end                            library.flags[args.flag] = ""            library.options[args.flag] = {type = "cfg",changeState = updateValue,values = args.values,refresh = refresh,skipflag = args.skipflag,oldargs = args}                    refresh(args.values)            updateValue(args.value or not args.multiselect and args.values[1] or "abcdefghijklmnopqrstuwvxyz")        end        function group:addColorpicker(args)            if not args.flag then return warn("⚠️ incorrect arguments ⚠️") end            groupbox.Size += UDim2.new(0, 0, 0, 20)                    library.multiZindex -= 1            jigCount -= 1            topStuff -= 1            local colorpicker = Instance.new("Frame")            local back = Instance.new("Frame")            local mid = Instance.new("Frame")            local front = Instance.new("Frame")            local text = Instance.new("TextLabel")            local colorpicker_2 = Instance.new("Frame")            local button = Instance.new("TextButton")            local colorFrame = Instance.new("Frame")			local colorFrame_2 = Instance.new("Frame")			local hueframe = Instance.new("Frame")			local main = Instance.new("Frame")			local hue = Instance.new("ImageLabel")			local pickerframe = Instance.new("Frame")			local main_2 = Instance.new("Frame")			local picker = Instance.new("ImageLabel")			local clr = Instance.new("Frame")			local copy = Instance.new("TextButton")            colorpicker.Name = "colorpicker"            colorpicker.Parent = grouper            colorpicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            colorpicker.BackgroundTransparency = 1.000            colorpicker.BorderSizePixel = 0            colorpicker.Size = UDim2.new(1, 0, 0, 20)            colorpicker.ZIndex = topStuff            text.Name = "text"            text.Parent = colorpicker            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            text.BackgroundTransparency = 1.000            text.Position = UDim2.new(0.0299999993, -1, 0, 10)            text.Font = Enum.Font.Code            text.Text = args.text or args.flag            text.TextColor3 = Color3.fromRGB(244, 244, 244)            text.TextSize = 13.000            text.TextStrokeTransparency = 0.000            text.TextXAlignment = Enum.TextXAlignment.Left            button.Name = "button"            button.Parent = colorpicker            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            button.BackgroundTransparency = 1.000            button.BorderSizePixel = 0            button.Size = UDim2.new(1, 0, 1, 0)            button.Font = Enum.Font.SourceSans            button.Text = ""            button.TextColor3 = Color3.fromRGB(0, 0, 0)            button.TextSize = 14.000            colorpicker_2.Name = "colorpicker"            colorpicker_2.Parent = colorpicker            colorpicker_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            colorpicker_2.BorderColor3 = Color3.fromRGB(0, 0, 0)            colorpicker_2.BorderSizePixel = 3            colorpicker_2.Position = UDim2.new(0.860000014, 4, 0.272000015, 0)            colorpicker_2.Size = UDim2.new(0, 20, 0, 10)            mid.Name = "mid"            mid.Parent = colorpicker_2            mid.BackgroundColor3 = Color3.fromRGB(69, 23, 255)            mid.BorderColor3 = Color3.fromRGB(60, 60, 60)            mid.BorderSizePixel = 2            mid.Size = UDim2.new(1, 0, 1, 0)            front.Name = "front"            front.Parent = mid            front.BackgroundColor3 = Color3.fromRGB(240, 142, 214)            front.BorderColor3 = Color3.fromRGB(0, 0, 0)            front.Size = UDim2.new(1, 0, 1, 0)            button.Name = "button"            button.Parent = colorpicker            button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            button.BackgroundTransparency = 1.000            button.Size = UDim2.new(0, 202, 0, 22)            button.Font = Enum.Font.SourceSans            button.Text = ""			button.ZIndex = args.ontop and topStuff or jigCount            button.TextColor3 = Color3.fromRGB(0, 0, 0)            button.TextSize = 14.000			colorFrame.Name = "colorFrame"			colorFrame.Parent = colorpicker			colorFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)			colorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)			colorFrame.BorderSizePixel = 2			colorFrame.Position = UDim2.new(0.101092957, 0, 0.75, 0)			colorFrame.Size = UDim2.new(0, 137, 0, 128)			colorFrame_2.Name = "colorFrame"			colorFrame_2.Parent = colorFrame			colorFrame_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)			colorFrame_2.BorderColor3 = Color3.fromRGB(60, 60, 60)			colorFrame_2.Size = UDim2.new(1, 0, 1, 0)			hueframe.Name = "hueframe"			hueframe.Parent = colorFrame_2            hueframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)            hueframe.BorderColor3 = Color3.fromRGB(60, 60, 60)            hueframe.BorderSizePixel = 2            hueframe.Position = UDim2.new(-0.0930000022, 18, -0.0599999987, 30)            hueframe.Size = UDim2.new(0, 100, 0, 100)            main.Name = "main"            main.Parent = hueframe            main.BackgroundColor3 = Color3.fromRGB(18, 18, 18)            main.BorderColor3 = Color3.fromRGB(0, 0, 0)            main.Size = UDim2.new(0, 100, 0, 100)            main.ZIndex = 6            picker.Name = "picker"            picker.Parent = main            picker.BackgroundColor3 = Color3.fromRGB(232, 0, 255)            picker.BorderColor3 = Color3.fromRGB(0, 0, 0)            picker.BorderSizePixel = 0            picker.Size = UDim2.new(0, 100, 0, 100)            picker.ZIndex = 104            picker.Image = "rbxassetid://2615689005"            pickerframe.Name = "pickerframe"            pickerframe.Parent = colorFrame            pickerframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)            pickerframe.BorderColor3 = Color3.fromRGB(60, 60, 60)            pickerframe.BorderSizePixel = 2            pickerframe.Position = UDim2.new(0.711000025, 14, -0.0599999987, 30)            pickerframe.Size = UDim2.new(0, 20, 0, 100)            main_2.Name = "main"            main_2.Parent = pickerframe            main_2.BackgroundColor3 = Color3.fromRGB(18, 18, 18)            main_2.BorderColor3 = Color3.fromRGB(0, 0, 0)            main_2.Size = UDim2.new(0, 20, 0, 100)            main_2.ZIndex = 6            hue.Name = "hue"            hue.Parent = main_2            hue.BackgroundColor3 = Color3.fromRGB(255, 0, 178)            hue.BorderColor3 = Color3.fromRGB(0, 0, 0)            hue.BorderSizePixel = 0            hue.Size = UDim2.new(0, 20, 0, 100)            hue.ZIndex = 104            hue.Image = "rbxassetid://2615692420"            clr.Name = "clr"            clr.Parent = colorFrame            clr.BackgroundColor3 = Color3.fromRGB(35, 35, 35)            clr.BackgroundTransparency = 1.000            clr.BorderColor3 = Color3.fromRGB(60, 60, 60)            clr.BorderSizePixel = 2            clr.Position = UDim2.new(0.0280000009, 0, 0, 2)            clr.Size = UDim2.new(0, 129, 0, 14)            clr.ZIndex = 5            copy.Name = "copy"            copy.Parent = clr            copy.BackgroundColor3 = Color3.fromRGB(18, 18, 18)            copy.BackgroundTransparency = 1.000            copy.BorderSizePixel = 0            copy.Size = UDim2.new(0, 129, 0, 14)            copy.ZIndex = 5            copy.Font = Enum.Font.SourceSans            copy.Text = args.text or args.flag            copy.TextColor3 = Color3.fromRGB(100, 100, 100)            copy.TextSize = 14.000            copy.TextStrokeTransparency = 0.000                        copy.MouseButton1Click:Connect(function()                colorFrame.Visible = false            end)            button.MouseButton1Click:Connect(function()				colorFrame.Visible = not colorFrame.Visible                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)            end)            button.MouseEnter:connect(function()                mid.BorderColor3 = library.libColor            end)            button.MouseLeave:connect(function()                mid.BorderColor3 = Color3.fromRGB(60, 60, 60)            end)            local function updateValue(value,fakevalue)                if typeof(value) == "table" then value = fakevalue end                library.flags[args.flag] = value                front.BackgroundColor3 = value                if args.callback then                    args.callback(value)                end			end            local white, black = Color3.new(1,1,1), Color3.new(0,0,0)            local colors = {Color3.new(1,0,0),Color3.new(1,1,0),Color3.new(0,1,0),Color3.new(0,1,1),Color3.new(0,0,1),Color3.new(1,0,1),Color3.new(1,0,0)}            local heartbeat = game:GetService("RunService").Heartbeat            local pickerX,pickerY,hueY = 0,0,0            local oldpercentX,oldpercentY = 0,0            hue.MouseEnter:Connect(function()                local input = hue.InputBegan:connect(function(key)                    if key.UserInputType == Enum.UserInputType.MouseButton1 then                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do                            library.colorpicking = true                            local percent = (hueY-hue.AbsolutePosition.Y-36)/hue.AbsoluteSize.Y                            local num = math.max(1, math.min(7,math.floor(((percent*7+0.5)*100))/100))                            local startC = colors[math.floor(num)]                            local endC = colors[math.ceil(num)]                            local color = white:lerp(picker.BackgroundColor3, oldpercentX):lerp(black, oldpercentY)                            picker.BackgroundColor3 = startC:lerp(endC, num-math.floor(num)) or Color3.new(0, 0, 0)                            updateValue(color)                        end                        library.colorpicking = false                    end                end)                local leave                leave = hue.MouseLeave:connect(function()                    input:disconnect()                    leave:disconnect()                end)            end)            picker.MouseEnter:Connect(function()                local input = picker.InputBegan:connect(function(key)                    if key.UserInputType == Enum.UserInputType.MouseButton1 then                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do                            library.colorpicking = true                            local xPercent = (pickerX-picker.AbsolutePosition.X)/picker.AbsoluteSize.X                            local yPercent = (pickerY-picker.AbsolutePosition.Y-36)/picker.AbsoluteSize.Y                            local color = white:lerp(picker.BackgroundColor3, xPercent):lerp(black, yPercent)                            updateValue(color)                            oldpercentX,oldpercentY = xPercent,yPercent                        end                        library.colorpicking = false                    end                end)                local leave                leave = picker.MouseLeave:connect(function()                    input:disconnect()                    leave:disconnect()                end)            end)            hue.MouseMoved:connect(function(_, y)                hueY = y            end)            picker.MouseMoved:connect(function(x, y)                pickerX,pickerY = x,y            end)            table.insert(library.toInvis,colorFrame)            library.flags[args.flag] = Color3.new(1,1,1)            library.options[args.flag] = {type = "colorpicker",changeState = updateValue,skipflag = args.skipflag,oldargs = args}            updateValue(args.color or Color3.new(1,1,1))        end        function group:addKeybind(args)            if not args.flag then return warn("⚠️ incorrect arguments ⚠️ - missing args on toggle:keybind") end            groupbox.Size += UDim2.new(0, 0, 0, 20)            local next = false                        local keybind = Instance.new("Frame")            local text = Instance.new("TextLabel")            local button = Instance.new("TextButton")            keybind.Parent = grouper            keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            keybind.BackgroundTransparency = 1.000            keybind.BorderSizePixel = 0            keybind.Size = UDim2.new(1, 0, 0, 20)                        text.Parent = keybind            text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)            text.BackgroundTransparency = 1.000            text.Position = UDim2.new(0.0299999993, -1, 0, 10)            text.Font = Enum.Font.Code            text.Text = args.text or args.flag            text.TextColor3 = Color3.fromRGB(244, 244, 244)            text.TextSize = 13.000            text.TextStrokeTransparency = 0.000            text.TextXAlignment = Enum.TextXAlignment.Left                        button.Parent = keybind            button.BackgroundColor3 = Color3.fromRGB(187, 131, 255)            button.BackgroundTransparency = 1.000            button.BorderSizePixel = 0            button.Position = UDim2.new(7.09711117e-08, 0, 0, 0)            button.Size = UDim2.new(0.978837132, 0, 1, 0)            button.Font = Enum.Font.Code            button.Text = "--"            button.TextColor3 = Color3.fromRGB(155, 155, 155)            button.TextSize = 13.000            button.TextStrokeTransparency = 0.000            button.TextXAlignment = Enum.TextXAlignment.Right            function updateValue(val)                if library.colorpicking then return end                library.flags[args.flag] = val                button.Text = keyNames[val] or val.Name            end            inputService.InputBegan:Connect(function(key)                local key = key.KeyCode == Enum.KeyCode.Unknown and key.UserInputType or key.KeyCode                if next then                    if not table.find(library.blacklisted,key) then                        next = false                        library.flags[args.flag] = key                        button.Text = keyNames[key] or key.Name                        button.TextColor3 = Color3.fromRGB(155, 155, 155)                    end                end                if not next and key == library.flags[args.flag] and args.callback then                    args.callback()                end            end)            button.MouseButton1Click:Connect(function()                if library.colorpicking then return end                library.flags[args.flag] = Enum.KeyCode.Unknown                button.Text = "..."                button.TextColor3 = Color3.new(0.2,0.2,0.2)                next = true            end)            library.flags[args.flag] = Enum.KeyCode.Unknown            library.options[args.flag] = {type = "keybind",changeState = updateValue,skipflag = args.skipflag,oldargs = args}            updateValue(args.key or Enum.KeyCode.Unknown)        end        return group, groupbox    end    return tabendfunction contains(list, x)	for _, v in pairs(list) do		if v == x then return true end	end	return falseendfunction getConfigPath(name)    return "OsirisCFGS/" .. name .. ".cfg"endfunction formatConfigName(filePath)    return filePath:match("([^/]+)%.cfg$")endfunction library:createConfig()    local name = library.flags["config_name"]    if not name or name == "" then return library:notify("Please enter a config name") end        local configPath = getConfigPath(name)    if isfile(configPath) then         return library:notify("Config already exists!")     end    local config = {}    for i,v in next, library.flags do        if library.options[i] and not library.options[i].skipflag then            if typeof(v) == "Color3" then                config[i] = {v.R,v.G,v.B}            elseif typeof(v) == "EnumItem" then                config[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}            else                config[i] = v            end        end    end        writefile(configPath, game:GetService("HttpService"):JSONEncode(config))    library:notify("Created config: " .. name)    library:refreshConfigs()endfunction library:saveConfig()    local name = library.flags["selected_config"]    if not name then return library:notify("No config selected") end        local configPath = getConfigPath(name)    local config = {}    for i,v in next, library.flags do        if library.options[i] and not library.options[i].skipflag then            if typeof(v) == "Color3" then                config[i] = {v.R,v.G,v.B}            elseif typeof(v) == "EnumItem" then                config[i] = {string.split(tostring(v),".")[2],string.split(tostring(v),".")[3]}            else                config[i] = v            end        end    end        writefile(configPath, game:GetService("HttpService"):JSONEncode(config))    library:notify("Updated config: " .. name)endfunction library:loadConfig()    local name = library.flags["selected_config"]    if not name then return library:notify("No config selected") end        local configPath = getConfigPath(name)    if not isfile(configPath) then        return library:notify("Config does not exist!")    end    local success, config = pcall(function()        return game:GetService("HttpService"):JSONDecode(readfile(configPath))    end)        if not success then        return library:notify("Failed to load config!")    end    for i,v in next, library.options do        spawn(function()            pcall(function()                if config[i] then                    if v.type == "colorpicker" then                        v.changeState(Color3.new(config[i][1],config[i][2],config[i][3]))                    elseif v.type == "keybind" then                        v.changeState(Enum[config[i][1]][config[i][2]])                    else                        if config[i] ~= library.flags[i] then                            v.changeState(config[i])                        end                    end                end            end)        end)    end    library:notify("Loaded config: " .. name)endfunction library:refreshConfigs()    local configs = {}    for _,file in ipairs(listfiles("OsirisCFGS")) do        -- Remove path and .cfg extension        local name = formatConfigName(file)        table.insert(configs, name)    end    if library.options["selected_config"] then        library.options["selected_config"].refresh(configs)    endendfunction library:deleteConfig()    local name = library.flags["selected_config"]    if not name then return library:notify("No config selected") end        local configPath = getConfigPath(name)    if isfile(configPath) then        delfile(configPath)        library:notify("Deleted config: " .. name)        library:refreshConfigs()    else        library:notify("Config does not exist!")    endend

local aimbotTab = library:addTab("Legit")
local visualsTab = library:addTab("Ragebot")
local miscTab = library:addTab("Visuals")
local miscTab = library:addTab("Misc")
local configTab = library:addTab("Settings")
local createconfigs = configTab:createGroup('left', 'Create Configs')
local configsettings = configTab:createGroup('left', 'Config Settings')
local uisettings = configTab:createGroup('right', 'UI Settings')
local othersettings = configTab:createGroup('right', 'Other')

createconfigs:addTextbox({text = "Name",flag = "config_name"})
createconfigs:addButton({text = "Load",callback = library.loadConfig})

configsettings:addConfigbox({flag = 'test',values = {}})
configsettings:addButton({text = "Load",callback = library.loadConfig})
configsettings:addButton({text = "Update",callback = library.saveConfig})
configsettings:addButton({text = "Delete",callback = library.deleteConfig})
configsettings:addButton({text = "Refresh",callback = library.refreshConfigs})
uisettings:addToggle({text = "Show Game Name",flag = "show game name"})
uisettings:addTextbox({text = "Menu Title",flag = "menutitle"})
uisettings:addTextbox({text = "Domain",flag = "menudomain"})
uisettings:addColorpicker({text = "Domain Accent",ontop = true,flag = "domainaccent",color = Color3.new(1,1,1)})
uisettings:addColorpicker({text = "Menu Accent",ontop = true,flag = "menuaccent",color = Color3.new(1,1,1)})

othersettings:addToggle({text = "Show Keybinds",flag = "show game name"})
configsettings:addButton({text = "Copy Game Invite"})
configsettings:addButton({text = "Rejoin Server"})
configsettings:addButton({text = "Server Hop"})