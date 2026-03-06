-- THE HACKER V6 - ULTIMATE ROBLOX HUB
-- Made by Waled-Hammad
-- Premium Edition

-- Services
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")

-- Local Player
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- Variables
local FlyEnabled = false
local InfiniteJump = false
local GodMode = false
local Invisible = false
local NoclipEnabled = false
local SpeedEnabled = false
local JumpPowerEnabled = false
local ESPEnabled = false
local AimbotEnabled = false
local SilentAimEnabled = false
local TriggerbotEnabled = false
local WalkspeedValue = 100
local JumppowerValue = 150
local SelectedPlayer = nil
local SelectedTool = nil
local BodyVelocity = nil
local BodyGyro = nil
local aimbotConnection = nil
local espConnections = {}
local trolledPlayers = {}

-- Anti-Cheat Bypass System
local function BypassAntiCheat()
    local mt = getrawmetatable(game)
    local old_namecall = mt.__namecall
    local old_index = mt.__index
    
    setreadonly(mt, false)
    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}
        
        -- Block all detection remotes
        if method == "FireServer" or method == "InvokeServer" then
            local remoteName = tostring(self)
            local blocked = {
                "Report", "report", "REPORT",
                "Detection", "detection", "DETECTION",
                "AntiCheat", "anticheat", "ANTICHEAT",
                "Ban", "ban", "BAN",
                "Kick", "kick", "KICK",
                "TeleportDetect", "SpeedDetect", "FlyDetect",
                "Log", "log", "LOG",
                "AdminDetect", "adminDetect",
                "Exploit", "exploit", "EXPLOIT",
                "Hack", "hack", "HACK"
            }
            
            for _, block in ipairs(blocked) do
                if remoteName:find(block) then
                    return
                end
            end
        end
        
        return old_namecall(self, ...)
    end)
    
    mt.__index = newcclosure(function(self, key)
        if key == "FireServer" or key == "InvokeServer" then
            return function(self, ...)
                local remoteName = tostring(self)
                local blocked = {"Report", "Detection", "AntiCheat"}
                for _, block in ipairs(blocked) do
                    if remoteName:find(block) then
                        return
                    end
                end
                return old_namecall(self, "FireServer", ...)
            end
        end
        return old_index(self, key)
    end)
    
    setreadonly(mt, true)
end

pcall(BypassAntiCheat)

-- Create Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TheHackerV6"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999
ScreenGui.Enabled = true

-- Matrix Rain Effect
local MatrixRain = Instance.new("Frame")
MatrixRain.Name = "MatrixRain"
MatrixRain.Size = UDim2.new(1, 0, 1, 0)
MatrixRain.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MatrixRain.BackgroundTransparency = 0.5
MatrixRain.Visible = false
MatrixRain.Parent = ScreenGui

for i = 1, 50 do
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(0, 20, 0, 20)
    text.Position = UDim2.new(0, math.random(0, 1920), 0, math.random(-500, 0))
    text.BackgroundTransparency = 1
    text.Text = math.random(0, 1)
    text.TextColor3 = Color3.fromRGB(0, 255, 0)
    text.TextScaled = true
    text.Font = Enum.Font.Code
    text.Parent = MatrixRain
    
    spawn(function()
        while MatrixRain.Visible do
            text.Position = text.Position + UDim2.new(0, 0, 0.01, 0)
            if text.Position.Y.Scale > 1 then
                text.Position = UDim2.new(0, math.random(0, 1920), 0, -20)
            end
            wait(0.05)
        end
    end)
end

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 1000, 0, 700)
MainFrame.Position = UDim2.new(0.5, -500, 0.5, -350)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

-- Glitch Effect
local Glitch = Instance.new("Frame")
Glitch.Name = "Glitch"
Glitch.Size = UDim2.new(1, 0, 1, 0)
Glitch.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Glitch.BackgroundTransparency = 0.95
Glitch.BorderSizePixel = 0
Glitch.Parent = MainFrame

-- Animated Border
local Border = Instance.new("Frame")
Border.Name = "Border"
Border.Size = UDim2.new(1, 4, 1, 4)
Border.Position = UDim2.new(0, -2, 0, -2)
Border.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Border.BackgroundTransparency = 0.3
Border.BorderSizePixel = 0
Border.Parent = MainFrame

spawn(function()
    while true do
        for i = 0, 1, 0.1 do
            Border.BackgroundTransparency = i
            wait(0.05)
        end
        for i = 1, 0, -0.1 do
            Border.BackgroundTransparency = i
            wait(0.05)
        end
    end
end)

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

-- Title with Glitch Effect
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -150, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🔴 THE HACKER V6 🔴"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

-- User Info
local UserInfo = Instance.new("TextLabel")
UserInfo.Name = "UserInfo"
UserInfo.Size = UDim2.new(0, 300, 1, 0)
UserInfo.Position = UDim2.new(1, -300, 0, 0)
UserInfo.BackgroundTransparency = 1
UserInfo.Text = "USER: " .. LocalPlayer.Name .. " | RANK: ELITE | STATUS: HACKING"
UserInfo.TextColor3 = Color3.fromRGB(0, 255, 0)
UserInfo.TextScaled = true
UserInfo.Font = Enum.Font.SourceSans
UserInfo.TextXAlignment = Enum.TextXAlignment.Right
UserInfo.Parent = TitleBar

-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Parent = TitleBar

-- Minimize Button
local MinButton = Instance.new("TextButton")
MinButton.Name = "MinButton"
MinButton.Size = UDim2.new(0, 40, 0, 40)
MinButton.Position = UDim2.new(1, -90, 0, 5)
MinButton.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
MinButton.Text = "-"
MinButton.TextColor3 = Color3.fromRGB(0, 255, 0)
MinButton.TextScaled = true
MinButton.Font = Enum.Font.SourceSansBold
MinButton.Parent = TitleBar

