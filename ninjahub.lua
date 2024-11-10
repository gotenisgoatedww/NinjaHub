---- RAYFIELD UI LIBRARY ----
---- 1987 [SHANGHAI]
---- leaderstats [T]
---- fix mobile glitch [T]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "Shanghai | neondomo1662",
    LoadingTitle = "Welcome to Shanghai",
    LoadingSubtitle = "Shanghai",
 })
 local Tab = Window:CreateTab("Training")
 local Section = Tab:CreateSection("1")
 local Button = Tab:CreateButton({
    Name = "[] AutoTrainX2",
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        while wait(0.68) do
            rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 20)
            wait(0.68)
            rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 19.99)
        end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] AutoTrainX1",
    Callback = function()
        local rs = game:GetService("ReplicatedStorage")
        while wait(0.68) do
            rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 10)
            wait(0.68)
            rs.RemoteEvent.AddPowerEvent:FireServer("FromTraining", 9.99)
        end
    end,
 })
 local Input = Tab:CreateInput({
    Name = "[] Set Trainrate",
    PlaceholderText = "Trainrate",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
    -- The function that takes place when the input is changed
    -- The variable (Text) is a string for the value in the text box
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] AntiAFK",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/RTrade/Voidz/main/AntiAFK.lua'),true))()
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] DestroyTrainingAnim",
    Callback = function()
        local LocalPlayer = game.Players.LocalPlayer
        local backpack = LocalPlayer.Backpack
        local toolName = "Train"
        
        local function deleteLocalScript()
            local tool = backpack:FindFirstChild(toolName)
            if tool then
                for _, descendant in ipairs(tool:GetDescendants()) do
                    if descendant:IsA("LocalScript") then
                        descendant:Destroy()
                    end
                end
            else
                print(toolName .. " not found in your backpack.")
            end
        end
        
        deleteLocalScript()
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] AutoEquipTrainingSword",
    Callback = function()
        while true do
            wait(.5)
            for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if v.Name == "Train" then
                    v.Parent = game.Players.LocalPlayer.Character
                end
            end
        end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Respawn",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] AuraSpam",
    Callback = function()
       _G.SPAM = true
while _G.SPAM do
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):WaitForChild("AuraEvent"):FireServer("Turn On")
    wait()
