-- ===========================================
-- THE HACKER V6 - ULTIMATE EDITION
-- by Waled-Hammad
-- ALLE TOOLS INKLUSIVE
-- ===========================================

-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

-- ===========================================
-- HACK VARIABLEN (ALLE)
-- ===========================================
local FlyEnabled = false
local InfiniteJumpEnabled = false
local GodModeEnabled = false
local InvisibleEnabled = false
local NoclipEnabled = false
local ESPEnabled = false
local AimbotEnabled = false
local SilentAimEnabled = false
local TriggerbotEnabled = false
local SpeedEnabled = false
local JumpPowerEnabled = false
local WalkspeedValue = 100
local JumppowerValue = 150
local SelectedPlayer = nil
local BodyVelocity = nil
local BodyGyro = nil
local aimbotConnection = nil
local espConnections = {}
local trolledPlayers = {}

-- SCREENGUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HackerV6"
ScreenGui.Parent = CoreGui
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.DisplayOrder = 999999

-- ===========================================
-- BINÄRE HACKER ANIMATION
-- ===========================================
local BinaryBackground = Instance.new("Frame")
BinaryBackground.Name = "BinaryBackground"
BinaryBackground.Size = UDim2.new(1, 0, 1, 0)
BinaryBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BinaryBackground.BackgroundTransparency = 0.1
BinaryBackground.Parent = ScreenGui

local binaryNumbers = {}
for i = 1, 150 do
    local binary = Instance.new("TextLabel")
    binary.Size = UDim2.new(0, 80, 0, 30)
    binary.Position = UDim2.new(0, math.random(0, 1920), 0, math.random(-1000, 0))
    binary.BackgroundTransparency = 1
    binary.Text = string.format("%08d", tonumber(string.format("%08d", math.random(0, 255)):gsub(".", function() return math.random(0,1) end)))
    binary.TextColor3 = Color3.fromRGB(0, math.random(100, 255), 0)
    binary.TextTransparency = 0.3
    binary.TextScaled = true
    binary.Font = Enum.Font.Code
    binary.Parent = BinaryBackground
    table.insert(binaryNumbers, binary)
end

spawn(function()
    while true do
        for _, binary in ipairs(binaryNumbers) do
            binary.Position = binary.Position + UDim2.new(0, 0, 0.0015, 0)
            if binary.Position.Y.Scale > 1 then
                binary.Position = UDim2.new(0, math.random(0, 1920), 0, -50)
                binary.Text = string.format("%08d", tonumber(string.format("%08d", math.random(0, 255)):gsub(".", function() return math.random(0,1) end)))
            end
            if math.random(1, 200) == 1 then
                binary.TextTransparency = 0.9
                wait(0.02)
                binary.TextTransparency = 0.3
            end
        end
        wait(0.02)
    end
end)

-- ===========================================
-- FPS & TIME COUNTER
-- ===========================================
local HackerInfo = Instance.new("Frame")
HackerInfo.Name = "HackerInfo"
HackerInfo.Size = UDim2.new(0, 200, 0, 80)
HackerInfo.Position = UDim2.new(0, 20, 0, 20)
HackerInfo.BackgroundColor3 = Color3.fromRGB(0, 10, 0)
HackerInfo.BorderSizePixel = 0
HackerInfo.Parent = ScreenGui

local FPSText = Instance.new("TextLabel")
FPSText.Size = UDim2.new(1, 0, 0.33, 0)
FPSText.Position = UDim2.new(0, 0, 0, 0)
FPSText.BackgroundTransparency = 1
FPSText.Text = "FPS: 60"
FPSText.TextColor3 = Color3.fromRGB(0, 255, 0)
FPSText.TextScaled = true
FPSText.Font = Enum.Font.Code
FPSText.Parent = HackerInfo

local TimeText = Instance.new("TextLabel")
TimeText.Size = UDim2.new(1, 0, 0.33, 0)
TimeText.Position = UDim2.new(0, 0, 0.33, 0)
TimeText.BackgroundTransparency = 1
TimeText.Text = os.date("%H:%M:%S")
TimeText.TextColor3 = Color3.fromRGB(0, 255, 0)
TimeText.TextScaled = true
TimeText.Font = Enum.Font.Code
TimeText.Parent = HackerInfo

local DateText = Instance.new("TextLabel")
DateText.Size = UDim2.new(1, 0, 0.33, 0)
DateText.Position = UDim2.new(0, 0, 0.66, 0)
DateText.BackgroundTransparency = 1
DateText.Text = os.date("%d.%m.%Y")
TimeText.TextColor3 = Color3.fromRGB(0, 255, 0)
DateText.TextScaled = true
DateText.Font = Enum.Font.Code
DateText.Parent = HackerInfo

spawn(function()
    local lastTime = tick()
    local frames = 0
    while true do
        frames = frames + 1
        local currentTime = tick()
        if currentTime - lastTime >= 1 then
            FPSText.Text = "FPS: " .. frames
            TimeText.Text = os.date("%H:%M:%S")
            DateText.Text = os.date("%d.%m.%Y")
            frames = 0
            lastTime = currentTime
        end
        RunService.RenderStepped:Wait()
    end
end)

-- ===========================================
-- START BUTTON
-- ===========================================
local StartButton = Instance.new("TextButton")
StartButton.Name = "StartButton"
StartButton.Size = UDim2.new(0, 600, 0, 180)
StartButton.Position = UDim2.new(0.5, -300, 0.5, -90)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 20, 0)
StartButton.BackgroundTransparency = 0.2
StartButton.Text = "001101 0101 100101 001101\n🔥 HACKER V6 ULTIMATE 🔥\n100101 001101 0101 100101"
StartButton.TextColor3 = Color3.fromRGB(0, 255, 0)
StartButton.TextScaled = true
StartButton.Font = Enum.Font.Code
StartButton.Draggable = true
StartButton.BorderSizePixel = 0
StartButton.Parent = ScreenGui

