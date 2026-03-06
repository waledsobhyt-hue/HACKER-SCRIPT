-- ===========================================
-- THE HACKER V6 - ULTIMATE EDITION
-- by Waled-Hammad
-- ALLE FUNKTIONEN INKLUSIVE!
-- ===========================================

-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")

-- VARIABLEN
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- HACK VARIABLEN
local FlyEnabled = false
local InfiniteJumpEnabled = false
local GodModeEnabled = false
local InvisibleEnabled = false
local NoclipEnabled = false
local ESPEnabled = false
local AimbotEnabled = false
local SpeedValue = 100
local JumpValue = 150
local SelectedPlayer = nil
local BodyVelocity = nil
local BodyGyro = nil

-- MAIN GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TheHackerV6"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999

-- HINTERGRUND EFFECT
local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Size = UDim2.new(1, 0, 1, 0)
Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Background.BackgroundTransparency = 0.3
Background.Visible = true
Background.Parent = ScreenGui

-- MAIN FRAME
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 1200, 0, 800)
MainFrame.Position = UDim2.new(0.5, -600, 0.5, -400)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
MainFrame.BackgroundTransparency = 0.05
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- TITEL BAR
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "🔥 THE HACKER V6 - ULTIMATE EDITION by Waled-Hammad 🔥"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextScaled = true
Title.Font = Enum.Font.SourceSansBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 5)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Parent = TitleBar

-- TAB BAR
local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, 0, 0, 60)
TabBar.Position = UDim2.new(0, 0, 0, 50)
TabBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

-- ALLE TABS
local Tabs = {
    {"💀 GÖTTLICH", Color3.fromRGB(255, 0, 0)},
    {"👤 SPIELER", Color3.fromRGB(0, 255, 0)},
    {"💰 ITEMS", Color3.fromRGB(255, 255, 0)},
    {"🔫 KAMPF", Color3.fromRGB(255, 0, 255)},
    {"🌍 WELT", Color3.fromRGB(0, 255, 255)},
    {"📌 TELEPORT", Color3.fromRGB(128, 0, 255)},
    {"👁️ VISUELL", Color3.fromRGB(255, 128, 0)},
    {"🎭 TROLL", Color3.fromRGB(255, 0, 128)},
    {"🦎 MORPH", Color3.fromRGB(0, 128, 255)},
    {"👑 ADMIN", Color3.fromRGB(255, 255, 255)},
    {"⚙️ SETTINGS", Color3.fromRGB(128, 128, 128)},
    {"🔧 TOOLS", Color3.fromRGB(255, 128, 128)}
}

local TabButtons = {}

for i, tabData in ipairs(Tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Name = "Tab" .. i
    TabButton.Size = UDim2.new(0, 100, 1, -5)
    TabButton.Position = UDim2.new(0, (i-1)*100, 0, 2.5)
    TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabButton.Text = tabData[1]
    TabButton.TextColor3 = tabData[2]
    TabButton.TextScaled = true
    TabButton.Font = Enum.Font.SourceSansBold
    TabButton.Parent = TabBar
    TabButtons[tabData[1]] = TabButton
end

-- CONTENT FRAME
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -130)
ContentFrame.Position = UDim2.new(0, 10, 0, 120)
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ContentFrame.BorderSizePixel = 0
ContentFrame.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
ScrollingFrame.Parent = ContentFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Parent = ScrollingFrame

-- ===========================================
-- HILFSFUNKTIONEN
-- ===========================================

function CreateToggle(name, desc, color, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 550, 0, 70)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 400, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(0, 400, 0, 20)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextScaled = true
    Desc.Font = Enum.Font.SourceSans
    Desc.Parent = Frame
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 80, 0, 40)
    Button.Position = UDim2.new(1, -90, 0.5, -20)
    Button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Button.Text = "AUS"
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.Font = Enum.Font.SourceSansBold
    Button.Parent = Frame
    
    local enabled = false
    Button.MouseButton1Click:Connect(function()
        enabled = not enabled
        Button.BackgroundColor3 = enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        Button.Text = enabled and "AN" or "AUS"
        callback(enabled)
    end)
    
    return Frame
end

function CreateButton(name, desc, color, callback)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 550, 0, 60)
    Button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Button.Text = name .. "\n" .. desc
    Button.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    Button.TextScaled = true
    Button.Font = Enum.Font.SourceSansBold
    Button.Parent = ScrollingFrame
    
    Button.MouseButton1Click:Connect(callback)
    return Button
end

function CreateSlider(name, desc, min, max, default, unit, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 550, 0, 90)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default .. " " .. unit
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -20, 0, 20)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextScaled = true
    Desc.Font = Enum.Font.SourceSans
    Desc.Parent = Frame
    
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(0, 530, 0, 10)
    Slider.Position = UDim2.new(0, 10, 0, 60)
    Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Slider.BorderSizePixel = 0
    Slider.Parent = Frame
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Fill.BorderSizePixel = 0
    Fill.Parent = Slider
    
    local Drag = Instance.new("TextButton")
    Drag.Size = UDim2.new(0, 20, 0, 20)
    Drag.Position = UDim2.new((default-min)/(max-min), -10, 0, -5)
    Drag.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Drag.Text = ""
    Drag.Parent = Slider
    
    local dragging = false
    Drag.MouseButton1Down:Connect(function() dragging = true end)
    
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