end    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] GetFF",
    Callback = function()
        local beforepos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local ff = game.Players.LocalPlayer.Character:FindFirstChild("ForceField")
        
        if not ff then
            repeat
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(70,98,-335)
                wait(0.1)
            until game.Players.LocalPlayer.Character:FindFirstChild("ForceField")
        else
            return
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = beforepos
    end,
 })

 local Tab = Window:CreateTab("Other")
 local Button = Tab:CreateButton({
    Name = "[] SilentAim",
    Callback = function()
        local ScreenGui2 = {
            ScreenGui2 = Instance.new("ScreenGui"),
            CommandBarFrame = Instance.new("Frame"),
            CommandBar = Instance.new("TextBox"),
            CommandBarCorner = Instance.new("UICorner"),
        }
        
        
        ScreenGui2.ScreenGui2.Name = "ScreenGui2"
        ScreenGui2.ScreenGui2.Parent = game:GetService("CoreGui")
        ScreenGui2.ScreenGui2.ResetOnSpawn = false
        ScreenGui2.ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Global
        
        ScreenGui2.CommandBarFrame.Name = "CommandBarFrame"
        ScreenGui2.CommandBarFrame.Parent = ScreenGui2.ScreenGui2
        ScreenGui2.CommandBarFrame.AnchorPoint = Vector2.new(0.5, 0)
        ScreenGui2.CommandBarFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ScreenGui2.CommandBarFrame.Position = UDim2.new(0.5, 0, 1, 0)
        ScreenGui2.CommandBarFrame.Size = UDim2.new(0.0933617353, 0, 0.0327022374, 0)
        ScreenGui2.CommandBarFrame.BackgroundTransparency = 1
        
        ScreenGui2.CommandBar.Name = "CommandBar"
        ScreenGui2.CommandBar.Parent = ScreenGui2.CommandBarFrame
        ScreenGui2.CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScreenGui2.CommandBar.BackgroundTransparency = 1.000
        ScreenGui2.CommandBar.Size = UDim2.new(1, 0, 1, 0)
        ScreenGui2.CommandBar.ClearTextOnFocus = false
        ScreenGui2.CommandBar.Font = Enum.Font.Gotham
        ScreenGui2.CommandBar.Text = ""
        ScreenGui2.CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
        ScreenGui2.CommandBar.TextScaled = true
        ScreenGui2.CommandBar.TextSize = 14.000
        ScreenGui2.CommandBar.TextWrapped = true
        
        ScreenGui2.CommandBarCorner.Parent = ScreenGui2.CommandBarFrame
        
        
        
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local CurrentCamera = workspace:WaitForChild("Camera")
        local UserInputService = game:GetService("UserInputService")
        local GuiService = game:GetService("GuiService")
        local plr = Players.LocalPlayer
        local mouse = plr:GetMouse()
        local target = nil
        local player = nil
        local lock = false
        local commandbarvisible = false
        local HRPLock = false
        local HRPLocking = false
        local prefix = "."
        local WhitelistedPlayers = {}
        local commands = {}
        
        local HRPSettings = {
            HRP_Player = nil;
            HRP_Position = nil;
            HRP_Part = "HumanoidRootPart";
            Draw_HRP = HRPLock;
            HRP_Radius = 5;
            HRP_Color = Color3.fromRGB(0,255,0);
            HRP_UnselectedTransparency = 0.5;
            HRP_SelectedTransparency = 0.8;
        }
        local FOVsettings = {
            FOV_Player;
            FOV_Position = nil;
            AimPart = "Head";
            TeamCheck = false;
            Draw_FOV = FOVLock;
            FOV_Radius = 200;
            FOV_Color = Color3.fromRGB(255,255,255);
        }
        
        local hrpcircle = Drawing.new("Circle")
        hrpcircle.Visible = HRPSettings.Draw_HRP
        hrpcircle.Radius = HRPSettings.HRP_Radius
        hrpcircle.Color = HRPSettings.HRP_Color
        hrpcircle.Thickness = 1
        hrpcircle.Filled = true
        hrpcircle.Transparency = HRPSettings.HRP_UnselectedTransparency
        hrpcircle.Position = Vector2.new(0,0)
        
        local function chat(message)
            game.StarterGui:SetCore("ChatMakeSystemMessage", {Text = message, Color = Color3.fromRGB(0,255,0), Font = Enum.Font.Fantasy})
        end
        
        local function GetPlayer(sender,text)
            if text == "" then
                return nil
            end
            if text == "all" then
                return "all"
            end
            for _,Player in pairs(Players:GetPlayers()) do
                if string.sub(string.lower(Player.Name),1,string.len(text)) == string.lower(text) then
                    return Player
                elseif string.sub(string.lower(Player.DisplayName),1,string.len(text)) == string.lower(text) then
                    return Player
                end
            end
            return nil
        end
        
        function CreateTween(object, info, args, play)
            local tween = game:GetService("TweenService"):Create(object, info, args)
            if play == "NoWait" or play == true then
                tween:Play()
                tween.Completed:Connect(function()
                    tween:Destroy()
                end)
                return
            elseif play == "Wait" then
                tween:Play()
                tween.Completed:Wait()
                tween:Destroy()
                return
            end
            return tween
        end
        
        function ClosestTPToCursor()
            local ClosestChar = nil
            local ClosestPart = nil
            local ClosestPartPosition = nil
            local ClosestPartOnScreen = false
            local ClosestPartMagnitudeFromMouse = nil
            local ShortestDistance = math.huge
            for i,v in ipairs(Players:GetPlayers()) do
                local char = v.Character
                if char then
                    if v ~= Players.LocalPlayer and not table.find(WhitelistedPlayers,v.Name) then
                        local TargetPart = char:FindFirstChild(FOVsettings.AimPart)
                        if TargetPart then
                            local PartPos, onScreen = CurrentCamera.WorldToViewportPoint(CurrentCamera, TargetPart.Position)
                            if onScreen then
                                local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(mouse.X, mouse.Y + GuiService.GetGuiInset(GuiService).Y)).Magnitude
                                if (Magnitude < ShortestDistance) then
                                    ClosestChar = char
                                    ClosestPart = TargetPart
                                    ClosestPartPosition = PartPos
                                    ClosestPartOnScreen = onScreen
                                    ClosestPartMagnitudeFromMouse = Magnitude
                                    ShortestDistance = Magnitude
                                end
                            end
                        end
                    end
                end
            end
            return ClosestChar, ClosestPart, ClosestPartPosition, ClosestPartOnScreen, ClosestPartMagnitudeFromMouse
        end
        
        function ClosestHRPPlayer()
            local target = nil
            local TargetChar, TargetPartTemp, PartPos, onScreen, Magnitude = ClosestTPToCursor()
            target = TargetChar
            return Players:GetPlayerFromCharacter(target)
        end
        
        RunService.Heartbeat:Connect(function()
            if HRPLock == true then
                if HRPSettings.HRP_Player == nil then
                    if ClosestHRPPlayer() ~= nil and ClosestHRPPlayer().Character then
                        local hrpplayer = ClosestHRPPlayer().Character
                        local vector, onscreen = CurrentCamera:WorldToViewportPoint(hrpplayer:FindFirstChild(HRPSettings.HRP_Part).Position)
                        if hrpcircle.Transparency ~= HRPSettings.HRP_UnselectedTransparency then
                            hrpcircle.Transparency = HRPSettings.HRP_UnselectedTransparency
                        end
                        if onscreen == true then
                            if hrpcircle.Visible == false then
                                hrpcircle.Visible = true
                            end
                            hrpcircle.Position = Vector2.new(vector.X,vector.Y)
                        elseif onscreen == false then
                            hrpcircle.Visible = false
                        end
                    else
                        hrpcircle.Visible = false
                    end
                elseif HRPSettings.HRP_Player ~= nil and HRPSettings.HRP_Player.Character then
                    local enemy = HRPSettings.HRP_Player.Character
                    local vector, onscreen = CurrentCamera:WorldToViewportPoint(enemy:FindFirstChild(HRPSettings.HRP_Part).Position)
                    if hrpcircle.Transparency ~= HRPSettings.HRP_SelectedTransparency then
                        hrpcircle.Transparency = HRPSettings.HRP_SelectedTransparency
                    end
                    if onscreen then
                        if hrpcircle.Visible == false then
                            hrpcircle.Visible = true
                        end
                        hrpcircle.Position = Vector2.new(vector.X,vector.Y)
                    elseif onscreen == false then
                        hrpcircle.Visible = false
                    end
                else
                    hrpcircle.Visible = false
                end
            elseif HRPLock == false then
                if hrpcircle.Visible ~= false then
                    hrpcircle.Visible = false
                end
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, processed)
            if input.KeyCode == Enum.KeyCode.Quote then
                local textbox = ScreenGui2.CommandBar
                local frame = ScreenGui2.CommandBarFrame
                if commandbarvisible == false then
                    CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position = UDim2.new(0.5,0,0.9,0)},true)
                    CreateTween(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundTransparency = 0},true)
                    textbox:CaptureFocus()
                    task.wait()
                    textbox.Text = ""
                    commandbarvisible = true
                end
            end
        end)
        
        ScreenGui2.CommandBar.FocusLost:Connect(function()
            if commandbarvisible == true then
                ScreenGui2.CommandBar.Text = ""
                CreateTween(ScreenGui2.CommandBarFrame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position = UDim2.new(0.5,0,1,0)},true)
                CreateTween(ScreenGui2.CommandBarFrame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{BackgroundTransparency = 1},true)
                commandbarvisible = false
            end
        end)
        
        UserInputService.InputBegan:Connect(function(input, processed)
            if input.KeyCode == Enum.KeyCode.E and not processed then
                if HRPSettings.HRP_Player == nil and ClosestHRPPlayer() ~= nil and ClosestHRPPlayer().Character then
                    HRPLocking = true
                    if not HRPLock then return end
                    local lockplr = ClosestHRPPlayer()
                    HRPSettings.HRP_Player = lockplr
                elseif HRPSettings.HRP_Player ~= nil then
                    HRPLocking = false
                    if not HRPLock then return end
                    HRPSettings.HRP_Player = nil
                end
            elseif input.KeyCode == Enum.KeyCode.Z and not processed then
                HRPLock = not HRPLock
                hrpcircle.Visible = HRPLock
            elseif input.KeyCode == Enum.KeyCode.Q and not processed then
                if lock == false then
                    lock = false
                    task.wait()
                    lock = true
                    while lock do
                        if HRPSettings.HRP_Player and HRPSettings.HRP_Player.Character and HRPSettings.HRP_Player.Character:FindFirstChild("Head") and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Shuriken") and Players.LocalPlayer.Character:FindFirstChild("Shuriken"):FindFirstChild("HitEvent") then
                            Players.LocalPlayer.Character:FindFirstChild("Shuriken"):FindFirstChild("HitEvent"):FireServer(HRPSettings.HRP_Player.Character:FindFirstChild("Head").Position)
                        end
                        task.wait()
                    end
                else
                    lock = false
                end
            end
        end)
        
        Players.PlayerRemoving:Connect(function(plrremoved)
            if plrremoved == HRPSettings.HRP_Player then
                HRPSettings.HRP_Player = nil
            end
        end)
        
        commands.lock = function(sender,args)
            local player = GetPlayer(sender,args[1])
            if player ~= nil then
                HRPSettings.HRP_Player = player
            end
        end
        
        commands.fire = function(sender,args)
            lock = false
            task.wait()
            lock = true
            while lock do
                if HRPSettings.HRP_Player and HRPSettings.HRP_Player.Character and HRPSettings.HRP_Player.Character:FindFirstChild("Head") and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Shuriken") and Players.LocalPlayer.Character:FindFirstChild("Shuriken"):FindFirstChild("HitEvent") then
                    Players.LocalPlayer.Character:FindFirstChild("Shuriken"):FindFirstChild("HitEvent"):FireServer(HRPSettings.HRP_Player.Character:FindFirstChild("Head"))
                elseif HRPSettings.HRP_Player == nil then
                    lock = false
                end
                task.wait()
            end
        end
        
        commands.unfire = function(sender,args)
            lock = false
        end
        
        commands.whitelist = function(sender,args)
            if not GetPlayer(sender,args[1]) then chat("Server: Player does not exist") return end
            local player = GetPlayer(sender,args[1])
            if table.find(WhitelistedPlayers,player.Name) then chat("Server: "..player.Name.." is already in Whitelist") return end
            table.insert(WhitelistedPlayers,player.Name)
            chat("Server: Added "..player.Name.." to the Whitelist")
        end
        
        commands.wl = function(sender,args)
            if not GetPlayer(sender,args[1]) then chat("Server: Player does not exist") return end
            local player = GetPlayer(sender,args[1])
            if table.find(WhitelistedPlayers,player.Name) then chat("Server: "..player.Name.." is already in Whitelist") return end
            table.insert(WhitelistedPlayers,player.Name)
            chat("Server: Added "..player.Name.." to the Whitelist")
        end
        
        commands.unwhitelist = function(sender,args)
            if not GetPlayer(sender,args[1]) then chat("Server: Player does not exist") return end
            local player = GetPlayer(sender,args[1])
            if table.find(WhitelistedPlayers,player.Name) then
                table.remove(WhitelistedPlayers,table.find(WhitelistedPlayers,player.Name))
                chat("Server: "..player.Name.." has been removed from Whitelist")
            else
                chat("Server: "..player.Name.." is not in the Whitelist")
            end
        end
        
        commands.unwl = function(sender,args)
            if not GetPlayer(sender,args[1]) then chat("Server: Player does not exist") return end
            local player = GetPlayer(sender,args[1])
            if table.find(WhitelistedPlayers,player.Name) then
                table.remove(WhitelistedPlayers,table.find(WhitelistedPlayers,player.Name))
                chat("Server: "..player.Name.." has been removed from Whitelist")
            else
                chat("Server: "..player.Name.." is not in the Whitelist")
            end
        end
        
        Players.LocalPlayer.Chatted:Connect(function(msg)
            msg = string.lower(msg)
            local splitstring = msg:split(" ")
            local slashcommand
            if splitstring[1] == "/e" then
                slashcommand = splitstring[2]
            else
                slashcommand = splitstring[1]
            end
            local cmd = slashcommand:split(prefix)
            local cmdname = cmd[2]
            if commands[cmdname] then
                local arguments = {}
                if splitstring[1] == "/e" then
                    for i = 3, #splitstring, 1 do
                        table.insert(arguments,splitstring[i])
                    end
                else
                    for i = 2, #splitstring, 1 do
                        table.insert(arguments,splitstring[i])
                    end
                end
                commands[cmdname](Players.LocalPlayer,arguments)
            end
        end)
        
        ScreenGui2.CommandBar.FocusLost:Connect(function()
            local msg = ScreenGui2.CommandBar.Text
            msg = string.lower(msg)
            local splitstring = msg:split(" ")
            local slashcommand = splitstring[1]
            if commands[slashcommand] then
                local arguments = {}
                for i = 2, #splitstring, 1 do
                    table.insert(arguments,splitstring[i])
                end
                commands[slashcommand](Players.LocalPlayer,arguments)
            end
        end)
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RemovePlayerTorso",
    Callback = function()
        game.Players.LocalPlayer.Character.UpperTorso.Waist:Remove()
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RainbowShurikens",
    Callback = function()
        while true do
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken1")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken2")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken3")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken4")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken5")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken6")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken7")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken8Ying")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken8Yang")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken9Ying")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Shuriken", "Shuriken9Yang")
            wait(0.01)end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RainbowClothes [YIN]",
    Callback = function()
        while true do
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying12")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying13")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying14")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying15")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying16")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying17")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Ying18")
            wait(0.01)end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RainbowClothes [YANG]",
    Callback = function()
        while true do
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang12")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang13")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang14")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang15")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang16")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang17")
            wait(0.01)
            game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("Cloth", "Yang18")
            wait(0.01)end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] YinShuriken [1.5MIL]",
    Callback = function()
        local args = {
            [1] = "Shuriken",
            [2] = "Shuriken9Ying"
        }
    
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer(unpack(args))
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] YangShuriken [1.5MIL]",
    Callback = function()
        local args = {
            [1] = "Shuriken",
            [2] = "Shuriken9Yang"
        }
    
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer(unpack(args))
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] YinSword [10MIL]",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("Sword","UltraKatana")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] YangSword [10MIL]",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("Sword","BlackAndWhiteWingedSword")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] InfiniteYield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    end,
 })

 local Section = Tab:CreateSection("<>")
 local Button = Tab:CreateButton({
    Name = "[] Spawn 10 Tools",
    Callback = function()
        for i=1, 10 do -- incase i forget / increase or decrease
            spawn(function()
              wait()
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
            end)
            end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Spawn 50 Tools",
    Callback = function()
        for i=1, 50 do -- incase i forget / increase or decrease
            spawn(function()
              wait()
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
            end)
            end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Spawn 100 Tools",
    Callback = function()
        for i=1, 100 do -- incase i forget / increase or decrease
            spawn(function()
              wait()
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
            end)
            end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Spawn 300 Tools",
    Callback = function()
        for i=1, 300 do -- incase i forget / increase or decrease
            spawn(function()
              wait()
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
            end)
            end
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Spawn 500 Tools",
    Callback = function()
        for i=1, 500 do -- incase i forget / increase or decrease
            spawn(function()
              wait()
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
            end)
            end
    end,
 })


 local Tab = Window:CreateTab("Server")
 local Button = Tab:CreateButton({
    Name = "[] RemoveFog",
    Callback = function()
        game.Lighting.FogEnd = 100000
        game.Lighting.FogStart = 100000
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] ChatSpy",
    Callback = function()
    --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--This script reveals ALL hidden messages in the default chat

enabled = true --chat "/spy" to toggle!
spyOnMyself = true --if true will check your messages too
public = false --if true will chat the logs publicly (fun, risky)
publicItalics = true --if true will use /me to stand out
privateProperties = { --customize private logs
	Color = Color3.fromRGB(0,255,255); 
	Font = Enum.Font.SourceSansBold;
	TextSize = 18;
}


local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")
local player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait() or Players.LocalPlayer
local saymsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest")
local getmsg = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering")
local instance = (_G.chatSpyInstance or 0) + 1
_G.chatSpyInstance = instance

local function onChatted(p,msg)
	if _G.chatSpyInstance == instance then
		if p==player and msg:lower():sub(1,4)=="/spy" then
			enabled = not enabled
			wait(0.3)
			privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
			StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
		elseif enabled and (spyOnMyself==true or p~=player) then
			msg = msg:gsub("[\n\r]",''):gsub("\t",' '):gsub("[ ]+",' ')
			local hidden = true
			local conn = getmsg.OnClientEvent:Connect(function(packet,channel)
				if packet.SpeakerUserId==p.UserId and packet.Message==msg:sub(#msg-#packet.Message+1) and (channel=="All" or (channel=="Team" and public==false and Players[packet.FromSpeaker].Team==player.Team)) then
					hidden = false
				end
			end)
			wait(1)
			conn:Disconnect()
			if hidden and enabled then
				if public then
					saymsg:FireServer((publicItalics and "/me " or '').."{SPY} [".. p.Name .."]: "..msg,"All")
				else
					privateProperties.Text = "{SPY} [".. p.Name .."]: "..msg
					StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
				end
			end
		end
	end
end

for _,p in ipairs(Players:GetPlayers()) do
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end
Players.PlayerAdded:Connect(function(p)
	p.Chatted:Connect(function(msg) onChatted(p,msg) end)
end)
privateProperties.Text = "{SPY "..(enabled and "EN" or "DIS").."ABLED}"
StarterGui:SetCore("ChatMakeSystemMessage",privateProperties)
if not player.PlayerGui:FindFirstChild("Chat") then wait(3) end
local chatFrame = player.PlayerGui.Chat.Frame
chatFrame.ChatChannelParentFrame.Visible = true
chatFrame.ChatBarParentFrame.Position = chatFrame.ChatChannelParentFrame.Position+UDim2.new(UDim.new(),chatFrame.ChatChannelParentFrame.Size.Y)
    end,
 })
 local Section = Tab:CreateSection("<>")
 local Button = Tab:CreateButton({
    Name = "[] Chat Translator",
    Callback = function()
        loadstring(game:HttpGetAsync('https://i.qts.life/r/ChatInlineTranslator.lua', true))()
        --[[
        af = "Afrikaans",
            sq = "Albanian",
            am = "Amharic",
            ar = "Arabic",
            hy = "Armenian",
            az = "Azerbaijani",
            eu = "Basque",
            be = "Belarusian",
            bn = "Bengali",
            bs = "Bosnian",
            bg = "Bulgarian",
            ca = "Catalan",
            ceb = "Cebuano",
            ny = "Chichewa",
            ['zh-cn'] = "Chinese Simplified",
            ['zh-tw'] = "Chinese Traditional",
            co = "Corsican",
            hr = "Croatian",
            cs = "Czech",
            da = "Danish",
            nl = "Dutch",
            en = "English",
            eo = "Esperanto",
            et = "Estonian",
            tl = "Filipino",
            fi = "Finnish",
            fr = "French",
            fy = "Frisian",
            gl = "Galician",
            ka = "Georgian",
            de = "German",
            el = "Greek",
            gu = "Gujarati",
            ht = "Haitian Creole",
            ha = "Hausa",
            haw = "Hawaiian",
            iw = "Hebrew",
            hi = "Hindi",
            hmn = "Hmong",
            hu = "Hungarian",
            is = "Icelandic",
            ig = "Igbo",
            id = "Indonesian",
            ga = "Irish",
            it = "Italian",
            ja = "Japanese",
            jw = "Javanese",
            kn = "Kannada",
            kk = "Kazakh",
            km = "Khmer",
            ko = "Korean",
            ku = "Kurdish (Kurmanji)",
            ky = "Kyrgyz",
            lo = "Lao",
            la = "Latin",
            lv = "Latvian",
            lt = "Lithuanian",
            lb = "Luxembourgish",
            mk = "Macedonian",
            mg = "Malagasy",
            ms = "Malay",
            ml = "Malayalam",
            mt = "Maltese",
            mi = "Maori",
            mr = "Marathi",
            mn = "Mongolian",
            my = "Myanmar (Burmese)",
            ne = "Nepali",
            no = "Norwegian",
            ps = "Pashto",
            fa = "Persian",
            pl = "Polish",
            pt = "Portuguese",
            pa = "Punjabi",
            ro = "Romanian",
            ru = "Russian",
            sm = "Samoan",
            gd = "Scots Gaelic",
            sr = "Serbian",
            st = "Sesotho",
            sn = "Shona",
            sd = "Sindhi",
            si = "Sinhala",
            sk = "Slovak",
            sl = "Slovenian",
            so = "Somali",
            es = "Spanish",
            su = "Sundanese",
            sw = "Swahili",
            sv = "Swedish",
            tg = "Tajik",
            ta = "Tamil",
            te = "Telugu",
            th = "Thai",
            tr = "Turkish",
            uk = "Ukrainian",
            ur = "Urdu",
            uz = "Uzbek",
            vi = "Vietnamese",
            cy = "Welsh",
            xh = "Xhosa",
            yi = "Yiddish",
            yo = "Yoruba",
            zu = "Zulu"
        --]]
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RejoinServer",
    Callback = function()
        game:GetService("TeleportService"):Teleport(placeId)
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] CrashServer",
    Callback = function()
        local RunService = game:GetService("RunService")
        RunService.Heartbeat:Connect(function(step)  
            game:GetService("ReplicatedStorage").RemoteEvent.SpawnCharacterEvent:FireServer("MainSpawn")
        end)
    end,
 })



 local Tab = Window:CreateTab("Gamepasses")
 local Section = Tab:CreateSection("Rainbow Gamepass")
 local Button = Tab:CreateButton({
    Name = "[] RainbowSword",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("RainbowPass","UnicornSword")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] RainbowShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("RainbowPass","MetallicThrowingKnives")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] GamepassCloth",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("RainbowPass","RainbowPackCloth")
    end,
 })

 local Section = Tab:CreateSection("Vip Gamepass")
 local Button = Tab:CreateButton({
    Name = "[] GrimAxe",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","GrimAxe")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] ScytheOfSingularity",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","ScytheOfSingularity")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] BatwingScythe (GLITCHY)",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","BatWingScythe")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] ChakraShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","Chakra")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] BoneScythe",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","BoneScythe")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] VipGamepassCloth",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("VipPass","VipPackCloth")
    end,
 })

 local Section = Tab:CreateSection("Pizza Gamepass")
 local Button = Tab:CreateButton({
    Name = "[] PizzaSword",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("PizzaPass","PizzaSword")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] PizzaShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("PizzaPass","PizzaKunai")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] PizzaGamepassCloth",
    Callback = function()
        game.ReplicatedStorage.RemoteEvent.GiveItemEvent:FireServer("PizzaPass", "PizzaPackCloth")
    end,
})

