lib.locale()

CreateThread(function()

    for k, v in pairs(Config.Props) do
        exports.ox_target:addModel(v.prop, {
            {
                label = v.settings.targetLabel,
                icon = 'fas fa-box-open',
                onSelect = function(ent)
                    isBusy = true
                    PoliceAlert(ent.entity)
                    if not v.settings.minigame then
                        ProgressBar(ent.entity, v.settings)
                    else
                        local success = MiniGame(v.settings.minigame)
                        if success then
                            ProgressBar(ent.entity, v.settings)
                        else
                            exports.qbx_core:Notify(locale('notifies.failed_minigame'))
                            isBusy = false
                        end
                    end
                end,
                canInteract = function(ent)
                    local RequiredItem = nil
                    if not NetworkGetEntityIsNetworked(ent) then NetworkRegisterEntityAsNetworked(ent) end
                    for k, v in pairs(Config.Props) do
                        if v.prop == GetEntityModel(ent) then
                            RequiredItem = v.settings.requireditem
                        end
                    end
                    local wasRobbed = lib.callback.await('dd5m_lootcontainers:server:getEntityState', false, ObjToNet(ent))
                    local haswep = exports.ox_inventory:Search('count', RequiredItem)
                    if RequiredItem ~= nil then
                        if haswep >= 1 and not wasRobbed then
                            return not isBusy
                        end
                    else
                        if not wasRobbed then
                            return not isBusy
                        end
                    end
                end
            }
        })
    end
end)

RegisterNetEvent('dd5m_lootcontainers:client:ResetEntity', function(netId)
    if NetworkGetEntityIsNetworked(netId) then NetworkUnregisterNetworkedEntity(netId) end
end)

