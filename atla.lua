getgenv().autoFarm = false;

local remotePath = game:GetService("ReplicatedStorage").NetworkFolder

function doFarm()
    spawn(function()
        while autoFarm == true do
            local args = {[1] = "ProcessKey",[2] = {["Key"] = "E"}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["Key"] = "Q"}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1658.9489746094, 426.97250366211, -2279.9765625),["Key"] = "J",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "X",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "C",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "V",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "B",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "N",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "M",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["AimPos"] = Vector3.new(1549.7655029297, 376.28677368164, -2283.1301269531),["Key"] = "F",["ExtraData"] = {}}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["Key"] = "E"}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            local args = {[1] = "ProcessKey",[2] = {["Key"] = "Q"}}
            remotePath.GameFunction:InvokeServer(unpack(args))
            wait()
        end
    end)
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Avatar TLA") 

local b = w:CreateFolder("Farming") 

local c = w:CreateFolder("Area TP")

local d = w:CreateFolder("Npc TP")

local e = w:CreateFolder("Miscellanous")

b:Toggle("Auto Farm",function(bool)
    getgenv().autoFarm = bool
    print('Auto Farm is: ', bool)
    if bool then
        doFarm();
    end
end)

e:Button("Noclip (N)",function()
    noclip = false
    game:GetService('RunService').Stepped:connect(function()
    if noclip then
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
     
    if key == "n" then
    noclip = not noclip
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)
end)

e:Button("Fly (F)",function()
    local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
 
        localplayer = plr
 
        if workspace:FindFirstChild("Core") then
            workspace.Core:Destroy()
        end
 
        local Core = Instance.new("Part")
        Core.Name = "Core"
        Core.Size = Vector3.new(0.05, 0.05, 0.05)
 
        spawn(function()
            Core.Parent = workspace
            local Weld = Instance.new("Weld", Core)
            Weld.Part0 = Core
            Weld.Part1 = localplayer.Character.LowerTorso
            Weld.C0 = CFrame.new(0, 0, 0)
        end)
 
        workspace:WaitForChild("Core")
 
        local torso = workspace.Core
        flying = true
        local speed=10
        local keys={a=false,d=false,w=false,s=false}
        local e1
        local e2
        local function start()
            local pos = Instance.new("BodyPosition",torso)
            local gyro = Instance.new("BodyGyro",torso)
            pos.Name="EPIXPOS"
            pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
            pos.position = torso.Position
            gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            gyro.cframe = torso.CFrame
            repeat
                wait()
                localplayer.Character.Humanoid.PlatformStand=true
                local new=gyro.cframe - gyro.cframe.p + pos.position
                if not keys.w and not keys.s and not keys.a and not keys.d then
                    speed=5
                end
                if keys.w then
                    new = new + workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+0
                end
                if keys.s then
                    new = new - workspace.CurrentCamera.CoordinateFrame.lookVector * speed
                    speed=speed+0
                end
                if keys.d then
                    new = new * CFrame.new(speed,0,0)
                    speed=speed+0
                end
                if keys.a then
                    new = new * CFrame.new(-speed,0,0)
                    speed=speed+0
                end
                if speed>10 then
                    speed=5
                end
                pos.position=new.p
                if keys.w then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(-math.rad(speed*0),0,0)
                elseif keys.s then
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame*CFrame.Angles(math.rad(speed*0),0,0)
                else
                    gyro.cframe = workspace.CurrentCamera.CoordinateFrame
                end
            until flying == false
            if gyro then gyro:Destroy() end
            if pos then pos:Destroy() end
            flying=false
            localplayer.Character.Humanoid.PlatformStand=false
            speed=10
        end
        e1=mouse.KeyDown:connect(function(key)
            if not torso or not torso.Parent then flying=false e1:disconnect() e2:disconnect() return end
            if key=="w" then
                keys.w=true
            elseif key=="s" then
                keys.s=true
            elseif key=="a" then
                keys.a=true
            elseif key=="d" then
                keys.d=true
            elseif key=="f" then
                if flying==true then
                    flying=false
                else
                    flying=true
                    start()
                end
            end
        end)
        e2=mouse.KeyUp:connect(function(key)
            if key=="w" then
                keys.w=false
            elseif key=="s" then
                keys.s=false
            elseif key=="a" then
                keys.a=false
            elseif key=="d" then
                keys.d=false
            end
        end)
        start()
end)