local Section = Tab:CreateSection("Silly Shurikens Gamepass")
local Button = Tab:CreateButton({
    Name = "[] BoomerangDagger",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","BoomerangDagger")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] DarkageKunai",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","DarkageKunai")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] GhostDagger",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","GhostDagger")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] GrabBagShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","GrabBag")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] OctopusShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","OctopusCannon")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] StarfishShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","StarfishShuriken")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] DonutsShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","ThrowingDonuts")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] WarRockShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","WarRock")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] HandleShuriken",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","Handle")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Flower Shuriken [1]",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","FlowerStar1")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Flower Shuriken [2]",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","FlowerStar2")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] Flower Shuriken [3]",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnyThrowPass","FlowerStar3")
    end,
 })

 local Section = Tab:CreateSection("Silly Swords Gamepass")
 local Button = Tab:CreateButton({
    Name = "[] DualPlungers",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","DualPlungers")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] FryingPan",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","Frying Pan")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] SummerSword",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","SummerSword")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] GuitarSword",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","GuitarSword")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] StopsignAxe",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","StopSignAxe")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] MackerelSword",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","Mackerel")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] BoardWithANail",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","BoardWithANailInIt")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] BigBugNet",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","BigBugNet")
    end,
 })
 local Button = Tab:CreateButton({
    Name = "[] SpringtimeCutlass",
    Callback = function()
        game:GetService("ReplicatedStorage").RemoteEvent.GiveItemEvent:FireServer("FunnySwordPass","SpringtimeCutlass")
    end,
 })