-- Toggle Button
local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 200, 0, 60)
ToggleButton.Position = UDim2.new(0, 20, 0, 20)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
ToggleButton.Text = "⚡ THE HACKER V6 ⚡"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 0)
ToggleButton.TextScaled = true
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Draggable = true
ToggleButton.Parent = ScreenGui

-- Tab Bar
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, 0, 0, 60)
TabBar.Position = UDim2.new(0, 0, 0, 50)
TabBar.BackgroundColor3 = Color3.fromRGB(0, 15, 0)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

-- Tabs
local Tabs = {
    {"COMBAT", "⚔️", Color3.fromRGB(255, 0, 0)},
    {"PLAYER", "👤", Color3.fromRGB(0, 255, 0)},
    {"VISUALS", "👁️", Color3.fromRGB(0, 255, 255)},
    {"WORLD", "🌍", Color3.fromRGB(255, 255, 0)},
    {"ITEMS", "💰", Color3.fromRGB(255, 0, 255)},
    {"TELEPORT", "📌", Color3.fromRGB(128, 0, 255)},
    {"TROLL", "🎭", Color3.fromRGB(255, 128, 0)},
    {"MORPH", "🦎", Color3.fromRGB(255, 128, 255)},
    {"ADMIN", "👑", Color3.fromRGB(255, 255, 255)},
    {"SETTINGS", "⚙️", Color3.fromRGB(128, 128, 128)}
}

-- Create Tab Buttons
for i, tabData in ipairs(Tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Name = tabData[1] .. "Tab"
    TabButton.Size = UDim2.new(0, 100, 1, -5)
    TabButton.Position = UDim2.new(0, (i-1)*100, 0, 2.5)
    TabButton.BackgroundColor3 = Color3.fromRGB(0, 10, 0)
    TabButton.Text = tabData[2] .. " " .. tabData[1]
    TabButton.TextColor3 = tabData[3]
    TabButton.TextScaled = true
    TabButton.Font = Enum.Font.SourceSansBold
    TabButton.Parent = TabBar
end

-- Content Frame
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -130)
ContentFrame.Position = UDim2.new(0, 10, 0, 120)
ContentFrame.BackgroundColor3 = Color3.fromRGB(0, 10, 0)
ContentFrame.BackgroundTransparency = 0.2
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

-- Scrolling Frame
local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 5, 0)
ScrollingFrame.Parent = ContentFrame

-- UI List Layout
local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

-- Function to create toggle buttons
local function CreateToggle(name, desc, color, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 450, 0, 60)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 15, 0)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Toggle"
    Button.Size = UDim2.new(0, 40, 0, 40)
    Button.Position = UDim2.new(0, 400, 0, 10)
    Button.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    Button.Text = "OFF"
    Button.TextColor3 = Color3.fromRGB(255, 0, 0)
    Button.TextScaled = true
    Button.Font = Enum.Font.SourceSansBold
    Button.Parent = Frame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 300, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = color or Color3.fromRGB(0, 255, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(0, 300, 0, 20)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextScaled = true
    Desc.Font = Enum.Font.SourceSans
    Desc.Parent = Frame
    
    local enabled = false
    Button.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            Button.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
            Button.TextColor3 = Color3.fromRGB(0, 255, 0)
            Button.Text = "ON"
        else
            Button.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
            Button.TextColor3 = Color3.fromRGB(255, 0, 0)
            Button.Text = "OFF"
        end
        callback(enabled)
    end)
    
    return Frame
end

-- Function to create buttons
local function CreateButton(name, desc, color, callback)
    local Button = Instance.new("TextButton")
    Button.Name = name .. "Button"
    Button.Size = UDim2.new(0, 430, 0, 50)
    Button.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
    Button.Text = name .. "\n" .. desc
    Button.TextColor3 = color or Color3.fromRGB(0, 255, 0)
    Button.TextScaled = true
    Button.Font = Enum.Font.SourceSansBold
    Button.Parent = ScrollingFrame
    
    Button.MouseButton1Click:Connect(callback)
    
    return Button
end

-- Function to create sliders
local function CreateSlider(name, desc, min, max, default, unit, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 450, 0, 80)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 15, 0)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default .. " " .. unit
    Label.TextColor3 = Color3.fromRGB(0, 255, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -20, 0, 20)
    DescLabel.Position = UDim2.new(0, 10, 0, 30)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextScaled = true
    DescLabel.Font = Enum.Font.SourceSans
    DescLabel.Parent = Frame
    
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(0, 430, 0, 10)
    Slider.Position = UDim2.new(0, 10, 0, 55)
    Slider.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Slider.BorderSizePixel = 0
    Slider.Parent = Frame
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Fill.BorderSizePixel = 0
    Fill.Parent = Slider
    
    local Drag = Instance.new("TextButton")
    Drag.Size = UDim2.new(0, 20, 0, 20)
    Drag.Position = UDim2.new((default - min) / (max - min), -10, 0, -5)
    Drag.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Drag.Text = ""
    Drag.Parent = Slider
    
    local dragging = false
    Drag.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = UDim2.new(0, Mouse.X - Slider.AbsolutePosition.X, 0, 0)
            local percent = math.clamp(pos.X.Scale + pos.X.Offset / Slider.AbsoluteSize.X, 0, 1)
            Fill.Size = UDim2.new(percent, 0, 1, 0)
            Drag.Position = UDim2.new(percent, -10, 0, -5)
            local value = min + (max - min) * percent
            Label.Text = name .. ": " .. math.floor(value) .. " " .. unit
            callback(value)
        end
    end)
    
    return Frame
end

