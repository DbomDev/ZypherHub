local version = "V1.1";

if game.PlaceId == 3101667897 then --Legends of Speed

    local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DbomDev/UiLib/master/Lib.lua')))();
    local w = library:CreateWindow("ZypherHub || "..version);

    local b = w:CreateFolder('Farming');
    
    local c = w:CreateFolder('Pets & Trials');

    local d = w:CreateFolder('Localplayer');

    local e = w:CreateFolder('Settings');
    
    local LocalPlayer = game:GetService("Players").LocalPlayer;
    local debounce = false;
    local ragdoll_debounce = false;
    local ragdoll_debounce_1 = 0;
 

    _G.AutoOrbCollect = false;
    _G.AutoGemCollect = false;
    _G.AutoEggHatch = false;
    _G.AutoRebirths = false;


    _G.ESP = false;

    _G.GColor = Color3.fromRGB(111, 255, 0);
    _G.HColor = Color3.fromRGB(0, 166, 255);
 

    -- // Farming //
    b:Toggle("Auto Orbs",function(bool)
        shared.toggle = bool;
        _G.AutoOrbCollect = bool;
    end)

    b:Toggle("Auto Gems",function(bool)
        shared.toggle = bool;
        _G.AutoGemCollect = bool;
    end)



    b:Toggle("Auto Rebirths",function(bool)
        shared.toggle = bool;
        _G.AutoRebirths = bool;
    end)

    -- // Pets & Trials
    c:Button("Auto Egg Hatch", function()
        local args = {
            [1] = "openCrystal",
            [2] = "Lightning Crystal"
        }
        game:GetService("ReplicatedStorage").rEvents.openCrystalRemote:InvokeServer(unpack(args))
    end)

    -- // Localplayer //
    d:Button("Remove Ads", function()
        local wk = game:GetService("Workspace");
        local ads1 = wk:WaitForChild("AdBoxUnits");
        local ads2 = wk:WaitForChild("AdUnits");
        
        ads1:Destroy()
        ads2:Destroy()
    end)

    -- // Settings
    e:Button("Destroy GUI", function()
        b:DestroyGui();
        c:DestroyGui();
        d:DestroyGui();
        e:DestroyGui();
    end)

    game:GetService("RunService").Heartbeat:Connect(function()
        spawn(function()
            if _G.AutoOrbCollect then
                local args = {
                    [1] = "collectOrb",
                    [2] = "Red Orb",
                    [3] = "City",
                }
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                wait()
            end
        end)

        spawn(function()
            if _G.AutoGemCollect then
                local args = {
                    [1] = "collectOrb",
                    [2] = "Gem",
                    [3] = "City",
                }
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(args))
                wait()
            end
        end)

        spawn(function()
            if _G.AutoRebirths then
                local args = {
                    [1] = "rebirthRequest",
                }
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))
                wait(30)
            end
        end)
    end)
elseif game.PlaceId == 155615604 then
    local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DbomDev/UiLib/master/Lib.lua')))();
    local w = library:CreateWindow("ZypherHub || "..version);

    local b = w:CreateFolder('Guns');

    local c = w:CreateFolder('Player');

    local d = w:CreateFolder('Settings');
 
    b:Dropdown("Give Gun",{"M9", "Remington 870", "AK-47"}, false, function(mob)
        local A_1 = game:GetService("Workspace")["Prison_ITEMS"].giver[mob].ITEMPICKUP
        local Event = game:GetService("Workspace").Remote.ItemHandler
        Event:InvokeServer(A_1)
    end)

    b:Dropdown("Gun Mod", {"M9", "Remington 870", "AK-47"}, false, function(mob)
        local module = nil
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(mob) then
            module = require(game:GetService("Players").LocalPlayer.Backpack[mob].GunStates)
        elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(mob) then
            module = require(game:GetService("Players").LocalPlayer.Character[mob].GunStates)
        end
        if module ~= nil then
            module["MaxAmmo"] = math.huge
            module["CurrentAmmo"] = math.huge
            module["StoredAmmo"] = math.huge
            module["FireRate"] = 0.000001
            module["Spread"] = 0
            module["Range"] = math.huge
            module["Bullets"] = 10
            module["ReloadTime"] = 0.000001
            module["AutoFire"] = true
        end
    end)

    c:Slider("Walkspeed", {min = 16, max = 250, precise = true}, function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end)

    c:Slider("Jumo Height", {min=5,max=200, precise=true}, function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value
    end)

    -- // Settings
    d:Button("Destroy GUI", function()
        b:DestroyGui();
        c:DestroyGui();
        d:DestroyGui();
    end)