-----------------------------------------------












while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui or not game:GetService("CoreGui"):FindFirstChild("TopBarApp") or not game:GetService("CoreGui"):FindFirstChild("PlayerList") or not game.Players.LocalPlayer.Character do wait() end
local on = true
if not on then return end
local PlaceValues = {
    [823323202] = 1;
}

if not PlaceValues[game.PlaceId] then return end

repeat task.wait(0.1) until game.Players.LocalPlayer:FindFirstChild("leaderstats")

local numofstats = 0
for i,v in ipairs(game.Players.LocalPlayer:FindFirstChild("leaderstats"):GetChildren()) do
    numofstats = numofstats + 1
end
local numnum = numofstats * 110
local xvalue = numnum + 172
local divxvalue = xvalue - 110
local coregui = game:GetService("CoreGui")
local playerlist = coregui:WaitForChild("PlayerList")
local Teams = game:GetService("Teams")
local Players = game:GetService("Players")
local plrsandteams = playerlist:WaitForChild("PlayerListMaster").OffsetFrame.PlayerScrollList.SizeOffsetFrame.ScrollingFrameContainer.ScrollingFrameClippingFrame.ScollingFrame.OffsetUndoFrame
local titlebar = playerlist.PlayerListMaster.OffsetFrame.PlayerScrollList.SizeOffsetFrame:WaitForChild("TitleBar")
local suffixes = {'','K+','M+','B+','T+','qd+','Qn+','sx+','Sp+','O+','N+','de+','Ud+','DD+','tdD+','qdD+','QnD+','sxD+','SpD+','OcD+','NvD+','Vgn+','UVg+','DVg+','TVg+','qtV+','QnV+','SeV+','SPG+','OVG+','NVG+','TGN+','UTG+','DTG+','tsTG+','qtTG+','QnTG+','ssTG+','SpTG+','OcTG+','NoAG+','UnAG+','DuAG+','TeAG+','QdAG+','QnAG+','SxAG+','SpAG+','OcAG+','NvAG+','CT+'}
local TeamValues = {}
local PlayerValues = {}
local Exceptions = {
    ['Reputation'] = 1;
    ['Power'] = 1;
}
local LBExceptions = {
    ['Realm'] = 150;
}

