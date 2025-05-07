-- Blox Fruits Auto Farm Script (safe, no key, works with all Executors)
-- By Mahmoud (for educational purposes only)

-- URL to fetch the script content from (replace with your actual URL)
local scriptURL = "https://your-repo-link-to-script-source.lua"

-- Loading the script from the URL
loadstring(game:HttpGet(scriptURL))()

-- Settings for AutoFarm
local AutoFarmEnabled = true
local AutoQuestEnabled = true
local AutoCollectEnabled = true
local AutoSkillEnabled = true
local AutoTeleportEnabled = true
local AutoStatsEnabled = true
local AutoESPEnabled = true

-- Function to enable AutoFarm
local function AutoFarm()
    while AutoFarmEnabled do
        local enemy = game:GetService("Workspace"):FindFirstChild("EnemyName") -- Change "EnemyName" to the NPC you're farming
        if enemy then
            game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = enemy.HumanoidRootPart.CFrame
            if AutoSkillEnabled then
                local skill = game.Players.LocalPlayer:FindFirstChild("Electric Claw") -- Example of skill usage
                if skill then
                    skill:Activate()
                end
            end
        end
        wait(1)
    end
end

-- Function to enable AutoQuest
local function AutoQuest()
    while AutoQuestEnabled do
        local questGiver = game:GetService("Workspace"):FindFirstChild("QuestGiverName") -- Replace with actual quest giver NPC name
        if questGiver then
            -- Add code to click NPC and start quest
        end
        wait(5)
    end
end

-- Function to enable Auto Collect Fruits
local function AutoCollect()
    while AutoCollectEnabled do
        local fruits = game:GetService("Workspace"):FindFirstChild("FruitDropName") -- Replace with actual fruit drop name
        if fruits then
            -- Code to collect fruit
        end
        wait(1)
    end
end

-- Function for Auto Stats Allocation
local function AutoStats()
    while AutoStatsEnabled do
        local strengthPoints = 10
        local defensePoints = 5
        local meleePoints = 5
        -- Adjust these values according to how you want to distribute stats
        game.Players.LocalPlayer:FindFirstChild("Strength").Value = strengthPoints
        game.Players.LocalPlayer:FindFirstChild("Defense").Value = defensePoints
        game.Players.LocalPlayer:FindFirstChild("Melee").Value = meleePoints
        wait(5)
    end
end

-- Function for Teleportation
local function TeleportToLocation(locationName)
    local targetLocation = game:GetService("Workspace"):FindFirstChild(locationName)
    if targetLocation then
        game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = targetLocation.CFrame
    end
end

-- ESP Function (Extra Sensory Perception)
local function ESP()
    while AutoESPEnabled do
        for _, part in pairs(game:GetService("Workspace"):GetChildren()) do
            if part:IsA("Model") and part:FindFirstChild("Humanoid") then
                -- ESP for enemies
                local box = Instance.new("BillboardGui")
                box.Parent = part
                box.Size = UDim2.new(0, 50, 0, 50)
                box.Adornee = part
                box.AlwaysOnTop = true
                local textLabel = Instance.new("TextLabel")
                textLabel.Parent = box
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Text = part.Name
                textLabel.TextColor3 = Color3.new(1, 0, 0)
                textLabel.BackgroundTransparency = 1
            end
        end
        wait(1)
    end
end

-- Main loop to toggle features
while true do
    if AutoFarmEnabled then
        AutoFarm()
    end
    if AutoQuestEnabled then
        AutoQuest()
    end
    if AutoCollectEnabled then
        AutoCollect()
    end
    if AutoStatsEnabled then
        AutoStats()
    end
    if AutoTeleportEnabled then
        TeleportToLocation("FruitLocation")  -- Example: teleport to fruit location
    end
    if AutoESPEnabled then
        ESP()  -- Enable ESP functionality
    end
    wait(1)
end
