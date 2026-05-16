local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if game.CoreGui:FindFirstChild("CopyAvatarGUI") then
    game.CoreGui.CopyAvatarGUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CopyAvatarGUI"
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,250,0,300)
Main.Position = UDim2.new(0.5,-125,0.5,-150)
Main.BackgroundColor3 = Color3.fromRGB(20,20,20)
Main.Active = true
Main.Draggable = true

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,35)
Title.BackgroundTransparency = 1
Title.Text = "COPY AVATAR"
Title.TextScaled = true
Title.TextColor3 = Color3.new(1,1,1)
Title.Font = Enum.Font.GothamBold