local function comma_value(n)
    if tonumber(n) then
        local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
        return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
    else
        return n
    end
end
local function format(val)
    if tonumber(val) then
        local negative = false
        if string.sub(val,1,1) == "-" then
            val = string.sub(val,2,string.len(val))
            negative = true
        end
        for i=1, #suffixes do
            if tonumber(val) < 10^(i*3) then
                local value = math.floor(val/((10^((i-1)*3))/100))/(100)..suffixes[i]
                if negative then value = "-"..value end
                return value
            end
        end
    else
        return val
    end
end
local function GetPlayer(text)
    for _,Player in pairs(game.Players:GetPlayers()) do
        if string.sub(string.lower(Player.Name),1,string.len(text)) == string.lower(text) then
            return Player
        elseif string.sub(string.lower(Player.DisplayName),1,string.len(text)) == string.lower(text) then
            return Player
        elseif Player.UserId == tonumber(text) then
            return Player
        end
    end
end
local function UpdateTeamValues()
    for i,v in pairs(TeamValues) do
        TeamValues[i] = 0
    end
    local plr
    for i,v in pairs(Players:GetPlayers()) do
        if v:FindFirstChild("leaderstats") then
            plr = v
            for i,v in pairs(v:FindFirstChild("leaderstats"):GetChildren()) do
                if tonumber(v.Value) then
                    TeamValues[plr.Team.Name.."_"..v.Name] = TeamValues[plr.Team.Name.."_"..v.Name] + v.Value
                end
            end
        end
    end
    for i,v in pairs(plrsandteams:GetChildren()) do
        if string.sub(v.Name,1,1) == "t" then
            for i,v in pairs(v:GetChildren()) do
                if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                    local statname = string.sub(v.Name,10,string.len(v.Name))
                    if Exceptions[statname] then
                        if tonumber(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname]) then
                            v.OverlayFrame.StatText.Text = format(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname])
                        else
                            v.OverlayFrame.StatText.Text = "-"
                        end
                    else
                        if tonumber(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname]) then
                            v.OverlayFrame.StatText.Text = comma_value(TeamValues[v.Parent.NameFrame.BGFrame.OverlayFrame.TeamName.Text.."_"..statname])
                        else
                            v.OverlayFrame.StatText.Text = "-"
                        end
                    end
                end
            end
        end
    end
