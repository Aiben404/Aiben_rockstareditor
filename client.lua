ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    ESX.PlayerData = xPlayer
    ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
    ESX.PlayerLoaded = false
    ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

function ShowNotification(message, type)
    if Config.EnableNotifications then
        ESX.ShowNotification(message, type or 'info')
    end
end

function PlaySound(soundName)
    if Config.EnableSoundEffects then
        PlaySoundFrontend(-1, soundName, "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    end
end

function openRockstarMenu()
    local lib = exports['ox_lib']
    local options = {}

    table.insert(options, {
        title = Config.Language["option-start-record"],
        icon = 'play',
        description = Config.Language["option-start-record-desc"],
        onSelect = function()
            if not IsRecording() then
                StartRecording(1)
                ShowNotification(Config.Language["recording-started"], 'success')
                PlaySound("SELECT")
            else
                ShowNotification('Recording already in progress!', 'error')
            end
        end,
    })

    table.insert(options, {
        title = Config.Language["option-stop-record"],
        icon = 'stop',
        description = Config.Language["option-stop-record-desc"],
        onSelect = function()
            if IsRecording() then
                StopRecordingAndSaveClip()
                ShowNotification(Config.Language["recording-stopped"], 'success')
                PlaySound("SELECT")
            else
                ShowNotification(Config.Language["not-recording"], 'error')
            end
        end,
    })

    table.insert(options, {
        title = Config.Language["option-open-rockstar"],
        icon = 'film',
        description = Config.Language["option-open-rockstar-desc"],
        onSelect = function()
            ShowNotification(Config.Language["editor-opening"], 'info')
            PlaySound("SELECT")
            Citizen.Wait(500)
            NetworkSessionLeaveSinglePlayer()
            ActivateRockstarEditor()
        end,
    })

    lib:registerContext({
        id = 'rockstar_menu',
        title = Config.Language["menu-title"],
        options = options
    })

    lib:showContext('rockstar_menu')
end

if Config.Command and Config.Command ~= "" then
    RegisterCommand(Config.Command, function()
        if Config.RequirePermission then
            openRockstarMenu()
        else
            openRockstarMenu()
        end
    end, false)
else
    TriggerServerEvent("rockstar:printConsole", "Please configure a command in the config file.")
end

if Config.Key and Config.Key ~= "" and Config.Command and Config.Command ~= "" then
    RegisterKeyMapping(Config.Command, Config.KeyDesc, 'keyboard', Config.Key)
end

RegisterCommand('record', function()
    if not IsRecording() then
        StartRecording(1)
        ShowNotification(Config.Language["recording-started"], 'success')
    else
        StopRecordingAndSaveClip()
        ShowNotification(Config.Language["recording-stopped"], 'success')
    end
end, false)