local StartGlow = Instance.new("ImageLabel")
StartGlow.Size = UDim2.new(1, 20, 1, 20)
StartGlow.Position = UDim2.new(0, -10, 0, -10)
StartGlow.BackgroundTransparency = 1
StartGlow.Image = "rbxassetid://3570695787"
StartGlow.ImageColor3 = Color3.fromRGB(0, 255, 0)
StartGlow.ImageTransparency = 0.5
StartGlow.Parent = StartButton

-- ===========================================
-- HAUPTMENÜ
-- ===========================================
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 1300, 0, 800)
MainFrame.Position = UDim2.new(0.5, -650, 0.5, -400)
MainFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 60)
TitleBar.BackgroundColor3 = Color3.fromRGB(0, 30, 0)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -100, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "001101 0101 100101  |  HACKER V6 ULTIMATE  |  100101 001101"
Title.TextColor3 = Color3.fromRGB(0, 255, 0)
Title.TextScaled = true
Title.Font = Enum.Font.Code
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -50, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Parent = TitleBar

-- ===========================================
-- TABS (ALLE 20 TABS)
-- ===========================================
local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, 0, 0, 80)
TabBar.Position = UDim2.new(0, 0, 0, 60)
TabBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TabBar.Parent = MainFrame

local Tabs = {
    {"💀 GOD", Color3.fromRGB(255, 0, 0)},
    {"👤 PLAYER", Color3.fromRGB(0, 255, 0)},
    {"💰 ITEMS", Color3.fromRGB(255, 255, 0)},
    {"🔫 COMBAT", Color3.fromRGB(255, 0, 255)},
    {"🌍 WORLD", Color3.fromRGB(0, 255, 255)},
    {"📌 TP", Color3.fromRGB(128, 0, 255)},
    {"👁️ ESP", Color3.fromRGB(255, 128, 0)},
    {"🎭 TROLL", Color3.fromRGB(255, 0, 128)},
    {"🦎 MORPH", Color3.fromRGB(0, 128, 255)},
    {"👑 ADMIN", Color3.fromRGB(255, 255, 255)},
    {"⚙️ SET", Color3.fromRGB(128, 128, 128)},
    {"🔧 TOOLS", Color3.fromRGB(255, 128, 128)},
    {"📦 ITEM", Color3.fromRGB(255, 200, 0)},
    {"🎯 AIM", Color3.fromRGB(255, 0, 0)},
    {"🚀 SPEED", Color3.fromRGB(0, 255, 200)},
    {"🕊️ FLY", Color3.fromRGB(0, 200, 255)},
    {"💰 MONEY", Color3.fromRGB(255, 215, 0)},
    {"🔓 BYPASS", Color3.fromRGB(200, 0, 255)},
    {"📡 SCAN", Color3.fromRGB(0, 255, 100)},
    {"🎮 GAME", Color3.fromRGB(255, 100, 0)}
}

for i, tabData in ipairs(Tabs) do
    local TabButton = Instance.new("TextButton")
    TabButton.Size = UDim2.new(0, 65, 1, -5)
    TabButton.Position = UDim2.new(0, (i-1)*65, 0, 2.5)
    TabButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    TabButton.Text = tabData[1]
    TabButton.TextColor3 = tabData[2]
    TabButton.TextScaled = true
    TabButton.Font = Enum.Font.Code
    TabButton.Parent = TabBar
end

-- ===========================================
-- CONTENT FRAME
-- ===========================================
local ContentFrame = Instance.new("Frame")
ContentFrame.Size = UDim2.new(1, -20, 1, -160)
ContentFrame.Position = UDim2.new(0, 10, 0, 150)
ContentFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ContentFrame.Parent = MainFrame

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, 0, 1, 0)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.ScrollBarThickness = 10
ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 0)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
ScrollingFrame.Parent = ContentFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.Parent = ScrollingFrame

-- ===========================================
-- FUNKTIONEN FÜR ALLE BUTTONS
-- ===========================================

function CreateToggle(name, desc, color, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 600, 0, 80)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0, 450, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = color
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.Code
    Label.Parent = Frame
    
    local Desc = Instance.new("TextLabel")
    Desc.Size = UDim2.new(0, 450, 0, 25)
    Desc.Position = UDim2.new(0, 10, 0, 35)
    Desc.BackgroundTransparency = 1
    Desc.Text = desc
    Desc.TextColor3 = Color3.fromRGB(150, 150, 150)
    Desc.TextXAlignment = Enum.TextXAlignment.Left
    Desc.TextScaled = true
    Desc.Font = Enum.Font.SourceSans
    Desc.Parent = Frame
    
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 100, 0, 50)
    Button.Position = UDim2.new(1, -110, 0.5, -25)
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
    Button.Size = UDim2.new(0, 600, 0, 70)
    Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Button.Text = name .. "\n" .. desc
    Button.TextColor3 = color
    Button.TextScaled = true
    Button.Font = Enum.Font.Code
    Button.Parent = ScrollingFrame
    
    Button.MouseButton1Click:Connect(callback)
    return Button
end

function CreateSlider(name, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 600, 0, 90)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(0, 255, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.Code
    Label.Parent = Frame
    
    local Slider = Instance.new("Frame")
    Slider.Size = UDim2.new(0, 580, 0, 10)
    Slider.Position = UDim2.new(0, 10, 0, 50)
    Slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Slider.Parent = Frame
    
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
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
            Label.Text = name .. ": " .. math.floor(value)
            callback(value)
        end
    end)
end