e:DestroyGui()

b:Button("Safe Place",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").Areas.Library.AreaParts.AreaPart.CFrame)
end)

c:Button("Roku's Temple",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(6004.38379, 91.651413, 260.895905, 0.766066015, -4.69039474e-09, 0.642761886, 3.80406675e-08, 1, -3.80409411e-08, -0.642761886, 5.35929665e-08, 0.766066015))
end)

c:Button("Swamp",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(3567.59863, 7.39990091, 2908.01904, -0.99151808, 4.26606697e-08, -0.129968837, 3.80394098e-08, 1, 3.80391754e-08, 0.129968837, 3.27725935e-08, -0.99151808))
end)

c:Button("Desert",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").Areas.Desert.AreaParts.AreaPart.CFrame)
end)

c:Button("Royal Plaza",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(5162.81689, 21.0659103, -2638.45117, -0.96691817, -2.70782756e-08, 0.25508678, -3.80403407e-08, 1, -3.8040465e-08, -0.25508678, -4.64856029e-08, -0.96691817))
end)

c:Button("Caldera",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(6339.01367, 161.247925, -6397.10645, 0.946817517, 4.82567373e-08, -0.321770966, -3.80397438e-08, 1, 3.80396052e-08, 0.321770966, -2.37764795e-08, 0.946817517))
end)

c:Button("West Air",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(7981.47314, 182.951401, -2090.04126, -0.0601199567, -0, -0.998191178, -0, 1, -0, 0.998191178, 0, -0.0601199567))
end)

c:Button("South Air",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").Areas["Southern Air Temple"].AreaParts.AreaPart.CFrame)
end)

c:Button("North Water",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(8606.43066, 61.1514168, 858.088379, -0.065884687, 0, 0.997827232, 0, 1.00000012, -0, -0.997827351, 0, -0.0658846796))
end)

c:Button("South Water",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(70.0243073, 11.4481468, 488.53653, -0.119098075, -3.32391465e-08, 0.99288249, 3.8040362e-08, 1, 3.8040433e-08, -0.99288249, 4.23001509e-08, -0.119098075))
end)

c:Button("Library",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").Areas.Library.AreaParts.AreaPart.CFrame)
end)

c:Button("Ba Sing Se",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(5798.84229, 7.75142431, 4305.71533, -0.998046935, 4.03459275e-08, -0.0624684058, 3.80439324e-08, 1, 3.80399996e-08, 0.0624684058, 3.55891636e-08, -0.998046935))
end)

c:Button("Kyoshi Island",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").Areas["Kyoshi Island"].AreaParts.AreaPart.CFrame)
end)

c:Button("Misty Palm Oasis",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(3407.67725, 93.5278397, 3894.35547, 0.0697871447, 0, 0.997561872, 0, 1, 0, -0.997561872, 0, 0.0697871447))
end)

c:Button("Spirit Oasis",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(CFrame.new(9422.48047, 188.598602, 815.836609, 0.173624337, 0, 0.984811902, 0, 1, 0, -0.984811902, 0, 0.173624337))
end)

d:Button("Airbender1",function()
    function teleportTO(placeCFrame)
        local plyr = game.Players.LocalPlayer;
        if plyr.Character then 
            plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
        end
    end
    teleportTO(game:GetService("Workspace").QuestNPCs.AirNPC1[" "].HumanoidRootPart.CFrame)

    print('ATLA Hub has been attached')

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)
