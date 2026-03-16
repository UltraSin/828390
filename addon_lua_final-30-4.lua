local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
local messageContainer = Instance.new("Frame")
messageContainer.Size = UDim2.new(0, 300, 0, 400)
messageContainer.Position = UDim2.new(0.5, 0, 0.18, 0)
messageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
messageContainer.BackgroundTransparency = 1
messageContainer.Parent = screenGui
local messageOffset = -37.5
local function showMessage(text, delay)
coroutine.wrap(function()
task.wait(delay)
local blackBox = Instance.new("Frame", messageContainer)
blackBox.BackgroundColor3 = Color3.new(0, 0, 0)
blackBox.BackgroundTransparency = 1
blackBox.AnchorPoint = Vector2.new(0.5, 0)
blackBox.Position = UDim2.new(0.5, 0, 0.5, 0)
Instance.new("UICorner", blackBox).CornerRadius = UDim.new(0, 10)
local textLabel = Instance.new("TextLabel", blackBox)
textLabel.Text = text
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextSize = 20
textLabel.Font = Enum.Font.Arcade
textLabel.BackgroundTransparency = 1
textLabel.TextTransparency = 1
local padding = 10
textLabel.Size = UDim2.new(1, -padding, 1, -padding)
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
blackBox.Size = UDim2.new(0, textLabel.TextBounds.X + padding, 0, textLabel.TextBounds.Y + padding)
for _, msg in ipairs(messageContainer:GetChildren()) do
if msg:IsA("Frame") and msg ~= blackBox then
msg.Position = msg.Position + UDim2.new(0, 0, 0, messageOffset)
end
end
local tweenService = game:GetService("TweenService")
tweenService:Create(blackBox, TweenInfo.new(0.4), {BackgroundTransparency = 0.6}):Play()
tweenService:Create(textLabel, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
task.wait(3 + #textLabel.Text * 0.1)
tweenService:Create(blackBox, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
tweenService:Create(textLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1)
textLabel:Destroy()
blackBox:Destroy()
end)()
end

local function Configuring()

local hpbar
local function CreateHPBar()
local GuiA = Instance.new("ScreenGui")
GuiA.Parent = game.CoreGui
GuiA.Name = "AhatGui"
local function GuiProp(UICorner, Outline, Index)
return function(gui)
local layer = Index or 1
gui.ZIndex = layer
if Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(255,255,255)
OLL.BackgroundTransparency = 0
OLL.BorderSizePixel = 0
OLL.ZIndex = layer - 1
OLL.Parent = gui
if UICorner then
local OL_Corner = Instance.new("UICorner")
OL_Corner.CornerRadius = UDim.new(0, 6)
OL_Corner.Parent = OLL
end
end
if UICorner then
local GUI_Corner = Instance.new("UICorner")
GUI_Corner.CornerRadius = UDim.new(0, 5)
GUI_Corner.Parent = gui
end
end
end
local function CreateGui(props)
local guiType = props.Type or "Frame"
local gui = Instance.new(guiType)
gui.Name = props.Name or guiType
gui.Size = UDim2.new(0, props.Size[1], 0, props.Size[2])
gui.Position = UDim2.new(0, props.Pos[1], 0, props.Pos[2])
gui.BackgroundColor3 = Color3.fromRGB(unpack(props.BackgroundColor or {255, 255, 255}))
gui.BackgroundTransparency = tonumber(props.BackgroundTransparency) or 0
gui.BorderSizePixel = 0
gui.Parent = props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
gui.Text = props.Text or ""
gui.Font = Enum.Font.Arcade
gui.TextSize = props.TextSize or 15
gui.TextColor3 = Color3.fromRGB(unpack(props.Textcolor or {255, 255, 255}))
if gui:IsA("TextBox") then
gui.ClearTextOnFocus = false
end
gui.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center
if props.OutlineText then
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(unpack(props.OutlineTextColor or {0,0,0}))
stroke.Thickness = 1
stroke.Parent = gui
end
end
if props.Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OLL.BorderSizePixel = 0
OLL.ZIndex = 0
OLL.Parent = gui
end
if props.UICorner then
local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 10)
round.Parent = gui
end
return gui
end
local TweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local hpbar
local GuiA = Instance.new("ScreenGui")
GuiA.Parent = game.CoreGui
GuiA.Name = "AhatGui"
local barContainer = Instance.new("Frame")
barContainer.Size = UDim2.new(1, 0, 0.25, 0)
barContainer.BackgroundTransparency = 1
barContainer.BorderSizePixel = 0
barContainer.Parent = GuiA
local bgBar = Instance.new("Frame")
bgBar.Size = UDim2.new(0.64, 0, 0, 38)
bgBar.Position = UDim2.new(0.18, 0, 0.05, -4)
bgBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
bgBar.BackgroundTransparency = 0.4
bgBar.BorderSizePixel = 0
bgBar.Parent = barContainer
local backBar = Instance.new("Frame")
backBar.Size = UDim2.new(0.6, 0, 0, 30)
backBar.Position = UDim2.new(0.2, 0, 0.05, 0)
backBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backBar.BorderSizePixel = 2
backBar.Parent = barContainer
local chipBar = Instance.new("Frame")
chipBar.Size = UDim2.new(0, 0, 1, 0)
chipBar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
chipBar.BorderSizePixel = 0
chipBar.ZIndex = 0
chipBar.Parent = backBar
local healthBar = Instance.new("Frame")
healthBar.Size = UDim2.new(0, 0, 1, 0)
healthBar.BackgroundColor3 = _immortalMode and Color3.fromRGB(140, 0, 255) or Color3.fromRGB(255, 0, 0)
healthBar.BorderSizePixel = 0
healthBar.ZIndex = 1
healthBar.Parent = backBar
local gradient = Instance.new("UIGradient")
gradient.Color = _immortalMode and ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(160, 0, 255)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 200))
} or ColorSequence.new{
ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
}
gradient.Rotation = 90
gradient.Parent = healthBar
local bossName = Instance.new("TextLabel")
bossName.Size = UDim2.new(0.6, 0, 0, 30)
bossName.Position = UDim2.new(0.2, 0, 0.05, 0)
bossName.BackgroundTransparency = 1
bossName.Text = "MINOS PRIME"
bossName.Font = Enum.Font.Arcade
bossName.TextSize = 20
bossName.TextColor3 = Color3.fromRGB(255, 255, 255)
bossName.TextStrokeTransparency = 1
bossName.Parent = barContainer
GuiProp(true, false, 1)(bgBar)
GuiProp(true, false, 1)(backBar)
GuiProp(true, false, 1)(chipBar)
GuiProp(true, false, 1)(healthBar)
local introDone = false
local chipTween
local chipTimer = 0
local chipWait = 0.5
local maxHealth = 100
local currentHealth = maxHealth
local destroyed = false
local heartbeatConnection
local humanoidHealthConnection
local humanoidDiedConnection
local function Destroy()
if destroyed then return end
destroyed = true
if heartbeatConnection then
heartbeatConnection:Disconnect()
heartbeatConnection = nil
end
if humanoidHealthConnection then
humanoidHealthConnection:Disconnect()
humanoidHealthConnection = nil
end
if humanoidDiedConnection then
humanoidDiedConnection:Disconnect()
humanoidDiedConnection = nil
end
if GuiA and GuiA.Parent then
GuiA:Destroy()
end
end
local function ShakeBar(intensity)
if destroyed then return end
local originalPos = barContainer.Position
for i = 1, 6 do
local offset = Vector2.new(
math.random(-intensity, intensity),
math.random(-intensity, intensity)
)
barContainer.Position = originalPos + UDim2.new(0, offset.X, 0, offset.Y)
task.wait(0.015)
end
barContainer.Position = originalPos
end
local function SetBossHealth(current, max)
if not introDone or destroyed then return end
maxHealth = max or maxHealth
currentHealth = math.clamp(current, 0, maxHealth)
local ratio = currentHealth / maxHealth
local redSize = healthBar.Size.X.Scale
TweenService:Create(healthBar, TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(ratio, 0, 1, 0)
}):Play()
if currentHealth <= 0 then
if Death then
Death()
end
Destroy()
return
end
if ratio < redSize then
chipBar.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
if chipTween then chipTween:Cancel() chipTween = nil end
if chipBar.Size.X.Scale < redSize then
chipBar.Size = UDim2.new(redSize, 0, 1, 0)
end
chipTimer = chipWait
ShakeBar(math.clamp(math.floor((redSize - ratio) * 20), 2, 20))
elseif ratio > redSize then
chipBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
if chipTween then chipTween:Cancel() chipTween = nil end
chipBar.Size = UDim2.new(ratio, 0, 1, 0)
chipTimer = 0
end
end
heartbeatConnection = runService.Heartbeat:Connect(function(dt)
if destroyed or not introDone then return end
if chipTimer > 0 then
chipTimer = chipTimer - dt
if chipTimer <= 0 and chipBar.BackgroundColor3 == Color3.fromRGB(255, 255, 0) then
chipTween = TweenService:Create(chipBar, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
Size = UDim2.new(healthBar.Size.X.Scale, 0, 1, 0)
})
chipTween:Play()
end
end
end)
local function BindToHumanoid(hum)
if humanoidHealthConnection then
humanoidHealthConnection:Disconnect()
humanoidHealthConnection = nil
end
if humanoidDiedConnection then
humanoidDiedConnection:Disconnect()
humanoidDiedConnection = nil
end
humanoidHealthConnection = hum.HealthChanged:Connect(function(newHealth)
if destroyed then return end
if newHealth <= 0 then
Destroy()
end
end)
humanoidDiedConnection = hum.Died:Connect(function()
Destroy()
end)
end
local function OnCharacterAdded(char)
local hum = char:WaitForChild("Humanoid", 5)
if hum then
BindToHumanoid(hum)
end
end
if player.Character then
OnCharacterAdded(player.Character)
end
player.CharacterAdded:Connect(OnCharacterAdded)
local function PlayIntro()
healthBar.Size = UDim2.new(0, 0, 1, 0)
chipBar.Size = UDim2.new(0, 0, 1, 0)
local tween1 = TweenService:Create(healthBar, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
local tween2 = TweenService:Create(chipBar, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
tween1:Play()
tween2:Play()
tween1.Completed:Connect(function()
introDone = true
SetBossHealth(currentHealth, maxHealth)
end)
end
PlayIntro()
local function SetHealth(newHealth)
if destroyed then return end
currentHealth = math.clamp(newHealth, 0, maxHealth)
SetBossHealth(currentHealth, maxHealth)
end
local function ChangeHealth(delta)
if destroyed then return end
SetHealth(currentHealth + delta)
end
local function SetMaxHealth(newMax)
if destroyed then return end
maxHealth = math.max(newMax, 1)
currentHealth = math.clamp(currentHealth, 0, maxHealth)
SetBossHealth(currentHealth, maxHealth)
end
return {
SetHealth = SetHealth,
ChangeHealth = ChangeHealth,
SetMaxHealth = SetMaxHealth,
Gui = GuiA,
Destroy = Destroy
}
end

local function DestroyItMan()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
humanoid.Died:Connect(function()
if DestroyGuiA then
DestroyGuiA()
end
end)
end

local L = game.Players.LocalPlayer
local C = L.Character or L.CharacterAdded:Wait()
local humanoidRootPart = C:WaitForChild("HumanoidRootPart", 5)
local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = humanoidRootPart
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end
local function PreloadDaM()
local ContentProvider = game:GetService("ContentProvider")
writefile("MinosPrimeTheme.mp3", game:HttpGet("https://raw.githubusercontent.com/KietVN02202/Music/main/MinosPrimeTheme.mp3"))
writefile("MinosPrime.mp3", game:HttpGet("https://raw.githubusercontent.com/KietVN02202/Music/main/MinosPrime.mp3"))
local assetsToPreload = {
getcustomasset("MinosPrimeTheme.mp3"),
getcustomasset("MinosPrime.mp3")
}
local function PreloadMusic()
ContentProvider:PreloadAsync(assetsToPreload)
end
PreloadMusic()
end
local function PlaySE(N, times)
for _ = 1, times do
coroutine.wrap(function()
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote", 5):InvokeServer(N,game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso")) end)
end)()
end
end
local function TextBHide()
local bc = game:GetService("CoreGui").ExperienceChat.bubbleChat
for _,v in pairs(bc:GetChildren()) do
v.Enabled = false end bc.ChildAdded:Connect(function(c)
c.Enabled = false end)
end
local function PushBack()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)
local pushPower = 120
local upwardPower = 17.5
local nearestPlayer
local nearestDistance = math.huge
for _, otherPlayer in ipairs(Players:GetPlayers()) do
if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
local otherHRP = otherPlayer.Character.HumanoidRootPart
local dist = (otherHRP.Position - hrp.Position).Magnitude
if dist < nearestDistance then
nearestDistance = dist
nearestPlayer = otherHRP
end
end
end
if nearestPlayer then
local awayDir = (hrp.Position - nearestPlayer.Position).Unit
local direction = (awayDir * pushPower) + (Vector3.new(0, 3, 0) * upwardPower)
hrp.AssemblyLinearVelocity = direction
end
end
local sound
local humanoidConnection1, humanoidConnection2
function ActMinosPrimeM(status)
local player = game.Players.LocalPlayer
if status == true then
local char = player.Character or player.CharacterAdded:Wait()
local humanoid = char:WaitForChild("Humanoid", 5)
if not sound or sound.Parent == nil then
sound = Instance.new("Sound")
sound.SoundId = getcustomasset("MinosPrimeTheme.mp3")
sound.Volume = 0.75
sound.Looped = true
sound.Parent = workspace
end
sound:Play()
local triggered = false
local function stopSound()
if not triggered then
triggered = true
if sound then
sound:Stop()
end
end
end
if humanoidConnection1 then humanoidConnection1:Disconnect() end
if humanoidConnection2 then humanoidConnection2:Disconnect() end
humanoidConnection1 = humanoid.HealthChanged:Connect(function(health)
if health == 1 then
stopSound()
end
end)
humanoidConnection2 = humanoid.Died:Connect(function()
stopSound()
end)
elseif status == false then
if sound then
sound:Stop()
sound:Destroy()
sound = nil
end
if humanoidConnection1 then
humanoidConnection1:Disconnect()
humanoidConnection1 = nil
end
if humanoidConnection2 then
humanoidConnection2:Disconnect()
humanoidConnection2 = nil
end
end
end

local player = game.Players.LocalPlayer
local isAlive = true
local isInvulnerable = false
local immunityCooldown = 1.5
local lastDamageTime = 0
local damageAmount = 17.5
local requiredAnimId = "rbxassetid://13526154547"
local hitboxActive = false
local connections = {}
local function Immunity(status)
isInvulnerable = status
end
local function StartHitbox()
local function isAnimationPlaying(character, animationId)
local humanoid = character:FindFirstChildOfClass("Humanoid")
if not humanoid then return false end
local animator = humanoid:FindFirstChildOfClass("Animator")
if not animator then return false end
for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
if track.Animation.AnimationId == animationId then
return true
end
end
return false
end
local function attachBoxToTool(tool)
if tool:FindFirstChild("Handle") and not tool:FindFirstChild("HitboxQ") then
local box = Instance.new("Part")
box.Name = "HitboxQ"
box.Size = Vector3.new(3, 4.5, 2.25)
box.Anchored = false
box.Transparency = 1
box.CanCollide = false
box.BrickColor = BrickColor.Red()
box.Material = Enum.Material.Brick
box.Parent = tool
local weld = Instance.new("Weld")
weld.Part0 = tool.Handle
weld.Part1 = box
weld.C0 = CFrame.new(0, 2, 0)
weld.Parent = box
local conn
conn = box.Touched:Connect(function(hit)
if not hitboxActive then return end
local myChar = player.Character
if not myChar or hit.Parent ~= myChar then return end
local currentTime = tick()
if currentTime - lastDamageTime < immunityCooldown then return end
local holder = tool.Parent
if holder:IsA("Model") and game.Players:GetPlayerFromCharacter(holder) then
if not isAnimationPlaying(holder, requiredAnimId) then return end
lastDamageTime = currentTime
if not isInvulnerable then
ActHpChange(-damageAmount)
PlayS(105270091788367,1.5)
pcall(function() game:GetService("ReplicatedStorage").Prop:FireServer() end)
end
end
end)
table.insert(connections, conn)
end
end
local function checkPlayerTools(otherPlayer)
if not isAlive or otherPlayer == player then return end
local backpackTools = otherPlayer.Backpack:GetChildren()
local characterTools = otherPlayer.Character and otherPlayer.Character:GetChildren() or {}
for _, item in pairs(backpackTools) do
if item:IsA("Tool") then
attachBoxToTool(item)
end
end
for _, item in pairs(characterTools) do
if item:IsA("Tool") then
attachBoxToTool(item)
end
end
end
local conn1 = game.Players.PlayerAdded:Connect(function(otherPlayer)
if otherPlayer == player then return end
local connB1 = otherPlayer.Backpack.ChildAdded:Connect(function(item)
if hitboxActive and item:IsA("Tool") then
attachBoxToTool(item)
end
end)
local connB2 = otherPlayer.CharacterAdded:Connect(function(character)
character.ChildAdded:Connect(function(item)
if hitboxActive and item:IsA("Tool") then
attachBoxToTool(item)
end
end)
end)
table.insert(connections, connB1)
table.insert(connections, connB2)
end)
table.insert(connections, conn1)
spawn(function()
while hitboxActive and isAlive do
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
checkPlayerTools(otherPlayer)
end
wait(1)
end
end)
player.Character:WaitForChild("Humanoid", 5).Died:Connect(function()
isAlive = false
hitboxActive = false
for _, conn in pairs(connections) do
if conn and conn.Disconnect then
conn:Disconnect()
end
end
connections = {}
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
if otherPlayer == player then continue end
local backpackTools = otherPlayer.Backpack:GetChildren()
local characterTools = otherPlayer.Character and otherPlayer.Character:GetChildren() or {}
for _, item in pairs(backpackTools) do
local hitbox = item:FindFirstChild("HitboxQ")
if hitbox then hitbox:Destroy() end
end
for _, item in pairs(characterTools) do
local hitbox = item:FindFirstChild("HitboxQ")
if hitbox then hitbox:Destroy() end
end
end
end)
end
function ActHitbox(status)
if status then
hitboxActive = true
if isAlive then
StartHitbox()
end
else
hitboxActive = false
for _, conn in pairs(connections) do
if conn and conn.Disconnect then
conn:Disconnect()
end
end
connections = {}
for _, otherPlayer in pairs(game.Players:GetPlayers()) do
if otherPlayer == player then continue end
local backpackTools = otherPlayer.Backpack:GetChildren()
local characterTools = otherPlayer.Character and otherPlayer.Character:GetChildren() or {}
for _, item in pairs(backpackTools) do
local hitbox = item:FindFirstChild("HitboxQ")
if hitbox then hitbox:Destroy() end
end
for _, item in pairs(characterTools) do
local hitbox = item:FindFirstChild("HitboxQ")
if hitbox then hitbox:Destroy() end
end
end
end
end

local function VFXAudioRemover()
local function DieAudios()
local muteIds = {
["rbxassetid://153230666"] = true,
["rbxassetid://14293202026"] = true,
["rbxassetid://1371567007"] = true,
["rbxassetid://15446218333"] = true,
["rbxassetid://15446218184"] = true,
["rbxassetid://15446217724"] = true,
["rbxassetid://15446217879"] = true,
["rbxassetid://15446218030"] = true,
["rbxassetid://15446418068"] = true,
["rbxassetid://15447532029"] = true,
["rbxassetid://8630860073"] = true,
["rbxassetid://6954159947"] = true,
["rbxassetid://7639377355"] = true,
["rbxassetid://1072005487"] = true,
["rbxassetid://16380234046"] = true,
["rbxassetid://1837921704"] = true,
["rbxassetid://9068549665"] = true,
["rbxassetid://9116274415"] = true,
["rbxassetid://690573922"] = true,
["rbxassetid://159885083"] = true,
["rbxassetid://725011552"] = true,
["rbxassetid://16288027454"] = true,
["rbxassetid://16288027236"] = true,
["rbxassetid://16288027114"] = true,
["rbxassetid://16288026898"] = true,
["rbxassetid://16288026446"] = true,
["rbxassetid://16288026678"] = true,
["rbxassetid://16288157051"] = true,
["rbxassetid://16288156873"] = true,
["rbxassetid://16906379523"] = true,
["rbxassetid://16906379807"] = true,
["rbxassetid://16906380577"] = true,
["rbxassetid://16906381037"] = true,
["rbxassetid://16906381295"] = true,
["rbxassetid://7978653185"] = true,
["rbxassetid://16288022293"] = true,
["rbxassetid://8317474936"] = true,
["rbxassetid://16288021399"] = true,
["rbxassetid://6095747538"] = true,
["rbxassetid://6523472922"] = true,
["rbxassetid://9114890978"] = true,
}
local function muteSound(sound)
if not sound.SoundId then return end
local id = string.lower(sound.SoundId)
for target in pairs(muteIds) do
if string.find(id, target, 1, true) then
sound.Volume = 0
break
end
end
end
for _, obj in ipairs(game:GetDescendants()) do
if obj:IsA("Sound") then
muteSound(obj)
end
end
game.DescendantAdded:Connect(function(obj)
if obj:IsA("Sound") then
muteSound(obj)
end
end)
end
coroutine.wrap(DieAudios)()