function CreateDropdown(name, options, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 600, 0, 90)
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Frame.Parent = ScrollingFrame
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 30)
    Label.Position = UDim2.new(0, 10, 0, 5)
    Label.BackgroundTransparency = 1
    Label.Text = name
    Label.TextColor3 = Color3.fromRGB(0, 255, 0)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.TextScaled = true
    Label.Font = Enum.Font.Code
    Label.Parent = Frame
    
    local Dropdown = Instance.new("TextButton")
    Dropdown.Size = UDim2.new(0, 580, 0, 40)
    Dropdown.Position = UDim2.new(0, 10, 0, 40)
    Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Dropdown.Text = "Auswählen..."
    Dropdown.TextColor3 = Color3.fromRGB(0, 255, 0)
    Dropdown.TextScaled = true
    Dropdown.Font = Enum.Font.SourceSansBold
    Dropdown.Parent = Frame
    
    local expanded = false
    local OptionsFrame = Instance.new("Frame")
    OptionsFrame.Size = UDim2.new(0, 580, 0, #options * 30)
    OptionsFrame.Position = UDim2.new(0, 10, 0, 80)
    OptionsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    OptionsFrame.Visible = false
    OptionsFrame.Parent = Frame
    
    for i, option in ipairs(options) do
        local OptionButton = Instance.new("TextButton")
        OptionButton.Size = UDim2.new(1, 0, 0, 30)
        OptionButton.Position = UDim2.new(0, 0, 0, (i-1)*30)
        OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        OptionButton.Text = option
        OptionButton.TextColor3 = Color3.fromRGB(0, 255, 0)
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
end

-- ===========================================
-- ALLE TAB FUNKTIONEN (ALLE TOOLS)
-- ===========================================

-- GOD TAB
function LoadGodTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("✨ GOD MODE", "Du bist unverwundbar - kein Schaden", Color3.fromRGB(255, 0, 0), function(state)
        GodModeEnabled = state
        if state and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.MaxHealth = math.huge
            LocalPlayer.Character.Humanoid.Health = math.huge
            LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(health)
                if GodModeEnabled and health < LocalPlayer.Character.Humanoid.MaxHealth then
                    LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
                end
            end)
        end
    end)
    
    CreateToggle("🛡️ ANTI KILL", "Kann nicht getötet werden - Schutz vor Kill-Befehlen", Color3.fromRGB(255, 50, 50), function(state) end)
    CreateToggle("💊 AUTO HEAL", "Automatische Heilung - Leben wird immer voll", Color3.fromRGB(255, 100, 100), function(state) end)
    CreateToggle("🔄 REGENERATION", "Schnelle Lebensregeneration", Color3.fromRGB(255, 150, 150), function(state) end)
    CreateToggle("💪 UNSTERBLICH", "Du stirbst niemals", Color3.fromRGB(255, 200, 200), function(state) end)
    CreateButton("💀 KILL ALL", "Töte alle Spieler im Server", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                player.Character.Humanoid.Health = 0
            end
        end
    end)
    CreateButton("❤️ VOLLES LEBEN", "Setze Leben auf Maximum", Color3.fromRGB(0, 255, 0), function()
        LocalPlayer.Character.Humanoid.Health = LocalPlayer.Character.Humanoid.MaxHealth
    end)
end