end
local function UpdatePlayerStats(plr)
    repeat task.wait(0.1) until plr:FindFirstChild("leaderstats")
    for i,v in pairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
        if not PlayerValues[plr.Name.."_"..v.Name] then
            PlayerValues[plr.Name.."_"..v.Name] = 0
        end
        PlayerValues[plr.Name.."_"..v.Name] = v.Value
    end
    for i,v in pairs(plrsandteams:GetChildren()) do
        if string.sub(v.Name,1,1) == "p" then
            if GetPlayer(string.sub(v.Name,3,string.len(v.Name))) == plr then
                for i,v in pairs(v.ChildrenFrame:GetChildren()) do
                    if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                        local statname = string.sub(v.Name,10,string.len(v.Name))
                        if Exceptions[statname] then
                            v.OverlayFrame.StatText.Text = format(PlayerValues[plr.Name.."_"..statname])
                        else
                            v.OverlayFrame.StatText.Text = comma_value(PlayerValues[plr.Name.."_"..statname])
                        end
                    end
                end
            end
        end
    end
end
local function UpdatePlayerListSize()
    for i,v in pairs(plrsandteams:GetChildren()) do
        if string.sub(v.Name,1,1) == "t" then
            for i,v in pairs(v:GetChildren()) do
                if v.Name == "BackgroundExtender" then
                    if v.Size ~= UDim2.new(1,0,1,0) then
                        v.Size = UDim2.new(1,0,1,0)
                    end
                end
                if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                    local statname = string.sub(v.Name,10,string.len(v.Name))
                    if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                        v.Size = UDim2.new(1,-divxvalue,1,0)
                    end
                end
            end
        elseif string.sub(v.Name,1,1) == "p" then
            for i,v in pairs(v.ChildrenFrame:GetChildren()) do
                if v.Name == "BackgroundExtender" then
                    if v.Size ~= UDim2.new(1,0,1,0) then
                        v.Size = UDim2.new(1,0,1,0)
                    end
                end
                if string.lower(string.sub(v.Name,1,8)) == "gamestat" then
                    local statname = string.sub(v.Name,10,string.len(v.Name))
                    if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                        v.Size = UDim2.new(1,-divxvalue,1,0)
                    end
                end
            end
        end
    end
    for i,v in pairs(titlebar.ChildrenFrame:GetChildren()) do
        if string.lower(string.sub(v.Name,1,4)) == "stat" then
            local statname = string.sub(v.Name,10,string.len(v.Name))
            if v.Size ~= UDim2.new(1,-divxvalue,1,0) then
                v.Size = UDim2.new(1,-divxvalue,1,0)
            end
        end
    end