local L = game.Players.LocalPlayer
task.spawn(function()
while true do		local c = L.Character
local hrp = c and c:FindFirstChild("HumanoidRootPart")
if hrp then
for _, v in ipairs(hrp:GetChildren()) do
if v.Name == "charged" then
v:Destroy()
end
end
end
for _, v in ipairs(workspace:GetChildren()) do
if v.Name == "Smoke" or v.Name == "fx" or v:IsA("Explosion") then
v:Destroy()
end
end
task.wait(0.01)
end
end)
end

local function Morph()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
local function setTransparency(obj)
if obj:IsA("BasePart") and obj ~= hrp then
obj.Transparency = 0
end
for _, child in ipairs(obj:GetChildren()) do
setTransparency(child)
end
end
setTransparency(character)
if torso then
local radio = torso:FindFirstChild("RadioPart")
if radio and radio:IsA("BasePart") then
radio.Transparency = 1
end
end
if torso then
local part = Instance.new("Part")
part.Size = Vector3.new(0.65,0.65,0.65)
part.Color = Color3.fromRGB(255,0,0)
part.Material = Enum.Material.Neon
part.Anchored = false
part.CanCollide = false
part.CFrame = torso.CFrame * CFrame.Angles(
math.random() * math.pi * 2,
math.random() * math.pi * 2,
math.random() * math.pi * 2
)
part.Parent = character
local weld = Instance.new("WeldConstraint")
weld.Part0 = torso
weld.Part1 = part
weld.Parent = part
local light = Instance.new("PointLight")
light.Color = Color3.fromRGB(0,255,255)
light.Brightness = 2
light.Range = 11.5
light.Parent = part
end
end

local function DeathTimeBoi()
local TextChatService = game:GetService("TextChatService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

local messageContainer = Instance.new("Frame")
messageContainer.Size = UDim2.new(0, 300, 0, 400)
messageContainer.Position = UDim2.new(0.5, 0, 0.18, 0)
messageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
messageContainer.BackgroundTransparency = 1
messageContainer.Parent = screenGui

local messageOffset = -37.5

local function showMessage(text, delay)
    pcall(function() TextChatService.TextChannels.RBXGeneral:SendAsync(text) end)
    coroutine.wrap(function()
        task.wait(delay)

        local blackBox = Instance.new("Frame", messageContainer)
        blackBox.BackgroundColor3 = Color3.new(0, 0, 0)
        blackBox.BackgroundTransparency = 1
        blackBox.AnchorPoint = Vector2.new(0.5, 0)
        blackBox.Position = UDim2.new(0.5, 0, 0.5, 0)
        Instance.new("UICorner", blackBox).CornerRadius = UDim.new(0, 10)

        local textLabel = Instance.new("TextLabel", blackBox)
        textLabel.Text = text
        textLabel.TextColor3 = Color3.new(1, 1, 1)
        textLabel.TextSize = 20
        textLabel.Font = Enum.Font.Arcade
        textLabel.BackgroundTransparency = 1
        textLabel.TextTransparency = 1

        local padding = 10
        textLabel.Size = UDim2.new(1, -padding, 1, -padding)
        textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
        textLabel.AnchorPoint = Vector2.new(0.5, 0.5)

        blackBox.Size = UDim2.new(0, textLabel.TextBounds.X + padding, 0, textLabel.TextBounds.Y + padding)

        for _, msg in ipairs(messageContainer:GetChildren()) do
            if msg:IsA("Frame") and msg ~= blackBox then
                msg.Position = msg.Position + UDim2.new(0, 0, 0, messageOffset)
            end
        end

        local tweenService = game:GetService("TweenService")
        tweenService:Create(blackBox, TweenInfo.new(0.4), {BackgroundTransparency = 0.6}):Play()
        tweenService:Create(textLabel, TweenInfo.new(0.4), {TextTransparency = 0}):Play()

        task.wait(3 + #textLabel.Text * 0.1)

        tweenService:Create(blackBox, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
        tweenService:Create(textLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
        task.wait(1)

        textLabel:Destroy()
blackBox:Destroy()
end)()
end

local function DialogueDie()
end
    
local function DeathEffect()
local createdPyramids = {}
local function BeamDie()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)
local pyramid = Instance.new("MeshPart")
pyramid.MeshId = "rbxassetid://9720331880"
pyramid.Size = Vector3.new(3, 15, 3)
pyramid.Anchored = false
pyramid.CanCollide = false
pyramid.Massless = true
pyramid.Material = Enum.Material.Neon
pyramid.Color = Color3.fromRGB(255, 255, 255)
pyramid.Transparency = 0.9
pyramid.Parent = workspace
table.insert(createdPyramids, pyramid)
local function randomUnitVector()
local theta = math.random() * 2 * math.pi
local phi = math.acos(2 * math.random() - 1)
local x = math.sin(phi) * math.cos(theta)
local y = math.sin(phi) * math.sin(theta)
local z = math.cos(phi)
return Vector3.new(x, y, z)
end
local offset = randomUnitVector() * 58
local spawnPos = hrp.Position + offset
spawnPos = Vector3.new(spawnPos.X, spawnPos.Y + pyramid.Size.Y / 2, spawnPos.Z)
local lookAtCFrame = CFrame.new(spawnPos, hrp.Position) * CFrame.Angles(math.rad(-90), 0, 0)
pyramid.CFrame = lookAtCFrame
local weld = Instance.new("WeldConstraint")
weld.Part0 = hrp
weld.Part1 = pyramid
weld.Parent = pyramid
end

local function DeathBoom()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://108167991407954"
sound.Volume = 1
sound.Looped = false
sound.Parent = hrp
sound:Play()
end
local acceleration = 0.86
local delayTime = 1
for i = 1, 25 do
coroutine.wrap(BeamDie)()
coroutine.wrap(DeathBoom)()
task.wait(delayTime)
delayTime = delayTime * acceleration
if delayTime < 0.01 then delayTime = 0.01 end
end
task.wait(0.5)
for _, pyramid in ipairs(createdPyramids) do
if pyramid and pyramid.Parent then
pyramid:Destroy()
end
end
end

local function ViewDie()
local p = game.Players.LocalPlayer
local char = p.Character or p.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)
local part = Instance.new("Part")
part.Size = Vector3.new(1,1,1)
part.Transparency = 1
part.Anchored = true
part.CanCollide = false
part.Parent = workspace
part.CFrame = hrp.CFrame
local cam = workspace.CurrentCamera
cam.CameraSubject = part
task.wait(5)
part:Destroy()
end

local function ShockwaveDied()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)

local part = Instance.new("Part")
part.Size = Vector3.new(5, 1, 5)
part.Position = hrp.Position + Vector3.new(0, -7, 0)
part.Anchored = true
part.CanCollide = false
part.Color = Color3.fromRGB(255, 255, 255)
part.Material = Enum.Material.SmoothPlastic
part.Transparency = 1
part.Parent = workspace

local decal = Instance.new("Decal")
decal.Texture = "rbxassetid://18642315696"
decal.Parent = part
decal.Face = Enum.NormalId.Top

local function animateSize(part, decal, sizeStart, sizeEnd, fadeStart, fadeEnd, duration, steps)
for i = 1, steps do
local alpha = i / steps
part.Size = sizeStart:Lerp(sizeEnd, alpha)
decal.Transparency = fadeStart + (fadeEnd - fadeStart) * alpha
task.wait(duration / steps)
end
end

animateSize(part, decal, Vector3.new(5, 1, 5), Vector3.new(120, 1, 120), 0, 1, 1, 60)
part:Destroy()
end

local function BamDied()
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)

local meshPart = Instance.new("MeshPart")
meshPart.Size = Vector3.new(0.2, 0.2, 0.2)
meshPart.Position = hrp.Position + Vector3.new(0, -7, 0)
meshPart.Anchored = true
meshPart.CanCollide = false
meshPart.MeshId = "rbxassetid://6247281036"
meshPart.Color = Color3.fromRGB(130, 130, 130)
meshPart.Material = Enum.Material.Neon
meshPart.Parent = workspace

local function animate(part, sizeStart, sizeEnd, duration, steps)
for i = 1, steps do
local alpha = (i / steps)^2
part.Size = sizeStart:Lerp(sizeEnd, alpha)
part.Transparency = alpha
task.wait(duration / steps)
end
part:Destroy()
end

animate(meshPart, Vector3.new(0.2, 0.2, 0.2), Vector3.new(1.5,1.5,1.5), 1, 64)
end

local function DeathAnim()
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
local animationIds = {
Second = "rbxassetid://16898368253"
}
local animations = {}
for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end
animations.Second:Play()
animations.Second:AdjustSpeed(0.5)
animations.Second.TimePosition = 0.7
wait(2)
animations.Second:AdjustSpeed(0.2)
wait(0.5)
animations.Second:AdjustSpeed(0.1)
wait(0.5)
animations.Second:AdjustSpeed(0)
wait(5)
animations.Second:Stop()
end

local function HipHDeathEffect()
local players = game:GetService("Players")
local ts = game:GetService("TweenService")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
humanoid.HipHeight = 2
local tweenInfo = TweenInfo.new(7.25, Enum.EasingStyle.Linear)
local tween = ts:Create(humanoid, tweenInfo, {HipHeight = 50})tween:Play()
end
local function FlashDeath()
local p = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", p:WaitForChild("PlayerGui", 5))
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(1,0,1,0)
frame.BackgroundColor3 = Color3.new(1,1,1)
frame.BackgroundTransparency = 0
frame.BorderSizePixel = 0
task.wait(0.7)
local ts = game:GetService("TweenService")
local tw = ts:Create(frame, TweenInfo.new(0.7), {BackgroundTransparency = 1})
tw:Play()
tw.Completed:Wait()
gui:Destroy()
end

local function DeathFx()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("slapstick", 5)
local duration = 7.5
local interval = 0.1
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer("fullcharged") end)
task.wait(interval)
end
end

local function DeathFx2()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("Prop", 5)
local duration = 7.5
local interval = 0.26
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer() end)
task.wait(interval)
end
end

local function SfxDeath()
local duration = 7
local interval = 0.2
local endTime = tick() + duration
while tick() < endTime do
task.wait(interval)
end
end

local function NightToDayDeath()
game.Lighting.ClockTime = 0
wait(15)
game.Lighting.ClockTime = 12
end

local soundInstance
local function ChoirIguess2()
local player = game.Players.LocalPlayer
soundInstance2 = Instance.new("Sound")
soundInstance2.SoundId = "rbxassetid://9114792002"
soundInstance2.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
soundInstance2.Volume = 1.5
soundInstance2.Looped = true
soundInstance2:Play()
end
local function StopChoir2()
if soundInstance2 then
soundInstance2:Stop()
soundInstance2:Destroy()
end
end

local function Break()
local sound1 = Instance.new("Sound")
sound1.SoundId = "rbxassetid://17405655409"
sound1.Parent = workspace
sound1.Volume = 1
sound1.PlaybackSpeed = 0.2
sound1:Play()
local sound2 = Instance.new("Sound")
sound2.SoundId = "rbxassetid://1843023670"
sound2.Parent = workspace
sound2.Volume = 2
sound2:Play()
local startTime = tick()
local duration = 2
while tick() - startTime < duration do
sound1.PlaybackSpeed = 0.2 + (tick() - startTime) / duration * 1
wait(0.02)
end
sound1.PlaybackSpeed = 1
end

local L = game.Players.LocalPlayer
local C = L.Character or L.CharacterAdded:Wait()
local humanoidRootPart = C:WaitForChild("HumanoidRootPart", 5)
local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = humanoidRootPart
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

local function ShakingBody()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)

local part = Instance.new("Part")
part.Size = Vector3.new(1, 1, 1)
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Position = hrp.Position
part.Parent = workspace

local function randomUnitVector()
local theta = math.random() * math.pi * 2
local phi = math.acos(2 * math.random() - 1)
local x = math.sin(phi) * math.cos(theta)
local y = math.sin(phi) * math.sin(theta)
local z = math.cos(phi)
return Vector3.new(x, y, z)
end

local duration = 2
local interval = 0.02
local elapsed = 0
local originalRotation = hrp.CFrame - hrp.CFrame.Position

while elapsed < duration do
local offset = randomUnitVector() * 1
hrp.CFrame = CFrame.new(part.Position + offset) * originalRotation
task.wait(interval)
elapsed = elapsed + interval
end

part:Destroy()
end
local function DeepDepAnim()
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)

local animationIds = {
Diedboi = "rbxassetid://16102418873"
}

local animations = {}
for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end

game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5).HipHeight = 5
animations.Diedboi:Play()
animations.Diedboi:AdjustSpeed(0.1)

wait(1)
animations.Diedboi:AdjustSpeed(0.03)
animations.Diedboi.TimePosition = 0.1
wait(0.5)
animations.Diedboi:AdjustSpeed(0)
animations.Diedboi.TimePosition = 0.12
wait(3)
animations.Diedboi:AdjustSpeed(0.2)
wait(0.3)
animations.Diedboi.TimePosition = 0.2
animations.Diedboi:AdjustSpeed(0)
wait(2.8)
animations.Diedboi:Stop()
end

local function NoVelocityDeath()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local duration = 2.5
local interval = 0.01
local startTime = tick()
while tick() - startTime < duration do
hrp.AssemblyLinearVelocity = Vector3.zero
hrp.AssemblyAngularVelocity = Vector3.zero
task.wait(interval)
end
end
PlayS(83062150621090, 1.5)
DestroyGuiA()
coroutine.wrap(DialogueDie)()
coroutine.wrap(NightToDayDeath)()
coroutine.wrap(DeepDepAnim)()
wait(4.5)
coroutine.wrap(ShakingBody)()
coroutine.wrap(NoVelocityDeath)()
wait(3)
coroutine.wrap(SfxDeath)()
coroutine.wrap(DeathFx2)()
coroutine.wrap(DeathFx)()
PlayS(98037998935658, 2.5)
ChoirIguess2()
coroutine.wrap(HipHDeathEffect)()
coroutine.wrap(DeathAnim)()
coroutine.wrap(DeathEffect)()
wait(7.25)
coroutine.wrap(ViewDie)()
coroutine.wrap(BamDied)()
coroutine.wrap(ShockwaveDied)()
coroutine.wrap(FlashDeath)()
coroutine.wrap(Break)()
StopChoir2()
pcall(function() game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb") end)
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local bv1 = hrp:FindFirstChild("BodyVelocity") or hrp:WaitForChild("BodyVelocity", 3)
if bv1 then bv1:Destroy() end
wait(0.01)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame += Vector3.new(0,2000,0)
wait(0.5)
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end

local function MinosPrimeIntroWoo()
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")
local messageContainer = Instance.new("Frame")
messageContainer.Size = UDim2.new(0, 300, 0, 400)
messageContainer.Position = UDim2.new(0.5, 0, 0.18, 0)
messageContainer.AnchorPoint = Vector2.new(0.5, 0.5)
messageContainer.BackgroundTransparency = 1
messageContainer.Parent = screenGui
local messageOffset = -37.5
local function showMessage(text, delay)
coroutine.wrap(function()
task.wait(delay)
local blackBox = Instance.new("Frame", messageContainer)
blackBox.BackgroundColor3 = Color3.new(0, 0, 0)
blackBox.BackgroundTransparency = 1
blackBox.AnchorPoint = Vector2.new(0.5, 0)
blackBox.Position = UDim2.new(0.5, 0, 0.5, 0)
Instance.new("UICorner", blackBox).CornerRadius = UDim.new(0, 10)
local textLabel = Instance.new("TextLabel", blackBox)
textLabel.Text = text
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.TextSize = 20
textLabel.Font = Enum.Font.Arcade
textLabel.BackgroundTransparency = 1
textLabel.TextTransparency = 1
local padding = 10
textLabel.Size = UDim2.new(1, -padding, 1, -padding)
textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
blackBox.Size = UDim2.new(0, textLabel.TextBounds.X + padding, 0, textLabel.TextBounds.Y + padding)
for _, msg in ipairs(messageContainer:GetChildren()) do
if msg:IsA("Frame") and msg ~= blackBox then
msg.Position = msg.Position + UDim2.new(0, 0, 0, messageOffset)
end
end
local tweenService = game:GetService("TweenService")
tweenService:Create(blackBox, TweenInfo.new(0.4), {BackgroundTransparency = 0.6}):Play()
tweenService:Create(textLabel, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
task.wait(3 + #textLabel.Text * 0.1)
tweenService:Create(blackBox, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
tweenService:Create(textLabel, TweenInfo.new(1), {TextTransparency = 1}):Play()
task.wait(1)
textLabel:Destroy()
blackBox:Destroy()
end)()
end

local function NoName()
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local alive = true
local function disableMyNametag()
local char = workspace:FindFirstChild(player.Name)
if char then
local head = char:FindFirstChild("Head")
if head then
local tag = head:FindFirstChild("Nametag")
if tag and tag:IsA("BillboardGui") then
tag.Enabled = false
end
end
end
end

local conn
conn = RunService.RenderStepped:Connect(function()
if not alive then
conn:Disconnect()
return
end
disableMyNametag()
end)

player.Character:WaitForChild("Humanoid", 5).Died:Connect(function()
alive = false
end)
end

local function NoBody()
for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.ForceField end end;task.delay(6,function()for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.Plastic end end end)
end

local function IntroFx()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("slapstick", 5)
local duration = 6
local interval = 0.1
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer("fullcharged") end)
task.wait(interval)
end
end

local function IntroFx2()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("Prop", 5)
local duration = 6
local interval = 0.26
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer() end)
task.wait(interval)
end
end

local function SfxIntro()
local duration = 5.5
local interval = 0.2
local endTime = tick() + duration
while tick() < endTime do
task.wait(interval)
end
end

local function IntroMusic()
wait(0.8)
local sound = Instance.new("Sound")
sound.SoundId = getcustomasset("MinosPrime.mp3")
sound.Volume = 0.8
sound.Looped = false
sound.Parent = workspace
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)
local closestPlayer = nil
local shortestDistance = math.huge
local animationIds = {
Blok = "rbxassetid://17332793965",
Crouch = "rbxassetid://13675136513",
Pray = "rbxassetid://16144816662",
Blow = "rbxassetid://16102418873",
Drink = "rbxassetid://16102841105",
Ha = "rbxassetid://135557283152371"
}
local animations = {}
for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end
local function BlowTime()
local anim = animations.Blow
anim:Play()
anim:AdjustSpeed(0.1)
game:GetService("RunService").Heartbeat:Connect(function()
if anim.IsPlaying and anim.TimePosition >= 0.6 then
anim:AdjustSpeed(-0.1)
elseif anim.IsPlaying and anim.TimePosition <= 0 and anim.Speed < 0 then
anim:Stop()
end
end)
end
local function AnimTime()
animations.Blok:Stop()
animations.Crouch:Play()
animations.Crouch.TimePosition = 2.8
animations.Crouch:AdjustSpeed(0)
wait(2)
animations.Crouch:AdjustSpeed(0.2)
wait(8)
animations.Pray:Play()
animations.Pray:AdjustSpeed(0.3)
wait(5)
coroutine.wrap(BlowTime)()
wait(1)
animations.Pray:Stop()
wait(11)
animations.Drink:Play()
animations.Drink:AdjustSpeed(0.11)
wait(0.5)
animations.Blow:Stop()
wait(14.5)
animations.Ha:Play()
animations.Ha:AdjustSpeed(0.1)
wait(2.5)
animations.Ha:AdjustSpeed(0)
wait(2)
animations.Ha:AdjustSpeed(0.6)
end
function teleportAndChangeGravity()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
humanoidRootPart.CFrame = CFrame.new(0, 35, 0)
game.Workspace.Gravity = 2
wait(6)
game.Workspace.Gravity = 196.2
end
local stopFunctions = false
local connections = {}
local function StopThis(Stopsthefunctions)
stopFunctions = Stopsthefunctions
for _, connection in pairs(connections) do
connection:Disconnect()
end
connections = {}
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
for _, child in pairs(game.Workspace:GetChildren()) do
if child:IsA("Part") or child:IsA("BillboardGui") or child:IsA("Sound") then
child:Destroy()
end
end
end
local soundInstance
local function ChoirIguess()
local player = game.Players.LocalPlayer
soundInstance = Instance.new("Sound")
soundInstance.SoundId = "rbxassetid://9114792002"
soundInstance.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
soundInstance.Volume = 1
soundInstance.Looped = true
soundInstance:Play()
end
local function StopChoir()
if soundInstance then
soundInstance:Stop()
soundInstance:Destroy()
end
end
local function createBall(speed)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local ball = Instance.new("Part")
ball.Size, ball.Shape = Vector3.new(1, 1, 1), Enum.PartType.Ball
ball.Color, ball.Material = Color3.fromRGB(200, 200, 255), Enum.Material.Neon
ball.Anchored, ball.CanCollide, ball.Transparency = false, false, 0.5
ball.Parent = game.Workspace
local trail = Instance.new("Trail")
trail.Color = ColorSequence.new(Color3.fromRGB(125, 125, 255))
trail.Lifetime = 0.3
trail.FaceCamera = true
trail.Enabled = true
trail.WidthScale = NumberSequence.new(1, 1)
trail.Attachment0, trail.Attachment1 = Instance.new("Attachment"), Instance.new("Attachment")
trail.Attachment1.Position = Vector3.new(0, -0.5, 0)
trail.Attachment0.Parent, trail.Attachment1.Parent, trail.Parent = ball, ball, ball
local offset, targetDistance = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).unit * 40, 40
local connection
connection = game:GetService("RunService").Heartbeat:Connect(function()
if ball and humanoidRootPart then
ball.Position = humanoidRootPart.Position + offset.unit * targetDistance
if stopFunctions or targetDistance <= 5 then
ball:Destroy()
connection:Disconnect()
else
targetDistance = targetDistance - (speed * game:GetService("RunService").Heartbeat:Wait())
end
end
end)
table.insert(connections, connection)
game.Debris:AddItem(ball, 5)
end
local function spawnBalls()
while not stopFunctions do
for i = 1, 120 do
createBall(70)
if stopFunctions then break end
task.wait(0.025)
end
end
end
local function Aura()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
while not stopFunctions do
local auraGui = Instance.new("BillboardGui")
auraGui.Size, auraGui.Adornee, auraGui.AlwaysOnTop = UDim2.new(1, 0, 1, 0), humanoidRootPart, true
local auraImage = Instance.new("ImageLabel")
auraImage.Size, auraImage.Image, auraImage.BackgroundTransparency = UDim2.new(1, 0, 1, 0), "rbxassetid://9335636508", 1
auraImage.Position, auraImage.ImageTransparency = UDim2.new(0, 0, 0, 0), 0
auraImage.ImageColor3 = Color3.fromRGB(150, 150, 255)
auraImage.Parent, auraGui.Parent = auraGui, humanoidRootPart
coroutine.wrap(function()
for i = 0, 1, 0.05 do
if stopFunctions then break end
auraGui.Size, auraImage.ImageTransparency = UDim2.new(1 + (20 * i), 0, 1 + (20 * i), 0), i
task.wait(0.05)
end
auraGui:Destroy()
end)()
task.wait(0.2)
end
end
local function DeBall()
wait(0.2)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local function createBall(size, color, material, transparency, duration)
local ball = Instance.new("Part")
ball.Shape = Enum.PartType.Ball
ball.Size = size
ball.Color = color
ball.Material = material
ball.Transparency = transparency
ball.Anchored = false
ball.CanCollide = false
ball.CFrame = humanoidRootPart.CFrame
ball.Parent = character
local weld = Instance.new("WeldConstraint")
weld.Part0 = humanoidRootPart
weld.Part1 = ball
weld.Parent = ball
game.Debris:AddItem(ball, duration)
end
createBall(Vector3.new(3, 3, 3), Color3.fromRGB(0, 150, 255), Enum.Material.Glass, 0.65, 6)
createBall(Vector3.new(3.1, 3.1, 3.1), Color3.fromRGB(0, 100, 255), Enum.Material.ForceField, 0, 6)
createBall(Vector3.new(2, 2, 2), Color3.fromRGB(255, 0, 0), Enum.Material.Neon, 0, 6)
end
function SkibidiFanum()
for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.ForceField end end;task.delay(6,function()for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.Plastic end end end)
end
function CoolText()
local gui=Instance.new("ScreenGui")
local Click=Instance.new("Sound")
Click.SoundId="rbxassetid://6042053626"
Click.Volume=0.75
Click.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
local Text1=Instance.new("TextLabel")
gui.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
Text1.Parent=gui
Text1.TextColor3=Color3.fromRGB(255,255,255)
Text1.Font=Enum.Font.Arcade
Text1.TextScaled=true
Text1.Size=UDim2.new(0.25,0,0.1,0)
Text1.Position=UDim2.new(0.375,0,0.1,0)
Text1.BackgroundTransparency=1
for i=1,#"ARENA /// FIRST" do
Text1.Text=string.sub("ARENA /// FIRST",1,i)
Click:Play()
wait(0.01)
end
wait(2)
local Text2=Instance.new("TextLabel")
Text2.Parent=gui
Text2.TextColor3=Color3.fromRGB(255,255,255)
Text2.Font=Enum.Font.Arcade
Text2.TextScaled=true
Text2.Size=UDim2.new(0.1875,0,0.075,0)
Text2.Position=UDim2.new(0.4,0,0.15,0)
Text2.BackgroundTransparency=1
for i=1,#"Soul Survivor" do
Text2.Text=string.sub("Soul Survivor",1,i)
Click:Play()
wait(0.01)
end
wait(5.5)
for i=0,1,0.05 do
Text1.TextTransparency=i
Text2.TextTransparency=i
wait(0.0375)
end
gui:Destroy()
end
local function mainSP()
animations.Blok:Play()
animations.Blok.TimePosition = 2
animations.Blok:AdjustSpeed(0)
wait(0.1)
coroutine.wrap(teleportAndChangeGravity)()
coroutine.wrap(spawnBalls)()
coroutine.wrap(Aura)()
coroutine.wrap(DeBall)()
coroutine.wrap(NoName)()
coroutine.wrap(NoBody)()
coroutine.wrap(ChoirIguess)()
coroutine.wrap(CoolText)()
end
local function Shockwave()
local part = Instance.new("Part")
part.Size = Vector3.new(5, 1, 5)
part.Position = Vector3.new(0, -7, 0)
part.Anchored = true
part.CanCollide = false
part.Color = Color3.fromRGB(255, 255, 255)
part.Material = Enum.Material.SmoothPlastic
part.Transparency = 1
part.Parent = game.Workspace
local decal = Instance.new("Decal")
decal.Texture = "rbxassetid://18642315696"
decal.Parent = part
decal.Face = Enum.NormalId.Top
local function animateSize(part, decal, sizeStart, sizeEnd, fadeStart, fadeEnd, duration, steps)
for i = 1, steps do
local alpha = i / steps
part.Size = sizeStart:Lerp(sizeEnd, alpha)
decal.Transparency = fadeStart + (fadeEnd - fadeStart) * alpha
wait(duration / steps)
end
end
animateSize(part, decal, Vector3.new(5, 1, 5), Vector3.new(80, 1, 80), 0, 1, 0.1, 30)
part:Destroy()
end
local function Bam()
local meshPart = Instance.new("MeshPart")
meshPart.Size = Vector3.new(0.2, 0.2, 0.2)
meshPart.Position = Vector3.new(0, -7, 0)
meshPart.Anchored = true
meshPart.CanCollide = false
meshPart.MeshId = "rbxassetid://6247281036"
meshPart.Color = Color3.fromRGB(130, 130, 130)
meshPart.Material = Enum.Material.Neon
meshPart.Parent = game.Workspace
local function animate(part, sizeStart, sizeEnd, duration, steps)
for i = 1, steps do
local alpha = (i / steps)^2
part.Size = sizeStart:Lerp(sizeEnd, alpha)
part.Transparency = alpha
wait(duration / steps)
end
part:Destroy()
end
animate(meshPart, Vector3.new(0.2, 0.2, 0.2), Vector3.new(3,3,3), 1, 34)
end
local function TimeChangething()
game:GetService("Lighting").TimeOfDay = "00:00:00"
wait(48)
game:GetService("Lighting").TimeOfDay = "12:00:00"
end
local function Break()
local player = game.Players.LocalPlayer
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6737582037"
sound.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
sound.Volume = 1
sound.PlaybackSpeed = 0.2
sound:Play()
local startTime = tick()
local duration = 2
while tick() - startTime < duration do
sound.PlaybackSpeed = 0.2 + (tick() - startTime) / duration * 0.5
wait(0.05)
end
sound.PlaybackSpeed = 1
end
local function Dialogue()
wait(3)
local messages = {
{0, "Ahh..."},
{2.3, "free at last."},
{6.8, "O Gabriel,"},
{9.5, "now dawns thy reckoning,"},
{13.6, "and thy gore shall GLISTEN before the temples of Man!"},
{22, "Creature of Steel..."},
{25.35, "my gratitude upon thee for my freedom."},
{30, "But the crimes thy kind have commited against humanity"},
{37, "are NOT forgotten!"},
{40.5, "And thy punishment..."},
{43.7, "is DEATH."},
}