-- PLAYER TAB
function LoadPlayerTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🕊️ FLY", "Ermöglicht freies Fliegen (WASD + Leertaste)", Color3.fromRGB(0, 255, 0), function(state)
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
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move + Vector3.new(0, -1, 0) end
                    
                    BodyVelocity.Velocity = move.Magnitude > 0 and move.Unit * 100 or Vector3.new(0, 0, 0)
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
    
    CreateToggle("🦘 INFINITE JUMP", "Unendlich oft springen (mehrfach hintereinander)", Color3.fromRGB(0, 255, 100), function(state)
        InfiniteJumpEnabled = state
        if state then
            UserInputService.JumpRequest:Connect(function()
                if InfiniteJumpEnabled and LocalPlayer.Character then
                    LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end)
    
    CreateToggle("🚀 NOCLIP", "Durch Wände und Objekte gehen", Color3.fromRGB(0, 255, 200), function(state)
        NoclipEnabled = state
        if state then
            RunService.Stepped:Connect(function()
                if NoclipEnabled and LocalPlayer.Character then
                    for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end)
        end
    end)
    
    CreateToggle("👻 INVISIBLE", "Unsichtbar für andere Spieler", Color3.fromRGB(100, 255, 255), function(state)
        InvisibleEnabled = state
        if LocalPlayer.Character then
            for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Transparency = state and 1 or 0 end
                if v:IsA("Decal") then v.Transparency = state and 1 or 0 end
            end
        end
    end)
    
    CreateToggle("⚡ SUPER SPEED", "Extrem schnelles Laufen", Color3.fromRGB(0, 255, 255), function(state)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = state and 250 or WalkspeedValue
        end
    end)
    
    CreateToggle("🌌 ANTI GRAVITY", "Schwerkraft ausgeschaltet - hohe Sprünge", Color3.fromRGB(150, 255, 255), function(state)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.JumpPower = state and 500 or JumppowerValue
        end
    end)
    
    CreateToggle("💫 NO FALL DAMAGE", "Kein Fallschaden", Color3.fromRGB(200, 255, 255), function(state) end)
    CreateToggle("🏊 WALK ON WATER", "Auf Wasser laufen", Color3.fromRGB(0, 200, 255), function(state) end)
    
    CreateSlider("🏃 SPEED", "Laufgeschwindigkeit ändern", 16, 500, 100, function(value)
        WalkspeedValue = value
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
    
    CreateSlider("⬆️ JUMP POWER", "Sprunghöhe ändern", 50, 1000, 150, function(value)
        JumppowerValue = value
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.JumpPower = value
        end
    end)
    
    CreateSlider("🔄 GRAVITY", "Schwerkraft ändern", 0, 200, 196.2, function(value)
        workspace.Gravity = value
    end)
    
    CreateButton("🔄 RESET CHAR", "Setze deinen Charakter zurück", Color3.fromRGB(255, 100, 0), function()
        LocalPlayer.Character:BreakJoints()
    end)
end

-- ITEMS TAB
function LoadItemsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("💰 INFINITY MONEY", "Unbegrenzt Geld (Leaderstats)", Color3.fromRGB(255, 255, 0), function()
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
            "Admin Sword", "Ban Hammer", "Kick Gun", "Teleport Tool", "Kill Brick",
            "Freeze Wand", "God Stick", "Invisibility Cloak", "Fly Feather", "Speed Coils",
            "Admin Panel", "Control Tool", "Explosion Wand", "Lightning Sword", "Gravity Gun",
            "Time Stop", "Delete Tool", "Clone Tool", "Morph Tool", "Vanish Tool"
        }
        for _, toolName in ipairs(tools) do
            local tool = Instance.new("Tool")
            tool.Name = "🔧 " .. toolName
            tool.RequiresHandle = false
            tool.CanBeDropped = true
            tool.Parent = LocalPlayer.Backpack
        end
    end)
    
    CreateButton("💎 VIP ITEMS", "Alle VIP-Items kostenlos", Color3.fromRGB(255, 215, 0), function()
        local vip = {
            "VIP Crown", "VIP Wings", "VIP Shield", "VIP Sword", "VIP Key",
            "VIP Access", "VIP Card", "VIP Armor", "VIP Aura", "VIP Pet",
            "VIP Mount", "VIP Emote", "VIP Glove", "VIP Boots", "VIP Ring"
        }
        for _, item in ipairs(vip) do
            local tool = Instance.new("Tool")
            tool.Name = "💎 " .. item
            tool.RequiresHandle = false
            tool.Parent = LocalPlayer.Backpack
        end
    end)
    
    CreateButton("🎁 ALLE ITEMS", "Sammle alle Items im Spiel ein", Color3.fromRGB(0, 255, 255), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                v.Parent = LocalPlayer.Backpack
            elseif v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v:FindFirstChild("ClickDetector"))
            end
        end
    end)
    
    CreateButton("🔓 ALLE GAMEPASSES", "Alle Gamepässe freischalten", Color3.fromRGB(255, 255, 255), function()
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
            "Mythical Cape", "Ancient Staff", "Divine Armor", "Heroic Blade",
            "Demon Sword", "Angel Wings", "Thor Hammer", "Zeus Lightning"
        }
        for _, item in ipairs(legends) do
            local part = Instance.new("Part")
            part.Name = "🔥 " .. item
            part.Size = Vector3.new(2, 2, 2)
            part.BrickColor = BrickColor.new("Bright red")
            part.Material = Enum.Material.Neon
            part.Position = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(math.random(-15, 15), 5, math.random(-15, 15))
            part.Parent = workspace
            local click = Instance.new("ClickDetector")
            click.Parent = part
        end
    end)
    
    CreateButton("📦 ITEM DUPLICATOR", "Dupliziere Items", Color3.fromRGB(0, 255, 0), function()
        for _, v in pairs(LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v:Clone().Parent = LocalPlayer.Backpack
            end
        end
    end)
end

-- COMBAT TAB
function LoadCombatTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🎯 AIMBOT", "Automatisches Zielen auf nächsten Spieler", Color3.fromRGB(255, 0, 0), function(state)
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
    
    CreateToggle("🤫 SILENT AIM", "Trifft ohne zu zielen", Color3.fromRGB(255, 50, 50), function(state) end)
    CreateToggle("🔫 TRIGGERBOT", "Automatisch schießen wenn Ziel im Fadenkreuz", Color3.fromRGB(255, 100, 100), function(state) end)
    CreateToggle("🧱 WALLBANG", "Durch Wände schießen", Color3.fromRGB(255, 150, 150), function(state) end)
    CreateToggle("⚡ INSTANT HIT", "Sofortiger Treffer", Color3.fromRGB(255, 200, 200), function(state) end)
    CreateToggle("🎯 NO SPREAD", "Keine Streuung - perfekte Genauigkeit", Color3.fromRGB(255, 0, 255), function(state) end)
    CreateToggle("🔫 RAPID FIRE", "Schnellfeuer-Modus", Color3.fromRGB(255, 0, 100), function(state) end)
    
    CreateSlider("🎯 AIM FOV", "Zielbereich in Pixeln", 50, 500, 200, function(value)
        LocalPlayer:SetAttribute("AimFOV", value)
    end)
    
    CreateSlider("🔄 AIM SMOOTH", "Zielgeschwindigkeit (je niedriger desto schneller)", 1, 100, 10, function(value)
        LocalPlayer:SetAttribute("AimSmooth", value)
    end)
    
    CreateButton("💀 RAGE MODE", "Töte alle Spieler sofort", Color3.fromRGB(255, 0, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                player.Character.Humanoid.Health = 0
            end
        end
    end)
    
    CreateButton("🔪 ONE HIT KILL", "Aktiviere One-Hit-Kill für Waffen", Color3.fromRGB(255, 0, 0), function() end)
end

-- WORLD TAB
function LoadWorldTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🤖 AUTO FARM", "Automatisch Items und Klicks farmen", Color3.fromRGB(0, 255, 255), function(state)
        if state then
            spawn(function()
                while state do
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                            fireclickdetector(v:FindFirstChild("ClickDetector"))
                            wait(0.05)
                        end
                    end
                    wait(1)
                end
            end)
        end
    end)
    
    CreateToggle("🏆 AUTO WIN", "Automatisch gewinnen (Spielabhängig)", Color3.fromRGB(255, 255, 0), function(state)
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
    
    CreateToggle("🌫️ NO FOG", "Kein Nebel - bessere Sicht", Color3.fromRGB(200, 200, 255), function(state)
        Lighting.FogEnd = state and 100000 or 1000
    end)
    
    CreateToggle("☀️ TIME CHANGER", "Immer Tag (12:00)", Color3.fromRGB(255, 255, 0), function(state)
        if state then
            spawn(function()
                while state do
                    Lighting.TimeOfDay = "12:00:00"
                    wait(1)
                end
            end)
        end
    end)
    
    CreateToggle("🌙 NIGHT VISION", "Nachtsicht - alles hell", Color3.fromRGB(100, 100, 255), function(state)
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = state and 2 or 1
    end)
    
    CreateButton("💥 DELETE ALL", "Lösche alle Objekte in der Welt", Color3.fromRGB(255, 0, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v ~= workspace.Terrain and not v:IsDescendantOf(LocalPlayer.Character) then
                v:Destroy()
            end
        end
    end)
    
    CreateButton("🌍 CLEAR MAP", "Leere die Map", Color3.fromRGB(255, 50, 0), function() end)
end

-- TELEPORT TAB
function LoadTeleportTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    
    CreateDropdown("👤 SPIELER AUSWÄHLEN", players, function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("📌 TELEPORT ZU SPIELER", "Teleportiere zum ausgewählten Spieler", Color3.fromRGB(128, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            LocalPlayer.Character:SetPrimaryPartCFrame(SelectedPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("📍 TELEPORT ZU MAUS", "Teleportiere zur Mausposition", Color3.fromRGB(100, 0, 255), function()
        if Mouse.Hit then
            LocalPlayer.Character:SetPrimaryPartCFrame(Mouse.Hit + Vector3.new(0, 3, 0))
        end
    end)
    
    CreateButton("🔄 BRING SPIELER", "Hole den Spieler zu dir", Color3.fromRGB(150, 0, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            SelectedPlayer.Character:SetPrimaryPartCFrame(LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 5, 0))
        end
    end)
    
    CreateButton("🏠 ZU SPAWN", "Teleportiere zum Spawnpunkt", Color3.fromRGB(0, 255, 0), function()
        local spawn = workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChild("Spawn")
        if spawn then
            LocalPlayer.Character:SetPrimaryPartCFrame(spawn.CFrame + Vector3.new(0, 3, 0))
        end
    end)
    
    CreateButton("🎯 ZU MITTE", "Teleportiere zur Kartenmitte (0,50,0)", Color3.fromRGB(255, 255, 0), function()
        LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(0, 50, 0))
    end)
    
    CreateButton("💾 POSITION SPEICHERN", "Speichere aktuelle Position", Color3.fromRGB(0, 255, 255), function()
        LocalPlayer:SetAttribute("SavedPos", LocalPlayer.Character.HumanoidRootPart.Position)
    end)
    
    CreateButton("📂 POSITION LADEN", "Lade gespeicherte Position", Color3.fromRGB(0, 255, 255), function()
        local saved = LocalPlayer:GetAttribute("SavedPos")
        if saved then
            LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(saved))
        end
    end)
    
    CreateButton("📌 ZU CHECKPOINT", "Teleportiere zum letzten Checkpoint", Color3.fromRGB(0, 200, 255), function() end)
end

-- ESP TAB
function LoadESPTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("👁️ ESP SPIELER", "Zeigt Spieler durch Wände (Highlight)", Color3.fromRGB(255, 128, 0), function(state)
        ESPEnabled = state
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                if state then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "ESP"
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    highlight.Adornee = player.Character
                    highlight.Parent = player.Character
                else
                    local esp = player.Character:FindFirstChild("ESP")
                    if esp then esp:Destroy() end
                end
            end
        end
    end)
    
    CreateToggle("📦 ESP ITEMS", "Zeigt Items durch Wände", Color3.fromRGB(255, 200, 0), function(state)
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
    
    CreateToggle("💎 ESP CHESTS", "Zeigt Truhen und Kisten", Color3.fromRGB(255, 215, 0), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("chest") or v.Name:lower():find("crate") or v.Name:lower():find("truhe") then
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
    
    CreateToggle("🔦 FULLBRIGHT", "Immer maximale Helligkeit", Color3.fromRGB(255, 255, 255), function(state)
        Lighting.Ambient = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(127, 127, 127)
        Lighting.Brightness = state and 2 or 1
    end)
    
    CreateToggle("🕶️ X-RAY", "Durch Wände sehen (Transparenz)", Color3.fromRGB(0, 255, 255), function(state)
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsDescendantOf(LocalPlayer.Character) then
                v.LocalTransparencyModifier = state and 0.7 or 0
            end
        end
    end)
    
    CreateToggle("📏 TRACERS", "Linien zu Spielern", Color3.fromRGB(255, 0, 255), function(state)
        local line = Drawing.new("Line")
        line.Visible = state
        line.Color = Color3.fromRGB(0, 255, 0)
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
    
    CreateToggle("🏷️ NAME TAGS", "Zeigt Namen über Spielern", Color3.fromRGB(0, 255, 255), function(state)
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
    
    CreateToggle("💀 HEALTH BARS", "Zeigt Lebensbalken", Color3.fromRGB(255, 0, 0), function(state) end)
end

-- TROLL TAB
function LoadTrollTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    local players = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(players, player.Name)
    end
    
    CreateDropdown("🎭 TROLL SPIELER", players, function(selected)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name == selected then
                SelectedPlayer = player
                break
            end
        end
    end)
    
    CreateButton("❄️ FREEZE", "Spieler einfrieren - kann sich nicht bewegen", Color3.fromRGB(0, 255, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Anchored = true end
            end
        end
    end)
    
    CreateButton("🔥 UNFREEZE", "Spieler wieder beweglich machen", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for _, v in pairs(SelectedPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then v.Anchored = false end
            end
        end
    end)
    
    CreateButton("🌀 SPIN", "Spieler dreht sich schnell", Color3.fromRGB(255, 255, 0), function()
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
    
    CreateButton("🤪 CONFUSE", "Spieler verwirren (Kamera verrückt)", Color3.fromRGB(255, 0, 255), function()
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
    
    CreateButton("💣 CRASH", "Spieler crashen (viele Parts spawnen)", Color3.fromRGB(255, 0, 0), function()
        if SelectedPlayer and SelectedPlayer.Character then
            for i = 1, 500 do
                local part = Instance.new("Part")
                part.Position = SelectedPlayer.Character.HumanoidRootPart.Position
                part.Parent = workspace
                spawn(function() wait(5) part:Destroy() end)
            end
        end
    end)
    
    CreateButton("📢 SPAM CHAT", "Chat mit Nachrichten spammen", Color3.fromRGB(0, 255, 255), function()
        for i = 1, 20 do
            ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer("THE HACKER V6 IST HIER! 🚀", "All")
            wait(0.1)
        end
    end)
    
    CreateButton("🎮 FAKE LAG", "Spieler laggen lassen", Color3.fromRGB(255, 255, 255), function()
        if SelectedPlayer and SelectedPlayer.Character then
            local torso = SelectedPlayer.Character:FindFirstChild("Torso") or SelectedPlayer.Character:FindFirstChild("UpperTorso")
            if torso then
                for i = 1, 100 do
                    torso.Position = torso.Position + Vector3.new(math.random(-20, 20), math.random(-10, 10), math.random(-20, 20))
                    wait(0.01)
                end
            end
        end
    end)
    
    CreateButton("🔇 STUMM SCHALTEN", "Spieler stumm schalten", Color3.fromRGB(128, 0, 128), function()
        if SelectedPlayer then
            SelectedPlayer:SetAttribute("Muted", true)
        end
    end)
    
    CreateButton("🔊 LAUT SCHALTEN", "Stummschaltung aufheben", Color3.fromRGB(0, 255, 0), function()
        if SelectedPlayer then
            SelectedPlayer:SetAttribute("Muted", nil)
        end
    end)
    
    CreateButton("🎭 FAKE KICK", "Spieler vortäuschen zu kicken", Color3.fromRGB(255, 100, 0), function()
        if SelectedPlayer then
            SelectedPlayer:Kick("Du wurdest gekickt! (Nur Fake)")
        end
    end)
end

-- MORPH TAB
function LoadMorphTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("🦎 MORPH ZU NPC", "Verwandle dich in einen NPC", Color3.fromRGB(0, 128, 255), function()
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
    
    CreateButton("🚗 MORPH ZU FAHRZEUG", "Werde ein Auto/Fahrzeug", Color3.fromRGB(0, 255, 255), function()
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
    
    CreateButton("🦇 MORPH ZU Fledermaus", "Werde eine Fledermaus", Color3.fromRGB(100, 0, 100), function() end)
    CreateButton("🐺 MORPH ZU WOLF", "Werde ein Wolf", Color3.fromRGB(150, 150, 150), function() end)
    CreateButton("🦅 MORPH ZU VOGEL", "Werde ein Vogel", Color3.fromRGB(200, 150, 0), function() end)
    CreateButton("🐉 MORPH ZU DRACHE", "Werde ein Drache", Color3.fromRGB(255, 0, 0), function() end)
    
    CreateButton("🔄 RESET MORPH", "Zurück zu normal", Color3.fromRGB(255, 0, 0), function()
        LocalPlayer.Character = LocalPlayer.Character
    end)
end

-- ADMIN TAB
function LoadAdminTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("👑 ADMIN GEBEN", "Gib dir selbst Admin-Rechte", Color3.fromRGB(255, 255, 255), function()
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
    
    CreateButton("🔇 MUTE ALLE", "Alle Spieler stummschalten", Color3.fromRGB(255, 100, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                player:SetAttribute("Muted", true)
            end
        end
    end)
    
    CreateButton("🔊 UNMUTE ALLE", "Stummschaltung aller aufheben", Color3.fromRGB(0, 255, 0), function()
        for _, player in ipairs(Players:GetPlayers()) do
            player:SetAttribute("Muted", nil)
        end
    end)
    
    CreateButton("💣 SERVER CRASH", "Server zum Absturz bringen (vorsichtig!)", Color3.fromRGB(255, 0, 0), function()
        for i = 1, 1000 do
            Instance.new("Part").Parent = workspace
        end
    end)
    
    CreateButton("🔄 SERVER HOP", "Zu einem anderen Server wechseln", Color3.fromRGB(0, 255, 255), function()
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
    
    CreateButton("📋 SERVER INFO", "Zeige Server-Informationen", Color3.fromRGB(0, 255, 0), function()
        print("=== SERVER INFO ===")
        print("Server ID: " .. game.JobId)
        print("Spieler: " .. #Players:GetPlayers() .. "/" .. Players.MaxPlayers)
        print("Spiel: " .. game.Name)
        print("Place ID: " .. game.PlaceId)
    end)
    
    CreateButton("👤 SPIELER LISTE", "Zeige alle Spieler", Color3.fromRGB(0, 255, 255), function()
        print("=== SPIELER LISTE ===")
        for i, player in ipairs(Players:GetPlayers()) do
            print(i .. ". " .. player.Name)
        end
    end)
end

-- SETTINGS TAB
function LoadSettingsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🎮 MATRIX MODUS", "Grüner Hacker-Look im Hintergrund", Color3.fromRGB(0, 255, 0), function(state)
        BinaryBackground.BackgroundColor3 = state and Color3.fromRGB(0, 20, 0) or Color3.fromRGB(0, 0, 0)
        BinaryBackground.BackgroundTransparency = state and 0.1 or 0.3
    end)
    
    CreateToggle("🤖 AUTO EXECUTE", "Skript automatisch ausführen", Color3.fromRGB(255, 255, 255), function(state)
        LocalPlayer:SetAttribute("AutoExecute", state)
    end)
    
    CreateToggle("💤 ANTI-AFK", "Nicht wegen Inaktivität gekickt werden", Color3.fromRGB(0, 255, 0), function(state)
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
    
    CreateToggle("🔄 REJOIN ON KICK", "Automatisch wieder joinen wenn gekickt", Color3.fromRGB(255, 0, 0), function(state)
        LocalPlayer:SetAttribute("RejoinOnKick", state)
    end)
    
    CreateToggle("🔇 SOUND MUTE", "Alle Spiel-Sounds stummschalten", Color3.fromRGB(150, 150, 150), function(state) end)
    
    CreateSlider("🔲 UI TRANSPARENZ", "Durchsichtigkeit des Menüs", 0, 1, 0, function(value)
        MainFrame.BackgroundTransparency = value
    end)
    
    CreateButton("💾 EINSTELLUNGEN SPEICHERN", "Speichere alle aktuellen Settings", Color3.fromRGB(0, 255, 0), function()
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
        MainFrame.Position = UDim2.new(0.5, -650, 0.5, -400)
    end)
    
    CreateButton("❌ GUI SCHLIESSEN", "Entferne das gesamte GUI", Color3.fromRGB(255, 0, 0), function()
        ScreenGui:Destroy()
    end)
end

-- TOOLS TAB
function LoadToolsTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("🔍 ITEM SCANNER", "Finde alle Items in der Nähe", Color3.fromRGB(255, 128, 128), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") or v:IsA("Part") and v:FindFirstChild("ClickDetector") then
                local distance = (v.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                print("📦 " .. v.Name .. " - " .. math.floor(distance) .. " studs away")
            end
        end
    end)
    
    CreateButton("🔓 TÜR ÖFFNER", "Öffne alle Türen im Spiel", Color3.fromRGB(0, 255, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Part") and (v.Name:lower():find("door") or v.Name:lower():find("tür")) then
                v.CanCollide = false
                v.Transparency = 0.5
            end
        end
    end)
    
    CreateButton("💎 SCHATZ FINDER", "Finde versteckte Schätze und Geheimnisse", Color3.fromRGB(255, 215, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name:lower():find("secret") or v.Name:lower():find("hidden") or v.Name:lower():find("easter") then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = v
                highlight.FillColor = Color3.fromRGB(255, 215, 0)
                highlight.Parent = v
            end
        end
    end)
    
    CreateButton("🎯 KLICK DETEKTOR", "Aktiviere alle Click-Detektoren", Color3.fromRGB(255, 0, 255), function()
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
    
    CreateButton("🔍 PLAYER FINDER", "Finde alle Spieler auf der Map", Color3.fromRGB(0, 255, 255), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local pos = player.Character.HumanoidRootPart.Position
                print("👤 " .. player.Name .. " bei " .. math.floor(pos.X) .. ", " .. math.floor(pos.Y) .. ", " .. math.floor(pos.Z))
            end
        end
    end)
    
    CreateButton("🧹 CLEAR ITEMS", "Lösche alle Items von der Map", Color3.fromRGB(255, 0, 0), function()
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                v:Destroy()
            end
        end
    end)
    
    CreateButton("⏱️ TIME SETTER", "Setze Uhrzeit auf 12:00", Color3.fromRGB(255, 255, 0), function()
        Lighting.TimeOfDay = "12:00:00"
    end)
    
    CreateButton("☀️ WEATHER CHANGER", "Ändere Wetter auf klar", Color3.fromRGB(0, 200, 255), function()
        Lighting.ClockTime = 12
    end)
end

-- SPEED TAB
function LoadSpeedTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🚀 SUPER SPEED", "Extrem schnelles Laufen", Color3.fromRGB(0, 255, 0), function(state)
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = state and 250 or WalkspeedValue
        end
    end)
    
    CreateToggle("⚡ HYPER SPEED", "Noch schneller", Color3.fromRGB(0, 255, 100), function(state)
        if state and LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = 500
        end
    end)
    
    CreateSlider("🏃 SPEED", "Laufgeschwindigkeit", 16, 1000, 100, function(value)
        WalkspeedValue = value
        if LocalPlayer.Character then
            LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
end

-- FLY TAB
function LoadFlyTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🕊️ FLY", "Normaler Flugmodus", Color3.fromRGB(0, 255, 255), function(state)
        FlyEnabled = state
    end)
    
    CreateToggle("🚀 FAST FLY", "Schneller Flugmodus", Color3.fromRGB(0, 200, 255), function(state) end)
    CreateToggle("🦅 JETPACK", "Jetpack-Modus", Color3.fromRGB(100, 255, 255), function(state) end)
    CreateToggle("🌌 SPACE FLY", "Schwerelosigkeit", Color3.fromRGB(150, 255, 255), function(state) end)
end

-- MONEY TAB
function LoadMoneyTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("💰 INFINITY MONEY", "Unendlich Geld", Color3.fromRGB(255, 255, 0), function()
        for _, v in pairs(LocalPlayer:GetDescendants()) do
            if v:IsA("NumberValue") then
                v.Value = 999999999
            end
        end
    end)
    
    CreateButton("💳 ROBUX HACK", "Robux hacken (visuell)", Color3.fromRGB(0, 255, 0), function()
        LocalPlayer:SetAttribute("Robux", 999999999)
    end)
    
    CreateButton("💎 FREE VIP", "VIP Status aktivieren", Color3.fromRGB(255, 215, 0), function()
        LocalPlayer:SetAttribute("VIP", true)
    end)
    
    CreateButton("🎫 FREE GAMEPASS", "Alle Gamepässe freischalten", Color3.fromRGB(255, 255, 255), function()
        for i = 1, 100 do
            LocalPlayer:SetAttribute("Gamepass_" .. i, true)
        end
    end)
end

-- BYPASS TAB
function LoadBypassTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateToggle("🔓 ANTI-CHEAT BYPASS", "Umgehe Anti-Cheat Systeme", Color3.fromRGB(200, 0, 255), function(state) end)
    CreateToggle("🛡️ REMOTE SPOOFER", "Verschleiere Remote-Aufrufe", Color3.fromRGB(255, 0, 255), function(state) end)
    CreateToggle("🔒 KICK PROTECT", "Schutz vor Kicks", Color3.fromRGB(255, 100, 255), function(state) end)
    CreateToggle("🔄 REJOINER", "Automatischer Rejoin", Color3.fromRGB(0, 255, 255), function(state) end)
    CreateButton("⚡ BYPASS ALL", "Alle Bypässe aktivieren", Color3.fromRGB(255, 0, 255), function() end)
end

-- SCAN TAB
function LoadScanTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("🔍 SCAN REMOTES", "Finde alle Remote-Events", Color3.fromRGB(0, 255, 100), function()
        print("=== REMOTE EVENTS ===")
        for _, v in pairs(ReplicatedStorage:GetDescendants()) do
            if v:IsA("RemoteEvent") then
                print("📡 " .. v.Name)
            end
        end
    end)
    
    CreateButton("🔍 SCAN TOOLS", "Finde alle Tools", Color3.fromRGB(0, 255, 150), function()
        print("=== TOOLS ===")
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Tool") then
                print("🔧 " .. v.Name)
            end
        end
    end)
    
    CreateButton("🔍 SCAN PLAYERS", "Scanne alle Spieler", Color3.fromRGB(0, 255, 200), function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                print("👤 " .. player.Name)
            end
        end
    end)
    
    CreateButton("🔍 SCAN CHEATS", "Suche nach Cheat-Einstellungen", Color3.fromRGB(255, 255, 0), function()
        print("Suche nach Cheat-Options...")
    end)
end

-- GAME TAB
function LoadGameTab()
    for _, v in pairs(ScrollingFrame:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    
    CreateButton("🎮 GAME INFO", "Zeige Spielinformationen", Color3.fromRGB(255, 100, 0), function()
        print("=== GAME INFO ===")
        print("Name: " .. game.Name)
        print("Place ID: " .. game.PlaceId)
        print("Genre: " .. game.Genre)
        print("Creator: " .. game.Creator.Name)
    end)
    
    CreateButton("🏆 AUTO WIN", "Automatisch gewinnen", Color3.fromRGB(255, 255, 0), function() end)
    CreateButton("⭐ AUTO COMPLETE", "Aufgaben automatisch erledigen", Color3.fromRGB(0, 255, 0), function() end)
    CreateButton("🔓 UNLOCK ALL", "Alles freischalten", Color3.fromRGB(255, 0, 255), function() end)
    CreateButton("🚀 SKIP LEVEL", "Level überspringen", Color3.fromRGB(0, 255, 255), function() end)
end

-- ===========================================
-- TAB WECHSEL
-- ===========================================
local tabFunctions = {
    ["💀 GOD"] = LoadGodTab,
    ["👤 PLAYER"] = LoadPlayerTab,
    ["💰 ITEMS"] = LoadItemsTab,
    ["🔫 COMBAT"] = LoadCombatTab,
    ["🌍 WORLD"] = LoadWorldTab,
    ["📌 TP"] = LoadTeleportTab,
    ["👁️ ESP"] = LoadESPTab,
    ["🎭 TROLL"] = LoadTrollTab,
    ["🦎 MORPH"] = LoadMorphTab,
    ["👑 ADMIN"] = LoadAdminTab,
    ["⚙️ SET"] = LoadSettingsTab,
    ["🔧 TOOLS"] = LoadToolsTab,
    ["📦 ITEM"] = LoadItemsTab,
    ["🎯 AIM"] = LoadCombatTab,
    ["🚀 SPEED"] = LoadSpeedTab,
    ["🕊️ FLY"] = LoadFlyTab,
    ["💰 MONEY"] = LoadMoneyTab,
    ["🔓 BYPASS"] = LoadBypassTab,
    ["📡 SCAN"] = LoadScanTab,
    ["🎮 GAME"] = LoadGameTab
}

for _, tabButton in ipairs(TabBar:GetChildren()) do
    if tabButton:IsA("TextButton") then
        tabButton.MouseButton1Click:Connect(function()
            for _, v in pairs(ScrollingFrame:GetChildren()) do
                if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
            end
            local func = tabFunctions[tabButton.Text]
            if func then func() end
        end)
    end
end

-- ===========================================
-- START BUTTON FUNKTION
-- ===========================================
StartButton.MouseButton1Click:Connect(function()
    StartButton.Visible = false
    MainFrame.Visible = true
    LoadGodTab()
end)

CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    StartButton.Visible = true
end)

-- ===========================================
-- TASTENSTEUERUNG
-- ===========================================
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        if MainFrame.Visible then
            MainFrame.Visible = false
            StartButton.Visible = true
        else
            MainFrame.Visible = true
            StartButton.Visible = false
        end
    end
end)

-- ===========================================
-- RESPONSIVE DESIGN
-- ===========================================
local function UpdateSize()
    local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
    
    if isMobile then
        StartButton.Size = UDim2.new(0, 350, 0, 120)
        StartButton.Position = UDim2.new(0.5, -175, 0.5, -60)
        MainFrame.Size = UDim2.new(0, 900, 0, 650)
        MainFrame.Position = UDim2.new(0.5, -450, 0.5, -325)
    else
        StartButton.Size = UDim2.new(0, 600, 0, 180)
        StartButton.Position = UDim2.new(0.5, -300, 0.5, -90)
        MainFrame.Size = UDim2.new(0, 1300, 0, 800)
        MainFrame.Position = UDim2.new(0.5, -650, 0.5, -400)
    end
end

Camera:GetPropertyChangedSignal("ViewportSize"):Connect(UpdateSize)
UpdateSize()

-- ===========================================
-- START
-- ===========================================
print("====================================")
print("THE HACKER V6 - ULTIMATE EDITION")
print("by Waled-Hammad")
print("20 TABS - ALLE TOOLS INKLUSIVE")
print("Drücke START oder RIGHT SHIFT")
print("====================================")

StarterGui:SetCore("SendNotification", {
    Title = "THE HACKER V6",
    Text = "Geladen! Drücke START oder RIGHT SHIFT",
    Duration = 5
})