end

for i,v in pairs(game.Teams:GetChildren()) do
    local teamname = v.Name
    for i,v in pairs(Players.LocalPlayer:FindFirstChild("leaderstats"):GetChildren()) do
        TeamValues[teamname.."_"..v.Name] = 0
    end
end

for i,v in pairs(Players:GetPlayers()) do
    task.spawn(function()
        repeat task.wait() until v:FindFirstChild("leaderstats")
        if v:FindFirstChild("leaderstats") then
            local plr = v
            for i,v in pairs(v:FindFirstChild("leaderstats"):GetChildren()) do
                v:GetPropertyChangedSignal("Value"):Connect(function()
                    UpdateTeamValues()
                    UpdatePlayerStats(plr)
                end)
            end
            UpdatePlayerStats(plr)
        end
        UpdatePlayerListSize()
    end)
end

Players.PlayerAdded:Connect(function(plr)
    repeat task.wait() until plr:FindFirstChild("leaderstats")
    repeat
        task.wait()
        local plrnumofstats = 0
        for i,v in ipairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
            plrnumofstats = plrnumofstats + 1
        end
    until plrnumofstats == numofstats
    for i,v in pairs(plr:FindFirstChild("leaderstats"):GetChildren()) do
        v:GetPropertyChangedSignal("Value"):Connect(function()
            UpdateTeamValues()
            UpdatePlayerStats(plr)
        end)
    end
    task.wait(0.5)
    UpdatePlayerStats(plr)
    UpdatePlayerListSize()
end)
Players.PlayerRemoving:Connect(function(plr)
    UpdateTeamValues()
end)