for _, v in ipairs(messages) do
task.delay(v[1], function()
showMessage(v[2], 0)
end)
end
end

local function Wintro()
coroutine.wrap(Morph)()
coroutine.wrap(StopChoir)()
coroutine.wrap(StopThis)(true)
coroutine.wrap(Shockwave)()
coroutine.wrap(Bam)()
coroutine.wrap(TimeChangething)()
coroutine.wrap(Break)()
coroutine.wrap(IntroMusic)()
coroutine.wrap(AnimTime)()
wait(47.5)
ToggleWalkAnim(true)
CreateTrueGui()
ActUseless(true)
local h=game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5); h.WalkSpeed=22.5; h.JumpPower=50
ActMinosPrimeM(true)
coroutine.wrap(StartHitbox)()
ActHitbox(true)
PlayS(139270438752699, 2.5)
hpbar = CreateHPBar()
function ActHpChange(amount)
if hpbar then
hpbar.ChangeHealth(amount)
end
end
end
mainSP()
coroutine.wrap(VFXAudioRemover)()
coroutine.wrap(SfxIntro)()
coroutine.wrap(IntroFx2)()
coroutine.wrap(IntroFx)()
wait(4.5)
task.wait(1.5)
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local L = Players.LocalPlayer
local C = L.Character or L.CharacterAdded:Wait()
pcall(function() RS:WaitForChild("RetroAbility", 5):FireServer("Bomb") end)
local hrp = C:WaitForChild("HumanoidRootPart", 5)
local BV = hrp:FindFirstChild("BodyVelocity") or hrp:WaitForChild("BodyVelocity", 3)
if BV then BV:Destroy() end
Wintro()
end

local function MinosPrimeIntroWoo2()

local function NoName()
local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local alive = true
local function disableMyNametag()
local char = workspace:FindFirstChild(player.Name)
if char then
local head = char:FindFirstChild("Head")
if head then
local tag = head:FindFirstChild("Nametag")
if tag and tag:IsA("BillboardGui") then
tag.Enabled = false
end
end
end
end

local conn
conn = RunService.RenderStepped:Connect(function()
if not alive then
conn:Disconnect()
return
end
disableMyNametag()
end)

player.Character:WaitForChild("Humanoid", 5).Died:Connect(function()
alive = false
end)
end

local function NoBody()
for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.ForceField end end;task.delay(6,function()for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.Plastic end end end)
end

local function IntroFx()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("slapstick", 5)
local duration = 6
local interval = 0.1
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer("fullcharged") end)
task.wait(interval)
end
end

local function IntroFx2()
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("Prop", 5)
local duration = 6
local interval = 0.26
local endTime = tick() + duration
while tick() < endTime do
pcall(function() Remote:FireServer() end)
task.wait(interval)
end
end

local function SfxIntro()
local duration = 5.5
local interval = 0.2
local endTime = tick() + duration
while tick() < endTime do
task.wait(interval)
end
end

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)
local closestPlayer = nil
local shortestDistance = math.huge
local animationIds = {
Blok = "rbxassetid://17332793965",
Crouch = "rbxassetid://13675136513",
Ha = "rbxassetid://135557283152371"
}
local animations = {}
for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end
local function BlowTime()
local anim = animations.Blow
anim:Play()
anim:AdjustSpeed(0.1)
game:GetService("RunService").Heartbeat:Connect(function()
if anim.IsPlaying and anim.TimePosition >= 0.6 then
anim:AdjustSpeed(-0.1)
elseif anim.IsPlaying and anim.TimePosition <= 0 and anim.Speed < 0 then
anim:Stop()
end
end)
end
local function AnimTime()
animations.Blok:Stop()
animations.Crouch:Play()
animations.Crouch.TimePosition = 2.8
animations.Crouch:AdjustSpeed(0)
wait(1)
animations.Crouch:AdjustSpeed(0.5)
wait(3.3)
animations.Crouch:Stop()
animations.Ha:Play()
animations.Ha:AdjustSpeed(0.15)
wait(1.7)
animations.Ha:AdjustSpeed(0)
wait(0.7)
animations.Ha:AdjustSpeed(0.6)
end

local function teleportAndChangeGravity()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
humanoidRootPart.CFrame = CFrame.new(0, 35, 0)
game.Workspace.Gravity = 2
wait(6)
game.Workspace.Gravity = 196.2
end
local stopFunctions = false
local connections = {}
local function StopThis(Stopsthefunctions)
stopFunctions = Stopsthefunctions
for _, connection in pairs(connections) do
connection:Disconnect()
end
connections = {}
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
for _, child in pairs(game.Workspace:GetChildren()) do
if child:IsA("Part") or child:IsA("BillboardGui") or child:IsA("Sound") then
child:Destroy()
end
end
end
local soundInstance
local function ChoirIguess()
local player = game.Players.LocalPlayer
soundInstance = Instance.new("Sound")
soundInstance.SoundId = "rbxassetid://9114792002"
soundInstance.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
soundInstance.Volume = 1
soundInstance.Looped = true
soundInstance:Play()
end
local function StopChoir()
if soundInstance then
soundInstance:Stop()
soundInstance:Destroy()
end
end
local function createBall(speed)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local ball = Instance.new("Part")
ball.Size, ball.Shape = Vector3.new(1, 1, 1), Enum.PartType.Ball
ball.Color, ball.Material = Color3.fromRGB(200, 200, 255), Enum.Material.Neon
ball.Anchored, ball.CanCollide, ball.Transparency = false, false, 0.5
ball.Parent = game.Workspace
local trail = Instance.new("Trail")
trail.Color = ColorSequence.new(Color3.fromRGB(125, 125, 255))
trail.Lifetime = 0.3
trail.FaceCamera = true
trail.Enabled = true
trail.WidthScale = NumberSequence.new(1, 1)
trail.Attachment0, trail.Attachment1 = Instance.new("Attachment"), Instance.new("Attachment")
trail.Attachment1.Position = Vector3.new(0, -0.5, 0)
trail.Attachment0.Parent, trail.Attachment1.Parent, trail.Parent = ball, ball, ball
local offset, targetDistance = Vector3.new(math.random() * 2 - 1, math.random() * 2 - 1, math.random() * 2 - 1).unit * 40, 40
local connection
connection = game:GetService("RunService").Heartbeat:Connect(function()
if ball and humanoidRootPart then
ball.Position = humanoidRootPart.Position + offset.unit * targetDistance
if stopFunctions or targetDistance <= 5 then
ball:Destroy()
connection:Disconnect()
else
targetDistance = targetDistance - (speed * game:GetService("RunService").Heartbeat:Wait())
end
end
end)
table.insert(connections, connection)
game.Debris:AddItem(ball, 5)
end
local function spawnBalls()
while not stopFunctions do
for i = 1, 120 do
createBall(70)
if stopFunctions then break end
task.wait(0.025)
end
end
end
local function Aura()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
while not stopFunctions do
local auraGui = Instance.new("BillboardGui")
auraGui.Size, auraGui.Adornee, auraGui.AlwaysOnTop = UDim2.new(1, 0, 1, 0), humanoidRootPart, true
local auraImage = Instance.new("ImageLabel")
auraImage.Size, auraImage.Image, auraImage.BackgroundTransparency = UDim2.new(1, 0, 1, 0), "rbxassetid://9335636508", 1
auraImage.Position, auraImage.ImageTransparency = UDim2.new(0, 0, 0, 0), 0
auraImage.ImageColor3 = Color3.fromRGB(150, 150, 255)
auraImage.Parent, auraGui.Parent = auraGui, humanoidRootPart
coroutine.wrap(function()
for i = 0, 1, 0.05 do
if stopFunctions then break end
auraGui.Size, auraImage.ImageTransparency = UDim2.new(1 + (20 * i), 0, 1 + (20 * i), 0), i
task.wait(0.05)
end
auraGui:Destroy()
end)()
task.wait(0.2)
end
end
local function DeBall()
wait(0.2)
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local function createBall(size, color, material, transparency, duration)
local ball = Instance.new("Part")
ball.Shape = Enum.PartType.Ball
ball.Size = size
ball.Color = color
ball.Material = material
ball.Transparency = transparency
ball.Anchored = false
ball.CanCollide = false
ball.CFrame = humanoidRootPart.CFrame
ball.Parent = character
local weld = Instance.new("WeldConstraint")
weld.Part0 = humanoidRootPart
weld.Part1 = ball
weld.Parent = ball
game.Debris:AddItem(ball, duration)
end
createBall(Vector3.new(3, 3, 3), Color3.fromRGB(0, 150, 255), Enum.Material.Glass, 0.65, 6)
createBall(Vector3.new(3.1, 3.1, 3.1), Color3.fromRGB(0, 100, 255), Enum.Material.ForceField, 0, 6)
createBall(Vector3.new(2, 2, 2), Color3.fromRGB(255, 0, 0), Enum.Material.Neon, 0, 6)
end
local function SkibidiFanum()
for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.ForceField end end;task.delay(6,function()for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants())do if v:IsA("BasePart")then v.Material=Enum.Material.Plastic end end end)
end
local function CoolText()
local gui=Instance.new("ScreenGui")
local Click=Instance.new("Sound")
Click.SoundId="rbxassetid://6042053626"
Click.Volume=0.75
Click.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
local Text1=Instance.new("TextLabel")
gui.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
Text1.Parent=gui
Text1.TextColor3=Color3.fromRGB(255,255,255)
Text1.Font=Enum.Font.Arcade
Text1.TextScaled=true
Text1.Size=UDim2.new(0.25,0,0.1,0)
Text1.Position=UDim2.new(0.375,0,0.1,0)
Text1.BackgroundTransparency=1
for i=1,#"ARENA /// FIRST" do
Text1.Text=string.sub("ARENA /// FIRST",1,i)
Click:Play()
wait(0.01)
end
wait(2)
local Text2=Instance.new("TextLabel")
Text2.Parent=gui
Text2.TextColor3=Color3.fromRGB(255,255,255)
Text2.Font=Enum.Font.Arcade
Text2.TextScaled=true
Text2.Size=UDim2.new(0.1875,0,0.075,0)
Text2.Position=UDim2.new(0.4,0,0.15,0)
Text2.BackgroundTransparency=1
for i=1,#"Soul Survivor" do
Text2.Text=string.sub("Soul Survivor",1,i)
Click:Play()
wait(0.01)
end
wait(5.5)
for i=0,1,0.05 do
Text1.TextTransparency=i
Text2.TextTransparency=i
wait(0.0375)
end
gui:Destroy()
end

local function mainSP()
animations.Blok:Play()
animations.Blok.TimePosition = 2
animations.Blok:AdjustSpeed(0)
wait(0.1)
coroutine.wrap(teleportAndChangeGravity)()
coroutine.wrap(spawnBalls)()
coroutine.wrap(Aura)()
coroutine.wrap(DeBall)()
coroutine.wrap(NoName)()
coroutine.wrap(NoBody)()
coroutine.wrap(ChoirIguess)()
coroutine.wrap(CoolText)()
end

local function Shockwave()
local part = Instance.new("Part")
part.Size = Vector3.new(5, 1, 5)
part.Position = Vector3.new(0, -7, 0)
part.Anchored = true
part.CanCollide = false
part.Color = Color3.fromRGB(255, 255, 255)
part.Material = Enum.Material.SmoothPlastic
part.Transparency = 1
part.Parent = game.Workspace
local decal = Instance.new("Decal")
decal.Texture = "rbxassetid://18642315696"
decal.Parent = part
decal.Face = Enum.NormalId.Top
local function animateSize(part, decal, sizeStart, sizeEnd, fadeStart, fadeEnd, duration, steps)
for i = 1, steps do
local alpha = i / steps
part.Size = sizeStart:Lerp(sizeEnd, alpha)
decal.Transparency = fadeStart + (fadeEnd - fadeStart) * alpha
wait(duration / steps)
end
end
animateSize(part, decal, Vector3.new(5, 1, 5), Vector3.new(80, 1, 80), 0, 1, 0.1, 30)
part:Destroy()
end
local function Bam()
local meshPart = Instance.new("MeshPart")
meshPart.Size = Vector3.new(0.2, 0.2, 0.2)
meshPart.Position = Vector3.new(0, -7, 0)
meshPart.Anchored = true
meshPart.CanCollide = false
meshPart.MeshId = "rbxassetid://6247281036"
meshPart.Color = Color3.fromRGB(130, 130, 130)
meshPart.Material = Enum.Material.Neon
meshPart.Parent = game.Workspace
local function animate(part, sizeStart, sizeEnd, duration, steps)
for i = 1, steps do
local alpha = (i / steps)^2
part.Size = sizeStart:Lerp(sizeEnd, alpha)
part.Transparency = alpha
wait(duration / steps)
end
part:Destroy()
end
animate(meshPart, Vector3.new(0.2, 0.2, 0.2), Vector3.new(3,3,3), 1, 34)
end
local function TimeChangething()
game:GetService("Lighting").TimeOfDay = "00:00:00"
wait(8)
game:GetService("Lighting").TimeOfDay = "12:00:00"
end
local function Break()
local player = game.Players.LocalPlayer
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://6737582037"
sound.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
sound.Volume = 1
sound.PlaybackSpeed = 0.2
sound:Play()
local startTime = tick()
local duration = 2
while tick() - startTime < duration do
sound.PlaybackSpeed = 0.2 + (tick() - startTime) / duration * 0.5
wait(0.05)
end
sound.PlaybackSpeed = 1
end