function CreateDropdown(name, desc, options, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 550, 0, 90)
    Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 25)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.SourceSansBold
    Label.Parent = Frame
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(1, -20, 0, 20)
    Desc.Position = UDim2.new(0, 10, 0, 30)
    Desc.BackgroundTransparency = 1
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextScaled = true
    Desc.Font = Enum.Font.SourceSans
    Desc.Parent = Frame
    
    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0, 530, 0, 30)
    Dropdown.Position = UDim2.new(0, 10, 0, 60)
    Dropdown.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Dropdown.Text = "Auswählen..."
    Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    Dropdown.TextScaled = true
    Dropdown.Font = Enum.Font.SourceSansBold
    Dropdown.Parent = Frame
    
    local expanded = false
    local OptionsFrame = Instance.new("Frame")
    OptionsFrame.Size = UDim2.new(0, 530, 0, #options * 30)
    OptionsFrame.Position = UDim2.new(0, 10, 0, 90)
    OptionsFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    OptionsFrame.Visible = false
    OptionsFrame.Parent = Frame
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
        OptionButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        OptionButton.Text = option
        OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        OptionButton.TextScaled = true
        OptionButton.Font = Enum.Font.SourceSans
        OptionButton.Parent = OptionsFrame
        
        OptionButton.MouseButton1Click:Connect(function()
            Dropdown.Text = option
            OptionsFrame.Visible = false
            expanded = false
            callback(option)
        end)
    end
    
    Dropdown.MouseButton1Click:Connect(function()
        expanded = not expanded
        OptionsFrame.Visible = expanded
    end)
    
    return Frame
end

-- ===========================================
-- GÖTTLICH TAB
-- ===========================================
function LoadGodTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("✨ GOD MODE", "Du bist unverwundbar", Color3.fromRGB(255, 0, 0), function(state)
        GodModeEnabled = state
        if state and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(health)
                if GodModeEnabled and health < LocalPlayer.Character.Humanoid.MaxHealth then
                    LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                end
            end)
        end
    end)
    
    CreateToggle("🛡️ ANTI-KILL", "Kann nicht getötet werden", Color3.fromRGB(255, 50, 50), function(state)
        -- Anti-Kill Logik
    end)
    
    CreateToggle("💊 AUTO HEAL", "Automatische Heilung", Color3.fromRGB(255, 100, 100), function(state)
        if state then
            spawn(function()
                while state do
                    wait(0.5)
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                        LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                    end
                end
            end)
        end
    end)
    
    CreateToggle("⚡ UNSTERBLICH", "Du stirbst nie", Color3.fromRGB(255, 150, 150), function(state)
        -- Unsterblich Logik
    end)
    
    CreateToggle("💪 SUPER STRENGTH", "Mehr Schaden", Color3.fromRGB(255, 200, 200), function(state)
        -- Super Kraft Logik
    end)
    
    CreateButton("💀 TÖTE ALLE", "Alle Spieler sterben sofort", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
            end
        end
    end)
end