playerlist.PlayerListMaster.Size = UDim2.new(0,xvalue,0,680)
UpdatePlayerListSize()

task.spawn(function()
    while task.wait(1) do
        for i,plr in pairs(Players:GetPlayers()) do
            UpdatePlayerStats(plr)
        end
        UpdateTeamValues()
        UpdatePlayerListSize()
    end
end)














while not game:IsLoaded() or not game:GetService("CoreGui") or not game:GetService("Players").LocalPlayer or not game:GetService("Players").LocalPlayer.PlayerGui or not game:GetService("CoreGui"):FindFirstChild("TopBarApp") or not game:GetService("CoreGui"):FindFirstChild("PlayerList") or not game.Players.LocalPlayer.Character do task.wait(0.03) end
local on = true
if not on then return end
if game.PlaceId ~= 823323202 then return end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

task.spawn(function()
    for i,v in pairs(Player.PlayerGui:GetChildren()) do
        if v.Name == "ScreenGui" and v:FindFirstChild("Frame") then
            v:Destroy()
        end
    end
    repeat task.wait() until Players.LocalPlayer:FindFirstChild("PlayerGui")
    local clone = Players.LocalPlayer.PlayerGui.PlayerScript:Clone()
    clone.Parent = Players.LocalPlayer.PlayerGui
    repeat task.wait() until Players.LocalPlayer:FindFirstChild("GuiScript")
    local clone2 = Players.LocalPlayer.PlayerGui.GuiScript:Clone()
    clone2.Parent = Players.LocalPlayer.PlayerGui
end)

Player.CharacterAdded:Connect(function(char)
    repeat wait() until char:FindFirstChild("HumanoidRootPart")
    task.spawn(function()
        for i,v in pairs(Player.PlayerGui:GetChildren()) do
            if v.Name == "ScreenGui" and v:FindFirstChild("Frame") then
                v:Destroy()
            end
        end
        local clone = Players.LocalPlayer.PlayerGui:WaitForChild("PlayerScript"):Clone()
        clone.Parent = Players.LocalPlayer.PlayerGui
        local clone2 = Players.LocalPlayer.PlayerGui:WaitForChild("GuiScript"):Clone()
        clone2.Parent = Players.LocalPlayer.PlayerGui
    end)
end)