local function IntroSpeechless()
mainSP()
coroutine.wrap(VFXAudioRemover)()
coroutine.wrap(SfxIntro)()
coroutine.wrap(IntroFx2)()
coroutine.wrap(IntroFx)()
wait(4.5)
task.wait(1.5)
local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local L = Players.LocalPlayer
local C = L.Character or L.CharacterAdded:Wait()
pcall(function() RS:WaitForChild("RetroAbility", 5):FireServer("Bomb") end)
local hrp2 = C:WaitForChild("HumanoidRootPart", 5)
local BV = hrp2:FindFirstChild("BodyVelocity") or hrp2:WaitForChild("BodyVelocity", 3)
if BV then BV:Destroy() end
task.wait(0.1)
coroutine.wrap(Morph)()
coroutine.wrap(StopChoir)()
coroutine.wrap(StopThis)(true)
coroutine.wrap(Shockwave)()
coroutine.wrap(Bam)()
coroutine.wrap(Break)()
coroutine.wrap(AnimTime)()
coroutine.wrap(TimeChangething)()
wait(7.5)
ToggleWalkAnim(true)
CreateTrueGui()
ActUseless(true)
ActMinosPrimeM(true)
coroutine.wrap(StartHitbox)()
ActHitbox(true)
PlayS(139270438752699, 2.5)
hpbar = CreateHPBar()
function ActHpChange(amount)
if hpbar then
hpbar.ChangeHealth(amount)
end
end
local h=game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5); h.WalkSpeed=22.5; h.JumpPower=50
end
IntroSpeechless()
end

local player = game.Players.LocalPlayer
local animationId = "rbxassetid://101931532422335"
local playing = false
local runCheck
local charConn
local enabled = false
local originalWalkId

local function setupHumanoid(humanoid)
local animate = humanoid.Parent:FindFirstChild("Animate")
if not animate or not animate:FindFirstChild("walk") or not animate.walk:FindFirstChild("WalkAnim") then return end
local walkAnim = animate.walk.WalkAnim
if not originalWalkId then
originalWalkId = walkAnim.AnimationId
end
walkAnim.AnimationId = animationId

runCheck = game:GetService("RunService").Heartbeat:Connect(function()
if humanoid:GetState() == Enum.HumanoidStateType.Physics then return end
local animator = humanoid:FindFirstChildOfClass("Animator")
if not animator then return end
local tracks = animator:GetPlayingAnimationTracks()
if #tracks == 1 and tracks[1].Animation.AnimationId == animationId then
local track = tracks[1]
if humanoid.MoveDirection.Magnitude > 0 and not playing then
playing = true
track:AdjustSpeed(0)
while humanoid.MoveDirection.Magnitude > 0
and humanoid:GetState() ~= Enum.HumanoidStateType.Physics
and #animator:GetPlayingAnimationTracks() == 1
and animator:GetPlayingAnimationTracks()[1].Animation.AnimationId == animationId do

for i = 0, 3, 0.15 do
if humanoid.MoveDirection.Magnitude == 0
or #animator:GetPlayingAnimationTracks() ~= 1
or animator:GetPlayingAnimationTracks()[1].Animation.AnimationId ~= animationId then
playing = false
return
end
track.TimePosition = i
task.wait(0.15)
end
end
playing = false
elseif humanoid.MoveDirection.Magnitude == 0 and playing then
playing = false
end
end
end)

humanoid.Died:Connect(function()
ToggleWalkAnim(false)
end)
end

function ToggleWalkAnim(status)
if status then
if enabled then return end
enabled = true
local function onCharacter(char)
if runCheck then runCheck:Disconnect() runCheck = nil end
local humanoid = char:WaitForChild("Humanoid", 5)
setupHumanoid(humanoid)
end
if player.Character then
onCharacter(player.Character)
end
charConn = player.CharacterAdded:Connect(onCharacter)
else
enabled = false
if runCheck then runCheck:Disconnect() runCheck = nil end
if charConn then charConn:Disconnect() charConn = nil end
playing = false
if player.Character then
local animate = player.Character:FindFirstChild("Animate")
if animate and animate:FindFirstChild("walk") and animate.walk:FindFirstChild("WalkAnim") and originalWalkId then
animate.walk.WalkAnim.AnimationId = originalWalkId
end
end
end
end

local GuiA = Instance.new("ScreenGui")
GuiA.Parent = game.CoreGui
GuiA.Name = "AhatGui"

local function GuiProp(UICorner, Outline, Index)
return function(gui)
local layer = Index or 1
gui.ZIndex = layer
if Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
OLL.BackgroundTransparency = 0
OLL.BorderSizePixel = 0
OLL.ZIndex = layer - 1
OLL.Parent = gui
if UICorner then
local OL_Corner = Instance.new("UICorner")
OL_Corner.CornerRadius = UDim.new(0, 6)
OL_Corner.Parent = OLL
end
end
if UICorner then
local GUI_Corner = Instance.new("UICorner")
GUI_Corner.CornerRadius = UDim.new(0, 5)
GUI_Corner.Parent = gui
end
end
end

local function CreateGui(props)
local guiType = props.Type or "Frame"
local gui = Instance.new(guiType)
gui.Name = props.Name or guiType
gui.Size = UDim2.new(0, props.Size[1], 0, props.Size[2])
gui.Position = UDim2.new(0, props.Pos[1], 0, props.Pos[2])
gui.BackgroundColor3 = Color3.fromRGB(unpack(props.BackgroundColor or {255, 255, 255}))
gui.BackgroundTransparency = tonumber(props.BackgroundTransparency) or 0
gui.BorderSizePixel = 0
gui.Parent = props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)

if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
gui.Text = props.Text or ""
gui.Font = Enum.Font.Arcade
gui.TextSize = props.TextSize or 15
gui.TextColor3 = Color3.fromRGB(unpack(props.Textcolor or {255, 255, 255}))
if gui:IsA("TextBox") then
gui.ClearTextOnFocus = false
end
gui.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center
if props.OutlineText then
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(unpack(props.OutlineTextColor or {0, 0, 0}))
stroke.Thickness = 1
stroke.Parent = gui
end
end

if props.Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OLL.BorderSizePixel = 0
OLL.ZIndex = 0
OLL.Parent = gui
end

if props.UICorner then
local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 10)
round.Parent = gui
end

return gui
end

local TweenService = game:GetService("TweenService")
local AP2 = CreateGui{
Type = "Frame",
Name = "Frame2",
Size = {240, 135},
Pos = {0, 0},
BackgroundColor = {0, 0, 0},
Parent = GuiA
}
AP2.AnchorPoint = Vector2.new(0.5, 0.5)
AP2.Position = UDim2.new(0.5, 0, 0.35, 0)

local AP3 = CreateGui{
Type = "Frame",
Name = "Frame3",
Size = {220, 2},
Pos = {10, 40},
BackgroundColor = {255, 255, 255},
Parent = AP2
}

local AP4 = CreateGui{
Type = "TextLabel",
Name = "Frame3",
Size = {220, 40},
Pos = {10, 10},
Text = "Make Your Choice",
TextSize = 15,
BackgroundTransparency = 1,
BackgroundColor = {255, 255, 255},
Parent = AP2
}

local ATransition = CreateGui{
Type = "Frame",
Name = "Frame2",
Size = {5, 5},
Pos = {120, 60},
BackgroundColor = {255, 255, 255},
Transparency = 1,
Parent = AP2
}
ATransition.AnchorPoint = Vector2.new(0.5, 0.5)

local ATransition2 = CreateGui{
Type = "Frame",
Name = "Frame2Fade",
Size = {250, 140},
Pos = {120, 67},
BackgroundColor = {0, 0, 0},
Transparency = 0,
Parent = AP2
}
ATransition2.AnchorPoint = Vector2.new(0.5, 0.5)

local function PlaySFX(id)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = 1
sound.Parent = game:GetService("SoundService")
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

_immortalMode = false
function OpenIntro(status)
if status == true then
AP2.Visible = true
PlaySFX(124967621900629)
ATransition.Transparency = 0
ATransition.Size = UDim2.new(0, 5, 0, 5)
ATransition2.Transparency = 0
ATransition2.Size = UDim2.new(0, 245, 0, 125)

local t1 = TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 245, 0, 5)})
t1:Play()
t1.Completed:Connect(function()
local t2 = TweenService:Create(ATransition, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 245, 0, 125)})
t2:Play()
t2.Completed:Connect(function()
TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Transparency = 1}):Play()
TweenService:Create(ATransition2, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Transparency = 1}):Play()
end)
end)
else
ATransition.Transparency = 0
ATransition2.Transparency = 0

local t1 = TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 245, 0, 5)})
local t2 = TweenService:Create(ATransition, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 5, 0, 5)})
t1:Play()
t1.Completed:Connect(function()
t2:Play()
t2.Completed:Connect(function()
ATransition.Transparency = 1
end)
end)
task.delay(0.25, function()
AP2.Visible = false
end)
end
end

local B = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {15, 47.5},
Text = "SKIP",
TextSize = 9,
BackgroundColor = {0, 0, 0},
Parent = AP2
}

local C = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {135, 47.5},
Text = "INTRO",
TextSize = 12,
BackgroundColor = {0, 0, 0},
Parent = AP2
}

local ImmortalBtn = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {210, 30},
Pos = {15, 90},
Text = "IMMORTAL MODE",
TextSize = 11,
BackgroundColor = {80, 0, 120},
Parent = AP2
}

GuiProp(true, true, 0)(AP2)
GuiProp(true, false, 0)(AP3)
GuiProp(false, false, 0)(AP4)
GuiProp(true, false, 11)(ATransition)
GuiProp(true, false, 10)(ATransition2)
GuiProp(true, true, 5)(B)
GuiProp(true, true, 5)(C)
GuiProp(true, true, 5)(ImmortalBtn)

B.MouseButton1Click:Connect(function()
ToggleWalkAnim(true)
coroutine.wrap(DestroyItMan)()
CreateTrueGui()
coroutine.wrap(Morph)()
coroutine.wrap(VFXAudioRemover)()
coroutine.wrap(SpawnSafeBS)()
ActUseless(true)
ActMinosPrimeM(true)
coroutine.wrap(TextBHide)()
OpenIntro(false)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
coroutine.wrap(function()
	local P = game.Players.LocalPlayer
	local C = P.Character or P.CharacterAdded:Wait()
	local hrp = C:WaitForChild("HumanoidRootPart", 5)
	for _,v in pairs(C:GetDescendants()) do
		if v:IsA("BasePart") then v.Material = Enum.Material.ForceField end
	end
	task.delay(6, function()
		for _,v in pairs(C:GetDescendants()) do
			if v:IsA("BasePart") then v.Material = Enum.Material.Plastic end
		end
	end)
end)()
coroutine.wrap(StartHitbox)()
ActHitbox(true)
PlayS(139270438752699, 2.5)
hpbar = CreateHPBar()
function ActHpChange(amount)
if hpbar then
hpbar.ChangeHealth(amount)
end
end
end)

C.MouseButton1Click:Connect(function()
coroutine.wrap(DestroyItMan)()
local h=game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5); h.WalkSpeed=0; h.JumpPower=0
coroutine.wrap(SpawnSafeBS)()
coroutine.wrap(TextBHide)()
OpenIntro(false)
MinosPrimeIntroWoo()
end)

ImmortalBtn.MouseButton1Click:Connect(function()
_immortalMode = true
ToggleWalkAnim(true)
coroutine.wrap(DestroyItMan)()
CreateTrueGui()
coroutine.wrap(Morph)()
coroutine.wrap(VFXAudioRemover)()
coroutine.wrap(SpawnSafeBS)()
ActUseless(true)
ActMinosPrimeM(true)
coroutine.wrap(TextBHide)()
OpenIntro(false)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
coroutine.wrap(StartHitbox)()
ActHitbox(true)
PlayS(139270438752699, 2.5)
hpbar = CreateHPBar()
function ActHpChange(amount)
if hpbar and not _immortalMode then
hpbar.ChangeHealth(amount)
end
end
Immunity(true)
end)

function SpawnSafeBS()
local cooldowns = {}
local part = Instance.new("Part")
part.Size = Vector3.new(1000, 5, 1000)
part.Position = Vector3.new(0, -105, 0)
part.Anchored = true
part.CanCollide = true
part.Transparency = 1
part.Material = Enum.Material.Plastic
part.BrickColor = BrickColor.new("Medium stone grey")
part.Parent = workspace
local player = game.Players.LocalPlayer
local function monitorDeath()
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid", 5)
hum.Died:Connect(function()
if part and part.Parent then
part:Destroy()
end
end)
end
task.spawn(monitorDeath)
part.Touched:Connect(function(hit)
local touchingPlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
if not touchingPlayer then return end
local lastTouch = cooldowns[touchingPlayer] or 0
if tick() - lastTouch < 1 then return end
cooldowns[touchingPlayer] = tick()
if touchingPlayer.Character and touchingPlayer.Character:FindFirstChild("HumanoidRootPart") then
touchingPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 0, 0)
end
if ActHpChange then
ActHpChange(-20)
end
end)
end

local ActUselessRunner = nil
local ActUselessStop = false
function ActUseless(status)
local player = game.Players.LocalPlayer
local myName = player.Name
local tracked = {}
local cooldowns = {}
if not status then
ActUselessStop = true
ActUselessRunner = nil
return
end
if ActUselessRunner then return end
ActUselessStop = false
ActUselessRunner = task.spawn(function()
local char = player.Character or player.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid", 5)
hum.Died:Connect(function()
ActUselessStop = true
end)
while not ActUselessStop do
for _, model in ipairs(workspace:GetChildren()) do
local tag = model:FindFirstChild("LastSlappedBy")
local otherHum = model:FindFirstChildOfClass("Humanoid")
if tag and otherHum and tag:IsA("StringValue") and tag.Value == myName then
if not tracked[otherHum] and (not cooldowns[otherHum] or os.clock() - cooldowns[otherHum] > 4) then
tracked[otherHum] = true
task.spawn(function()
repeat task.wait(0.05) until otherHum.Health < 1 or ActUselessStop
if not ActUselessStop then
PlayS(109848317516154, 1.5)
showMessage("Useless", 0)
if ActHpChange then
ActHpChange(20)
end
cooldowns[otherHum] = os.clock()
end
tracked[otherHum] = nil
end)
end
end
end
task.wait(0.1)
end
ActUselessRunner = nil
end)
end

function Death()
DestroyGuiA()
local h=game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5); h.WalkSpeed=0; h.JumpPower=0
ActUseless(false)
ActHitbox(false)
ActMinosPrimeM(false)
Immunity(true)
coroutine.wrap(DeathTimeBoi)()
end

coroutine.wrap(PreloadDaM)()
OpenIntro(true)
end

function CreateTrueGui()
local function StopFling()
local Players = game:GetService("Players")
local L = Players.LocalPlayer
local c = L.Character or L.CharacterAdded:Wait()
local hum = c:WaitForChild("Humanoid", 5)
local hrp = c:WaitForChild("HumanoidRootPart", 5)
hum.PlatformStand = true
hrp.Velocity = Vector3.zero
hrp.RotVelocity = Vector3.zero
wait(0.05)
hum.PlatformStand = false
hum:ChangeState(Enum.HumanoidStateType.GettingUp)
end

local GuiA = Instance.new("ScreenGui")
GuiA.Parent = game.CoreGui
GuiA.Name = "AhatGui"
local function GuiProp(UICorner, Outline, Index)
return function(gui)
local layer = Index or 1
gui.ZIndex = layer
if Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(255,255,255)
OLL.BackgroundTransparency = 0
OLL.BorderSizePixel = 0
OLL.ZIndex = layer - 1
OLL.Parent = gui
if UICorner then
local OL_Corner = Instance.new("UICorner")
OL_Corner.CornerRadius = UDim.new(0, 6)
OL_Corner.Parent = OLL
end
end
if UICorner then
local GUI_Corner = Instance.new("UICorner")
GUI_Corner.CornerRadius = UDim.new(0, 5)
GUI_Corner.Parent = gui
end
end
end

local function CreateGui(props)
local guiType = props.Type or "Frame"
local gui = Instance.new(guiType)
gui.Name = props.Name or guiType
gui.Size = UDim2.new(0, props.Size[1], 0, props.Size[2])
gui.Position = UDim2.new(0, props.Pos[1], 0, props.Pos[2])
gui.BackgroundColor3 = Color3.fromRGB(unpack(props.BackgroundColor or {255, 255, 255}))
gui.BackgroundTransparency = tonumber(props.BackgroundTransparency) or 0
gui.BorderSizePixel = 0
gui.Parent = props.Parent or game.Players.LocalPlayer:WaitForChild("PlayerGui", 5)
if gui:IsA("TextLabel") or gui:IsA("TextButton") or gui:IsA("TextBox") then
gui.Text = props.Text or ""
gui.Font = Enum.Font.Arcade
gui.TextSize = props.TextSize or 15
gui.TextColor3 = Color3.fromRGB(unpack(props.Textcolor or {255, 255, 255}))
if gui:IsA("TextBox") then
gui.ClearTextOnFocus = false
end
gui.TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Center
if props.OutlineText then
local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(unpack(props.OutlineTextColor or {0,0,0}))
stroke.Thickness = 1
stroke.Parent = gui
end
end
if props.Outline then
local OLL = Instance.new("Frame")
OLL.Size = UDim2.new(1, 4, 1, 4)
OLL.Position = UDim2.new(0, -2, 0, -2)
OLL.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OLL.BorderSizePixel = 0
OLL.ZIndex = 0
OLL.Parent = gui
end
if props.UICorner then
local round = Instance.new("UICorner")
round.CornerRadius = UDim.new(0, 10)
round.Parent = gui
end
return gui
end

local AButton = CreateGui{
Type = "TextButton",
Name = "Frame1",
Size = {55,55},
Pos = {100, 100},
BackgroundColor = {0,0,0},
Text = "Testing\nGui",
TextSize = 8,
Parent = GuiA
}
AButton.Visible = false

local A = CreateGui{
Type = "Frame",
Name = "Frame1",
Size = {40, 200},
Pos = {100, 200},
BackgroundColor = {0,0,0},
Parent = GuiA
}
A.Visible = false

local AP2 = CreateGui{
Type = "Frame",
Name = "Frame2",
Size = {240, 200},
Pos = {50,0},
BackgroundColor = {0,0,0},
Parent = A
}

local AP3 = CreateGui{
Type = "Frame",
Name = "Frame3",
Size = {220, 2},
Pos = {60,35},
BackgroundColor = {255,255,255},
Parent = A
}

local AP4 = CreateGui{
Type = "TextLabel",
Name = "Frame3",
Size = {220, 2},
Pos = {60,15},
Text = "Slap Battles Minos Prime Script\nBy @Crossattic",
TextSize = 11,
BackgroundTransparency = 1,
BackgroundColor = {255,255,255},
Parent = A
}

local TweenService = game:GetService("TweenService")
local RotatingText = CreateGui{
Type = "TextLabel",
Name = "Frame1",
Size = {200, 40},
Pos = {160, -25},
BackgroundColor = {0,0,0},
BackgroundTransparency = 1,
Text = "Beta",
TextSize = 15,
Textcolor = {255,255,255},
OutlineText = true,
Parent = A
}

task.spawn(function()
local angle1 = -25
local angle2 = 25
while RotatingText.Parent do
local Tween1 = TweenService:Create(RotatingText, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = angle1})
Tween1:Play()
Tween1.Completed:Wait()
local Tween2 = TweenService:Create(RotatingText, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Rotation = angle2})
Tween2:Play()
Tween2.Completed:Wait()
end
end)

local SLDR = CreateGui{
Type = "ScrollingFrame",
Name = "SLDR",
Size = {230, 155},
Pos = {5, 40},
BackgroundColor = {0,0,0},
Parent = AP2
}

local B = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {10, 35},
Text = "Enable\nSuper Jump\n[1]",
TextSize = 9,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local C = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {10, 75},
Text = "Punch\n[M1]",
TextSize = 12,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local D  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {10, 115},
Text = "Throw Serpent\n[R]",
TextSize = 12,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local E  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {10, 155},
Text = "Overhead\n[Z]",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local F  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {10, 195},
Text = "Prepare\nThyself (WIP)",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local G  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {130, 35},
Text = "Uppercut\n[X]",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local H  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {130, 75},
Text = "Crush\n[C]",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local I  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {130, 115},
Text = "Judgement\n[T]",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local J  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {130, 155},
Text = "Die\n[E]",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local K  = CreateGui{
Type = "TextButton",
Name = "Frame2",
Size = {90, 30},
Pos = {130, 195},
Text = "Thy end is now\n(WIP)",
TextSize = 10,
BackgroundColor = {0,0,0},
Parent = SLDR
}

