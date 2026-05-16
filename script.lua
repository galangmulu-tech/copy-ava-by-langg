local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

pcall(function()
    game.CoreGui.CopyAvatarGUI:Destroy()
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "CopyAvatarGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,250,0,300)
frame.Position = UDim2.new(0.5,-125,0.5,-150)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.BackgroundTransparency = 1
title.Text = "COPY AVATAR"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local scrolling = Instance.new("ScrollingFrame", frame)
scrolling.Position = UDim2.new(0,5,0,40)
scrolling.Size = UDim2.new(1,-10,1,-45)
scrolling.CanvasSize = UDim2.new(0,0,0,0)
scrolling.BackgroundTransparency = 1
scrolling.ScrollBarThickness = 4

local layout = Instance.new("UIListLayout", scrolling)
layout.Padding = UDim.new(0,5)

local function Copy(plr)
    local success, desc = pcall(function()
        return Players:GetHumanoidDescriptionFromUserId(plr.UserId)
    end)

    if success and desc then
        LocalPlayer:LoadCharacter()

        task.wait(1)

        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")

        if hum then
            hum:ApplyDescriptionReset(desc)
        end
    end
end

local function AddPlayer(plr)
    if plr == LocalPlayer then return end

    local btn = Instance.new("TextButton", scrolling)
    btn.Size = UDim2.new(1,-5,0,40)
    btn.BackgroundColor3 = Color3.fromRGB(35,35,35)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextScaled = true
    btn.Font = Enum.Font.Gotham
    btn.Text = plr.Name

    btn.MouseButton1Click:Connect(function()
        Copy(plr)
    end)

    scrolling.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 10)
end

for _,plr in ipairs(Players:GetPlayers()) do
    AddPlayer(plr)
end

Players.PlayerAdded:Connect(AddPlayer)