-- Function to create dropdown
local function CreateDropdown(name, desc, options, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 450, 0, 80)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 15, 0)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(0, 255, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local DescLabel = Instance.new("TextLabel")
    DescLabel.Size = UDim2.new(1, -20, 0, 20)
    DescLabel.Position = UDim2.new(0, 10, 0, 30)
    DescLabel.BackgroundTransparency = 1
    DescLabel.Text = desc
    DescLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
    DescLabel.TextXAlignment = Enum.TextXAlignment.Left
    DescLabel.TextScaled = true
    DescLabel.Font = Enum.Font.SourceSans
    DescLabel.Parent = Frame
    
    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0, 430, 0, 30)
    Dropdown.Position = UDim2.new(0, 10, 0, 55)
    Dropdown.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
    Dropdown.Text = "Select..."
    Dropdown.TextColor3 = Color3.fromRGB(0, 255, 0)
    Dropdown.TextScaled = true
    Dropdown.Font = Enum.Font.SourceSansBold
    Dropdown.Parent = Frame
    
    local expanded = false
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(0, 430, 0, #options * 30)
    optionsFrame.Position = UDim2.new(0, 10, 0, 85)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(0, 15, 0)
    optionsFrame.BorderSizePixel = 0
    optionsFrame.Visible = false
    optionsFrame.Parent = Frame
    
    for i, option in ipairs(options) do
        local optionButton = Instance.new("TextButton")
        optionButton.Size = UDim2.new(1, 0, 0, 30)
        optionButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
        optionButton.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
        optionButton.Text = option
        optionButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        optionButton.TextScaled = true
        optionButton.Font = Enum.Font.SourceSansBold
        optionButton.Parent = optionsFrame
        
        optionButton.MouseButton1Click:Connect(function()
            Dropdown.Text = option
            optionsFrame.Visible = false
            expanded = false
            callback(option)
        end)
    end
    
    Dropdown.MouseButton1Click:Connect(function()
        expanded = not expanded
        optionsFrame.Visible = expanded
    end)
    
    return Frame
end

-- Function to update player list
local function UpdatePlayerList()
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    return players
end

-- COMBAT TAB
local function CreateCombatTab()
    CreateToggle("Aimbot", "Automatically aims at nearest player", Color3.fromRGB(255, 0, 0), function(state)
        AimbotEnabled = state
        if state then
            if aimbotConnection then aimbotConnection:Disconnect() end
            aimbotConnection = RunService.RenderStepped:Connect(function()
                if not AimbotEnabled then return end
                
                local closest = nil
                local shortestDistance = math.huge
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                        
                        if onScreen then
                            local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                            if distance < shortestDistance and distance < 200 then
                                shortestDistance = distance
                                closest = head
                            end
                        end
                    end
                end
                
                if closest then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
                end
            end)
        else
            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end
        end
    end)
    
    CreateToggle("Silent Aim", "Hits players without aiming at them", Color3.fromRGB(255, 50, 50), function(state)
        SilentAimEnabled = state
    end)
    
    CreateToggle("Triggerbot", "Automatically shoots when aiming at player", Color3.fromRGB(255, 100, 100), function(state)
        TriggerbotEnabled = state
    end)
    
    CreateToggle("Wallbang", "Shoot through walls", Color3.fromRGB(255, 150, 150), function(state)
        if state then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
    end)
    
    CreateSlider("Aimbot FOV", "Field of view for aimbot", 50, 500, 200, "px", function(value)
        LocalPlayer:SetAttribute("AimbotFOV", value)
    end)
    
    CreateSlider("Aimbot Smoothness", "How smooth the aimbot moves", 1, 100, 10, "%", function(value)
        LocalPlayer:SetAttribute("AimbotSmoothness", value)
    end)
    
    CreateButton("Rage Mode", "Kill all players instantly", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
            end
        end
    end)
end

-- PLAYER TAB
local function CreatePlayerTab()
    CreateToggle("Fly", "Enable flying mode", Color3.fromRGB(0, 255, 0), function(state)
        FlyEnabled = state
        local char = LocalPlayer.Character
        if not char then return end
        
        local humanoid = char:FindFirstChild("Humanoid")
        local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
        
        if state and torso then
            humanoid.PlatformStand = true
            
            BodyVelocity = Instance.new("BodyVelocity")
            BodyVelocity.Velocity = Vector3.new(0, 0, 0)
            BodyVelocity.MaxForce = Vector3.new(4000, 4000, 4000)
            BodyVelocity.Parent = torso
            
            BodyGyro = Instance.new("BodyGyro")
            BodyGyro.MaxTorque = Vector3.new(4000, 4000, 4000)
            BodyGyro.P = 1000
            BodyGyro.Parent = torso
            
            spawn(function()
                while FlyEnabled and torso do
                    local moveDirection = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        moveDirection = moveDirection + Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        moveDirection = moveDirection - Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        moveDirection = moveDirection - Camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        moveDirection = moveDirection + Camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        moveDirection = moveDirection + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                        moveDirection = moveDirection + Vector3.new(0, -1, 0)
                    end
                    
                    if moveDirection.Magnitude > 0 then
                        BodyVelocity.Velocity = moveDirection.Unit * 100
                    else
                        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                    
                    if BodyGyro then
                        BodyGyro.CFrame = Camera.CFrame
                    end
                    
                    wait()
                end
            end)
        else
            if BodyVelocity then BodyVelocity:Destroy() end
            if BodyGyro then BodyGyro:Destroy() end
            if humanoid then
                humanoid.PlatformStand = false
            end
        end
    end)
    
    CreateToggle("Infinite Jump", "Jump infinitely", Color3.fromRGB(0, 255, 0), function(state)
        InfiniteJump = state
        if state then
            UserInputService.JumpRequest:Connect(function()
                if InfiniteJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)
    
    CreateToggle("Noclip", "Walk through walls", Color3.fromRGB(0, 255, 100), function(state)
        NoclipEnabled = state
        if state then
            RunService.Stepped:Connect(function()
                if NoclipEnabled and LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end
    end)
    
    CreateToggle("Invisible", "Become invisible to others", Color3.fromRGB(100, 255, 100), function(state)
        Invisible = state
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Transparency = state and 1 or 0
                end
                if v:IsA("Decal") then
                    v.Transparency = state and 1 or 0
                end
            end
        end
    end)
    
    CreateToggle("God Mode", "Become invincible", Color3.fromRGB(255, 255, 0), function(state)
        GodMode = state
        if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            
            LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(health)
                if GodMode and health < LocalPlayer.Character.Humanoid.MaxHealth then
                    LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                end
            end)
        end
    end)
    
    CreateToggle("Anti-Gravity", "Low gravity mode", Color3.fromRGB(150, 255, 150), function(state)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = state and 200 or JumppowerValue
        end
    end)
    
    CreateSlider("Walk Speed", "Change movement speed", 16, 500, 100, "studs/s", function(value)
        WalkspeedValue = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
    
    CreateSlider("Jump Power", "Change jump height", 50, 500, 150, "power", function(value)
        JumppowerValue = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end)
    
    CreateButton("Reset Character", "Respawn your character", Color3.fromRGB(255, 0, 0), function()
        LocalPlayer.Character:BreakJoints()
    end)
end

-- VISUALS TAB
local function CreateVisualsTab()
    CreateToggle("ESP Players", "See players through walls", Color3.fromRGB(0, 255, 255), function(state)
        ESPEnabled = state
        
        -- Clear old ESP
        for _, conn in ipairs(espConnections) do
            conn:Disconnect()
        end
        espConnections = {}
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if state then
                    -- Create ESP
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ESP_" .. player.Name
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    
                    if player.Character then
                        highlight.Adornee = player.Character
                        highlight.Parent = player.Character
                    end
                    
                    -- Update when character loads
                    local conn = player.CharacterAdded:Connect(function(character)
                        wait(0.5)
                        if ESPEnabled then
                            local newHighlight = Instance.new("Highlight")
                            newHighlight.Name = "ESP_" .. player.Name
                            newHighlight.FillColor = Color3.fromRGB(255, 0, 0)
                            newHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                            newHighlight.FillTransparency = 0.5
                            newHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            newHighlight.Adornee = character
                            newHighlight.Parent = character
                        end
                    end)
                    table.insert(espConnections, conn)
                else
                    -- Remove ESP
                    if player.Character then
                        local highlight = player.Character:FindFirstChild("ESP_" .. player.Name)
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    end)
    
    CreateToggle("ESP Items", "See valuable items", Color3.fromRGB(100, 255, 255), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                if state then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "ItemESP"
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    
                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = "📦 " .. v.Name
                    text.TextColor3 = Color3.fromRGB(255, 255, 0)
                    text.TextStrokeTransparency = 0
                    text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    text.TextScaled = true
                    text.Font = Enum.Font.SourceSansBold
                    text.Parent = billboard
                    
                    billboard.Parent = v
                else
                    local esp = v:FindFirstChild("ItemESP")
                    if esp then
                        esp:Destroy()
                    end
                end
            end
        end
    end)
    
    CreateToggle("ESP Chests", "Highlight all chests", Color3.fromRGB(150, 255, 255), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("chest") or v.Name:lower():find("crate") then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ChestESP"
                    highlight.FillColor = Color3.fromRGB(255, 215, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.3
                    highlight.Parent = v
                else
                    local highlight = v:FindFirstChild("ChestESP")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
        end
    end)
    
    CreateToggle("Fullbright", "See in the dark", Color3.fromRGB(255, 255, 255), function(state)
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = state and 2 or 1
    end)
    
    CreateToggle("X-Ray", "See through walls", Color3.fromRGB(200, 255, 255), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                if state then
                    v.LocalTransparencyModifier = 0.7
                else
                    v.LocalTransparencyModifier = 0
                end
            end
        end
    end)
    
    CreateToggle("Tracers", "Draw lines to players", Color3.fromRGB(255, 100, 255), function(state)
        local tracerLine = Drawing.new("Line")
        tracerLine.Visible = state
        tracerLine.Color = Color3.fromRGB(255, 0, 0)
        tracerLine.Thickness = 2
        tracerLine.Transparency = 1
        
        spawn(function()
            while state do
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local headPos = player.Character.Head.Position
                        local screenPos, onScreen = Camera:WorldToViewportPoint(headPos)
                        
                        if onScreen then
                            tracerLine.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                            tracerLine.To = Vector2.new(screenPos.X, screenPos.Y)
                            tracerLine.Visible = true
                            break
                        end
                    end
                end
                wait()
            end
            tracerLine.Visible = false
        end)
    end)
    
    CreateToggle("Name Tags", "Show player names", Color3.fromRGB(0, 255, 255), function(state)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if state then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "NameTag"
                    billboard.Size = UDim2.new(0, 100, 0, 50)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    
                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = player.Name
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    text.TextStrokeTransparency = 0
                    text.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                    text.TextScaled = true
                    text.Font = Enum.Font.SourceSansBold
                    text.Parent = billboard
                    
                    billboard.Parent = player.Character.Head
                else
                    local nameTag = player.Character.Head:FindFirstChild("NameTag")
                    if nameTag then
                        nameTag:Destroy()
                    end
                end
            end
        end
    end)
end

-- WORLD TAB
local function CreateWorldTab()
    CreateToggle("Auto Farm", "Automatically collect items", Color3.fromRGB(255, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                            fireclickdetector(v:FindFirstChild("ClickDetector"))
                            wait(0.1)
                        end
                    end
                    wait(1)
                end
            end)
        end
    end)
    
    CreateToggle("Auto Win", "Automatically win games", Color3.fromRGB(255, 255, 100), function(state)
        if state then
            spawn(function()
                while state do
                    -- Try to find win remote
                    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                        if v:IsA("RemoteEvent") and (v.Name:lower():find("win") or v.Name:lower():find("victory")) then
                            v:FireServer()
                        end
                    end
                    wait(1)
                end
            end)
        end
    end)
    
    CreateButton("Delete All", "Delete all objects in game", Color3.fromRGB(255, 0, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v ~= workspace.Terrain and not v:IsDescendantOf(LocalPlayer.Character) then
                v:Destroy()
            end
        end
    end])
    
    CreateToggle("No Fog", "Remove all fog", Color3.fromRGB(200, 200, 255), function(state)
        Lighting.FogEnd = state and 100000 or 1000
    end)
    
    CreateToggle("Time Changer", "Change time of day", Color3.fromRGB(255, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    Lighting.TimeOfDay = "12:00:00"
                    wait(1)
                end
            end)
        end
    end)
    
    CreateSlider("Gravity", "Change world gravity", 0, 200, 196.2, "studs/s²", function(value)
        workspace.Gravity = value
    end)
end

-- ITEMS TAB
local function CreateItemsTab()
    CreateButton("Get All Tools", "Get all tools in game", Color3.fromRGB(255, 255, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Backpack
            end
        end
    end)
    
    CreateButton("Give Admin Tools", "Get admin commands", Color3.fromRGB(255, 0, 255), function()
        local adminTools = {
            "Admin Sword",
            "Ban Hammer",
            "Kick Gun",
            "Teleport Tool",
            "Kill Brick",
            "Freeze Wand",
            "God Stick",
            "Invisibility Cloak",
            "Fly Feather",
            "Speed Coils",
            "Admin Panel"
        }
        
        for _, toolName in ipairs(adminTools) do
            local tool = Instance.new("Tool")
            tool.Name = toolName
            tool.RequiresHandle = false
            tool.CanBeDropped = true
            tool.Parent = LocalPlayer.Backpack
            
            local remote = Instance.new("RemoteEvent")
            remote.Name = "AdminRemote"
            remote.Parent = tool
        end
    end)
    
    CreateButton("Infinity Money", "Get unlimited money", Color3.fromRGB(255, 215, 0), function()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, v in pairs(leaderstats:GetChildren()) do
                if v:IsA("NumberValue") or v:IsA("IntValue") then
                    v.Value = 999999999
                end
            end
        end
        
        -- Try to find money values
        for _, v in pairs(LocalPlayer:GetDescendants()) do
            if v:IsA("NumberValue") or v:IsA("IntValue") and v.Name:lower():find("money") or v.Name:lower():find("cash") then
                v.Value = 999999999
            end
        end
    end)
    
    CreateButton("Unlock Gamepasses", "Get all gamepasses free", Color3.fromRGB(255, 255, 255), function()
        LocalPlayer:SetAttribute("Gamepasses", "All")
        LocalPlayer:SetAttribute("VIP", true)
        LocalPlayer:SetAttribute("Premium", true)
    end)
    
    CreateButton("Spawn VIP Items", "Spawn rare items", Color3.fromRGB(255, 215, 0), function()
        local vipItems = {
            "VIP Crown",
            "VIP Wings",
            "VIP Shield",
            "VIP Sword",
            "VIP Key",
            "VIP Access Card"
        }
        
        for _, itemName in ipairs(vipItems) do
            local part = Instance.new("Part")
            part.Name = itemName
            part.Size = Vector3.new(2, 2, 2)
            part.BrickColor = BrickColor.new("Bright yellow")
            part.Material = Enum.Material.Neon
            part.Anchored = false
            part.CanCollide = true
            part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), 5, math.random(-10, 10))
            part.Parent = workspace
            
            local clickDetector = Instance.new("ClickDetector")
            clickDetector.Parent = part
            
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            
            local text = Instance.new("TextLabel")
            text.Size = UDim2.new(1, 0, 1, 0)
            text.BackgroundTransparency = 1
            text.Text = "🔥 VIP ITEM 🔥"
            text.TextColor3 = Color3.fromRGB(255, 215, 0)
            text.TextScaled = true
            text.Font = Enum.Font.SourceSansBold
            text.Parent = billboard
            billboard.Parent = part
        end
    end)
    
    CreateButton("Get All Gamepasses", "Bypass gamepass purchases", Color3.fromRGB(0, 255, 255), function()
        -- Try to bypass MarketplaceService
        local old_PromptProductPurchase = MarketplaceService.PromptProductPurchase
        MarketplaceService.PromptProductPurchase = function(...)
            return true
        end
        
        -- Simulate owning all gamepasses
        for i = 1, 1000 do
            LocalPlayer:SetAttribute("Gamepass_" .. i, true)
        end
    end)
end

-- TELEPORT TAB
local function CreateTeleportTab()
    local playerDropdown = CreateDropdown("Select Player", "Choose a player to teleport to", UpdatePlayerList(), function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("Teleport to Player", "Move to selected player", Color3.fromRGB(128, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:SetPrimaryPartCFrame(SelectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("Teleport to Mouse", "Teleport where mouse points", Color3.fromRGB(100, 0, 255), function()
        if Mouse.Hit then
            LocalPlayer.Character:SetPrimaryPartCFrame(Mouse.Hit + Vector3.new(0, 3, 0))
        end
    end)
    
    CreateButton("Bring Player", "Teleport selected player to you", Color3.fromRGB(150, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            SelectedPlayer.Character:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("Teleport to Spawn", "Go to spawn location", Color3.fromRGB(0, 255, 0), function()
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn then
            LocalPlayer.Character:SetPrimaryPartCFrame(spawn.CFrame + Vector3.new(0, 3, 0))
        end
    end])
    
    CreateButton("Teleport to Center", "Go to map center", Color3.fromRGB(255, 255, 0), function()
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 50, 0))
    end)
    
    CreateButton("Save Location", "Save current position", Color3.fromRGB(0, 255, 255), function()
        LocalPlayer:SetAttribute("SavedPosition", LocalPlayer.Character.HumanoidRootPart.Position)
    end)
    
    CreateButton("Load Location", "Teleport to saved position", Color3.fromRGB(0, 255, 255), function()
        local savedPos = LocalPlayer:GetAttribute("SavedPosition")
        if savedPos then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(savedPos))
        end
    end)
end

-- TROLL TAB
local function CreateTrollTab()
    local trollDropdown = CreateDropdown("Troll Player", "Select player to troll", UpdatePlayerList(), function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("Freeze Player", "Prevent player from moving", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = true
                end
            end
            trolledPlayers[SelectedPlayer] = "frozen"
        end
    end)
    
    CreateButton("Unfreeze Player", "Allow player to move", Color3.fromRGB(0, 255, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = false
                end
            end
            trolledPlayers[SelectedPlayer] = nil
        end
    end)
    
    CreateButton("Spin Player", "Make player spin wildly", Color3.fromRGB(255, 255, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local torso = SelectedPlayer.Character:FindFirstChild("Torso") or SelectedPlayer.Character:FindFirstChild("UpperTorso")
            if torso then
                local bodyAngular = Instance.new("BodyAngularVelocity")
                bodyAngular.AngularVelocity = Vector3.new(0, 50, 0)
                bodyAngular.MaxTorque = Vector3.new(4000, 4000, 4000)
                bodyAngular.Parent = torso
                
                trolledPlayers[SelectedPlayer] = "spinning"
                
                spawn(function()
                    wait(10)
                    if bodyAngular and bodyAngular.Parent then
                        bodyAngular:Destroy()
                    end
                end)
            end
        end
    end)
    
    CreateButton("Confuse Player", "Flip player's screen", Color3.fromRGB(255, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local humanoid = SelectedPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.CameraOffset = Vector3.new(10, 10, 10)
                wait(3)
                humanoid.CameraOffset = Vector3.new(0, 0, 0)
            end
        end
    end)
    
    CreateButton("Invert Controls", "Reverse player's controls", Color3.fromRGB(0, 255, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            trolledPlayers[SelectedPlayer] = "inverted"
            
            spawn(function()
                while trolledPlayers[SelectedPlayer] == "inverted" do
                    if SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("Humanoid") then
                        -- Invert movement
                        SelectedPlayer.Character.Humanoid.WalkSpeed = -SelectedPlayer.Character.Humanoid.WalkSpeed
                        wait(0.1)
                    end
                end
            end)
        end
    end)
    
    CreateButton("Crash Player", "Attempt to crash player", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for i = 1, 1000 do
                local part = Instance.new("Part")
                part.Position = SelectedPlayer.Character.HumanoidRootPart.Position
                part.Parent = workspace
                spawn(function()
                    wait(5)
                    part:Destroy()
                end)
            end
        end
    end)
    
    CreateButton("Spam Chat", "Spam chat with messages", Color3.fromRGB(0, 255, 0), function()
        local messages = {
            "THE HACKER V6 OWNS THIS GAME!",
            "WALED-HAMMAD IS GOD!",
            "GET HACKED NOOB!",
            "🤣🤣🤣",
            "YOU CAN'T STOP ME!",
            "HACKER V6 BEST HUB!"
        }
        
        for i = 1, 20 do
            local msg = messages[math.random(1, #messages)]
            ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg, "All")
            wait(0.1)
        end
    end)
end

-- MORPH TAB
local function CreateMorphTab()
    CreateButton("Morph into NPC", "Transform into an NPC", Color3.fromRGB(255, 128, 255), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v ~= LocalPlayer.Character and v:FindFirstChild("Humanoid") then
                local char = LocalPlayer.Character
                local pos = char.HumanoidRootPart.Position
                char:Destroy()
                
                local newChar = v:Clone()
                newChar.Name = LocalPlayer.Name
                newChar.Parent = workspace
                newChar:SetPrimaryPartCFrame(CFrame.new(pos))
                
                LocalPlayer.Character = newChar
                wait(1)
                break
            end
        end
    end)
    
    CreateButton("Morph into Dino", "Become a dinosaur", Color3.fromRGB(0, 255, 0), function()
        local dino = Instance.new("Model")
        dino.Name = LocalPlayer.Name
        
        -- Body parts
        local head = Instance.new("Part")
        head.Name = "Head"
        head.Size = Vector3.new(2, 2, 3)
        head.BrickColor = BrickColor.new("Bright green")
        head.Parent = dino
        
        local torso = Instance.new("Part")
        torso.Name = "Torso"
        torso.Size = Vector3.new(3, 4, 5)
        torso.BrickColor = BrickColor.new("Bright green")
        torso.Parent = dino
        
        local leftArm = Instance.new("Part")
        leftArm.Name = "Left Arm"
        leftArm.Size = Vector3.new(1, 3, 1)
        leftArm.BrickColor = BrickColor.new("Bright green")
        leftArm.Parent = dino
        
        local rightArm = Instance.new("Part")
        rightArm.Name = "Right Arm"
        rightArm.Size = Vector3.new(1, 3, 1)
        rightArm.BrickColor = BrickColor.new("Bright green")
        rightArm.Parent = dino
        
        local leftLeg = Instance.new("Part")
        leftLeg.Name = "Left Leg"
        leftLeg.Size = Vector3.new(1, 3, 1)
        leftLeg.BrickColor = BrickColor.new("Bright green")
        leftLeg.Parent = dino
        
        local rightLeg = Instance.new("Part")
        rightLeg.Name = "Right Leg"
        rightLeg.Size = Vector3.new(1, 3, 1)
        rightLeg.BrickColor = BrickColor.new("Bright green")
        rightLeg.Parent = dino
        
        local tail = Instance.new("Part")
        tail.Name = "Tail"
        tail.Size = Vector3.new(1, 1, 3)
        tail.BrickColor = BrickColor.new("Bright green")
        tail.Parent = dino
        
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = dino
        
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:Destroy()
        
        dino.Parent = workspace
        dino:SetPrimaryPartCFrame(CFrame.new(pos))
        LocalPlayer.Character = dino
    end)
    
    CreateButton("Morph into Item", "Become an item", Color3.fromRGB(255, 255, 0), function()
        local item = Instance.new("Part")
        item.Name = LocalPlayer.Name
        item.Size = Vector3.new(2, 2, 2)
        item.BrickColor = BrickColor.new("Bright yellow")
        item.Shape = Enum.PartType.Ball
        item.Material = Enum.Material.Neon
        item.Parent = workspace
        
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = item
        
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:Destroy()
        
        item.Position = pos
        LocalPlayer.Character = item
    end)
    
    CreateButton("Morph into Vehicle", "Become a vehicle", Color3.fromRGB(0, 255, 255), function()
        local vehicle = Instance.new("Model")
        vehicle.Name = LocalPlayer.Name
        
        local body = Instance.new("Part")
        body.Name = "Body"
        body.Size = Vector3.new(4, 2, 8)
        body.BrickColor = BrickColor.new("Bright red")
        body.Parent = vehicle
        
        local wheel1 = Instance.new("Part")
        wheel1.Name = "Wheel1"
        wheel1.Size = Vector3.new(2, 2, 1)
        wheel1.BrickColor = BrickColor.new("Black")
        wheel1.Parent = vehicle
        
        local wheel2 = wheel1:Clone()
        wheel2.Name = "Wheel2"
        wheel2.Parent = vehicle
        
        local wheel3 = wheel1:Clone()
        wheel3.Name = "Wheel3"
        wheel3.Parent = vehicle
        
        local wheel4 = wheel1:Clone()
        wheel4.Name = "Wheel4"
        wheel4.Parent = vehicle
        
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = vehicle
        
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:Destroy()
        
        vehicle.Parent = workspace
        vehicle:SetPrimaryPartCFrame(CFrame.new(pos))
        LocalPlayer.Character = vehicle
    end)
    
    CreateButton("Reset Morph", "Return to normal", Color3.fromRGB(255, 0, 0), function()
        LocalPlayer.Character = LocalPlayer.Character
    end)
end

-- ADMIN TAB
local function CreateAdminTab()
    CreateButton("Give Admin", "Give yourself admin", Color3.fromRGB(255, 255, 255), function()
        LocalPlayer:SetAttribute("Admin", true)
        
        -- Try to give admin via remotes
        for _, v in pairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") and (v.Name:lower():find("admin") or v.Name:lower():find("rank")) then
                v:FireServer(LocalPlayer, "Admin")
            end
        end
    end)
    
    CreateButton("Kick All", "Kick every player", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:Kick("Kicked by THE HACKER V6")
            end
        end
    end)
    
    CreateButton("Ban All", "Ban all players", Color3.fromRGB(255, 50, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:Kick("Banned by ADMIN")
            end
        end
    end)
    
    CreateButton("Mute All", "Mute all players", Color3.fromRGB(255, 100, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:SetAttribute("Muted", true)
            end
        end
    end)
    
    CreateButton("Unmute All", "Unmute all players", Color3.fromRGB(0, 255, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            player:SetAttribute("Muted", nil)
        end
    end)
    
    CreateButton("Shutdown Server", "Attempt to shutdown", Color3.fromRGB(255, 0, 0), function()
        game:Shutdown()
    end)
    
    CreateButton("Teleport to Random Game", "Join random server", Color3.fromRGB(0, 255, 255), function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)
    
    CreateButton("Server Hop", "Join another server", Color3.fromRGB(0, 255, 255), function()
        local placeId = game.PlaceId
        local xblox = {}
        
        pcall(function()
            xblox = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100"))
        end)
        
        if xblox and xblox.data then
            for _, server in ipairs(xblox.data) do
                if server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
                    break
                end
            end
        end
    end)
end

-- SETTINGS TAB
local function CreateSettingsTab()
    CreateToggle("Matrix Rain", "Enable matrix background", Color3.fromRGB(0, 255, 0), function(state)
        MatrixRain.Visible = state
    end)
    
    CreateToggle("Auto Execute", "Auto-run scripts", Color3.fromRGB(255, 255, 255), function(state)
        LocalPlayer:SetAttribute("AutoExecute", state)
    end)
    
    CreateToggle("Anti-AFK", "Prevent being kicked", Color3.fromRGB(0, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                    wait(60)
                end
            end)
        end
    end)
    
    CreateToggle("Rejoin on Kick", "Auto rejoin if kicked", Color3.fromRGB(255, 0, 0), function(state)
        LocalPlayer:SetAttribute("RejoinOnKick", state)
    end)
    
    CreateSlider("UI Transparency", "Change UI opacity", 0, 1, 0, "%", function(value)
        MainFrame.BackgroundTransparency = value
    end])
    
    CreateButton("Save Settings", "Save current configuration", Color3.fromRGB(0, 255, 0), function()
        local settings = {
            FlyEnabled = FlyEnabled,
            InfiniteJump = InfiniteJump,
            GodMode = GodMode,
            Invisible = Invisible,
            WalkspeedValue = WalkspeedValue,
            JumppowerValue = JumppowerValue
        }
        
        local json = HttpService:JSONEncode(settings)
        writefile("TheHackerV6_Settings.json", json)
        
        StarterGui:SetCore("SendNotification", {
            Title = "THE HACKER V6",
            Text = "Settings saved!",
            Duration = 3
        })
    end)
    
    CreateButton("Load Settings", "Load saved configuration", Color3.fromRGB(255, 255, 0), function()
        if isfile("TheHackerV6_Settings.json") then
            local json = readfile("TheHackerV6_Settings.json")
            local settings = HttpService:JSONDecode(json)
            
            FlyEnabled = settings.FlyEnabled or false
            InfiniteJump = settings.InfiniteJump or false
            GodMode = settings.GodMode or false
            Invisible = settings.Invisible or false
            WalkspeedValue = settings.WalkspeedValue or 100
            JumppowerValue = settings.JumppowerValue or 150
            
            StarterGui:SetCore("SendNotification", {
                Title = "THE HACKER V6",
                Text = "Settings loaded!",
                Duration = 3
            })
        end
    end)
    
    CreateButton("Reset UI", "Reset UI position", Color3.fromRGB(255, 0, 0), function()
        MainFrame.Position = UDim2.new(0.5, -500, 0.5, -350)
    end)
    
    CreateButton("Destroy GUI", "Remove the hack menu", Color3.fromRGB(255, 0, 0), function()
        ScreenGui:Destroy()
    end)
end

-- Welcome Screen
local WelcomeScreen = Instance.new("Frame")
WelcomeScreen.Name = "WelcomeScreen"
WelcomeScreen.Size = UDim2.new(0, 400, 0, 300)
WelcomeScreen.Position = UDim2.new(0.5, -200, 0.5, -150)
WelcomeScreen.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
WelcomeScreen.BackgroundTransparency = 0.1
WelcomeScreen.BorderSizePixel = 0
WelcomeScreen.Visible = true
WelcomeScreen.Parent = ScreenGui

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Size = UDim2.new(1, 0, 0, 80)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 20)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "🔥 THE HACKER V6 🔥"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
WelcomeTitle.TextScaled = true
WelcomeTitle.Font = Enum.Font.SourceSansBold
WelcomeTitle.Parent = WelcomeScreen

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -40, 0, 120)
WelcomeText.Position = UDim2.new(0, 20, 0, 100)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name .. "!\n\nStatus: HACKER\nPress INSERT to open menu\nMade by Waled-Hammad"
WelcomeText.TextColor3 = Color3.fromRGB(0, 255, 0)
WelcomeText.TextScaled = true
WelcomeText.Font = Enum.Font.SourceSans
WelcomeText.Parent = WelcomeScreen

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0, 200, 0, 50)
EnterButton.Position = UDim2.new(0.5, -100, 1, -60)
EnterButton.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
EnterButton.Text = "ENTER THE MATRIX"
EnterButton.TextColor3 = Color3.fromRGB(0, 255, 0)
EnterButton.TextScaled = true
EnterButton.Font = Enum.Font.SourceSansBold
EnterButton.Parent = WelcomeScreen

EnterButton.MouseButton1Click:Connect(function()
    WelcomeScreen.Visible = false
    MatrixRain.Visible = true
end)

-- Tab switching
for i, tabButton in ipairs(TabBar:GetChildren()) do
    if tabButton:IsA("TextButton") then
        tabButton.MouseButton1Click:Connect(function()
            -- Clear content
            for _, v in pairs(ScrollingFrame:GetChildren()) do
                if v:IsA("Frame") or v:IsA("TextButton") then
                    v:Destroy()
                end
            end
            
            -- Load selected tab
            if tabButton.Name == "COMBATTab" then
                CreateCombatTab()
            elseif tabButton.Name == "PLAYERTab" then
                CreatePlayerTab()
            elseif tabButton.Name == "VISUALSTab" then
                CreateVisualsTab()
            elseif tabButton.Name == "WORLDTab" then
                CreateWorldTab()
            elseif tabButton.Name == "ITEMSTab" then
                CreateItemsTab()
            elseif tabButton.Name == "TELEPORTTab" then
                CreateTeleportTab()
            elseif tabButton.Name == "TROLLTab" then
                CreateTrollTab()
            elseif tabButton.Name == "MORPHTab" then
                CreateMorphTab()
            elseif tabButton.Name == "ADMINTab" then
                CreateAdminTab()
            elseif tabButton.Name == "SETTINGSTab" then
                CreateSettingsTab()
            end
        end)
    end
end

-- Toggle menu with Insert key
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.Insert then
            MainFrame.Visible = not MainFrame.Visible
            ToggleButton.Visible = not MainFrame.Visible
        end
    end
end)

-- Close button
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

-- Minimize button
MinButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

-- Toggle button
ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    ToggleButton.Visible = false
end)

-- Dragging
local dragging = false
local dragInput
local dragStart
local startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TitleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- Load default tab
CreateCombatTab()

-- Anti-Kick protection
LocalPlayer.OnTeleport:Connect(function(state)
    if LocalPlayer:GetAttribute("RejoinOnKick") then
        wait(5)
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
end)

-- Print success
print("====================================")
print("THE HACKER V6 loaded successfully!")
print("Made by Waled-Hammad")
print("Press INSERT to open menu")
print("====================================")

-- Notification
StarterGui:SetCore("SendNotification", {
    Title = "THE HACKER V6",
    Text = "Loaded successfully!\nPress INSERT to open",
    Duration = 5,
    Button1 = "OK"
})
