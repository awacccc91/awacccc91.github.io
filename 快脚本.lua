-- FastScript | Full Cheat Features | No Ads No Sponsor
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Workspace = game:GetService("Workspace")
local TextChatService = game:GetService("TextChatService")
local Player = Players.LocalPlayer
local Character, Humanoid, HumanoidRootPart

-- Auto refresh character
local function RefreshCharacter()
    Character = Player.Character or Player.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
end
RefreshCharacter()
Player.CharacterAdded:Connect(RefreshCharacter)

-- Feature Settings
local Settings = {
    Fly = false,
    Noclip = true,
    InfiniteJump = true,
    WalkSpeed = 150,
    JumpPower = 150,
    FlySpeed = 120,
    NoFallDamage = true,
    ESP = false,
    GodMode = false
}

-- Basic Stats Modify
Humanoid.WalkSpeed = Settings.WalkSpeed
Humanoid.JumpPower = Settings.JumpPower

-- Infinite Jump
UserInputService.JumpRequest:Connect(function()
    if Settings.InfiniteJump then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- No Fall Damage
Humanoid.FallingDown:Connect(function()
    if Settings.NoFallDamage then
        Humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
    end
end)

-- Noclip (Phase Through Walls)
RunService.Stepped:Connect(function()
    if Settings.Noclip and Character then
        for _,v in pairs(Character:GetDescendants()) do
            if v:IsA("Part") or v:IsA("MeshPart") then
                v.CanCollide = false
            end
        end
    end
end)

-- God Mode (No Damage)
RunService.Heartbeat:Connect(function()
    if Settings.GodMode and Humanoid then
        Humanoid.Health = Humanoid.MaxHealth
    end
end)

-- Fast Fly (WASD Move, Space Up, LeftShift Down)
RunService.RenderStepped:Connect(function()
    if Settings.Fly and HumanoidRootPart then
        local Camera = Workspace.CurrentCamera
        local MoveDir = Vector3.new()
        
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then MoveDir += Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then MoveDir -= Camera.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then MoveDir -= Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then MoveDir += Camera.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then MoveDir += Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then MoveDir -= Vector3.new(0,1,0) end
        
        MoveDir = MoveDir.Unit * Settings.FlySpeed
        HumanoidRootPart.Velocity = MoveDir
    end
end)

-- Player ESP
local function CreateESP(TargetPlayer)
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "FastScript_ESP"
    BillboardGui.AlwaysOnTop = true
    BillboardGui.Size = UDim2.new(0,100,0,50)
    BillboardGui.StudsOffset = Vector3.new(0,2,0)

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Text = TargetPlayer.Name
    NameLabel.TextColor3 = Color3.new(1,0,0)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Size = UDim2.new(1,0,1,0)
    NameLabel.TextScaled = true
    NameLabel.Parent = BillboardGui

    TargetPlayer.CharacterAdded:Connect(功能(Char)
BillboardGui。Parent = Char:WaitForChild(“头”)
    结束)

    如果目标玩家。性格；角色；字母然后
BillboardGui。Parent = TargetPlayer。人物:FindFirstChild(“头”)
    结束
结束

为_，Plr在pairs(玩家:GetPlayers())做
    如果Plr ~=播放器然后创建ESP(Plr)结束
结束
玩家。PlayerAdded:Connect(CreateESP)

-聊天命令控件
TextChatService。ChatInputBar . input changed:Connect(功能(消息)
    如果消息=="/1" 然后
设置。飞翔=不设置。飞
    埃尔塞夫消息=="/2" 然后
设置。Noclip =不设置。诺克莱普
    埃尔塞夫消息=="/3" 然后
设置。GodMode =不设置。上帝模式
    埃尔塞夫消息=="/4" 然后
设置。ESP =不设置。西班牙
        为_，Plr在pairs(玩家:GetPlayers())做
            如果Plr ~=播放器和Plr。性格；角色；字母然后
                当地的Head = Plr。人物:FindFirstChild(“头”)
                如果头然后
                    当地的ESPUI = Head:FindFirstChild("快速脚本_ESP ")
                    如果埃斯皮伊然后埃斯普伊。启用=设置。西班牙结束
                结束
            结束
        结束
    结束
结束)