local TweenService = game:GetService("TweenService")
local ATransition = CreateGui{
Type = "Frame",
Name = "Frame2",
Size = {5, 5},
Pos = {145, 100},
BackgroundColor = {255, 255, 255},
Transparency = 1,
Parent = A
}
ATransition.AnchorPoint = Vector2.new(0.5, 0.5)
local ATransition2 = CreateGui{
Type = "Frame",
Name = "Frame2Fade",
Size = {300, 210},
Pos = {145, 100},
BackgroundColor = {0, 0, 0},
Transparency = 0,
Parent = A
}
ATransition2.AnchorPoint = Vector2.new(0.5, 0.5)
local function PlaySFX(id)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = 1
sound.Parent = game:GetService("SoundService")
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end
local function PlayOpen()
PlaySFX(124967621900629)
ATransition.Transparency = 0
ATransition.Size = UDim2.new(0, 5, 0, 5)
ATransition2.Transparency = 0
ATransition2.Size = UDim2.new(0, 300, 0, 210)
local t1 = TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 300, 0, 5)})
t1:Play()
t1.Completed:Connect(function()
local t2 = TweenService:Create(ATransition, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 300, 0, 210)})
t2:Play()
t2.Completed:Connect(function()
TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Transparency = 1}):Play()
TweenService:Create(ATransition2, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Transparency = 1}):Play()
end)
end)
end
local function PlayClose()
ATransition.Transparency = 0
ATransition2.Transparency = 0
local t1 = TweenService:Create(ATransition, TweenInfo.new(0.15, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 300, 0, 5)})
local t2 = TweenService:Create(ATransition, TweenInfo.new(0.05, Enum.EasingStyle.Linear),
{Size = UDim2.new(0, 5, 0, 5)})
t1:Play()
t1.Completed:Connect(function()
t2:Play()
t2.Completed:Connect(function()
ATransition.Transparency = 1
end)
end)
end
local function GuiToggle()
end
AButton.MouseButton1Click:Connect(GuiToggle)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function CheckChildren(Name, ...)
	local moreArgs = {...}
	local currentObject = ReplicatedStorage:FindFirstChild(Name)
	for _, more in ipairs(moreArgs) do
		if currentObject then
			currentObject = currentObject:FindFirstChild(more)
		else
			break
		end
	end
	return currentObject or ReplicatedStorage.GeneralHit
end

local GlovehitsTable = {
	["Default"] = CheckChildren("b"),
	["Extended"] = CheckChildren("b"),
	["T H I C K"] = CheckChildren("GeneralHit"),
	["Squid"] = CheckChildren("GeneralHit"),
	["Gummy"] = CheckChildren("GeneralHit"),
	["RNG"] = CheckChildren("GeneralHit"),
	["Tycoon"] = CheckChildren("GeneralHit"),
	["Charge"] = CheckChildren("GeneralHit"),
	["Baller"] = CheckChildren("GeneralHit"),
	["Tableflip"] = CheckChildren("GeneralHit"),
	["Booster"] = CheckChildren("GeneralHit"),
	["Shield"] = CheckChildren("GeneralHit"),
	["Track"] = CheckChildren("GeneralHit"),
	["Goofy"] = CheckChildren("GeneralHit"),
	["Confusion"] = CheckChildren("GeneralHit"),
	["Elude"] = CheckChildren("GeneralHit"),
	["Glitch"] = CheckChildren("GeneralHit"),
	["Snowball"] = CheckChildren("GeneralHit"),
	["fish"] = CheckChildren("GeneralHit"),
	["Killerfish"] = CheckChildren("GeneralHit"),
	["ðŸ—¿"] = CheckChildren("GeneralHit"),
	["Obby"] = CheckChildren("GeneralHit"),
	["Voodoo"] = CheckChildren("GeneralHit"),
	["Leash"] = CheckChildren("GeneralHit"),
	["Flamarang"] = CheckChildren("GeneralHit"),
	["Berserk"] = CheckChildren("GeneralHit"),
	["Quake"] = CheckChildren("GeneralHit"),
	["Rattlebones"] = CheckChildren("GeneralHit"),
	["Chain"] = CheckChildren("GeneralHit"),
	["Ping Pong"] = CheckChildren("GeneralHit"),
	["Whirlwind"] = CheckChildren("GeneralHit"),
	["Slicer"] = CheckChildren("GeneralHit"),
	["Counter"] = CheckChildren("GeneralHit"),
	["Hammer"] = CheckChildren("GeneralHit"),
	["Excavator"] = CheckChildren("GeneralHit"),
	["Home Run"] = CheckChildren("GeneralHit"),
	["Psycho"] = CheckChildren("GeneralHit"),
	["Kraken"] = CheckChildren("GeneralHit"),
	["Gravity"] = CheckChildren("GeneralHit"),
	["Lure"] = CheckChildren("GeneralHit"),
	["Jebaited"] = CheckChildren("GeneralHit"),
	["Meteor"] = CheckChildren("GeneralHit"),
	["Tinkerer"] = CheckChildren("GeneralHit"),
	["Guardian Angel"] = CheckChildren("GeneralHit"),
	["Sun"] = CheckChildren("GeneralHit"),
	["Necromancer"] = CheckChildren("GeneralHit"),
	["Zombie"] = CheckChildren("GeneralHit"),
	["Dual"] = CheckChildren("GeneralHit"),
	["Alchemist"] = CheckChildren("GeneralHit"),
	["Parry"] = CheckChildren("GeneralHit"),
	["Druid"] = CheckChildren("GeneralHit"),
	["Oven"] = CheckChildren("GeneralHit"),
	["Jester"] = CheckChildren("GeneralHit"),
	["Ferryman"] = CheckChildren("GeneralHit"),
	["Scythe"] = CheckChildren("GeneralHit"),
	["Blackhole"] = CheckChildren("GeneralHit"),
	["Santa"] = CheckChildren("GeneralHit"),
	["Grapple"] = CheckChildren("GeneralHit"),
	["Iceskate"] = CheckChildren("GeneralHit"),
	["Pan"] = CheckChildren("GeneralHit"),
	["Blasphemy"] = CheckChildren("GeneralHit"),
	["Blink"] = CheckChildren("GeneralHit"),
	["Ultra Instinct"] = CheckChildren("GeneralHit"),
	["Admin"] = CheckChildren("GeneralHit"),
	["Prop"] = CheckChildren("GeneralHit"),
	["Joust"] = CheckChildren("GeneralHit"),
	["Slapstick"] = CheckChildren("GeneralHit"),
	["Firework"] = CheckChildren("GeneralHit"),
	["Run"] = CheckChildren("GeneralHit"),
	["Beatdown"] = CheckChildren("GeneralHit"),
	["L.O.L.B.O.M.B"] = CheckChildren("GeneralHit"),
	["Glovel"] = CheckChildren("GeneralHit"),
	["Chicken"] = CheckChildren("GeneralHit"),
	["Divebomb"] = CheckChildren("GeneralHit"),
	["Lamp"] = CheckChildren("GeneralHit"),
	["Pocket"] = CheckChildren("GeneralHit"),
	["BONK"] = CheckChildren("GeneralHit"),
	["Knockoff"] = CheckChildren("GeneralHit"),
	["Divert"] = CheckChildren("GeneralHit"),
	["Frostbite"] = CheckChildren("GeneralHit"),
	["Sbeve"] = CheckChildren("GeneralHit"),
	["Plank"] = CheckChildren("GeneralHit"),
	["Golem"] = CheckChildren("GeneralHit"),
	["Spoonful"] = CheckChildren("GeneralHit"),
	["Grab"] = CheckChildren("GeneralHit"),
	["the schlop"] = CheckChildren("GeneralHit"),
	["UFO"] = CheckChildren("GeneralHit"),
	["el gato"] = CheckChildren("GeneralHit"),
	["Siphon"] = CheckChildren("GeneralHit"),
	["Hive"] = CheckChildren("GeneralHit"),
	["Wrench"] = CheckChildren("GeneralHit"),
	["Hunter"] = CheckChildren("GeneralHit"),
	["Relude"] = CheckChildren("GeneralHit"),
	["Avatar"] = CheckChildren("GeneralHit"),
	["Demolition"] = CheckChildren("GeneralHit"),
	["Shotgun"] = CheckChildren("GeneralHit"),
	["Beachball"] = CheckChildren("GeneralHit"),
	["Water"] = CheckChildren("GeneralHit"),
	["Fan"] = CheckChildren("GeneralHit"),
	["Boxer"] = CheckChildren("GeneralHit"),
	["Titan"] = CheckChildren("GeneralHit"),
	["64"] = CheckChildren("GeneralHit"),
	["Clock"] = CheckChildren("GeneralHit"),
	["Lawnmower"] = CheckChildren("GeneralHit"),
	["Snowroller"] = CheckChildren("GeneralHit"),
	["Metaverse"] = CheckChildren("GeneralHit"),
	["Medusa"] = CheckChildren("GeneralHit"),
	["Agro"] = CheckChildren("GeneralHit"),
	["Infinity"] = CheckChildren("GeneralHit"),
	["Seal"] = CheckChildren("GeneralHit"),
	["Mouse"] = CheckChildren("GeneralHit"),
	["Clover"] = CheckChildren("GeneralHit"),
	["Swordfighter"] = CheckChildren("GeneralHit"),
	["Tank"] = CheckChildren("GeneralHit"),
	["Flick"] = CheckChildren("GeneralHit"),
	["Eggler"] = CheckChildren("GeneralHit"),
	["Doomsday"] = CheckChildren("GeneralHit"),
	["Slender"] = CheckChildren("GeneralHit"),
	["R/C"] = CheckChildren("GeneralHit"),
	["Swashbuckler"] = CheckChildren("GeneralHit"),
	["Chainsaw"] = CheckChildren("GeneralHit"),
	["Mushroom"] = CheckChildren("GeneralHit"),
	["Silly"] = CheckChildren("GeneralHit"),
	["Scuba"] = CheckChildren("GeneralHit"),
	["Slasher"] = CheckChildren("GeneralHit"),
	["Pyromania"] = CheckChildren("GeneralHit"),
	["Car Keys"] = CheckChildren("GeneralHit"),
	["Trifecta"] = CheckChildren("GeneralHit"),
	["Suction"] = CheckChildren("GeneralHit"),
	["Friction"] = CheckChildren("GeneralHit"),
	["Reflect"] = CheckChildren("GeneralHit"),
	["Screwdriver"] = CheckChildren("GeneralHit"),
	["Dave"] = CheckChildren("GeneralHit"),
	["Mortis"] = CheckChildren("GeneralHit"),
	["Disc"] = CheckChildren("GeneralHit"),
	["Bounty"] = CheckChildren("GeneralHit"),
	["Grenadier"] = CheckChildren("GeneralHit"),
	["Debug"] = CheckChildren("GeneralHit"),
	["Paint"] = CheckChildren("GeneralHit"),
	["Retribution"] = CheckChildren("GeneralHit"),
	["Architect"] = CheckChildren("GeneralHit"),
	["Pylon"] = CheckChildren("GeneralHit"),
	["Plate"] = CheckChildren("GeneralHit"),
	["Walrus"] = CheckChildren("GeneralHit"),
	["Lag"] = CheckChildren("GeneralHit"),
	["Harvester"] = CheckChildren("GeneralHit"),
	["Smile"] = CheckChildren("GeneralHit"),
	["Elf"] = CheckChildren("GeneralHit"),
	["Butcher"] = CheckChildren("GeneralHit"),
	["Wheelchair"] = CheckChildren("GeneralHit"),
	["Leafblower"] = CheckChildren("GeneralHit"),
	["Conker"] = CheckChildren("GeneralHit"),
	["Automaton"] = CheckChildren("GeneralHit"),
	["Riftshot"] = CheckChildren("GeneralHit"),
	["ZZZZZZZ"] = CheckChildren("ZZZZZZZHit"),
	["Brick"] = CheckChildren("BrickHit"),
	["Snow"] = CheckChildren("SnowHit"),
	["Pull"] = CheckChildren("PullHit"),
	["Flash"] = CheckChildren("FlashHit"),
	["Spring"] = CheckChildren("springhit"),
	["Swapper"] = CheckChildren("HitSwapper"),
	["Bull"] = CheckChildren("BullHit"),
	["Dice"] = CheckChildren("DiceHit"),
	["Ghost"] = CheckChildren("GhostHit"),
	["Thanos"] = CheckChildren("ThanosHit"),
	["Stun"] = CheckChildren("HtStun"),
	["Za Hando"] = CheckChildren("zhramt"),
	["Fort"] = CheckChildren("Fort"),
	["Magnet"] = CheckChildren("MagnetHIT"),
	["Pusher"] = CheckChildren("PusherHit"),
	["Anchor"] = CheckChildren("hitAnchor"),
	["Space"] = CheckChildren("HtSpace"),
	["Boomerang"] = CheckChildren("BoomerangH"),
	["Speedrun"] = CheckChildren("Speedrunhit"),
	["Mail"] = CheckChildren("MailHit"),
	["Golden"] = CheckChildren("GoldenHit"),
	["MR"] = CheckChildren("MisterHit"),
	["Reaper"] = CheckChildren("ReaperHit"),
	["Replica"] = CheckChildren("ReplicaHit"),
	["Defense"] = CheckChildren("DefenseHit"),
	["Killstreak"] = CheckChildren("KSHit"),
	["Reverse"] = CheckChildren("ReverseHit"),
	["Shukuchi"] = CheckChildren("ShukuchiHit"),
	["Duelist"] = CheckChildren("DuelistHit"),
	["woah"] = CheckChildren("woahHit"),
	["Ice"] = CheckChildren("IceHit"),
	["Adios"] = CheckChildren("hitAdios"),
	["Blocked"] = CheckChildren("BlockedHit"),
	["Engineer"] = CheckChildren("engiehit"),
	["Rocky"] = CheckChildren("RockyHit"),
	["Conveyor"] = CheckChildren("ConvHit"),
	["STOP"] = CheckChildren("STOP"),
	["Phantom"] = CheckChildren("PhantomHit"),
	["Wormhole"] = CheckChildren("WormHit"),
	["Acrobat"] = CheckChildren("AcHit"),
	["Plague"] = CheckChildren("PlagueHit"),
	["[REDACTED]"] = CheckChildren("ReHit"),
	["bus"] = CheckChildren("hitbus"),
	["Phase"] = CheckChildren("PhaseH"),
	["Warp"] = CheckChildren("WarpHt"),
	["Bomb"] = CheckChildren("BombHit"),
	["Bubble"] = CheckChildren("BubbleHit"),
	["Jet"] = CheckChildren("JetHit"),
	["Shard"] = CheckChildren("ShardHIT"),
	["potato"] = CheckChildren("potatohit"),
	["CULT"] = CheckChildren("CULTHit"),
	["bob"] = CheckChildren("bobhit"),
	["Buddies"] = CheckChildren("buddiesHIT"),
	["Spy"] = CheckChildren("SpyHit"),
	["Detonator"] = CheckChildren("DetonatorHit"),
	["Rage"] = CheckChildren("GRRRR"),
	["Trap"] = CheckChildren("traphi"),
	["Orbit"] = CheckChildren("Orbihit"),
	["Hybrid"] = CheckChildren("HybridCLAP"),
	["Slapple"] = CheckChildren("SlappleHit"),
	["Disarm"] = CheckChildren("DisarmH"),
	["Dominance"] = CheckChildren("DominanceHit"),
	["Link"] = CheckChildren("LinkHit"),
	["Rojo"] = CheckChildren("RojoHit"),
	["rob"] = CheckChildren("robhit"),
	["Rhythm"] = CheckChildren("rhythmhit"),
	["Nightmare"] = CheckChildren("nightmarehit"),
	["Hitman"] = CheckChildren("HitmanHit"),
	["Thor"] = CheckChildren("ThorHit"),
	["Retro"] = CheckChildren("RetroHit"),
	["Cloud"] = CheckChildren("CloudHit"),
	["Null"] = CheckChildren("NullHit"),
	["spin"] = CheckChildren("spinhit"),
	["Kinetic"] = CheckChildren("HtStun"),
	["Recall"] = CheckChildren("HtStun"),
	["Balloony"] = CheckChildren("HtStun"),
	["Sparky"] = CheckChildren("HtStun"),
	["Boogie"] = CheckChildren("HtStun"),
	["Coil"] = CheckChildren("HtStun"),
	["Diamond"] = CheckChildren("DiamondHit"),
	["Megarock"] = CheckChildren("DiamondHit"),
	["Moon"] = CheckChildren("CelestialHit"),
	["Jupiter"] = CheckChildren("CelestialHit"),
	["Mitten"] = CheckChildren("MittenHit"),
	["Hallow Jack"] = CheckChildren("HallowHIT"),
	["OVERKILL"] = CheckChildren("Overkillhit"),
	["The Flex"] = CheckChildren("FlexHit"),
	["Custom"] = CheckChildren("CustomHit"),
	["God's Hand"] = CheckChildren("Godshand"),
	["Error"] = CheckChildren("Errorhit"),
	["Untitled Tag Glove"] = CheckChildren("UTGHit"),
	["Poltergeist"] = CheckChildren("UTGHit"),
}

local function GetGloveRemote()
	local player = game.Players.LocalPlayer
	local leaderstats = player:FindFirstChild("leaderstats")
	local gloveObj = leaderstats and leaderstats:FindFirstChild("Glove")
	local gloveName = gloveObj and gloveObj.Value or "Default"
	return GlovehitsTable[gloveName] or ReplicatedStorage.GeneralHit
end
local function SpawnAfterImage()
local player = game.Players.LocalPlayer
local character = player.Character
if not character then return end
local hrp = character:FindFirstChild("HumanoidRootPart")
if not hrp then return end
for _, part in ipairs(character:GetDescendants()) do
if part:IsA("BasePart") and part ~= hrp then
local ghost = Instance.new("Part")
ghost.Size = part.Size
ghost.CFrame = part.CFrame
ghost.Anchored = true
ghost.CanCollide = false
ghost.CastShadow = false
ghost.Color = Color3.fromRGB(200, 200, 255)
ghost.Material = Enum.Material.Neon
ghost.Transparency = 0.3
ghost.Parent = workspace
game:GetService("Debris"):AddItem(ghost, 0.08)
end
end
end

local function CreateHitbox(size, offset, duration)
	local player = game.Players.LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart", 5)
	local hitRemote = GetGloveRemote()

	local part = Instance.new("Part")
	part.Name = "HitboxVisual"
	part.Size = size
	part.Color = Color3.fromRGB(255, 0, 0)
	part.Transparency = 0.5
	part.CanCollide = false
	part.Anchored = false
	part.Massless = true
	part.CFrame = root.CFrame * CFrame.new(offset.X, offset.Y, offset.Z)
	part.Parent = workspace

	local weld = Instance.new("WeldConstraint")
	weld.Part0 = root
	weld.Part1 = part
	weld.Parent = part

	local hitPlayers = {}
	local RS = game:GetService("RunService")
	local conn

	-- Frame-based AABB overlap: fires remote exactly once per player the moment they enter the hitbox
	conn = RS.Heartbeat:Connect(function()
		if not part or not part.Parent then
			conn:Disconnect()
			return
		end
		local boxCF = part.CFrame
		local halfSize = size / 2
		for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
			if otherPlayer ~= player and not hitPlayers[otherPlayer] then
				local otherChar = otherPlayer.Character
				local torso = otherChar and (
					otherChar:FindFirstChild("HumanoidRootPart")
					or otherChar:FindFirstChild("Torso")
					or otherChar:FindFirstChild("UpperTorso")
				)
				if torso then
					local localPos = boxCF:PointToObjectSpace(torso.Position)
					if math.abs(localPos.X) <= halfSize.X
						and math.abs(localPos.Y) <= halfSize.Y
						and math.abs(localPos.Z) <= halfSize.Z then
						hitPlayers[otherPlayer] = true
						local targetTorso = otherChar:FindFirstChild("Torso") or otherChar:FindFirstChild("UpperTorso")
						if targetTorso then
							pcall(function() hitRemote:FireServer(targetTorso) end)
						end
					end
				end
			end
		end
	end)

	task.delay(duration, function()
		conn:Disconnect()
		if part and part.Parent then
			part:Destroy()
		end
	end)
end

do
local L = game.Players.LocalPlayer
local C = L.Character or L.CharacterAdded:Wait()
local humanoidRootPart = C:WaitForChild("HumanoidRootPart", 5)

local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = humanoidRootPart
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

local RS = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local P = game:GetService("Players").LocalPlayer
local loop, anim, track, tween
local didJump = false
local function JumpFx()
PlayS(139270438752699, 1.5)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
end
local function ActSuperJump(status)
if loop then
loop:Disconnect()
loop = nil
end
if tween then
tween:Cancel()
tween = nil
end
didJump = false
if not anim then
anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://17569164461"
end
local function getHumanoid()
local C = P.Character
if C then
return C:FindFirstChildWhichIsA("Humanoid"), C:FindFirstChild("HumanoidRootPart")
end
end
local function playAnim(H)
if not track and H then
track = H:LoadAnimation(anim)
track.Priority = Enum.AnimationPriority.Action
track:Play()
end
end
local function stopAnim()
if track then
track:Stop()
track:Destroy()
track = nil
end
end
local function tweenTimePosition(toPos)
if not track then return end
if tween then
tween:Cancel()
tween = nil
end
local goal = {TimePosition = toPos}
local info = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
tween = TweenService:Create(track, info, goal)
tween:Play()
track:AdjustSpeed(0)
tween.Completed:Connect(function()
tween = nil
end)
end
local function lerp(a, b, t)
return a + (b - a) * t
end
if status then
local lastState = nil
loop = RS.Heartbeat:Connect(function()
local H, HRP = getHumanoid()
if H and HRP then
H.JumpPower = 120
local state = H:GetState()
if state == Enum.HumanoidStateType.Jumping then
if not didJump then
coroutine.wrap(JumpFx)()
end
didJump = true
elseif state == Enum.HumanoidStateType.Landed or state == Enum.HumanoidStateType.Running then
didJump = false
end
if didJump and (state == Enum.HumanoidStateType.Jumping or state == Enum.HumanoidStateType.Freefall) then
playAnim(H)
if state == Enum.HumanoidStateType.Jumping then
if lastState ~= "jumping" then
if track then
if tween then
tween:Cancel()
tween = nil
end
track.TimePosition = 0.5
track:AdjustSpeed(0)
end
lastState = "jumping"
end
elseif HRP.Velocity.Y <= 0 then
local fallVel = HRP.Velocity.Y
local fallVelAbs = math.abs(fallVel)
local maxVel = 100
local t = math.clamp(fallVelAbs / maxVel, 0, 1)
local targetTime = lerp(0.35, 0.1, t)
if lastState ~= "falling" or (track and math.abs(track.TimePosition - targetTime) > 0.01) then
tweenTimePosition(targetTime)
lastState = "falling"
end
end
else
stopAnim()
lastState = nil
end
end
end)
else
local H = getHumanoid()
if H then
H.JumpPower = 50
end
stopAnim()
if tween then
tween:Cancel()
tween = nil
end
didJump = false
end
end
local UIS = game:GetService("UserInputService")
local TB = false

