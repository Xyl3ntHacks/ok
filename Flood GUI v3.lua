repeat task.wait() until game:IsLoaded() 
getgenv''.maps = {
	    "Undersea_Facility",
		"Active_Mineshafts",
        "Beneath_The_Ruins",
		"End_Of_The_Line",
		"Familiar_Ruins",
		"Shutdown",
		"Sunken_Citadel",
		"Toxic_Woods",
	    "Lost Woods",
		"Axiom",
		"Castle Tides",
		"Poisonous Valley",
		"Marred Dreams",
		"Buried Oasis",
		"Forsaken Era",
		"Eerie Peaks",
		"Polar Industry",
		"Infiltration",
		"Cave System",
		"Flood Island",
		"Oriental Grove",
		"Sky Sanctuary",
		"Decrepit Seas",
		"Mysterium",
		"Forgotten Tombs",
		"Construction Thrill",
		"Fall Equinox",
		"Northern Workshop",
		"Lava Tower",
		"Crystal Caverns",
		"Snowy Peaks",
		"Dark Sci-Forest",
		"Graveyard Cliffside",
		"Wild Savannah",
		"Sedimentary Temple",
		"Sunken Citadel",
		"Relic Valley",
		"Poisonous Forest",
		"Abandoned Facility",
		"Familiar Ruins",
		"Lost Desert",
		"Gloomy Manor",
		"Sinking Ship",
		"Dark Sci-Facility",
		"Beneath The Ruins",
		"Magmatic Mines",
		"Fallen",
		"Blue Moon",
		"Poisonous Chasm",
		"Ignis Peaks",
		"Sandswept Ruins",
		"Satomi Springs"
	}
wait = task.wait

local clmain = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("CL_MAIN_GameScript")) or wait()
local save = clmain.newAlert
clmain.newAlert = function(text)
    save(text,nil,nil,'rainbow')
end
if getrenv().wow and debugmode == false then
	clmain.newAlert('Already Executed!',Color3.new(1,0,0))
    error('Already Executed')
else
    getrenv().wow=''
end
-- TAS file minifier 
-- Starting from this line to ending line code was made by ian
local HttpService = game:GetService("HttpService")
local function round(x)
    local factorOfTen = 10^(3)
    return math.floor(x * factorOfTen + .5) / factorOfTen
end
local function minfile(file)
    local tasFile = HttpService:JSONDecode(file)
    local minTasFile = {}
    for t,data in ipairs(tasFile) do
        local minData = {}
        for key,val in pairs(data) do
            local minVal = nil
            if type(val) == "table" then
                minVal = {}
                for f,x in ipairs(val) do
                    if type(x) == "number" then table.insert(minVal, round(x))
                    else table.insert(minVal, x) end    
                end
            else
                minVal = round(val)
            end
            minData[key] = minVal
        end
        table.insert(minTasFile, minData)
    end
    return HttpService:JSONEncode(minTasFile)
end
-- ending line
local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:wait()
local bb = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
	bb:CaptureController()
	bb:ClickButton2(Vector2.new())
end)
-- new anticheat bypass all credits to altlexon
game.ReplicatedStorage.Remote.ReqCharVars.OnClientInvoke = function()
	return {}
end
getgenv().oof = false
local votemap = game.Players.LocalPlayer.PlayerGui.GameGui.VoteMap
local key = -game:GetService("ReplicatedStorage").Remote.ReqPasskey:InvokeServer()
function vote()
	wait(1)
	game:GetService("ReplicatedStorage").Remote.UpdMapVote:FireServer(key, 8, 0)
	if not game.Workspace.Multiplayer:WaitForChild("NewMap", 7) then
		game:GetService("ReplicatedStorage").Remote.UpdMapVote:FireServer(key, 2, 0)
	end
