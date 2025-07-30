ESX = exports['es_extended']:getSharedObject()

RegisterServerEvent("rockstar:printConsole")
AddEventHandler("rockstar:printConsole", function(message)
    print("^3[Rockstar Editor]^7 " .. message)
end)

RegisterServerEvent("rockstar:logUsage")
AddEventHandler("rockstar:logUsage", function(action)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    
    if xPlayer then
        print(string.format("^3[Rockstar Editor]^7 Player %s (%s) used %s", 
            xPlayer.getName(), 
            xPlayer.getIdentifier(), 
            action
        ))
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    print("^2[Rockstar Editor]^7 Script started successfully!")
    print("^3[Rockstar Editor]^7 Command: /" .. Config.Command)
    print("^3[Rockstar Editor]^7 Key: " .. Config.Key)
end)