B.MouseButton1Click:Connect(function()
TB = not TB
B.Text = TB and "Disable\nSuper Jump\n[1]" or "Enable\nSuper Jump\n[1]"
B.BackgroundColor3 = TB and Color3.fromRGB(255,255,255) or Color3.fromRGB(0,0,0)
B.TextColor3 = TB and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
ActSuperJump(TB)
end)

local inputConn
inputConn = UIS.InputBegan:Connect(function(input, gameProcessed)
if gameProcessed then return end
if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Q then
TB = not TB
B.Text = TB and "Disable\nSuper Jump\n[Q]" or "Enable\nSuper Jump\n[Q]"
B.BackgroundColor3 = TB and Color3.fromRGB(255,255,255) or Color3.fromRGB(0,0,0)
B.TextColor3 = TB and Color3.fromRGB(0,0,0) or Color3.fromRGB(255,255,255)
ActSuperJump(TB)
end
end)

GuiA.AncestryChanged:Connect(function(child, parent)
if not parent then
if inputConn then
inputConn:Disconnect()
inputConn = nil
end
TB = false
ActSuperJump(false)
end
end)
end

local function PunchT()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
local animator = humanoid:WaitForChild("Animator", 5)
local animLeftId = "rbxassetid://109511274923523"
local animRightId = "rbxassetid://133068451086106"
local leftArm = character:FindFirstChild("LeftUpperArm") or character:FindFirstChild("Left Arm")
local rightArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm")
local function createBlueBall(arm)
local ball = Instance.new("MeshPart")
ball.Size = Vector3.new(1, 1, 1)
ball.MeshId = "rbxassetid://2284371020"
ball.Color = Color3.fromRGB(150, 150, 255)
ball.Material = Enum.Material.Plastic
ball.Anchored = false
ball.CanCollide = false
ball.CFrame = arm.CFrame * CFrame.new(0, -2.5, 0)
ball.Parent = workspace
local weld = Instance.new("WeldConstraint")
weld.Part0 = arm
weld.Part1 = ball
weld.Parent = ball
local function createAttachment(pos)
local attach = Instance.new("Attachment")
attach.Position = pos
attach.Parent = ball
return attach
end
local trail = Instance.new("Trail")
trail.Attachment0 = createAttachment(Vector3.new(0, 1, 0))
trail.Attachment1 = createAttachment(Vector3.new(0, -1, 0))
trail.Texture = "rbxassetid://16287894587"
trail.Color = ColorSequence.new(Color3.fromRGB(225, 225, 225))
trail.Lifetime = 1
trail.Transparency = NumberSequence.new(0)
trail.LightEmission = 0
trail.FaceCamera = true
trail.Parent = ball
return ball
end
local function playAnimation(animId, timePos)
local anim = Instance.new("Animation")
anim.AnimationId = animId
local track = animator:LoadAnimation(anim)
track.Priority = Enum.AnimationPriority.Action
track:Play()
track.TimePosition = timePos
return track
end
local choice = math.random(1, 2)
local selectedArm, selectedAnimId, startTime
if choice == 1 then
selectedArm = leftArm
selectedAnimId = animLeftId
startTime = 0.2
else
selectedArm = rightArm
selectedAnimId = animRightId
startTime = 0.05
end
local track = playAnimation(selectedAnimId, startTime)
local ball = createBlueBall(selectedArm)
track.Stopped:Wait()
if ball then ball:Destroy() end
end

local function OverHead()

local function OverHeadTp()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)

local function getClosestInFront()
local forward = hrp.CFrame.LookVector
local origin = hrp.Position
local closest, shortest = nil, math.huge

for _, other in ipairs(Players:GetPlayers()) do
if other ~= player and other.Character and other.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = other.Character.HumanoidRootPart
local direction = (targetHRP.Position - origin).Unit
local dot = forward:Dot(Vector3.new(direction.X, 0, direction.Z).Unit)

if dot > 0.5 then
local dist = (targetHRP.Position - origin).Magnitude
if dist < shortest then
shortest = dist
closest = other
end
end
end
end
return closest
end

local target = getClosestInFront()
if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = target.Character.HumanoidRootPart
local offset = (hrp.Position - targetHRP.Position)
offset = Vector3.new(offset.X, 0, offset.Z).Unit

local newPos = targetHRP.Position + offset * 2 + Vector3.new(0, 3, 0)
local currentRotation = hrp.CFrame - hrp.Position
hrp.CFrame = CFrame.new(newPos) * currentRotation
end
end

local function PlaySE(N, times)
for _ = 1, times do
coroutine.wrap(function()
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote", 5):InvokeServer(N,game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso")) end)
end)()
end
end

local function OverheadSfx()
local hrp = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
hrp = hrp:WaitForChild("HumanoidRootPart", 5)
local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = hrp
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end
PlayS(75233844730127, 1)
wait(0.1)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
PlayS(18694755502, 0.7)
end
local function BlueFlash()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(5, 0, 5, 0)
gui.Adornee = hrp
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Parent = hrp
local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.BackgroundTransparency = 1
image.Size = UDim2.new(0.5, 0, 0.5, 0)
image.Image = "rbxassetid://127539265797898"
image.ImageTransparency = 0
image.ScaleType = Enum.ScaleType.Fit
image.Parent = gui
local grow = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
grow:Play()
grow.Completed:Wait()
wait(0.05)
local shrink = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0.1, 0, 0.1, 0)
})
shrink:Play()
shrink.Completed:Wait()
wait(0.01)
gui:Destroy()
end
local function OverheadAnim()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://16144846625"
local track = humanoid:LoadAnimation(anim)
track:Play()
track.TimePosition = 0.15
track:AdjustSpeed(0)
task.wait(0.1)
track:AdjustSpeed(1.5)
local connection
connection = RunService.RenderStepped:Connect(function()
if track.TimePosition >= 0.41 then
connection:Disconnect()
track:AdjustSpeed(0)
track.TimePosition = 0.42
task.wait(0.3)
track:Stop()
end
end)
end

local function OverHeadSEAura()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart", 5)
local part = Instance.new("Part")
part.Anchored = true
part.CanCollide = false
part.Transparency = 1
part.Size = Vector3.new(1, 1, 1)
part.CFrame = root.CFrame
part.Parent = workspace
local billboard = Instance.new("BillboardGui")
billboard.Size = UDim2.new(2, 0, 2, 0)
billboard.AlwaysOnTop = true
billboard.Parent = part
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(1, 0, 1, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://1057939773"
imageLabel.ImageColor3 = Color3.fromRGB(50, 255, 255)
imageLabel.ImageTransparency = 0
imageLabel.Parent = billboard
local tweenService = game:GetService("TweenService")
local sizeTween = tweenService:Create(billboard, TweenInfo.new(1, Enum.EasingStyle.Quad), {
Size = UDim2.new(30, 0, 30, 0)
})
local transparencyTween = tweenService:Create(imageLabel, TweenInfo.new(1, Enum.EasingStyle.Quad), {
ImageTransparency = 1
})
sizeTween:Play()
transparencyTween:Play()
transparencyTween.Completed:Connect(function()
if part then part:Destroy()
end
end)
end

local function OverheadStill()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart", 5)
local startCFrame = root.CFrame
task.spawn(function()
local startTime = tick()
while tick() - startTime < 0.7 do
root.Velocity = Vector3.zero
root.AssemblyLinearVelocity = Vector3.zero
root.AssemblyAngularVelocity = Vector3.zero
root.CFrame = startCFrame
task.wait(0.01)
end
end)
end

local function OverheadTrail()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local leftArm = character:FindFirstChild("LeftUpperArm") or character:FindFirstChild("Left Arm")
local rightArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm")
local function createBlueBall(arm)
local ball = Instance.new("MeshPart")
ball.Size = Vector3.new(1, 1, 1)
ball.MeshId = "rbxassetid://2284371020"
ball.Color = Color3.fromRGB(150, 150, 255)
ball.Material = Enum.Material.Plastic
ball.Anchored = false
ball.CanCollide = false
ball.CFrame = arm.CFrame * CFrame.new(0, -5, 0)
ball.Parent = workspace
local weld = Instance.new("WeldConstraint")
weld.Part0 = arm
weld.Part1 = ball
weld.Parent = ball
local function createAttachment(pos)
local attach = Instance.new("Attachment")
attach.Position = pos
attach.Parent = ball
return attach
end
local trail = Instance.new("Trail")
trail.Attachment0 = createAttachment(Vector3.new(0, 1, 0))
trail.Attachment1 = createAttachment(Vector3.new(0, -1, 0))
trail.Texture = "rbxassetid://16287894587"
trail.Color = ColorSequence.new(Color3.fromRGB(225, 225, 225))
trail.Lifetime = 1
trail.Transparency = NumberSequence.new(0)
trail.LightEmission = 0
trail.FaceCamera = true
trail.Parent = ball
return ball
end
local chosenArm = math.random(1, 1) == 1 and leftArm or rightArm
local ball = createBlueBall(chosenArm)
task.delay(0.3, function()
if ball then ball:Destroy() end
end)
end
coroutine.wrap(OverHeadTp)()
wait(0.06)
coroutine.wrap(OverHeadSEAura)()
coroutine.wrap(OverheadStill)()
coroutine.wrap(OverheadAnim)()
coroutine.wrap(BlueFlash)()
coroutine.wrap(OverheadSfx)()
wait(0.1)
coroutine.wrap(SpawnAfterImage)()
CreateHitbox(Vector3.new(26, 38, 38), Vector3.new(0, -2, -4), 0.4)
task.delay(0.01, function() coroutine.wrap(SpawnAfterImage)() end)
coroutine.wrap(OverheadTrail)()
wait(0.5)
coroutine.wrap(StopFling)()
end

local function Uppercut()
local function AnimUppercut()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid", 5)
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://16102907464"
local track = humanoid:LoadAnimation(animation)
track:Play()
track.TimePosition = 1.1
track:AdjustSpeed(0)
wait(0.6)
for t = 1.1, 0.5, -0.03 do
track.TimePosition = t
task.wait(0.01)
end

track:AdjustSpeed(0)
wait(1)
track:Stop()
end

local function Drag()
local player = game:GetService("Players").LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)
hrp.Velocity = Vector3.new(0, 150, 0)
end

local function UppercutArmT()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rightArm = character:FindFirstChild("RightUpperArm") or character:FindFirstChild("Right Arm")
local function createBlueBall(arm)
local ball = Instance.new("MeshPart")
ball.Size = Vector3.new(1, 1, 1)
ball.MeshId = "rbxassetid://2284371020"
ball.Color = Color3.fromRGB(150, 150, 255)
ball.Material = Enum.Material.Plastic
ball.Anchored = false
ball.CanCollide = false
ball.CFrame = arm.CFrame * CFrame.new(0, -2.5, 0)
ball.Parent = workspace

local weld = Instance.new("WeldConstraint")
weld.Part0 = arm
weld.Part1 = ball
weld.Parent = ball

local function createAttachment(pos)
local attach = Instance.new("Attachment")
attach.Position = pos
attach.Parent = ball
return attach
end

local trail = Instance.new("Trail")
trail.Attachment0 = createAttachment(Vector3.new(0, 1, 0))
trail.Attachment1 = createAttachment(Vector3.new(0, -1, 0))
trail.Texture = "rbxassetid://16287894587"
trail.Color = ColorSequence.new(Color3.fromRGB(225, 225, 255))
trail.Lifetime = 1
trail.Transparency = NumberSequence.new(0)
trail.LightEmission = 0
trail.FaceCamera = true
trail.Parent = ball

return ball
end

local ball = createBlueBall(rightArm)
task.delay(1.2, function()
if ball then ball:Destroy() end
end)
end

local function UppercutTp()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)

local function DragEffect(startPos, endPos)
local direction = (endPos - startPos).Unit
local maxDistance = (endPos - startPos).Magnitude
local traveled = 0
while traveled < maxDistance do
local gas = Instance.new("MeshPart")
gas.MeshId = "rbxassetid://4729380505"
gas.Size = Vector3.new(1, 20, 0.5)
gas.Position = startPos + direction * traveled - Vector3.new(0, 10, 0)
gas.Anchored = true
gas.CanCollide = false
gas.CastShadow = false
gas.Transparency = 0
gas.Material = Enum.Material.ForceField
gas.Color = Color3.fromRGB(255, 255, 255)
gas.Parent = workspace
local targetPos = gas.Position + Vector3.new(math.random(-10, 10), 40, math.random(-10, 10))
gas.CFrame = CFrame.lookAt(gas.Position, targetPos) * CFrame.Angles(math.rad(90), 0, 0)
local tween = TweenService:Create(gas, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {Position = targetPos, Transparency = 1})
tween:Play()
tween.Completed:Connect(function()
if gas and gas.Parent then
gas:Destroy()
end
end)

if traveled % 0.5 < 0.1 then
local part = Instance.new("MeshPart")
part.MeshId = "rbxassetid://10433873780"
part.TextureID = "rbxassetid://7060550066"
part.Size = Vector3.new(1.5, 1.5, 1.5)
part.Position = startPos + direction * traveled + Vector3.new(math.random(-2, 2), -3, math.random(-2, 2))
part.Anchored = true
part.CanCollide = false
part.CastShadow = false
part.Orientation = Vector3.new(math.random(-40, 40), math.random(-40, 40), math.random(-40, 40))
part.Parent = workspace
coroutine.wrap(function()
wait(3)
local fadeTween = TweenService:Create(part, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Transparency = 1})
fadeTween:Play()
fadeTween.Completed:Wait()
if part and part.Parent then
part:Destroy()
end
end)()
end

if traveled % 10 < 0.1 then
local PTCL = Instance.new("MeshPart")
PTCL.MeshId = "rbxassetid://10433873780"
PTCL.TextureID = "rbxassetid://7060550066"
PTCL.Size = Vector3.new(0.7, 0.7, 0.7)
PTCL.Position = startPos + direction * traveled
PTCL.Anchored = false
PTCL.CanCollide = false
PTCL.Parent = workspace
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = (Vector3.new(math.random(-10, 10), 10, math.random(-10, 10))).Unit * math.random(25, 50)
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.P = 5000
bodyVelocity.Parent = PTCL
PTCL.CFrame = PTCL.CFrame * CFrame.Angles(math.random(), math.random(), math.random())
local attachment0 = Instance.new("Attachment", PTCL)
local attachment1 = Instance.new("Attachment", PTCL)
attachment1.Position = Vector3.new(0, -0.5, 0)
local trail = Instance.new("Trail")
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Parent = PTCL
trail.Color = ColorSequence.new(Color3.fromRGB(150, 150, 150))
trail.Lifetime = 0.5
trail.WidthScale = NumberSequence.new(1, 1)
trail.FaceCamera = true
trail.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0, 0),
NumberSequenceKeypoint.new(1, 1),
})
coroutine.wrap(function()
wait(0.2)
if bodyVelocity and bodyVelocity.Parent then
bodyVelocity:Destroy()
end
if PTCL and PTCL.Parent then
PTCL.CanCollide = true
end
end)()
Debris:AddItem(PTCL, 5)
end

traveled = traveled + 2
end
end

local forward = hrp.CFrame.LookVector
local origin = hrp.Position
local closest, shortest = nil, math.huge

for _, other in ipairs(Players:GetPlayers()) do
if other ~= player and other.Character and other.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = other.Character.HumanoidRootPart
local direction = (targetHRP.Position - origin).Unit
local dot = forward:Dot(Vector3.new(direction.X, 0, direction.Z).Unit)
if dot > 0.5 then
local dist = (targetHRP.Position - origin).Magnitude
if dist < shortest then
shortest = dist
closest = other
end
end
end
end

if closest and closest.Character and closest.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = closest.Character.HumanoidRootPart
local offset = (hrp.Position - targetHRP.Position)
offset = Vector3.new(offset.X, 0, offset.Z).Unit

local newPos = targetHRP.Position + offset * 5 + Vector3.new(0, 2, 0)
local currentRotation = hrp.CFrame - hrp.Position

local oldPos = hrp.Position
hrp.CFrame = CFrame.new(newPos) * currentRotation

DragEffect(oldPos, newPos)
end
end

local function UppercutHit()

local function FloatAndLookUp()
local P = game:GetService("Players").LocalPlayer
local C = P.Character or P.CharacterAdded:Wait()
local HRP = C:WaitForChild("HumanoidRootPart", 5)
local originalCFrame = HRP.CFrame
local floatPosition = HRP.Position
local originalLookVector = originalCFrame.LookVector
local lookUpDirection = floatPosition + Vector3.new(0, 1000, 0)
local originalYaw = CFrame.new(floatPosition, floatPosition + Vector3.new(originalLookVector.X, 0, originalLookVector.Z))
local lookUpCFrame = CFrame.new(floatPosition, lookUpDirection)
task.spawn(function()
local t = tick()
while tick() - t < 0.4 do
HRP.Velocity = Vector3.zero
HRP.AssemblyLinearVelocity = Vector3.zero
HRP.AssemblyAngularVelocity = Vector3.zero
local rotOnly = originalYaw - originalYaw.Position
local final = CFrame.new(floatPosition) * rotOnly * CFrame.Angles(-math.rad(-90), 0, 0)
HRP.CFrame = final
task.wait(0.01)
end
HRP.CFrame = originalCFrame
end)
end
coroutine.wrap(FloatAndLookUp)()
wait(0.2)
coroutine.wrap(SpawnAfterImage)()
CreateHitbox(Vector3.new(38, 28, 46), Vector3.new(0, 0, -5), 0.15)
task.delay(0.01, function() coroutine.wrap(SpawnAfterImage)() end)
end
local function BlueFlash()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(5, 0, 5, 0)
gui.Adornee = hrp
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Parent = hrp
local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.BackgroundTransparency = 1
image.Size = UDim2.new(0.5, 0, 0.5, 0)
image.Image = "rbxassetid://127539265797898"
image.ImageTransparency = 0
image.ScaleType = Enum.ScaleType.Fit
image.Parent = gui
local grow = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
grow:Play()
grow.Completed:Wait()
wait(0.05)
local shrink = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0.1, 0, 0.1, 0)
})
shrink:Play()
shrink.Completed:Wait()
wait(0.01)
gui:Destroy()
end

local function PlaySE(N, times)
for _ = 1, times do
coroutine.wrap(function()
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote", 5):InvokeServer(N,game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso")) end)
end)()
end
end

local function UppercutSfx()

local hrp = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
hrp = hrp:WaitForChild("HumanoidRootPart", 5)
local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = hrp
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end
PlayS(75233844730127, 1)
PlayS(96076010230734, 2)
end

pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
coroutine.wrap(BlueFlash)()
coroutine.wrap(UppercutSfx)()
coroutine.wrap(AnimUppercut)()
wait(0.2)
coroutine.wrap(UppercutTp)()
wait(0.1)
coroutine.wrap(UppercutArmT)()
coroutine.wrap(UppercutHit)()
wait(0.4)
local P = game:GetService("Players").LocalPlayer
local C = P.Character or P.CharacterAdded:Wait()
local H = C:WaitForChild("Humanoid", 5)
coroutine.wrap(StopFling)()
coroutine.wrap(Drag)()
wait(0.75)
coroutine.wrap(StopFling)()
end

local function DieAbility()
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")

local function PlayPunchSnd()
local snd = Instance.new("Sound")
snd.SoundId = "rbxassetid://18694755502"
snd.Volume = 1.5
snd.Parent = hrp
snd:Play()
snd.Ended:Connect(function() snd:Destroy() end)
local snd2 = Instance.new("Sound")
snd2.SoundId = "rbxassetid://75233844730127"
snd2.Volume = 1
snd2.Parent = hrp
snd2:Play()
snd2.Ended:Connect(function() snd2:Destroy() end)
end