end
game.Players.PlayerAdded:Connect(function()
	if getgenv().autoleave == true then
		game.Players.LocalPlayer:Kick("Auto-Leave is enabled. So you were kicked because a player joined.")	
	end
end)
votemap.Changed:Connect(function(change)
	if change == "Visible" then
		if votemap.Visible == true and getgenv().oof == true then
			print("Voting..")
			wait()
			vote()
		end
	end
end)
print("Loaded!")
local lp = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local TS = game:GetService("TweenService")
local function Time(targetpos)
	local tme = (targetpos - lp.Character.HumanoidRootPart.Position).Magnitude / math.random(16, 20)
	return tme
end
local function tween(pos)
	local toof = TS:Create(lp.Character.HumanoidRootPart, TweenInfo.new(Time(pos), Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		CFrame = CFrame.new(pos)
	})
	toof:Play()
	return toof
end


getgenv().active = false
task.spawn(function()
	while wait(1) do
		local function oof()
			print(game.Workspace.Multiplayer:WaitForChild("Map",9e9).Name)
			wait()
			Map = workspace.Multiplayer:WaitForChild("Map",9e9)
			for i, v in pairs(Map:GetDescendants()) do
				if v.Name == "Handle" then
					v:Destroy()
				end
			end
			if Map:FindFirstChild("Settings") ~= nil then
				print(Map.Settings.MapName.Value)
			end
			if Map:FindFirstChild("ExitRegion", true) then
				local oos = tween(Map:FindFirstChild("ExitRegion", true).Position, Map:FindFirstChild("ExitRegion", true).CFrame)
				oos.Completed:wait()
				wait()
				Map:FindFirstChild("ExitRegion", true):Destroy()
				if getgenv().active == true then
					return
				end
			end
			for i, v in pairs(Map:GetDescendants()) do
				if v:IsA("Part") and v:FindFirstChild("TouchInterest") ~= nil and v.Parent ~= nil then
					local toof = tween(v.Position, v.CFrame)
					toof.Completed:wait()
					wait()
					v:Destroy()
				end
			end
		end
		if getgenv().active == true then
			oof()
			if Map:FindFirstChild("ExitRegion", true) == nil then
				repeat
					wait()
				until game.Workspace.Multiplayer:WaitForChild("OldMap")
				game.Players.LocalPlayer.Character.Humanoid.Health = 0
				game.Players.LocalPlayer.CharacterAdded:Wait()
				wait(.1)
				game:GetService("ReplicatedStorage").Remote.AddedWaiting:FireServer(-game:GetService("ReplicatedStorage").Remote.ReqPasskey:InvokeServer())
				wait(.3)
				for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Waiting.UI.Content.Buttons.MapVote.MouseButton1Click)) do
					v:Fire()
				end
			end
		else
			wait(1)
		end
	end
end)
local UIS = game:GetService'UserInputService'
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
	SchemeColor = Color3.fromRGB(0, 100, 255),
	Background = Color3.fromRGB(40, 40, 40),
	Header = Color3.fromRGB(30, 30, 30),
	TextColor = Color3.fromRGB(255, 255, 255),
	ElementColor = Color3.fromRGB(60, 60, 60)
}
local Window = Library.CreateLib("Flood GUI v3 | By Tomato", colors)
local a = Window:NewTab("Auto")
local l = Window:NewTab("Local-Player")
local b = Window:NewTab("Blatant")
local t = Window:NewTab("TAS")
local k = Window:NewTab("Other")
local c = Window:NewTab("Credits")
local auto = a:NewSection("Auto")
local loc = l:NewSection("Local Player")
local blatant = b:NewSection("Blatant")
local tas = t:NewSection("TAS")
local other = k:NewSection("Other")
local credits = c:NewSection("Credits")
getgenv().wow = true
other:NewKeybind("ToggleUI", "Toggle UI with this keybind.", Enum.KeyCode.J, function()
	if getgenv().ui == true then
		clmain.newAlert("UI Disabled!", Color3.fromRGB(255, 0, 0))
		getgenv().ui = false
	else
		clmain.newAlert("UI Enabled!", Color3.fromRGB(0, 60, 255))
		getgenv().ui = true
	end
	Library:ToggleUI()
end)
other:NewLabel("Discord Invites")
other:NewButton("Copy Tomato-Hub Invite", "Copies Tomato-Hub invite to clipboard!", function()
	setclipboard("https://discord.gg/8N2M9fHJqa")
end)
other:NewButton("Copy Lexon-Hub Invite", "Copies Lexon-Hub invite to clipboard!", function()
	setclipboard("https://discord.gg/ng4CN7Vq")
end)
getgenv().ui = true
loc:NewSlider("Walkspeed", "Change your walkspeed!", 100, 20, function(t)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = t
end)
loc:NewSlider("JumpPower", "Change your jumppower!", 200, 50, function(t)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = t
end)

