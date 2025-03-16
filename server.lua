local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('werewolf-silahdonustur')
AddEventHandler('werewolf-silahdonustur', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local legalmi = false
    for _, job in ipairs(Config.legalmeslek) do
        if Player.PlayerData.job.name == job then
            legalmi = true
            break
        end
    end

    if legalmi then
        TriggerClientEvent('QBCore:Notify', src, "Legaller bu işlemi yapamaz!", "error")
        return
    end

    local weaponItem = nil
    for itemName, newItem in pairs(Config.donustur) do
        local item = Player.Functions.GetItemByName(itemName)
        local itemAmount = 0
        if item then
            itemAmount = item.amount or 0
        end
        if itemAmount > 0 then
            weaponItem = itemName
            break
        end
    end

    if not weaponItem then
        TriggerClientEvent('QBCore:Notify', src, "Üzerinizde dönüştürebilecek bir silah yok!", "error")
        return
    end

    Player.Functions.RemoveItem(weaponItem, 1)
    local newWeapon = Config.donustur[weaponItem]
    Player.Functions.AddItem(newWeapon, 1)
    TriggerClientEvent('QBCore:Notify', src, "Silah dönüştürüldü!", "success")
end)