local function DieFlash()
local Players = game:GetService("Players")
local tws = game:GetService("TweenService")
local char2 = player.Character or player.CharacterAdded:Wait()
local hrp2 = char2:WaitForChild("HumanoidRootPart", 5)
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(4, 0, 4, 0)
gui.Adornee = hrp2
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Parent = hrp2
local img = Instance.new("ImageLabel")
img.AnchorPoint = Vector2.new(0.5, 0.5)
img.Position = UDim2.new(0.5, 0, 0.5, 0)
img.BackgroundTransparency = 1
img.Size = UDim2.new(0.4, 0, 0.4, 0)
img.Image = "rbxassetid://127539265797898"
img.ImageTransparency = 0
img.ScaleType = Enum.ScaleType.Fit
img.Parent = gui
local grow = tws:Create(img, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
grow:Play()
grow.Completed:Wait()
local shrink = tws:Create(img, TweenInfo.new(0.07, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0.05, 0, 0.05, 0)})
shrink:Play()
shrink.Completed:Wait()
gui:Destroy()
end

local function getClosestEnemy()
local closest, shortest = nil, math.huge
for _, p in ipairs(players:GetPlayers()) do
if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
local dist = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
if dist < shortest then
shortest = dist
closest = p
end
end
end
return closest
end

local function DragEffect(startPos, endPos)
local dir = (endPos - startPos).Unit
local dist = (endPos - startPos).Magnitude
local traveled = 0
while traveled < dist do
local gas = Instance.new("MeshPart")
gas.MeshId = "rbxassetid://4729380505"
gas.Size = Vector3.new(1, 20, 0.5)
gas.Position = startPos + dir * traveled - Vector3.new(0, 10, 0)
gas.Anchored = true
gas.CanCollide = false
gas.CastShadow = false
gas.Transparency = 0
gas.Material = Enum.Material.ForceField
gas.Color = Color3.fromRGB(255, 100, 100)
gas.Parent = workspace
local targetPos = gas.Position + Vector3.new(math.random(-8,8), 40, math.random(-8,8))
gas.CFrame = CFrame.lookAt(gas.Position, targetPos) * CFrame.Angles(math.rad(90), 0, 0)
local tw = TweenService:Create(gas, TweenInfo.new(0.25, Enum.EasingStyle.Linear), {Position = targetPos, Transparency = 1})
tw:Play()
tw.Completed:Connect(function() if gas and gas.Parent then gas:Destroy() end end)
traveled = traveled + 3
end
end

local function PunchAnim()
local anim = Instance.new("Animation")
local animIds = {"rbxassetid://109511274923523", "rbxassetid://133068451086106"}
anim.AnimationId = animIds[math.random(1,2)]
local track = humanoid:LoadAnimation(anim)
track.Priority = Enum.AnimationPriority.Action
track:Play()
track.TimePosition = 0.1
task.delay(0.4, function() track:Stop() end)
end

showMessage("Die!", 0)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)

local target = getClosestEnemy()
if not target or not target.Character then return end
local targetHrp = target.Character.HumanoidRootPart

local prevPos = hrp.Position
local offset = (hrp.Position - targetHrp.Position)
offset = Vector3.new(offset.X, 0, offset.Z).Unit * 3
local tpPos = targetHrp.Position + offset
hrp.CFrame = CFrame.new(tpPos, targetHrp.Position)
coroutine.wrap(DragEffect)(prevPos, tpPos)

for punch = 1, 5 do
local tChar = target.Character
if not tChar or not tChar:FindFirstChild("HumanoidRootPart") then break end
local tHrp = tChar.HumanoidRootPart

local newOffset = (hrp.Position - tHrp.Position)
newOffset = Vector3.new(newOffset.X, 0, newOffset.Z).Unit * 3
local newTp = tHrp.Position + newOffset
hrp.CFrame = CFrame.new(newTp, tHrp.Position)

coroutine.wrap(DieFlash)()
coroutine.wrap(PlayPunchSnd)()
coroutine.wrap(PunchAnim)()
coroutine.wrap(function()
local dieVoiceId = math.random(1,2) == 1 and 7007955646 or 7007955031
local vs = Instance.new("Sound")
vs.SoundId = "rbxassetid://" .. dieVoiceId
vs.Volume = 1.2
vs.Parent = hrp
vs:Play()
vs.Ended:Connect(function() vs:Destroy() end)
end)()

coroutine.wrap(SpawnAfterImage)()
CreateHitbox(Vector3.new(32, 26, 32), Vector3.new(0, 0, -4), 0.35)
task.delay(0.01, function() coroutine.wrap(SpawnAfterImage)() end)

pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)

if punch < 5 then
wait(1.2)
end
end


coroutine.wrap(function()
local sw = Instance.new("MeshPart")
sw.MeshId = "rbxassetid://6797156017"
sw.Size = Vector3.new(8, 8, 8)
sw.Position = hrp.Position
sw.Anchored = true
sw.CanCollide = false
sw.Transparency = 0.5
sw.Color = Color3.fromRGB(255, 80, 80)
sw.Material = Enum.Material.Neon
sw.Parent = workspace
local tw = TweenService:Create(sw, TweenInfo.new(1, Enum.EasingStyle.Sine), {Size = Vector3.new(60, 60, 60), Transparency = 1})
tw:Play()
tw.Completed:Connect(function() sw:Destroy() end)
end)()

coroutine.wrap(StopFling)()
end

local function Judgement()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)
local closestPlayer = nil
local shortestDistance = math.huge

pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("runeffect") end)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("cancelrun") end)

local animationIds = {
Crouch = "rbxassetid://13675136513"
}

local animations = {}

for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end

local function PlaySE(N, times)
for _ = 1, times do
coroutine.wrap(function()
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote", 5):InvokeServer(N,game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso")) end)
end)()
end
end

local function BlueWave()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local BasePosition = humanoidRootPart.Position + Vector3.new(0, 2, 0)
local SWB = Instance.new("MeshPart")
SWB.MeshId = "rbxassetid://12756704717"
SWB.Size = Vector3.new(0.2,0.2,0.2)
SWB.Position = humanoidRootPart.Position
SWB.Anchored = true
SWB.Name = "SWB"
SWB.CanCollide = false
SWB.Transparency = 0.5
SWB.Color = Color3.fromRGB(50,255,255)
SWB.Material = Enum.Material.Neon
SWB.Parent = workspace
SWB.CastShadow = false
local TweenService = game:GetService("TweenService")
local SizeGoal2 = {Size = Vector3.new(10,10,10), Transparency = 1}
local TweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local Tween1 = TweenService:Create(SWB, TweenInfo, SizeGoal2)
Tween1:Play()
Tween1.Completed:Connect(function()
SWB:Destroy()
end)
end

local function YellowFlash()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(5, 0, 5, 0)
gui.Adornee = hrp
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Parent = hrp
local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.BackgroundTransparency = 1
image.Size = UDim2.new(0.5, 0, 0.5, 0)
image.Image = "rbxassetid://99571472264097"
image.ImageTransparency = 0
image.ScaleType = Enum.ScaleType.Fit
image.Parent = gui
local grow = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
grow:Play()
grow.Completed:Wait()
wait(0.05)
local shrink = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0.1, 0, 0.1, 0)
})
shrink:Play()
shrink.Completed:Wait()
wait(0.01)
gui:Destroy()
end

local function BlueP2()
for _ = 1, math.random(30,30) do
local p = Instance.new("Part")
p.Size = Vector3.new(0.3,500,0.3)
p.Color = Color3.fromRGB(50,255,255)
p.Material = Enum.Material.Neon
p.Anchored = true
p.CanCollide = false
p.CastShadow = false
p.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.random()*math.pi*2,math.random()*math.pi*2,math.random()*math.pi*2)
p.Parent = game.Workspace
spawn(function()
for i = 0.7,1,0.05 do
p.Transparency = i
wait(0.05)
end
p:Destroy()
end)
end
end

local function PlayS(id, loudness)
local player = game.Players.LocalPlayer
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Parent = player.Character:WaitForChild("HumanoidRootPart", 5)
sound.Volume = loudness
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

local function JudgementS()
local Judgementtt = math.random(1, 2) == 1 and 7007957795 or 7007957247
PlayS(Judgementtt, 0.7)
PlayS(6996368591, 1)
wait(1.2)
PlayS(6870001262, 1.6)
PlayS(75233844730127, 2)
wait(0.2)
PlayS(7007956313, 2)
end

local function Flash()
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
end

local function FC()
humanoidRootPart.Anchored = true
end
local function UFC()
humanoidRootPart.Anchored = false
end
local function JudgementAN()
animations.Crouch:Play()
animations.Crouch.TimePosition = 3
animations.Crouch:AdjustSpeed(0)
end

local function Dialogue()
showMessage("Judgement!", 0)
end

local function Banggg()
wait(0.05)
pcall(function() game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb") end)
local bvhrp = character:WaitForChild("HumanoidRootPart", 5)
local bv3 = bvhrp:FindFirstChild("BodyVelocity") or bvhrp:WaitForChild("BodyVelocity", 3)
if bv3 then bv3:Destroy() end
end

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local function DragEffect(startPos, endPos)
local direction = (endPos - startPos).Unit
local maxDistance = (endPos - startPos).Magnitude
local traveled = 0
while traveled < maxDistance do
local gas = Instance.new("MeshPart")
gas.MeshId = "rbxassetid://4729380505"
gas.Size = Vector3.new(1, 20, 0.5)
gas.Position = startPos + direction * traveled - Vector3.new(0, 10, 0)
gas.Anchored = true
gas.CanCollide = false
gas.CastShadow = false
gas.Transparency = 0
gas.Material = Enum.Material.ForceField
gas.Color = Color3.fromRGB(255, 255, 255)
gas.Parent = workspace
local targetPos = gas.Position + Vector3.new(math.random(-10, 10), 40, math.random(-10, 10))
gas.CFrame = CFrame.lookAt(gas.Position, targetPos) * CFrame.Angles(math.rad(90), 0, 0)
local tween = TweenService:Create(gas, TweenInfo.new(0.3, Enum.EasingStyle.Linear), {Position = targetPos, Transparency = 1})
tween:Play()
tween.Completed:Connect(function()
if gas and gas.Parent then
gas:Destroy()
end
end)
if traveled % 0.5 < 0.1 then
local part = Instance.new("MeshPart")
part.MeshId = "rbxassetid://10433873780"
part.TextureID = "rbxassetid://7060550066"
part.Size = Vector3.new(1.5, 1.5, 1.5)
part.Position = startPos + direction * traveled + Vector3.new(math.random(-2, 2), -3, math.random(-2, 2))
part.Anchored = true
part.CanCollide = false
part.CastShadow = false
part.Orientation = Vector3.new(math.random(-40, 40), math.random(-40, 40), math.random(-40, 40))
part.Parent = workspace
coroutine.wrap(function()
wait(3)
local fadeTween = TweenService:Create(part, TweenInfo.new(1.5, Enum.EasingStyle.Linear), {Transparency = 1})
fadeTween:Play()
fadeTween.Completed:Wait()
if part and part.Parent then
part:Destroy()
end
end)()
end
if traveled % 10 < 0.1 then
local PTCL = Instance.new("MeshPart")
PTCL.MeshId = "rbxassetid://10433873780"
PTCL.TextureID = "rbxassetid://7060550066"
PTCL.Size = Vector3.new(0.7, 0.7, 0.7)
PTCL.Position = startPos + direction * traveled
PTCL.Anchored = false
PTCL.CanCollide = false
PTCL.Parent = workspace
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = (Vector3.new(math.random(-10, 10), 10, math.random(-10, 10))).Unit * math.random(25, 50)
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.P = 5000
bodyVelocity.Parent = PTCL
PTCL.CFrame = PTCL.CFrame * CFrame.Angles(math.random(), math.random(), math.random())
local attachment0 = Instance.new("Attachment", PTCL)
local attachment1 = Instance.new("Attachment", PTCL)
attachment1.Position = Vector3.new(0, -0.5, 0)
local trail = Instance.new("Trail")
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Parent = PTCL
trail.Color = ColorSequence.new(Color3.fromRGB(150, 150, 150))
trail.Lifetime = 0.5
trail.WidthScale = NumberSequence.new(1, 1)
trail.FaceCamera = true
trail.Transparency = NumberSequence.new({
NumberSequenceKeypoint.new(0, 0),
NumberSequenceKeypoint.new(1, 1),
})
coroutine.wrap(function()
wait(0.2)
if bodyVelocity and bodyVelocity.Parent then
bodyVelocity:Destroy()
end
if PTCL and PTCL.Parent then
PTCL.CanCollide = true
end
end)()
Debris:AddItem(PTCL, 5)
end
traveled = traveled + 2
end
end

local function LookThenTpUpward()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local function getClosestInFront()
local forward = hrp.CFrame.LookVector
local origin = hrp.Position
local closest, shortest = nil, math.huge
for _, other in ipairs(Players:GetPlayers()) do
if other ~= player and other.Character and other.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = other.Character.HumanoidRootPart
local direction = (targetHRP.Position - origin).Unit
local dot = forward:Dot(Vector3.new(direction.X, 0, direction.Z).Unit)
if dot > 0.5 then
local dist = (targetHRP.Position - origin).Magnitude
if dist < shortest then
shortest = dist
closest = other
end
end
end
end
return closest
end
local target = getClosestInFront()
if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
local targetHRP = target.Character.HumanoidRootPart
local targetVelocity = targetHRP.Velocity
local offset = hrp.Position - targetHRP.Position
offset = Vector3.new(offset.X, 0, offset.Z).Unit * 3
local predictionTime = 0.5
local predictedPos = targetHRP.Position + Vector3.new(targetVelocity.X, 0, targetVelocity.Z) * predictionTime
local h = Instance.new("Highlight")
h.Adornee = target.Character
h.FillColor = Color3.new(1, 1, 1)
h.FillTransparency = 1
h.OutlineColor = Color3.new(1, 1, 1)
h.OutlineTransparency = 0
h.Parent = target.Character
local start = tick()
while tick() - start < 1.2 do
local currentPos = predictedPos
local lookAt = Vector3.new(currentPos.X, hrp.Position.Y, currentPos.Z)
hrp.CFrame = CFrame.lookAt(hrp.Position, lookAt)
task.wait()
if targetHRP.Parent then
local vel = targetHRP.Velocity
predictedPos = targetHRP.Position + Vector3.new(vel.X, 0, vel.Z) * predictionTime
end
end
local previousPosition = hrp.Position
local newPos = predictedPos + offset
local horizontalLook = CFrame.lookAt(newPos, predictedPos)
local pitchUp = CFrame.Angles(math.rad(90), 0, 0)
local finalCFrame = horizontalLook * pitchUp
hrp.CFrame = finalCFrame
local newPosition = hrp.Position
DragEffect(previousPosition, newPosition)
task.wait(0.1)
local lockStart = tick()
while tick() - lockStart < 0.6 do
if hrp and hrp.Parent then
hrp.Velocity = Vector3.zero
hrp.CFrame = finalCFrame
end
task.wait(0.01)
end
if h and h.Parent then
h:Destroy()
end
end
end

game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5).WalkSpeed = 0
coroutine.wrap(LookThenTpUpward)()
coroutine.wrap(JudgementS)()
coroutine.wrap(Dialogue)()
coroutine.wrap(JudgementAN)()
wait(0.4)
Flash()
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("dash") end)
wait(0.8)
coroutine.wrap(YellowFlash)()
pcall(function() game:GetService("ReplicatedStorage").Prop:FireServer() end)
wait(0.2)
animations.Crouch:Stop()
coroutine.wrap(BlueP2)()
coroutine.wrap(Banggg)()
coroutine.wrap(BlueWave)()
coroutine.wrap(SpawnAfterImage)()
CreateHitbox(Vector3.new(38, 38, 38), Vector3.new(0, 0, -2), 0.4)
task.delay(0.01, function() coroutine.wrap(SpawnAfterImage)() end)
wait(0.7)
game.Players.LocalPlayer.Character:WaitForChild("Humanoid", 5).WalkSpeed = 25
local P = game:GetService("Players").LocalPlayer
local C = P.Character or P.CharacterAdded:Wait()
local H = C:WaitForChild("Humanoid", 5)
coroutine.wrap(StopFling)()
end

local function CrushAbility()
local function DieAnim()
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local humanoid = character:WaitForChild("Humanoid", 5)

local animationIds = {
Dropkick = "rbxassetid://122236786027040",
Flip = "rbxassetid://16144846625"
}

local animations = {}
for name, id in pairs(animationIds) do
local animation = Instance.new("Animation")
animation.AnimationId = id
animations[name] = humanoid:LoadAnimation(animation)
end

animations.Dropkick:Play()
animations.Dropkick.TimePosition = 0.5
animations.Dropkick:AdjustSpeed(0)
wait(0.5)
animations.Dropkick:Stop()
animations.Flip:Play()
animations.Flip.TimePosition = 0.4
animations.Flip:AdjustSpeed(0)
wait(0.3)
animations.Flip:Stop()
end

local function FloatThenTpToSurface()
local runService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart", 5)

local originalCF = hrp.CFrame
local originalRot = originalCF - originalCF.Position
local lookDownCF = originalRot * CFrame.Angles(math.rad(-90), 0, 0) + originalCF.Position

local t0 = tick()
while tick() - t0 < 0.5 do
hrp.CFrame = lookDownCF
hrp.Velocity = Vector3.zero
hrp.AssemblyLinearVelocity = Vector3.zero
hrp.AssemblyAngularVelocity = Vector3.zero
runService.RenderStepped:Wait()
end

local rayOrigin = hrp.Position
local rayDirection = Vector3.new(0, -1000, 0)
local raycastParams = RaycastParams.new()
raycastParams.FilterDescendantsInstances = {char}
raycastParams.FilterType = Enum.RaycastFilterType.Blacklist

local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
if result then
local surfacePos = result.Position + Vector3.new(0, 3, 0)
hrp.CFrame = originalRot + surfacePos
end
end

local function ShockWave()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local BasePosition = humanoidRootPart.Position + Vector3.new(0, 2, 0)
local SWD = Instance.new("Part")
SWD.Size = Vector3.new(10,1,10)
SWD.Position = BasePosition
SWD.Anchored = true
SWD.CanCollide = false
SWD.Name = "SWD"
SWD.Transparency = 1
SWD.Parent = workspace
SWD.CastShadow = false
local SWDD = Instance.new("Decal")
SWDD.Texture = "rbxassetid://18642925033"
SWDD.Face = Enum.NormalId.Top
SWDD.Parent = SWD
local SW = Instance.new("MeshPart")
SW.MeshId = "rbxassetid://6797156017"
SW.Size = Vector3.new(6, 6, 6)
SW.Position = humanoidRootPart.Position
SW.Anchored = true
SW.Name = "SW"
SW.CanCollide = false
SW.Transparency = 0.7
SW.Color = Color3.fromRGB(255, 165, 0)
SW.Material = Enum.Material.Neon
SW.Parent = workspace
SW.CastShadow = false
local SW2 = Instance.new("MeshPart")
SW2.MeshId = "rbxassetid://6797156017"
SW2.Size = Vector3.new(6,6,6)
SW2.Position = humanoidRootPart.Position
SW2.Anchored = true
SW2.Name = "SW2"
SW2.CanCollide = false
SW2.Transparency = 0
SW2.Color = Color3.fromRGB(255, 165, 0)
SW2.Material = Enum.Material.ForceField
SW2.Parent = workspace
SW2.CastShadow = false
local TweenService = game:GetService("TweenService")
local SizeGoal = {Size = Vector3.new(130, 1, 130)}
local SizeGoal2 = {Size = Vector3.new(50, 15, 50), Transparency = 1}
local TweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local Tween = TweenService:Create(SWD, TweenInfo, SizeGoal)
local Tween2 = TweenService:Create(SW, TweenInfo, SizeGoal2)
local Tween3 = TweenService:Create(SWDD, TweenInfo, {Transparency = 1})
local Tween4 = TweenService:Create(SW2, TweenInfo, SizeGoal2)
Tween:Play()
Tween2:Play()
Tween3:Play()
Tween4:Play()
Tween.Completed:Connect(function()
SWD:Destroy()
SW:Destroy()
SW2:Destroy()
end)
end

local function ROKK()
local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
local count = math.random(7, 15)
for i = 1, count do
local ROKK = Instance.new("MeshPart")
ROKK.MeshId = "rbxassetid://10433873780"
ROKK.TextureID = "rbxassetid://7060550066"
ROKK.Size = Vector3.new(1,6,1)
ROKK.Position = playerPosition + Vector3.new(math.random(-5, 5), -10, math.random(-5, 5))
ROKK.Anchored = true
ROKK.CanCollide = false
ROKK.Name = "ROKK"
ROKK.Transparency = 0
ROKK.Parent = workspace
ROKK.CastShadow = false
local goalPosition = playerPosition + Vector3.new(math.random(-5, 5), -2, math.random(-5, 5))
local tweenInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local tween = game:GetService("TweenService"):Create(ROKK, tweenInfo, {Position = goalPosition})
tween:Play()
tween.Completed:Connect(function()
local lookAtCFrame = CFrame.lookAt(ROKK.Position, playerPosition)
local leanRotation = CFrame.Angles(math.rad(20), 0, 0)
ROKK.CFrame = lookAtCFrame * leanRotation
local fadeTween = game:GetService("TweenService"):Create(ROKK,TweenInfo.new(0.75, Enum.EasingStyle.Linear, Enum.EasingDirection.Out),{Transparency = 1})
wait(3)
fadeTween:Play()
fadeTween.Completed:Connect(function()
ROKK:Destroy()
end)
end)
end
end