elseif game.PlaceId == 270499015 then 
    local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DbomDev/UiLib/master/Lib.lua')))();
    local w = library:CreateWindow("ZypherHub || "..version);

    local b = w:CreateFolder('Trainings');
    
    local c = w:CreateFolder('Teleports');

    local d = w:CreateFolder('Remove');

    local e = w:CreateFolder('Settings');
    
    
    local LocalPlayer = game:GetService("Players").LocalPlayer;
    _G.Auto = false;
    _G.AutoJumpingJacks = false;
    _G.Amout_JumpingJacks = 0;
    _G.ESP = false;

    _G.TPTO = "";

    _G.GColor = Color3.fromRGB(111, 255, 0);
    _G.HColor = Color3.fromRGB(0, 166, 255);
 

    -- // Training  //

    -- // Teleport //
    c:Box("To Username", 20, function(value)
        local val = value

        local plrname = game.Players[val]

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = plrname.Character.HumanoidRootPart.CFrame
    end)    

  --  b:Dropdown("Dropdown",{"Gate Entrance","Gate Exit","VIP Entrance","VIP Exit","HQ","PD","Obby","Airbase","White House"},true,function(mob) 
    --    local lib_tps = {
       --     ["Gate Entrance"] = CFrame.new(437.245514, 5.55302048, 57.4681282, -0.99989754, 0, -0.0143166548, 0, 1, 0, 0.0143166548, 0, -0.99989754),
      --      ["Gate Exit"] = CFrame.new(436.101776, 6.02245426, 202.832733, -0.997791708, 0.000225625816, 0.0664201751, 1.39797874e-06, 0.999994338, -0.00337584619, -0.0664205551, -0.00336829829, -0.997786045),
       --     ["VIP Entrance"] = CFrame.new(695.760925, 7.97560215, 70.6875992, -0.999999523, -2.1718226e-05, 0.000950851711, -1.72545078e-05, 0.999988973, 0.0046974672, -0.000950943679, 0.00469744904, -0.999988496),
       --     ["VIP Exit"] = CFrame.new(689.935425, 6.00014639, 211.202606, -0.999019206, -0.000119731092, 0.0442791246, -7.95481901e-06, 0.999996841, 0.00252418849, -0.044279281, 0.00252135983, -0.999016047),
      --      ["HQ"] = CFrame.new(65.5801926, 39.8088112, 584.282654, -0.99984616, 1.38809983e-05, 0.0175426584, -2.98816957e-07, 0.999999642, -0.000807944045, -0.017542664, -0.000807824894, -0.999845803),
      --      ["PD"] = CFrame.new(190.471497, 39.7151489, 822.244141, -0.998768628, 0.000219895126, 0.0496099293, -4.153151e-07, 0.999990165, -0.00444081379, -0.0496104136, -0.00443536649, -0.998758793),
      --      ["Obby"] = CFrame.new(342.656006, 38.4473839, 586.042847, 0.196508065, 0.00211090129, -0.980499923, -6.5274503e-06, 0.999997675, 0.00215157424, 0.980502188, -0.000416424242, 0.196507633),
      --      ["Airbase"] = CFrame.new(-167.448364, 37.7664146, 687.168152, -0.52065593, -0.00306432042, 0.853761137, -1.26011246e-05, 0.999993622, 0.00358148455, -0.85376662, 0.00185395032, -0.520652592),
      --      ["White House"] = CFrame.new(915.440063, 46.8078041, 653.542664, 0.00345891481, -0.0034859709, -0.99998796, 1.26482792e-06, 0.99999392, -0.00348598766, 0.99999404, 1.07889018e-05, 0.00345889828)
      --  }

     --   local msg1 = ":to "..mob;
    --    local args = {[1] = msg1,[2] = "All"}
     --   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
     --   wait(0.25)
     --   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = lib_tps[mob]
  --  end)

    c:Button("Gate Entrance", function()
        local msg1 = ":to GateEntrance";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local GateEntrance = CFrame.new(437.245514, 5.55302048, 57.4681282, -0.99989754, 0, -0.0143166548, 0, 1, 0, 0.0143166548, 0, -0.99989754)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GateEntrance
    end)

    c:Button("Gate Exit", function()
        local msg1 = ":to GateExit";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local GateExit = CFrame.new(436.101776, 6.02245426, 202.832733, -0.997791708, 0.000225625816, 0.0664201751, 1.39797874e-06, 0.999994338, -0.00337584619, -0.0664205551, -0.00336829829, -0.997786045)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GateExit 
    end)

    c:Button("VIP Entrance", function()
        local msg1 = ":to VIPEntrance";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local VIPEntrance = CFrame.new(695.760925, 7.97560215, 70.6875992, -0.999999523, -2.1718226e-05, 0.000950851711, -1.72545078e-05, 0.999988973, 0.0046974672, -0.000950943679, 0.00469744904, -0.999988496)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = VIPEntrance
    end)

    c:Button("VIP Exit", function()
        local msg1 = ":to VIPExit";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local VIPExit = CFrame.new(689.935425, 6.00014639, 211.202606, -0.999019206, -0.000119731092, 0.0442791246, -7.95481901e-06, 0.999996841, 0.00252418849, -0.044279281, 0.00252135983, -0.999016047)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = VIPExit
    end)

    c:Button("HQ", function()
        local msg1 = ":to HQ";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        
        wait(0.25)
        local HQ = CFrame.new(65.5801926, 39.8088112, 584.282654, -0.99984616, 1.38809983e-05, 0.0175426584, -2.98816957e-07, 0.999999642, -0.000807944045, -0.017542664, -0.000807824894, -0.999845803)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = HQ
    end)

    c:Button("PD", function()
        local msg1 = ":to PD";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local PD = CFrame.new(190.471497, 39.7151489, 822.244141, -0.998768628, 0.000219895126, 0.0496099293, -4.153151e-07, 0.999990165, -0.00444081379, -0.0496104136, -0.00443536649, -0.998758793)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PD
    end)

    c:Button("Obby", function()
        local msg1 = ":to Obby";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local Obby = CFrame.new(342.656006, 38.4473839, 586.042847, 0.196508065, 0.00211090129, -0.980499923, -6.5274503e-06, 0.999997675, 0.00215157424, 0.980502188, -0.000416424242, 0.196507633)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obby
    end)

    c:Button("White House", function()
        local msg1 = ":to WhiteHouse";
        local args = {
            [1] = msg1,
            [2] = "All",
        }
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
        wait(0.25)
        local WhiteHouse = CFrame.new(915.440063, 46.8078041, 653.542664, 0.00345891481, -0.0034859709, -0.99998796, 1.26482792e-06, 0.99999392, -0.00348598766, 0.99999404, 1.07889018e-05, 0.00345889828)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = WhiteHouse
    end)

    -- // Remove //
    d:Button("Invisible Walls 1", function()
        local Walls = game:GetService("Workspace"):WaitForChild("invis wall")
        Walls:Destroy();
        local Walls2 = game:GetService("Workspace"):WaitForChild("InvisibleWalls")
        Walls2:Destroy();
    end)

    d:Button("VIP Invisible Walls", function()
        local Walls = game:GetService("Workspace")["VIPClear"]
        Walls:Destroy();
    end)

    -- // Settings //
    e:Button("Destroy GUI", function()
        b:DestroyGui();
    end)
