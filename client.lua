
--Comprobar la comida
CreateThread(function()
    while true do
        Wait(200)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.getPercent()
        end)
        Wait(200)
        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            hunger = status.getPercent()
        end)
        Wait(200)
    end
    Wait(200)
end)


--Mostrar el radar solo cuando estes en un vehiculo
Citizen.CreateThread(function()
    while true do

        Citizen.Wait(0)
        if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            canHide = true
            DisplayRadar(canHide)
        else
            canHide = false
            DisplayRadar(canHide)
        end

    end
end)

-- Quitar la vida y chaleco del minimapa default
Citizen.CreateThread(function()

    local minimap = RequestScaleformMovie("minimap")

    SetRadarBigmapEnabled(true, false)

    Wait(0)

    SetRadarBigmapEnabled(false, false)

    while true do

        Wait(0)

        BeginScaleformMovieMethod(minimap, "SETUP_HEALTH_ARMOUR")

        ScaleformMovieMethodAddParamInt(3)

        EndScaleformMovieMethod()

    end

end)
--Comando para ocultar/mostrar el hud
local showhud = false
RegisterCommand('showhud', function(source, args, rawCommand)
    showhud = not showhud

    if showhud then
        SendNUIMessage({
            action = 'hideHud'

        })
    else
        SendNUIMessage({
            action = 'showHud'

        })
    end

end)

--Enviando la data al js
CreateThread(function()
    while true do
        Wait(50)
        local PlayerPed = PlayerPedId()
        SendNUIMessage({
            action = 'update',
            health = (GetEntityHealth(PlayerPed)-100),
            armour = GetPedArmour(PlayerPed),
            oxygen = GetPlayerUnderwaterTimeRemaining(PlayerId())*10,
            swim = swim,
            hunger = hunger,
            thirst = thirst

        })
    end
end)
