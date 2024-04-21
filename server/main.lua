lib.locale()
local entities = {}
QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('dd5m_lootcontainers:server:ResetEntity', function(entity)
    entities[entity] = 0
end)

function EntityRespawn()
    if entities ~= nil or entities ~= {} then
        for _,t in pairs(entities) do
            entities[_] = t + 1
            if t >= 0 and t >= Config.ResetTime then
                entities[_] = -1
            end
        end
    end
    SetTimeout(60000, EntityRespawn)
end

if not Config.ResetOnReboot then
    EntityRespawn()
end

RegisterNetEvent('dd5m_lootcontainers:server:SetEntity', function(netId, entModel, isFinished)
    entities[netId] = 0
    DropItem(isFinished, netId, entModel, source)
end)

local function pGive(playerId, item, amount)
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end
    if type(item) == 'string' then
        Player.Functions.AddItem(item, amount)
        lib.notify(playerId, {
            description = "Item obtained.",
            type = "success",
        })
    elseif type(item) == 'table' and amount == 10000 then
        local itemString = ''
        if #item <= 0 then lib.notify(playerId, { description = locale('notifies.got_nothing'), type = 'info' }) return end
        for _,i in pairs(item) do
            Player.Functions.AddItem(i.item, i.amount)
            itemString = i.item .. ', ' .. itemString
        end
        if itemString ~= '' then
            lib.notify(playerId, {
                description = "Items obtained.",
                type = "success",
            })
        else
            lib.notify(playerId, {
                description = "Nothing was found.",
                type = "error",
            })
        end
    end
end

function DropItem(finished, netId, entModel, playerId)
    local Settings = {}
    local Player = QBCore.Functions.GetPlayer(playerId)
    if not Player then return end
    if not netId then return end
    if not finished then return end
    for k, v in pairs(Config.Props) do
        if entModel == v.prop then
            Settings = v.settings
        end
    end
    if Settings.canlootmultiple then
        local itemTable = {}
        local itemAmount = math.random(1, Settings.maxlootitem)

        for i=1, itemAmount do
            local lootChance = math.random(1,100)
            local item = Settings.loot[math.random(1, #Settings.loot)]
            if lootChance >= item.chances then
                itemTable[#itemTable+1] = {item = item.item, amount = math.floor(math.random(item.min, item.max))}
            end
        end
        return pGive(playerId, itemTable, 10000)
    else
        local lootChance = math.random(1,100)
        local item = Settings.loot[math.random(1, #Settings.loot)]
        if lootChance >= item.chances then
            return pGive(playerId, item.item, math.random(item.min, item.max))
        end
    end
end

lib.callback.register('dd5m_lootcontainers:server:getEntityState', function(source, netId)
    if entities[netId] == -1 or entities[netId] == nil then return false else return true end
end)

AddEventHandler('onResourceStop', function(resName)
    if resName ~= GetCurrentResourceName() then return end
    for _,v in pairs(entities) do
        if v == -1 then
            TriggerClientEvent('dd5m_lootcontainers:client:ResetEntity', -1, _)
        end
    end
end)