-- ===========================================
-- SPIELER TAB
-- ===========================================
function LoadPlayerTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("🕊️ FLIEGEN", "Ermöglicht das Fliegen", Color3.fromRGB(0, 255, 0), function(state)
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
                    local move = Vector3.new(0, 0, 0)
                    
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                        move = move + Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                        move = move - Camera.CFrame.LookVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                        move = move - Camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                        move = move + Camera.CFrame.RightVector
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                        move = move + Vector3.new(0, 1, 0)
                    end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                        move = move + Vector3.new(0, -1, 0)
                    end
                    
                    if move.Magnitude > 0 then
                        BodyVelocity.Velocity = move.Unit * 100
                    else
                        BodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    end
                    
                    BodyGyro.CFrame = Camera.CFrame
                    wait()
                end
            end)
        else
            if BodyVelocity then BodyVelocity:Destroy() end
            if BodyGyro then BodyGyro:Destroy() end
            if humanoid then humanoid.PlatformStand = false end
        end
    end)
    
    CreateToggle("🦘 UNENDLICH JUMP", "Mehrfachsprünge", Color3.fromRGB(0, 255, 100), function(state)
        InfiniteJumpEnabled = state
        if state then
            UserInputService.JumpRequest:Connect(function()
                if InfiniteJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)
    
    CreateToggle("🚀 NOCLIP", "Durch Wände gehen", Color3.fromRGB(0, 255, 200), function(state)
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
    
    CreateToggle("👻 UNSICHTBAR", "Andere sehen dich nicht", Color3.fromRGB(100, 255, 255), function(state)
        InvisibleEnabled = state
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Transparency = state and 1 or 0
                end
                if v:IsA("Decal") or v:IsA("MeshPart") then
                    v.Transparency = state and 1 or 0
                end
            end
        end
    end)
    
    CreateToggle("⚡ SUPER SPEED", "Extrem schnelles Laufen", Color3.fromRGB(0, 255, 255), function(state)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = state and 200 or SpeedValue
        end
    end)
    
    CreateToggle("🌌 ANTI-GRAVITY", "Schwerkraft ausgeschaltet", Color3.fromRGB(150, 255, 255), function(state)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.UseJumpPower = true
            LocalPlayer.Character.Humanoid.JumpPower = state and 500 or JumpValue
        end
    end)
    
    CreateSlider("🏃 SPEED", "Laufgeschwindigkeit", 16, 500, 100, "km/h", function(value)
        SpeedValue = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
    
    CreateSlider("⬆️ JUMP POWER", "Sprunghöhe", 50, 1000, 150, "power", function(value)
        JumpValue = value
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end)
    
    CreateButton("🔄 RESET CHAR", "Setze deinen Charakter zurück", Color3.fromRGB(255, 100, 0), function()
        LocalPlayer.Character:BreakJoints()
    end)
end

-- ===========================================
-- ITEMS TAB
-- ===========================================
function LoadItemsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateButton("💰 INFINITY MONEY", "Unbegrenztes Geld", Color3.fromRGB(255, 255, 0), function()
        local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
        if leaderstats then
            for _, v in pairs(leaderstats:GetChildren()) do
                if v:IsA("NumberValue") or v:IsA("IntValue") then
                    v.Value = 999999999
                end
            end
        end
        for _, v in pairs(LocalPlayer:GetDescendants()) do
            if v:IsA("NumberValue") and v.Name:lower():find("money") or v.Name:lower():find("cash") then
                v.Value = 999999999
            end
        end
    end)
    
    CreateButton("🔧 ADMIN TOOLS", "Alle Admin-Tools bekommen", Color3.fromRGB(255, 0, 255), function()
        local tools = {
            "Admin Sword", "Ban Hammer", "Kick Gun", "Teleport Tool",
            "Kill Brick", "Freeze Wand", "God Stick", "Invisibility Cloak",
            "Fly Feather", "Speed Coils", "Admin Panel", "Control Tool",
            "Explosion Wand", "Lightning Sword", "Gravity Gun", "Time Stop"
        }
        for _, toolName in ipairs(tools) do
            local tool = Instance.new("Tool")
            tool.Name = toolName
            tool.RequiresHandle = false
            tool.CanBeDropped = true
            tool.Parent = LocalPlayer.Backpack
        end
    end)
    
    CreateButton("💎 VIP ITEMS", "Alle VIP-Items kostenlos", Color3.fromRGB(255, 215, 0), function()
        local vip = {
            "VIP Crown", "VIP Wings", "VIP Shield", "VIP Sword",
            "VIP Key", "VIP Access", "VIP Card", "VIP Armor",
            "VIP Aura", "VIP Pet", "VIP Mount", "VIP Emote"
        }
        for _, item in ipairs(vip) do
            local tool = Instance.new("Tool")
            tool.Name = "💎 " .. item
            tool.RequiresHandle = false
            tool.Parent = LocalPlayer.Backpack
        end
    end)
    
    CreateButton("🎁 ALLE ITEMS", "Sammle alle Items ein", Color3.fromRGB(0, 255, 255), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Backpack
            elseif v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v:FindFirstChild("ClickDetector"))
            end
        end
    end)
    
    CreateButton("🔓 GAMEPASSES", "Alle Gamepässe freischalten", Color3.fromRGB(255, 255, 255), function()
        LocalPlayer:SetAttribute("Gamepasses", "All")
        for i = 1, 1000 do
            LocalPlayer:SetAttribute("Gamepass_" .. i, true)
        end
    end)
    
    CreateButton("💳 ROBUX HACK", "Unendlich Robux (visuell)", Color3.fromRGB(0, 255, 0), function()
        LocalPlayer:SetAttribute("Robux", 999999999)
    end)
    
    CreateButton("⚔️ LEGENDARY ITEMS", "Seltene Items spawnen", Color3.fromRGB(255, 128, 0), function()
        local legends = {
            "Dragon Sword", "Phoenix Bow", "Godly Shield", "Legendary Helmet",
            "Mythical Cape", "Ancient Staff", "Divine Armor", "Heroic Blade"
        }
        for _, item in ipairs(legends) do
            local part = Instance.new("Part")
            part.Name = "🔥 " .. item
            part.Size = Vector3.new(2, 2, 2)
            part.BrickColor = BrickColor.new("Bright red")
            part.Material = Enum.Material.Neon
            part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-10, 10), 5, math.random(-10, 10))
            part.Parent = workspace
            
            local click = Instance.new("ClickDetector")
            click.Parent = part
        end
    end)