elseif game.PlaceId == 3956818381 then -- Ninja Legends

    local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/DbomDev/UiLib/master/Lib.lua')))();
    local w = library:CreateWindow("ZypherHub || "..version);

    local b = w:CreateFolder('Main');

    local c = w:CreateFolder('Settings');
 
    _G.autoswing = false;
    _G.autosell = false;

    _G.buyswords = false;
    _G.buybelts = false;

    b:Toggle("Auto Swing",function(bool)
        shared.toggle = bool;
        _G.autoswing = bool;
    end)

    b:Toggle("Auto Sell",function(bool)
        shared.toggle = bool;
        _G.autosell = bool;
    end)

    b:Toggle("Buy Swords",function(bool)
        shared.toggle = bool;
        _G.buyswords = bool;
    end)

    b:Toggle("Buy Belts",function(bool)
        shared.toggle = bool;
        _G.buybelts = bool;
    end)

    b:Button("Unlock Islands", function()
        local oldcframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
            wait(0.1)
        end
        wait(0.1)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcframe
    end)

    -- // Settings

    c:Button("Destroy GUI", function()
        b:DestroyGui();
        c:DestroyGui();
        d:DestroyGui();
    end)

    game:GetService("RunService").Heartbeat:Connect(function()
        spawn(function()
            if _G.autoswing then
                if not _G.autoswing then return end
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild("ninjitsuGain") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        break
                    end
                end
                local A_1 = "swingKatana"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1)
                wait()
            end
        end)

        spawn(function()
            if _G.autosell then
                if _G.autosell == false then return end
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                wait()
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
                wait()
            end
        end)

        spawn(function()
            if _G.buyswords then
                if not _G.buyswords then return end
                local A_1 = "buyAllSwords"
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2)
                wait(0.5)
            end
        end)

        spawn(function()
            if _G.buybelts then
                if not _G.buybelts then return end
                local A_1 = "buyAllBelts"
                local A_2 = "Inner Peace Island"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent
                Event:FireServer(A_1, A_2)
                wait(0.5)
            end
        end)
    end)
end
