lib.locale()
isBusy = false

function MiniGame(data)
    if data == 'memorygame' then
        local success = false
        local holdResult = true

        exports["memorygame"]:thermiteminigame(5, 3, 3, 15, function()
            success = true
            holdResult = false
        end, function()
            success = false
            holdResult = false
        end)

        while holdResult do Wait(100) end
        return success
    elseif data == 'ox_lib' then
        local success = lib.skillCheck({'easy', 'easy', 'easy'}, {'w','a','s','d'})
        return success or false
    elseif not data then
        return true
    end
end

function PoliceAlert(ent)
    local Illegal, AlertChance = nil, nil
    for k, v in pairs(Config.Props) do
        if joaat(v.prop) == GetEntityModel(ent) then
            Illegal = v.settings.illegal
            AlertChance = v.settings.alertchance
        end
    end
    if Illegal then
        if math.random(1,100) >= AlertChance then return end

        if Config.Dispatch == 'cd_dispatch' then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = {'police', },
                coords = data.coords,
                title = 'Suspicious Activity',
                message = 'Suspicious activity reported at '..data.street,
                flash = 0,
                unique_id = data.unique_id,
                sound = 1,
                blip = {
                    sprite = 431,
                    scale = 1.2,
                    colour = 3,
                    flashes = false,
                    text = '911 - Suspicious Activity',
                    time = 5,
                    radius = 0,
                }
            })
        elseif Config.Dispatch == 'qb-core' then
            TriggerServerEvent('police:server:policeAlert', locale('police.bliptitle'))
        else
            print('[dd5m_lootcontainers] Config.Dispatch does not have a valid argument')
        end
    end
end

function ProgressBar(ent, settings)
    if lib.progressBar({
        duration = settings.progressTime * 1000,
        label = settings.progressText,
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
            combat = true,
            mouse = false
        },
        anim = settings.anim
    }) then
        if not NetworkGetEntityIsNetworked(ent) then NetworkRegisterEntityAsNetworked(ent) end
        TriggerServerEvent('dd5m_lootcontainers:server:SetEntity', ObjToNet(ent), GetEntityModel(ent), true)
        if not Config.ResetOnReboot then TriggerServerEvent('dd5m_lootcontainers:server:ResetEntity', ObjToNet(ent)) end
        isBusy = false
        ClearPedTasks(PlayerPedId())
    else
        isBusy = false
        HurtPlayer(true)
        ClearPedTasks(PlayerPedId())
    end
end

function HurtPlayer(cancelled)
    local doubled = 0.5
    if cancelled then doubled = 1.5 end

    if Config.Hurting then
        if math.random(1,100) >= Config.HurtChance * doubled then return end

        local health = GetEntityHealth(PlayerPedId())
        local newHealth = health - math.random(Config.HurtDamage.min, Config.HurtDamage.max)
        SetEntityHealth(PlayerPedId(), newHealth)

        if Config.CanBleed then
            if math.random(1,100) >= Config.BleedChance then return end
            TriggerEvent('hospital:client:SetPain')
        end
    end
end