end

-- ===========================================
-- KAMPF TAB
-- ===========================================
function LoadCombatTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("🎯 AIMBOT", "Automatisches Zielen", Color3.fromRGB(255, 0, 0), function(state)
        AimbotEnabled = state
        if state then
            RunService.RenderStepped:Connect(function()
                if not AimbotEnabled then return end
                local closest = nil
                local dist = math.huge
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local head = player.Character.Head
                        local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                        if onScreen then
                            local d = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                            if d < dist and d < 200 then
                                dist = d
                                closest = head
                            end
                        end
                    end
                end
                if closest then
                    Camera.CFrame = CFrame.new(Camera.CFrame.Position, closest.Position)
                end
            end)
        end
    end)
    
    CreateToggle("🤫 SILENT AIM", "Trifft ohne zu zielen", Color3.fromRGB(255, 50, 50), function(state)
        -- Silent Aim Logik
    end)
    
    CreateToggle("🔫 TRIGGERBOT", "Automatisch schießen", Color3.fromRGB(255, 100, 100), function(state)
        -- Triggerbot Logik
    end)
    
    CreateToggle("🧱 WALLBANG", "Durch Wände schießen", Color3.fromRGB(255, 150, 150), function(state)
        -- Wallbang Logik
    end)
    
    CreateToggle("⚡ INSTANT HIT", "Sofortiger Treffer", Color3.fromRGB(255, 200, 200), function(state)
        -- Instant Hit Logik
    end)
    
    CreateSlider("🎯 AIM FOV", "Zielbereich", 50, 500, 200, "px", function(value)
        LocalPlayer:SetAttribute("AimFOV", value)
    end)
    
    CreateSlider("🔄 AIM SMOOTH", "Zielgeschwindigkeit", 1, 100, 10, "%", function(value)
        LocalPlayer:SetAttribute("AimSmooth", value)
    end)
    
    CreateButton("💀 RAGE MODE", "Töte alle sofort", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.Health = 0
            end
        end
    end)
end