local save = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts["CL_MAIN_GameScript"]).takeAir
getgenv().godmode = false
spawn(function()
	while wait(.04) do
		if getgenv().godmode == true then
			getsenv(game:GetService("Players").LocalPlayer.PlayerScripts["CL_MAIN_GameScript"]).takeAir = function()
				return 0
			end
		else
			getsenv(game:GetService("Players").LocalPlayer.PlayerScripts["CL_MAIN_GameScript"]).takeAir = save
		end
	end
end)
blatant:NewKeybind("Infinite Air", "Infinite Air/God Mode", Enum.KeyCode.R, function()
	if getgenv().godmode ~= false then
		clmain.newAlert("Infinite Air Disabled!", Color3.fromRGB(255, 0, 0))
		getgenv().godmode = false
	else
		clmain.newAlert("Infinite Air Enabled!", Color3.fromRGB(0, 255, 0))
		getgenv().godmode = true
	end
end)
getgenv().noclip = false
blatant:NewKeybind("Noclip", "Walk through some walls!", Enum.KeyCode.G, function()
	if getgenv().noclip ~= false then
		lp.Character:WaitForChild("Torso").CanCollide = getgenv().noclip
		lp.Character:WaitForChild("HumanoidRootPart").CanCollide = getgenv().noclip
		clmain.newAlert("Noclip Disabled!", Color3.fromRGB(255, 0, 0))
		getgenv().noclip = false
	else
		lp.Character:WaitForChild("Torso").CanCollide = getgenv().noclip
		lp.Character:WaitForChild("HumanoidRootPart").CanCollide = getgenv().noclip
		clmain.newAlert("Noclip Enabled!", Color3.fromRGB(0, 255, 0))
		getgenv().noclip = true
	end
end)
blatant:NewButton("Lag Server", "Equip buddy then press", function()
	local key = -game:GetService("ReplicatedStorage").Remote.ReqPasskey:InvokeServer()
	for i = 1, 190, 1 do
		game:GetService("ReplicatedStorage").Remote.ConfirmItem:FireServer(key, 40)
	end
end)
auto:NewToggle("Auto-Play [Working]", "Requires TAS files", function(t)
	getgenv().play = t
end)
getgenv().play = false
task.spawn(function()
		while task.wait(1) do
			local S,r = pcall(function()
				if getgenv().play ~= false then
					loadstring(game:HttpGet('https://raw.githubusercontent.com/ImMejor35/Flood-GUI/main/TAS/TAS%20Player'))
					"TAS Player Fixed By Tomato with help from Epix"
				end
			end)
			if S ~= true then
				print(r)
			end
		end
end)
getgenv().infjump = false
blatant:NewKeybind("Infinite Jump", "Jump while freefalling!", Enum.KeyCode.M, function(t)
	infjump = not infjump
end)
UIS.InputBegan:connect(function(UserInput,Typed)
	if infjump == true and UserInput.KeyCode == Enum.KeyCode.Space or UserInput.KeyCode == Enum.KeyCode.ButtonA and not Typed then
		lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
auto:NewToggle("Auto-Farm [DISCONTINUED]", "Automatically wins for you!", function(t)
	getgenv().active = t
end)
auto:NewToggle("Auto-Vote", "Automatically votes for you!", function(t)
	getgenv().oof = t
end)
auto:NewButton("Get TAS files", "Downloads Required TAS files!", function()
	print("Starting downloads..")
	for i, v in pairs(maps) do
		print("-------------------------------------------------")
		local map = string.gsub(v, " ", "%%20")
		local su = false -- isfile(v..".json")
		if su == true then
			clmain.newAlert(v.." TAS file already exists!",Color3.fromRGB(50,100,255))
		else
			local s, r = pcall(function()
				local tas = game:HttpGet("https://raw.githubusercontent.com/ImMejor35/Flood-GUI/main/TAS%20FILES/"..map..".json")
				writefile(v..".json", minfile(tas),true)
			end)
			if s then
				clmain.newAlert("Downloaded "..v.." TAS file succesfully!",Color3.fromRGB(0,255,0))
			else
				clmain.newAlert("Failed to download "..v.." TAS file. :(",Color3.fromRGB(255,0,0))
			end
		end
		task.wait()
	end
	clmain.newAlert("Finished Downloading TAS files")
end)
tas:NewButton("Rejoin", "Rejoin game so you can create another TAS", function()
	game:GetService("TeleportService"):Teleport(game:GetService("Players").LocalPlayer)
end)

tas:NewButton('Fix Create-TAS', 'Fix', function()
    local Workspace = game:GetService('Workspace')
    local LP = game.Players.LocalPlayer
    if Workspace.Multiplayer:FindFirstChild('Map') then
        Workspace.Multiplayer.Map:Destroy()
    end
    local Map = Workspace.Multiplayer:WaitForChild('Map')
    local Spawn = (function() -- this whole function was made by Epix
            local Workspace = game:GetService("Workspace")
            local character = LP.Character
            local characterPosition = character.HumanoidRootPart.Position -- only need to evaluate this once
    
            -- Get parts that have the character above them
    
            -- Part that's supposed to represent the character's "feet"
            local dummyPart = Instance.new("Part")
            dummyPart.Size = Vector3.one
            dummyPart.Position = characterPosition - (Vector3.yAxis * 2)
            dummyPart.Anchored = true
            dummyPart.CanCollide = false
            dummyPart.Parent = Workspace
    
            local overlapParams = OverlapParams.new()
            overlapParams.FilterDescendantsInstances = {dummyPart} -- Only checking if bounding area intersects with "feet"
            overlapParams.FilterType = Enum.RaycastFilterType.Whitelist
    
            local spawnCandidates = table.create(10)
            for _, item in next, Map:GetDescendants() do
                if not item:IsA("BasePart") or (item.Position - characterPosition).Magnitude > 10 then
                    continue
                end
    
                -- If the part is flipped upside down, that is a problem, thus there is a check here
                local facingUpVector
                if item.CFrame.UpVector:Dot(Vector3.yAxis) >= 0 then facingUpVector = item.CFrame.UpVector else facingUpVector = -item.CFrame.UpVector end
                local candidatesInArea = Workspace:GetPartBoundsInBox(
                    item.CFrame + (facingUpVector * (item.Size.Y/2 + 0.25)),
                    Vector3.new(item.Size.X, 0.5, item.Size.Z),
                    overlapParams
                )
                for _, candidate in next, candidatesInArea do
                    if candidate == dummyPart then
                        table.insert(spawnCandidates, item)
                    end
                end
            end
    
            dummyPart:Destroy()
    
            if #spawnCandidates >= 1 then
                -- Prioritize invisible spawn parts parented to the map
                for _, spawnCandidate in next, spawnCandidates do
                    if spawnCandidate.CanCollide and (spawnCandidate.Transparency >= 0.8 or spawnCandidate.Parent == map) then
                        return spawnCandidate
                    end
                end
                -- Second pass: only needs to be CanCollide
                for _, spawnCandidate in next, spawnCandidates do
                    if spawnCandidate.CanCollide then
                        return spawnCandidate
                    end
                end
                -- Fall back to first in list
                return spawnCandidates[1]
            else
                error("Failed to find spawn part!")
            end
    end)()
    
Spawn.Name = "Spawn"
end)

tas:NewButton("Create-TAS", "Create a TAS, Press then enter lift.", function()
	game.Workspace.DescendantAdded:Connect(function(child)
		if child.ClassName == "Sound" then
			child:Destroy()
		end
	end)
	local Fix = coroutine.wrap(function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/ExploitOnYt/87466f9b6f9333449c683643e59fdf94/raw/440d5306e1aa87f1ba20e94be005bffe945e0f8a/Tas", true))()
	end)
        local ButtonStuff = coroutine.wrap(function()
            for i,v in pairs(game.Workspace:WaitForChild("Map"):GetDescendants()) do
                if v.ClassName == "Part" and v.Size == Vector3.new(3,1,3) then 
                    v.Size = v.Size * 1.8
                    v.Color = Color3.fromRGB(255,140,0)
                    local selectbox = Instance.new("SelectionBox", v)
                    selectbox.Adornee = v
                    selectbox.Color3 = Color3.fromRGB(255,140,0)
                    getgenv().delayy = false
                    v.Touched:Connect(function(part)
                        if delayy == false then
                            clmain.newAlert("Button Touched!",Color3.fromRGB(255,140,0))
                            delayy = true
                            wait(1)
                            delayy = false
                        end
                    end)
                end
            end
        end)
	Fix()
	ButtonStuff()
end)
tas:NewButton("Run-TAS", "Press then enter lift!", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/ImMejor35/Flood-GUI/main/TAS/TAS%20Player'))
	"TAS Player Fixed By Tomato with help from Epix"
end)


local oldindex
oldindex = hookmetamethod(game, "__index", function(self, b)
	if tostring(self) == "HumanoidRootPart" and b == "Position" and not checkcaller() then
		if getgenv().swim == true then
			return Vector3.new(-23, -153, 0) -- position of lobby water
		else
			return oldindex(self, b) -- normal player position
		end
	end
	return oldindex(self, b)
end)
tas:NewKeybind("Toggle Swim", "Only works while creating TAS.", Enum.KeyCode.T, function()
	if getgenv().swim == true then
		getgenv().swim = false
	else
		getgenv().swim = true
	end
end)
tas:NewButton("Remove Water (TAS)", "Removes water in tas creator", function()
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if string.match(string.lower(v.Name),"water") then
            v:Destroy()
        end
    end
end)
tas:NewToggle("Auto-Leave", "Automatically leaves when player joins!", function(t)
	getgenv().autoleave = t
end)
credits:NewLabel("New Anti-Kick by AltLexon#6917")
credits:NewLabel("TAS script by Voiz#5668")
credits:NewLabel("TAS File Minifier by iaan#8193")
credits:NewLabel("Everything else by Tomato")
wait()
if debugmode == true then
	clmain.newAlert("Flood GUI v3 loaded in Debug Mode!",Color3.new(0,0,1))
else
	clmain.newAlert("Flood GUI v3 Loaded!",nil,nil,"rainbow")
end
local oldwrite; oldwrite = hookfunction(writefile,function(name,data,bypass)
    if bypass ~= true then
        local Mn = string.gsub(name,'.json','')
        if table.find(maps,Mn) then
            clmain.newAlert("Saved "..Mn.." TAS file!",nil,nil,"rainbow")
            return oldwrite(name,minfile(data))
        end
    end
    return oldwrite(name,data)
end)


--resets character to fix lag bug wow
game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Health = 0
