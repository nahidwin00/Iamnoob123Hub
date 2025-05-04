local NeonUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/NeonHub/NeonVampireUI/main/UI.lua"))()
NeonUI:Init()

local useAutoFarm = true
local useKillAura = true
local useAutoQuest = true
local useBossFarm = true
local useTeleportation = true
local useGhoulV3 = true
local useElectricClaw = true
local useTrueTripleKatana = true

function teleportToQuest()
    local questLocation = game:GetService("Workspace"):FindFirstChild("QuestNPC")
    if questLocation then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = questLocation.CFrame
    end
end

function autoFarm()
    if useAutoFarm then
        local enemy = game:GetService("Workspace"):FindFirstChild("Enemy")
        if enemy then
            enemy:TakeDamage(1000)
        end
    end
end

function killAura()
    if useKillAura then
        local enemies = game:GetService("Workspace"):GetChildren()
        for _, enemy in pairs(enemies) do
            if enemy:IsA("Model") and enemy:FindFirstChild("Humanoid") then
                enemy.Humanoid.Health = 0
            end
        end
    end
end

function autoQuest()
    if useAutoQuest then
        local quest = game:GetService("Workspace"):FindFirstChild("QuestNPC")
        if quest then
            quest.Interact:Fire()
        end
    end
end

function bossFarm()
    if useBossFarm then
        local boss = game:GetService("Workspace"):FindFirstChild("Boss")
        if boss then
            while boss.Health > 0 do
                boss:TakeDamage(1000)
                wait(1)
            end
        end
    end
end

function activateSpecialAbilities()
    if useGhoulV3 then
        -- Add Ghoul V3 ability activation code here
    end
    if useElectricClaw then
        -- Add Electric Claw ability activation code here
    end
    if useTrueTripleKatana then
        -- Add True Triple Katana ability activation code here
    end
end

NeonUI:CreateButton("Auto Farm", autoFarm)
NeonUI:CreateButton("Kill Aura", killAura)
NeonUI:CreateButton("Auto Quest", autoQuest)
NeonUI:CreateButton("Boss Farm", bossFarm)
NeonUI:CreateButton("Teleport to Quest", teleportToQuest)

function runFeatures()
    if useAutoFarm then autoFarm() end
    if useKillAura then killAura() end
    if useAutoQuest then autoQuest() end
    if useBossFarm then bossFarm() end
    if useTeleportation then teleportToQuest() end
    activateSpecialAbilities()
end

while true do
    runFeatures()
    wait(0.5)
end