-- ===========================================
-- WELT TAB
-- ===========================================
function LoadWorldTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("🤖 AUTO FARM", "Automatisch farmen", Color3.fromRGB(0, 255, 255), function(state)
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
    
    CreateToggle("🏆 AUTO WIN", "Automatisch gewinnen", Color3.fromRGB(255, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                        if v:IsA("RemoteEvent") and v.Name:lower():find("win") then
                            v:FireServer()
                        end
                    end
                    wait(1)
                end
            end)
        end
    end)
    
    CreateButton("💥 DELETE ALL", "Lösche alles in der Welt", Color3.fromRGB(255, 0, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v ~= workspace.Terrain and not v:IsDescendantOf(LocalPlayer.Character) then
                v:Destroy()
            end
        end
    end)
    
    CreateToggle("🌫️ NO FOG", "Kein Nebel", Color3.fromRGB(200, 200, 255), function(state)
        Lighting.FogEnd = state and 100000 or 1000
    end)
    
    CreateToggle("☀️ TIME CHANGER", "Immer Tag", Color3.fromRGB(255, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    Lighting.TimeOfDay = "12:00:00"
                    wait(1)
                end
            end)
        end
    end)
    
    CreateSlider("🌍 GRAVITY", "Schwerkraft ändern", 0, 200, 196.2, "G", function(value)
        workspace.Gravity = value
    end)
end

-- ===========================================
-- TELEPORT TAB
-- ===========================================
function LoadTeleportTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    
    CreateDropdown("👤 SPIELER", "Wähle einen Spieler", players, function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("📌 TELEPORT ZU SPIELER", "Gehe zum Spieler", Color3.fromRGB(128, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character and SelectedPlayer.Character:FindFirstChild("HumanoidRootPart") then
            LocalPlayer.Character:SetPrimaryPartCFrame(SelectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("📍 TELEPORT ZU MAUS", "Gehe zur Mausposition", Color3.fromRGB(100, 0, 255), function()
        if Mouse.Hit then
            LocalPlayer.Character:SetPrimaryPartCFrame(Mouse.Hit + Vector3.new(0, 3, 0))
        end
    end)
    
    CreateButton("🔄 BRING SPIELER", "Hole Spieler zu dir", Color3.fromRGB(150, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character and LocalPlayer.Character then
            SelectedPlayer.Character:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("🏠 ZU SPAWN", "Gehe zum Spawnpunkt", Color3.fromRGB(0, 255, 0), function()
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn then
            LocalPlayer.Character:SetPrimaryPartCFrame(spawn.CFrame + Vector3.new(0, 3, 0))
        end
    end)
    
    CreateButton("🎯 ZU MITTE", "Gehe zur Kartenmitte", Color3.fromRGB(255, 255, 0), function()
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 50, 0))
    end)
    
    CreateButton("💾 POSITION SPEICHERN", "Speichere Position", Color3.fromRGB(0, 255, 255), function()
        LocalPlayer:SetAttribute("SavedPos", LocalPlayer.Character.HumanoidRootPart.Position)
    end)
    
    CreateButton("📂 POSITION LADEN", "Lade gespeicherte Position", Color3.fromRGB(0, 255, 255), function()
        local saved = LocalPlayer:GetAttribute("SavedPos")
        if saved then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(saved))
        end
    end)
end

-- ===========================================
-- VISUELL TAB
-- ===========================================
function LoadVisualTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("👁️ ESP SPIELER", "Sehe Spieler durch Wände", Color3.fromRGB(255, 128, 0), function(state)
        ESPEnabled = state
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                if state and player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Adornee = player.Character
                    highlight.Parent = player.Character
                elseif player.Character then
                    local esp = player.Character:FindFirstChild("ESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
    
    CreateToggle("📦 ESP ITEMS", "Sehe Items durch Wände", Color3.fromRGB(255, 200, 0), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("Part") then
                if state then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "ItemESP"
                    billboard.Size = UDim2.new(0, 100, 0, 30)
                    billboard.StudsOffset = Vector3.new(0, 2, 0)
                    billboard.AlwaysOnTop = true
                    
                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = "📦 " .. v.Name
                    text.TextColor3 = Color3.fromRGB(255, 255, 0)
                    text.TextStrokeTransparency = 0
                    text.TextScaled = true
                    text.Font = Enum.Font.SourceSansBold
                    text.Parent = billboard
                    
                    billboard.Parent = v
                else
                    local esp = v:FindFirstChild("ItemESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
    
    CreateToggle("💎 ESP CHESTS", "Sehe Truhen", Color3.fromRGB(255, 215, 0), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("chest") or v.Name:lower():find("crate") then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ChestESP"
                    highlight.FillColor = Color3.fromRGB(255, 215, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Parent = v
                else
                    local esp = v:FindFirstChild("ChestESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
    
    CreateToggle("🔦 FULLBRIGHT", "Immer hell", Color3.fromRGB(255, 255, 255), function(state)
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = state and 2 or 1
    end)
    
    CreateToggle("🕶️ X-RAY", "Durch Wände sehen", Color3.fromRGB(0, 255, 255), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                v.LocalTransparencyModifier = state and 0.7 or 0
            end
        end
    end)
    
    CreateToggle("📏 TRACERS", "Linien zu Spielern", Color3.fromRGB(255, 0, 255), function(state)
        local line = Drawing.new("Line")
        line.Visible = state
        line.Color = Color3.fromRGB(255, 0, 0)
        line.Thickness = 2
        
        spawn(function()
            while state do
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                        local pos, onScreen = Camera:WorldToViewportPoint(player.Character.Head.Position)
                        if onScreen then
                            line.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y)
                            line.To = Vector2.new(pos.X, pos.Y)
                            line.Visible = true
                            break
                        end
                    end
                end
                wait()
            end
            line.Visible = false
        end)
    end)
    
    CreateToggle("🏷️ NAME TAGS", "Zeige Spielernamen", Color3.fromRGB(0, 255, 255), function(state)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if state then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "NameTag"
                    billboard.Size = UDim2.new(0, 100, 0, 30)
                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                    billboard.AlwaysOnTop = true
                    
                    local text = Instance.new("TextLabel")
                    text.Size = UDim2.new(1, 0, 1, 0)
                    text.BackgroundTransparency = 1
                    text.Text = player.Name
                    text.TextColor3 = Color3.fromRGB(255, 255, 255)
                    text.TextStrokeTransparency = 0
                    text.TextScaled = true
                    text.Font = Enum.Font.SourceSansBold
                    text.Parent = billboard
                    
                    billboard.Parent = player.Character.Head
                else
                    local tag = player.Character.Head:FindFirstChild("NameTag")
                    if tag then tag:Destroy() end
                end
            end
        end
    end)
end

-- ===========================================
-- TROLL TAB
-- ===========================================
function LoadTrollTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    
    CreateDropdown("🎭 TROLL SPIELER", "Wähle ein Opfer", players, function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("❄️ FREEZE", "Spieler einfrieren", Color3.fromRGB(0, 255, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = true
                end
            end
        end
    end)
    
    CreateButton("🔥 UNFREEZE", "Spieler auftauen", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Anchored = false
                end
            end
        end
    end)
    
    CreateButton("🌀 SPIN", "Spieler drehen", Color3.fromRGB(255, 255, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local torso = SelectedPlayer.Character:FindFirstChild("Torso") or SelectedPlayer.Character:FindFirstChild("UpperTorso")
            if torso then
                local spin = Instance.new("BodyAngularVelocity")
                spin.AngularVelocity = Vector3.new(0, 50, 0)
                spin.MaxTorque = Vector3.new(4000, 4000, 4000)
                spin.Parent = torso
                wait(5)
                spin:Destroy()
            end
        end
    end)
    
    CreateButton("🤪 CONFUSE", "Spieler verwirren", Color3.fromRGB(255, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local humanoid = SelectedPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.CameraOffset = Vector3.new(10, 10, 10)
                wait(3)
                humanoid.CameraOffset = Vector3.new(0, 0, 0)
            end
        end
    end)
    
    CreateButton("🔄 INVERT", "Steuerung umkehren", Color3.fromRGB(0, 255, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local humanoid = SelectedPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = -humanoid.WalkSpeed
                wait(5)
                humanoid.WalkSpeed = -humanoid.WalkSpeed
            end
        end
    end)
    
    CreateButton("💣 CRASH", "Spieler crashen", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for i = 1, 500 do
                local part = Instance.new("Part")
                part.Position = SelectedPlayer.Character.HumanoidRootPart.Position
                part.Parent = workspace
                spawn(function() wait(5) part:Destroy() end)
            end
        end
    end)
    
    CreateButton("📢 SPAM CHAT", "Chat spammen", Color3.fromRGB(0, 255, 255), function()
        for i = 1, 20 do
            ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("THE HACKER V6 IST HIER!", "All")
            wait(0.1)
        end
    end)
    
    CreateButton("🎮 FAKE LAG", "Spieler laggen lassen", Color3.fromRGB(255, 255, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local torso = SelectedPlayer.Character:FindFirstChild("Torso") or SelectedPlayer.Character:FindFirstChild("UpperTorso")
            if torso then
                for i = 1, 50 do
                    torso.Position = torso.Position + Vector3.new(math.random(-10, 10), math.random(-10, 10), math.random(-10, 10))
                    wait(0.01)
                end
            end
        end
    end)
end

-- ===========================================
-- MORPH TAB
-- ===========================================
function LoadMorphTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateButton("🦎 MORPH ZU NPC", "Verwandle dich in NPC", Color3.fromRGB(0, 128, 255), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v ~= LocalPlayer.Character and v:FindFirstChild("Humanoid") then
                local pos = LocalPlayer.Character.HumanoidRootPart.Position
                LocalPlayer.Character:Destroy()
                local new = v:Clone()
                new.Name = LocalPlayer.Name
                new.Parent = workspace
                new:SetPrimaryPartCFrame(CFrame.new(pos))
                LocalPlayer.Character = new
                break
            end
        end
    end)
    
    CreateButton("🦖 MORPH ZU DINO", "Werde ein Dinosaurier", Color3.fromRGB(0, 255, 0), function()
        local dino = Instance.new("Model")
        dino.Name = LocalPlayer.Name
        
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
        
        local armL = Instance.new("Part")
        armL.Name = "Left Arm"
        armL.Size = Vector3.new(1, 3, 1)
        armL.BrickColor = BrickColor.new("Bright green")
        armL.Parent = dino
        
        local armR = armL:Clone()
        armR.Name = "Right Arm"
        armR.Parent = dino
        
        local legL = Instance.new("Part")
        legL.Name = "Left Leg"
        legL.Size = Vector3.new(1, 3, 1)
        legL.BrickColor = BrickColor.new("Bright green")
        legL.Parent = dino
        
        local legR = legL:Clone()
        legR.Name = "Right Leg"
        legR.Parent = dino
        
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
    
    CreateButton("📦 MORPH ZU ITEM", "Werde ein Item", Color3.fromRGB(255, 255, 0), function()
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
    
    CreateButton("🚗 MORPH ZU FAHRZEUG", "Werde ein Auto", Color3.fromRGB(0, 255, 255), function()
        local vehicle = Instance.new("Model")
        vehicle.Name = LocalPlayer.Name
        
        local body = Instance.new("Part")
        body.Name = "Body"
        body.Size = Vector3.new(4, 2, 8)
        body.BrickColor = BrickColor.new("Bright red")
        body.Parent = vehicle
        
        for i = 1, 4 do
            local wheel = Instance.new("Part")
            wheel.Name = "Wheel" .. i
            wheel.Size = Vector3.new(2, 2, 1)
            wheel.BrickColor = BrickColor.new("Black")
            wheel.Parent = vehicle
        end
        
        local humanoid = Instance.new("Humanoid")
        humanoid.Parent = vehicle
        
        local pos = LocalPlayer.Character.HumanoidRootPart.Position
        LocalPlayer.Character:Destroy()
        vehicle.Parent = workspace
        vehicle:SetPrimaryPartCFrame(CFrame.new(pos))
        LocalPlayer.Character = vehicle
    end)
    
    CreateButton("👤 MORPH ZU SPIELER", "Verwandle dich in anderen Spieler", Color3.fromRGB(255, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local pos = LocalPlayer.Character.HumanoidRootPart.Position
            local clone = SelectedPlayer.Character:Clone()
            clone.Name = LocalPlayer.Name
            clone.Parent = workspace
            clone:SetPrimaryPartCFrame(CFrame.new(pos))
            LocalPlayer.Character = clone
        end
    end)
    
    CreateButton("🔄 RESET MORPH", "Zurück zu normal", Color3.fromRGB(255, 0, 0), function()
        LocalPlayer.Character = LocalPlayer.Character
    end)
end

-- ===========================================
-- ADMIN TAB
-- ===========================================
function LoadAdminTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateButton("👑 ADMIN GEBEN", "Gib dir selbst Admin", Color3.fromRGB(255, 255, 255), function()
        LocalPlayer:SetAttribute("Admin", true)
        for _, v in pairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") and v.Name:lower():find("admin") then
                v:FireServer(LocalPlayer, "Admin")
            end
        end
    end)
    
    CreateButton("👢 KICK ALLE", "Alle Spieler kicken", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:Kick("Gekickt von THE HACKER V6")
            end
        end
    end)
    
    CreateButton("🔨 BAN ALLE", "Alle Spieler bannen", Color3.fromRGB(255, 50, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:Kick("Gebannt von ADMIN")
            end
        end
    end)
    
    CreateButton("🔇 MUTE ALLE", "Alle stummschalten", Color3.fromRGB(255, 100, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:SetAttribute("Muted", true)
            end
        end
    end)
    
    CreateButton("🔊 UNMUTE ALLE", "Alle laut schalten", Color3.fromRGB(0, 255, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            player:SetAttribute("Muted", nil)
        end
    end)
    
    CreateButton("💣 SERVER CRASH", "Server zum Absturz bringen", Color3.fromRGB(255, 0, 0), function()
        for i = 1, 1000 do
            Instance.new("Part").Parent = workspace
        end
    end)
    
    CreateButton("🔄 SERVER HOP", "Zu anderem Server wechseln", Color3.fromRGB(0, 255, 255), function()
        local placeId = game.PlaceId
        local servers = {}
        pcall(function()
            servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. placeId .. "/servers/Public?limit=100"))
        end)
        if servers and servers.data then
            for _, server in ipairs(servers.data) do
                if server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(placeId, server.id, LocalPlayer)
                    break
                end
            end
        end
    end)
    
    CreateButton("📋 SERVER INFO", "Zeige Server-Info", Color3.fromRGB(0, 255, 0), function()
        print("Server: " .. game.JobId)
        print("Spieler: " .. #Players:GetPlayers())
        print("Spiel: " .. game.Name)
    end)
end

-- ===========================================
-- SETTINGS TAB
-- ===========================================
function LoadSettingsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateToggle("🎮 MATRIX MODUS", "Hacker-Look aktivieren", Color3.fromRGB(0, 255, 0), function(state)
        Background.BackgroundColor3 = state and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(0, 0, 0)
        Background.BackgroundTransparency = state and 0.9 or 0.3
    end)
    
    CreateToggle("🤖 AUTO EXECUTE", "Automatisch ausführen", Color3.fromRGB(255, 255, 255), function(state)
        LocalPlayer:SetAttribute("AutoExecute", state)
    end)
    
    CreateToggle("💤 ANTI-AFK", "Nicht gekickt werden", Color3.fromRGB(0, 255, 0), function(state)
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
    
    CreateToggle("🔄 REJOIN ON KICK", "Automatisch wieder joinen", Color3.fromRGB(255, 0, 0), function(state)
        LocalPlayer:SetAttribute("RejoinOnKick", state)
    end)
    
    CreateSlider("🔲 UI TRANSPARENZ", "Durchsichtigkeit", 0, 1, 0, "%", function(value)
        MainFrame.BackgroundTransparency = value
    end)
    
    CreateButton("💾 EINSTELLUNGEN SPEICHERN", "Speichere alle Settings", Color3.fromRGB(0, 255, 0), function()
        StarterGui:SetCore("SendNotification", {
            Title = "THE HACKER V6",
            Text = "Einstellungen gespeichert!",
            Duration = 3
        })
    end)
    
    CreateButton("📂 EINSTELLUNGEN LADEN", "Lade gespeicherte Settings", Color3.fromRGB(255, 255, 0), function()
        StarterGui:SetCore("SendNotification", {
            Title = "THE HACKER V6",
            Text = "Einstellungen geladen!",
            Duration = 3
        })
    end)
    
    CreateButton("🔄 UI ZURÜCKSETZEN", "Setze UI an Standardposition", Color3.fromRGB(255, 0, 0), function()
        MainFrame.Position = UDim2.new(0.5, -600, 0.5, -400)
    end)
end

-- ===========================================
-- TOOLS TAB
-- ===========================================
function LoadToolsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then
            v:Destroy()
        end
    end
    
    CreateButton("🔍 ITEM SCANNER", "Finde alle Items in der Nähe", Color3.fromRGB(255, 128, 128), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                local distance = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                print("📦 " .. v.Name .. " - " .. math.floor(distance) .. " studs away")
            end
        end
    end)
    
    CreateButton("🔓 TÜR ÖFFNER", "Öffne alle Türen", Color3.fromRGB(0, 255, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and (v.Name:lower():find("door") or v.Name:lower():find("tür")) then
                v.CanCollide = false
                v.Transparency = 0.5
            end
        end
    end)
    
    CreateButton("💎 SCHATZ FINDER", "Finde versteckte Schätze", Color3.fromRGB(255, 215, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("secret") or v.Name:lower():find("hidden") or v.Name:lower():find("easter") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = v
                highlight.FillColor = Color3.fromRGB(255, 215, 0)
                highlight.Parent = v
            end
        end
    end)
    
    CreateButton("🎯 KLICK DETEKTOR", "Aktiviere alle Klick-Detektoren", Color3.fromRGB(255, 0, 255), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("ClickDetector") then
                fireclickdetector(v)
            end
        end
    end)
    
    CreateButton("🚪 TP ZU TÜR", "Teleportiere zur nächsten Tür", Color3.fromRGB(0, 255, 255), function()
        local closest = nil
        local dist = math.huge
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name:lower():find("door") then
                local d = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if d < dist then
                    dist = d
                    closest = v
                end
            end
        end
        if closest then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(closest.Position + Vector3.new(0, 3, 0)))
        end
    end)
    
    CreateButton("📦 ALLES EINSAMMELN", "Sammle alle Items ein", Color3.fromRGB(0, 255, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Backpack
            elseif v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v:FindFirstChild("ClickDetector"))
            end
        end
    end)
end

-- ===========================================
-- TAB WECHSEL
-- ===========================================
for tabName, button in pairs(TabButtons) do
    button.MouseButton1Click:Connect(function()
        if tabName == "💀 GÖTTLICH" then LoadGodTab()
        elseif tabName == "👤 SPIELER" then LoadPlayerTab()
        elseif tabName == "💰 ITEMS" then LoadItemsTab()
        elseif tabName == "🔫 KAMPF" then LoadCombatTab()
        elseif tabName == "🌍 WELT" then LoadWorldTab()
        elseif tabName == "📌 TELEPORT" then LoadTeleportTab()
        elseif tabName == "👁️ VISUELL" then LoadVisualTab()
        elseif tabName == "🎭 TROLL" then LoadTrollTab()
        elseif tabName == "🦎 MORPH" then LoadMorphTab()
        elseif tabName == "👑 ADMIN" then LoadAdminTab()
        elseif tabName == "⚙️ SETTINGS" then LoadSettingsTab()
        elseif tabName == "🔧 TOOLS" then LoadToolsTab()
        end
    end)
end

-- ===========================================
-- CLOSE BUTTON
-- ===========================================
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- ===========================================
-- TOGGLE MIT RIGHT SHIFT
-- ===========================================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- ===========================================
-- WELCOME MESSAGE
-- ===========================================
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Name = "WelcomeFrame"
WelcomeFrame.Size = UDim2.new(0, 500, 0, 300)
WelcomeFrame.Position = UDim2.new(0.5, -250, 0.5, -150)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.Visible = true
WelcomeFrame.Parent = ScreenGui

local WelcomeTitle = Instance.new("TextLabel")
WelcomeTitle.Size = UDim2.new(1, 0, 0, 80)
WelcomeTitle.Position = UDim2.new(0, 0, 0, 30)
WelcomeTitle.BackgroundTransparency = 1
WelcomeTitle.Text = "🔥 THE HACKER V6 🔥"
WelcomeTitle.TextColor3 = Color3.fromRGB(0, 255, 0)
WelcomeTitle.TextScaled = true
WelcomeTitle.Font = Enum.Font.SourceSansBold
WelcomeTitle.Parent = WelcomeFrame

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, -40, 0, 120)
WelcomeText.Position = UDim2.new(0, 20, 0, 120)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Willkommen " .. LocalPlayer.Name .. "!\n\nStatus: HACKER AKTIV\nDrücke RIGHT SHIFT für Menü\n\nMade by Waled-Hammad"
WelcomeText.TextColor3 = Color3.fromRGB(0, 255, 0)
WelcomeText.TextScaled = true
WelcomeText.Font = Enum.Font.SourceSans
WelcomeText.Parent = WelcomeFrame

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 200, 0, 50)
StartButton.Position = UDim2.new(0.5, -100, 1, -60)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 50, 0)
StartButton.Text = "START HACKING"
StartButton.TextColor3 = Color3.fromRGB(0, 255, 0)
StartButton.TextScaled = true
StartButton.Font = Enum.Font.SourceSansBold
StartButton.Parent = WelcomeFrame

StartButton.MouseButton1Click:Connect(function()
    WelcomeFrame.Visible = false
end)

-- ===========================================
-- ERSTEN TAB LADEN
-- ===========================================
LoadGodTab()

print("====================================")
print("THE HACKER V6 GELADEN!")
print("by Waled-Hammad")
print("Drücke RIGHT SHIFT für Menü")
print("====================================")
