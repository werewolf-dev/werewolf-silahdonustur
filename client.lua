Citizen.CreateThread(function()
    RequestModel(GetHashKey(Config.NPC.model))
    while not HasModelLoaded(GetHashKey(Config.NPC.model)) do
        Citizen.Wait(10)
    end
    npc = CreatePed(4, GetHashKey(Config.NPC.model), Config.NPC.coords.x, Config.NPC.coords.y, Config.NPC.coords.z - 1.0, Config.NPC.heading, false, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    exports['qb-target']:AddTargetEntity(npc, {
        options = {
            {
                type = "client",
                event = "werewolf-silahdonustur:menu",
                icon = "fas fa-gun",
                label = "Silahı Dönüştür",
            }
        },
        distance = 2.5
    })
end)

RegisterNetEvent('werewolf-silahdonustur:menu')
AddEventHandler('werewolf-silahdonustur:menu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Silah Dönüştür",
            txt = "Legal silahlarını burdan dönüştürebilirsiniz.",
            params = {
                event = "werewolf-silahdonustur:donustur"
            }
        },
        {
            header = "Kapat",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        }
    })
end)

RegisterNetEvent('werewolf-silahdonustur:donustur')
AddEventHandler('werewolf-silahdonustur:donustur', function()
    TriggerServerEvent('werewolf-silahdonustur')
end)