local function Gas()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local count = math.random(3, 7)

for i = 1, count do
local gas = Instance.new("MeshPart")
gas.MeshId = "rbxassetid://4729380505"
gas.Size = Vector3.new(1, 20, 0.5)
gas.Position = humanoidRootPart.Position - Vector3.new(0, 10, 0)
gas.Anchored = true
gas.Name = "Gas"
gas.CanCollide = false
gas.Transparency = 0
gas.Color = Color3.fromRGB(255, 255, 255)
gas.Material = Enum.Material.ForceField
gas.Parent = workspace
gas.CastShadow = false

local targetPos = humanoidRootPart.Position + Vector3.new(math.random(-10, 10), 40, math.random(-10, 10))
local direction = (targetPos - gas.Position).unit
local rotationOffset = Vector3.new(90, 0, 0)
gas.CFrame = CFrame.lookAt(gas.Position, targetPos) * CFrame.Angles(math.rad(rotationOffset.X), math.rad(rotationOffset.Y), math.rad(rotationOffset.Z))

local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local goal = {Position = targetPos, Transparency = 1}
local tween = game:GetService("TweenService"):Create(gas, tweenInfo, goal)
tween:Play()

task.delay(2, function()
if gas and gas.Parent then
gas:Destroy()
end
end)

wait(0.01)
end
end

local function ParticleS()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local spawnAmount = math.random(3, 10)
for _ = 1, spawnAmount do
local PTCL = Instance.new("MeshPart")
PTCL.MeshId = "rbxassetid://10433873780"
PTCL.TextureID = "rbxassetid://7060550066"
PTCL.Size = Vector3.new(0.7, 0.7, 0.7)
PTCL.Position = humanoidRootPart.Position
PTCL.Anchored = false
PTCL.CanCollide = false
PTCL.Name = "PTCL"
PTCL.Parent = workspace
local randomDirection = (Vector3.new(math.random(-10, 10), 10, math.random(-10, 10))).Unit
local randomVelocity = math.random(50, 75)
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.Velocity = randomDirection * randomVelocity
bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
bodyVelocity.P = 5000
bodyVelocity.Parent = PTCL
PTCL.CFrame = PTCL.CFrame * CFrame.Angles(math.random(), math.random(), math.random())
local trail = Instance.new("Trail")
trail.Color = ColorSequence.new(Color3.fromRGB(150,150,150))
trail.Lifetime = 0.5
trail.FaceCamera = true
trail.Enabled = true
trail.WidthScale = NumberSequence.new(1, 1)
local attachment0 = Instance.new("Attachment")
local attachment1 = Instance.new("Attachment")
attachment1.Position = Vector3.new(0, -0.5, 0)
attachment0.Parent = PTCL
attachment1.Parent = PTCL
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Parent = PTCL
local transparencySequence = NumberSequence.new({
NumberSequenceKeypoint.new(0, 0),
NumberSequenceKeypoint.new(1, 1)})
trail.Transparency = transparencySequence
coroutine.wrap(function()
wait(0.25)
bodyVelocity:Destroy()
PTCL.CanCollide = true
wait(4.5)
PTCL:Destroy()
end)()
end
end

local function Aura()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local function createAura()
local auraPart = Instance.new("Part")
auraPart.Size = Vector3.new(1, 1, 1)
auraPart.Anchored = true
auraPart.CanCollide = false
auraPart.Transparency = 1
auraPart.Position = humanoidRootPart.Position
auraPart.Parent = workspace
local auraGui = Instance.new("BillboardGui")
auraGui.Size = UDim2.new(1, 0, 1, 0)
auraGui.AlwaysOnTop = true
auraGui.Parent = auraPart
local auraImage = Instance.new("ImageLabel")
auraImage.Size = UDim2.new(1, 0, 1, 0)
auraImage.Image = "rbxassetid://106822944701902"
auraImage.BackgroundTransparency = 1
auraImage.Position = UDim2.new(0, 0, 0, 0)
auraImage.ImageTransparency = 0
auraImage.ImageColor3 = Color3.fromRGB(255, 255, 255)
auraImage.Parent = auraGui
coroutine.wrap(function()
for i = 0, 20, 0.1 do
local size = 80 - (200 * i)
auraGui.Size = UDim2.new(size, 0, size, 0)
auraImage.ImageTransparency = i
wait(0.05)
end
auraPart:Destroy()
end)()
end
for i = 1, 1 do
createAura()
wait(0.15)
end
end
local function createTrail()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local Head = character:WaitForChild("Head", 5)
local trail = Instance.new("Trail")
trail.Color = ColorSequence.new(Color3.fromRGB(255,255,255))
trail.Lifetime = 0.5
trail.FaceCamera = true
trail.WidthScale = NumberSequence.new(1, 0)
trail.Transparency = NumberSequence.new(0.65, 1)
local attachment0 = Instance.new("Attachment", Head)
local attachment1 = Instance.new("Attachment", Head)
attachment1.Position = Vector3.new(0, -3, 0)
trail.Attachment0 = attachment0
trail.Attachment1 = attachment1
trail.Parent = Head
task.wait(0.5)
trail:Destroy()
end

local function BlueWave()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
local BasePosition = humanoidRootPart.Position + Vector3.new(0, 2, 0)
local SWB = Instance.new("MeshPart")
SWB.MeshId = "rbxassetid://12756704717"
SWB.Size = Vector3.new(0.2,0.2,0.2)
SWB.Position = humanoidRootPart.Position
SWB.Anchored = true
SWB.Name = "SWB"
SWB.CanCollide = false
SWB.Transparency = 0.5
SWB.Color = Color3.fromRGB(50,255,255)
SWB.Material = Enum.Material.Neon
SWB.Parent = workspace
SWB.CastShadow = false
local TweenService = game:GetService("TweenService")
local SizeGoal2 = {Size = Vector3.new(10,10,10), Transparency = 1}
local TweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local Tween1 = TweenService:Create(SWB, TweenInfo, SizeGoal2)
Tween1:Play()
Tween1.Completed:Connect(function()
SWB:Destroy()
end)
end

local function BlueP2()
for _ = 1, math.random(30,30) do
local p = Instance.new("Part")
p.Size = Vector3.new(0.3,500,0.3)
p.Color = Color3.fromRGB(50,255,255)
p.Material = Enum.Material.Neon
p.Anchored = true
p.CanCollide = false
p.CastShadow = false
p.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(math.random()*math.pi*2,math.random()*math.pi*2,math.random()*math.pi*2)
p.Parent = game.Workspace
spawn(function()
for i = 0.7,1,0.05 do
p.Transparency = i
wait(0.05)
end
p:Destroy()
end)
end
end

local function BlueFlash()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local gui = Instance.new("BillboardGui")
gui.Size = UDim2.new(5, 0, 5, 0)
gui.Adornee = hrp
gui.AlwaysOnTop = true
gui.LightInfluence = 0
gui.Parent = hrp
local image = Instance.new("ImageLabel")
image.AnchorPoint = Vector2.new(0.5, 0.5)
image.Position = UDim2.new(0.5, 0, 0.5, 0)
image.BackgroundTransparency = 1
image.Size = UDim2.new(0.5, 0, 0.5, 0)
image.Image = "rbxassetid://127539265797898"
image.ImageTransparency = 0
image.ScaleType = Enum.ScaleType.Fit
image.Parent = gui
local grow = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
Size = UDim2.new(1, 0, 1, 0)
})
grow:Play()
grow.Completed:Wait()
wait(0.05)
local shrink = TweenService:Create(image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
Size = UDim2.new(0.1, 0, 0.1, 0)
})
shrink:Play()
shrink.Completed:Wait()
wait(0.01)
gui:Destroy()
end

local function impactSfx()
wait(0.3)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").Events.Silly:FireServer("jump") end)
pcall(function() game:GetService("ReplicatedStorage").RetroAbility:FireServer("Bomb") end)
local players = game:GetService("Players")
local player = players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart", 5)
local bv4 = hrp:FindFirstChild("BodyVelocity") or hrp:WaitForChild("BodyVelocity", 3)
if bv4 then bv4:Destroy() end
end

local function PlaySE(N, times)
for _ = 1, times do
coroutine.wrap(function()
pcall(function() game:GetService("ReplicatedStorage"):WaitForChild("PlaySoundRemote", 5):InvokeServer(N,game:GetService("Players").LocalPlayer.Character:FindFirstChild("Torso") or game:GetService("Players").LocalPlayer.Character:FindFirstChild("UpperTorso")) end)
end)()
end
end

local hrp = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
hrp = hrp:WaitForChild("HumanoidRootPart", 5)
local function PlayS(id, loudness)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://" .. id
sound.Volume = loudness
sound.Parent = hrp
sound:Play()
sound.Ended:Connect(function()
sound:Destroy()
end)
end

local function CrushS()
if not _thyEndSilent then
PlayS(120009252632037, 1.5)
PlayS(75233844730127, 1.5)
end
wait(0.53)
PlayS(72663236106863, 3)
end

local function Dialogue()
if not _thyEndSilent then showMessage("Crush!", 0) end
end

local function StartCrush()
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
pcall(function() game:GetService("ReplicatedStorage").slapstick:FireServer("fullcharged") end)
coroutine.wrap(Dialogue)()
coroutine.wrap(BlueFlash)()
coroutine.wrap(FloatThenTpToSurface)()
coroutine.wrap(DieAnim)()
coroutine.wrap(CrushS)()
wait(0.45)
coroutine.wrap(Aura)()
coroutine.wrap(createTrail)()
wait(0.08)
coroutine.wrap(impactSfx)()
coroutine.wrap(ShockWave)()
coroutine.wrap(ROKK)()
coroutine.wrap(Gas)()
coroutine.wrap(ParticleS)()
coroutine.wrap(BlueP2)()
coroutine.wrap(BlueWave)()
coroutine.wrap(SpawnAfterImage)()
CreateHitbox(Vector3.new(44, 28, 44), Vector3.new(0, -2, -5), 0.4)
task.delay(0.01, function() coroutine.wrap(SpawnAfterImage)() end)
wait(0.5)
local P = game:GetService("Players").LocalPlayer
local C = P.Character or P.CharacterAdded:Wait()
local H = C:WaitForChild("Humanoid", 5)
coroutine.wrap(StopFling)()
end
StartCrush()
end

local abilityPlayer = game.Players.LocalPlayer
local abilityUIS = game:GetService("UserInputService")

local function PunchAbility()
	local hrpChar = abilityPlayer.Character or abilityPlayer.CharacterAdded:Wait()
	local phrp = hrpChar:WaitForChild("HumanoidRootPart", 5)
	local snd = Instance.new("Sound")
	snd.SoundId = "rbxassetid://18694755502"
	snd.Volume = 1
	snd.Parent = phrp
	snd:Play()
	snd.Ended:Connect(function() snd:Destroy() end)
	CreateHitbox(Vector3.new(20, 10, 20), Vector3.new(0, 0, -5), 0.35)
	coroutine.wrap(PunchT)()
end

local function JudgementAbilityWrapped()
	local jchar = abilityPlayer.Character or abilityPlayer.CharacterAdded:Wait()
	local jhum = jchar:WaitForChild("Humanoid", 5)
	if jhum.FloorMaterial ~= Enum.Material.Air then
		Judgement()
	end
end

local function ThyEndIsNow()
	if Death then coroutine.wrap(Death)() end
end

_thyEndSilent = false
local function ThyEndIsNowAbility()
	showMessage("Thy End Is Now!", 0)
	coroutine.wrap(function()
		Uppercut()
		wait(0.7)
		_thyEndSilent = true
		CrushAbility()
		task.delay(2, function() _thyEndSilent = false end)
	end)()
end

local abilityDefs = {
	{name="Overhead",       key="Z",  kc=Enum.KeyCode.Z,     color=Color3.fromRGB(255,200,0),   fn=OverHead,              cd=4},
	{name="Uppercut",       key="X",  kc=Enum.KeyCode.X,     color=Color3.fromRGB(0,180,255),   fn=Uppercut,              cd=3},
	{name="Die",            key="E",  kc=Enum.KeyCode.E,     color=Color3.fromRGB(255,80,80),   fn=DieAbility,            cd=5},
	{name="Judgement",      key="T",  kc=Enum.KeyCode.T,     color=Color3.fromRGB(200,0,255),   fn=JudgementAbilityWrapped, cd=7},
	{name="Crush",          key="C",  kc=Enum.KeyCode.C,     color=Color3.fromRGB(0,255,200),   fn=CrushAbility,          cd=3},
	{name="Thy End\nIs Now", key="V",  kc=Enum.KeyCode.V,     color=Color3.fromRGB(220,0,0),     fn=ThyEndIsNowAbility,    cd=12},
}

abilityUIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.N then
		ThyEndIsNow()
	end
end)

local abilityGui = Instance.new("ScreenGui")
abilityGui.Name = "AbilityHUD"
abilityGui.ResetOnSpawn = false
abilityGui.IgnoreGuiInset = false
abilityGui.Parent = game:GetService("CoreGui")

local BTN_W = 54
local BTN_H = 50
local BTN_GAP = 4
local totalW = #abilityDefs * (BTN_W + BTN_GAP) - BTN_GAP

local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(0, math.min(totalW, 520), 0, BTN_H + 6)
scrollFrame.Position = UDim2.new(0.5, -math.min(totalW, 520)/2, 1, -(BTN_H + 16))
scrollFrame.BackgroundTransparency = 1
scrollFrame.BorderSizePixel = 0
scrollFrame.ScrollingDirection = Enum.ScrollingDirection.X
scrollFrame.CanvasSize = UDim2.new(0, totalW, 0, 0)
scrollFrame.ScrollBarThickness = 0
scrollFrame.ClipsDescendants = true
scrollFrame.Parent = abilityGui

local uiList = Instance.new("UIListLayout")
uiList.FillDirection = Enum.FillDirection.Horizontal
uiList.Padding = UDim.new(0, BTN_GAP)
uiList.HorizontalAlignment = Enum.HorizontalAlignment.Left
uiList.VerticalAlignment = Enum.VerticalAlignment.Center
uiList.Parent = scrollFrame

local BLACK_READY    = Color3.fromRGB(18, 18, 18)
local RED_COOLDOWN   = Color3.fromRGB(110, 0, 0)
local WHITE          = Color3.fromRGB(255, 255, 255)
local BLACK_TEXT     = Color3.fromRGB(0, 0, 0)

local abilityButtons  = {}
local abilityLabels   = {}
local abilityCooldowns = {}

for idx, def in ipairs(abilityDefs) do
	abilityCooldowns[idx] = false

	local frame = Instance.new("Frame")
	frame.Size = UDim2.new(0, BTN_W, 0, BTN_H)
	frame.BackgroundColor3 = BLACK_READY
	frame.BorderSizePixel = 0
	frame.Parent = scrollFrame

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 8)
	corner.Parent = frame

	local stroke = Instance.new("UIStroke")
	stroke.Color = Color3.fromRGB(60, 60, 60)
	stroke.Thickness = 1
	stroke.Parent = frame

	local nameLabel = Instance.new("TextLabel")
	nameLabel.Size = UDim2.new(1, -4, 0.58, 0)
	nameLabel.Position = UDim2.new(0, 2, 0, 3)
	nameLabel.BackgroundTransparency = 1
	nameLabel.Text = def.name
	nameLabel.TextColor3 = WHITE
	nameLabel.Font = Enum.Font.Arcade
	nameLabel.TextScaled = true
	nameLabel.TextStrokeTransparency = 0.4
	nameLabel.TextStrokeColor3 = BLACK_TEXT
	nameLabel.Parent = frame

	local keyLabel = Instance.new("TextLabel")
	keyLabel.Size = UDim2.new(1, -4, 0.28, 0)
	keyLabel.Position = UDim2.new(0, 2, 0.65, 0)
	keyLabel.BackgroundTransparency = 1
	keyLabel.Text = "[" .. def.key .. "]"
	keyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
	keyLabel.Font = Enum.Font.Arcade
	keyLabel.TextScaled = true
	keyLabel.TextTransparency = 0.1
	keyLabel.Parent = frame



	local cdOverlay = Instance.new("Frame")
	cdOverlay.Name = "CooldownOverlay"
	cdOverlay.Size = UDim2.new(1, 0, 1, 0)
	cdOverlay.Position = UDim2.new(0, 0, 0, 0)
	cdOverlay.BackgroundColor3 = RED_COOLDOWN
	cdOverlay.BackgroundTransparency = 0.15
	cdOverlay.BorderSizePixel = 0
	cdOverlay.ZIndex = 3
	cdOverlay.Visible = false
	local cdCorner = Instance.new("UICorner")
	cdCorner.CornerRadius = UDim.new(0, 8)
	cdCorner.Parent = cdOverlay
	cdOverlay.Parent = frame

	local cdLabel = Instance.new("TextLabel")
	cdLabel.Size = UDim2.new(1, 0, 1, 0)
	cdLabel.Position = UDim2.new(0, 0, 0, 0)
	cdLabel.BackgroundTransparency = 1
	cdLabel.Text = ""
	cdLabel.TextColor3 = WHITE
	cdLabel.Font = Enum.Font.GothamBold
	cdLabel.TextScaled = true
	cdLabel.ZIndex = 6
	cdLabel.TextStrokeTransparency = 0
	cdLabel.TextStrokeColor3 = BLACK_TEXT
	cdLabel.Visible = false
	cdLabel.Parent = frame

	abilityButtons[idx] = frame
	abilityLabels[idx] = {nameLabel=nameLabel, keyLabel=keyLabel, cdOverlay=cdOverlay, cdLabel=cdLabel}

	local touchBtn = Instance.new("TextButton")
	touchBtn.Size = UDim2.new(1, 0, 1, 0)
	touchBtn.BackgroundTransparency = 1
	touchBtn.Text = ""
	touchBtn.ZIndex = 5
	touchBtn.Parent = frame

	local capturedIdx = idx
	local capturedDef = def
	local capturedFrame = frame
	local capturedLabels = abilityLabels[idx]

	local function fireAbility()
		if abilityCooldowns[capturedIdx] then return end
		abilityCooldowns[capturedIdx] = true

		coroutine.wrap(capturedDef.fn)()

		local totalCd = capturedDef.cd
		local timeLeft = totalCd
		capturedFrame.BackgroundColor3 = RED_COOLDOWN
		capturedLabels.cdOverlay.Visible = true
		capturedLabels.cdLabel.Visible = true
		task.spawn(function()
			local lastSec = -1
			while timeLeft > 0 do
				local secs = math.ceil(timeLeft)
				if secs ~= lastSec then
					capturedLabels.cdLabel.Text = tostring(secs)
					lastSec = secs
				end
				task.wait(0.1)
				timeLeft = timeLeft - 0.1
			end
			capturedLabels.cdOverlay.Visible = false
			capturedLabels.cdLabel.Visible = false
			capturedLabels.cdLabel.Text = ""
			capturedFrame.BackgroundColor3 = BLACK_READY
			abilityCooldowns[capturedIdx] = false
		end)
	end

	touchBtn.MouseButton1Click:Connect(fireAbility)

	abilityUIS.InputBegan:Connect(function(input, gp)
		if gp then return end
		if input.KeyCode == capturedDef.kc then
			fireAbility()
		end
	end)
end

local punchCooldown = false
local punchBtn = Instance.new("TextButton")
punchBtn.Name = "PunchCircle"
punchBtn.Size = UDim2.new(0, 68, 0, 68)
punchBtn.Position = UDim2.new(0.87, 0, 0.60, 0)
punchBtn.AnchorPoint = Vector2.new(0.5, 0.5)
punchBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
punchBtn.BorderSizePixel = 0
punchBtn.Text = "Punch\n[1]"
punchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
punchBtn.Font = Enum.Font.Arcade
punchBtn.TextScaled = true
punchBtn.ZIndex = 10
punchBtn.Parent = abilityGui

local punchCorner = Instance.new("UICorner")
punchCorner.CornerRadius = UDim.new(1, 0)
punchCorner.Parent = punchBtn

local punchStroke = Instance.new("UIStroke")
punchStroke.Color = Color3.fromRGB(150, 150, 255)
punchStroke.Thickness = 2
punchStroke.Parent = punchBtn

local function firePunch()
	if punchCooldown then return end
	punchCooldown = true
	coroutine.wrap(PunchAbility)()
	task.delay(0.4, function()
		punchCooldown = false
	end)
end

punchBtn.MouseButton1Click:Connect(firePunch)
abilityUIS.InputBegan:Connect(function(input, gp)
	if gp then return end
	if input.KeyCode == Enum.KeyCode.One then firePunch() end
end)

local abilityChar = abilityPlayer.Character
if abilityChar then
	local abilityHum = abilityChar:FindFirstChildOfClass("Humanoid")
	if abilityHum then
		abilityHum.Died:Connect(function()
			if abilityGui and abilityGui.Parent then
				abilityGui:Destroy()
			end
		end)
	end
end

function DestroyGuiA()
if GuiA and GuiA.Parent then
for _, child in ipairs(GuiA:GetDescendants()) do
if child:IsA("LocalScript") or child:IsA("Script") or child:IsA("ModuleScript") then
child:Destroy()
end
end
GuiA:Destroy()
end
end
end

pcall(Configuring)