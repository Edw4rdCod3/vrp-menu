RegisterCommand('map', function()
    SendNUIMessage({
        type = 'minimap',
        show = true
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("map", function()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("settings", function()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), 0, -1)
    SetNuiFocus(false, false)
end)

RegisterNUICallback("resume", function()
    SetNuiFocus(false, false)
    SetDisplay(false)
end)

RegisterNUICallback("quit", function()
    TriggerServerEvent('MenuQuit')
end)



local display = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        SetPauseMenuActive(false)
        if IsControlJustPressed(1, 200) or IsControlJustPressed(1, 199) then
            SetDisplay(not display)
        end
    end
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)

    if bool then
        -- Apply blur when opening the menu
        TriggerScreenblurFadeIn(1000)
    else
        -- Remove blur when closing the menu
        TriggerScreenblurFadeOut(1000)
    end

    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end


--[[RegisterCommand('sendBugReport', function(source, args, rawCommand)
    local bugReport = table.concat(args, " ")
    
    if bugReport == '' then
        SendNUIMessage({ type = 'showAlert', message = 'Please enter a bug report.' })
        return
    end

    -- Send the bug report
    local webhookURL = 'YourWEbHOOK'
    PerformHttpRequest(webhookURL, function(err, text, headers)
        if err == 200 then
            SendNUIMessage({ type = 'showAlert', message = 'Bug report sent successfully!' })
        else
            SendNUIMessage({ type = 'showAlert', message = 'Failed to send bug report.' })
        end
    end, 'POST', json.encode({content = "Bug Report: " .. bugReport}), {['Content-Type'] = 'application/json'})
end, false)
]]