QBCore = exports['qb-core']:GetCoreObject()
local Zones = {}
local zonename = NIL
local inFishingZone = false
local anchored = false
local boat = nil

CreateThread(function() 
    for k=1, #Config.FishingZone do
		Zones[k] = PolyZone:Create(Config.FishingZone[k].zones, {
			name = Config.FishingZone[k].name,
			minZ = 	Config.FishingZone[k].minz,
			maxZ = Config.FishingZone[k].maxz,
			debugPoly = false,
		})
		Zones[k]:onPlayerInOut(function(isPointInside)
			if isPointInside then
				inFishingZone = true
				zonename = Zones[k].name
				if zonename == "bronzezone" then
					exports['qb-core']:DrawText('Bronze Fishing Zone','left')
				elseif zonename == "silverzone" then
					exports['qb-core']:DrawText('Silver Fishing Zone','left')
				elseif zonename == "goldzone" then
					exports['qb-core']:DrawText('Gold Fishing Zone','left')
				elseif zonename == "crayfishzone" then
					exports['qb-core']:DrawText('Cray Fishing Zone','left')
				end
				--QBCore.Functions.Notify('you have entered a legal fishing zone', "success")
			else
				inFishingZone = false
				exports['qb-core']:HideText()
			end
		end)
    end
end)

-- start pot fishing
RegisterNetEvent("rsg_potfishing:client:startfishing")
AddEventHandler("rsg_potfishing:client:startfishing", function(itemName)
	-- check in boat
	local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
	local plyVehClass = GetVehicleClass(plyVeh)
	if plyVehClass == 14 then
		-- bronze fishing
		if inFishingZone == true and zonename == "bronzezone" then
			local hasItem = QBCore.Functions.HasItem("fishingpotbaited")
			if hasItem then
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", Config.BronzePotTime, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					TriggerServerEvent("rsg_potfishing:server:bronzezoneReward")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You do not have a baited fishing pot!", "error")
			end
		-- silverzone fishing	
		elseif inFishingZone == true and zonename == "silverzone" then
			local hasItem = QBCore.Functions.HasItem("fishingpotbaited")
			if hasItem then
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", Config.SilverPotTime, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					TriggerServerEvent("rsg_potfishing:server:silverzoneReward")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You do not have a baited fishing pot!", "error")
			end
		-- gold fishing	
		elseif inFishingZone == true and zonename == "goldzone" then
			local hasItem = QBCore.Functions.HasItem("fishingpotbaited")
			if hasItem then
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", Config.GoldPotTime, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					TriggerServerEvent("rsg_potfishing:server:goldzoneReward")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You do not have a baited fishing pot!", "error")
			end
		-- crayfish fishing	
		elseif inFishingZone == true and zonename == "crayfishzone" then
			local hasItem = QBCore.Functions.HasItem("fishingpotbaited")
			if hasItem then
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", Config.CrayPotTime, false, true, {
					disableMovement = false,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
					TriggerServerEvent("rsg_potfishing:server:crayfishzoneReward")
				end, function()
					QBCore.Functions.Notify("Cancelled..", "error")
				end)
			else
				QBCore.Functions.Notify("You do not have a baited fishing pot!", "error")
			end
		else
			QBCore.Functions.Notify("You are not in a fishing zone!", "error")
		end
	else
		QBCore.Functions.Notify("You need to be in control of a boat to do this!", "error")
	end
end)

RegisterNetEvent("rsg_potfishing:client:startfishing")
AddEventHandler("rsg_potfishing:client:startfishing", function(itemName)
	local ped = GetPlayerPed()
	if IsPedInAnyBoat(ped) then
		boat = GetVehiclePedIsIn(ped, true)
	end
	if IsControlJustPressed(1, 81) and not IsPedInAnyVehicle(ped) and boat ~= nil then
		if not anchored then
			SetBoatAnchor(boat, true)
			TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
			Citizen.Wait(10000)
			ClearPedTasks(ped)
			QBCore.Functions.Notify("Anchor successfully deployed!", "success")
		else
			TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
			Citizen.Wait(10000)
			SetBoatAnchor(boat, false)
			ClearPedTasks(ped)
			QBCore.Functions.Notify("Anchor successfully lifted!", "success")
		end
		anchored = not anchored
	end
		if IsVehicleEngineOn(boat) then
		anchored = false
	end
end)

RegisterNetEvent("rsg_potfishing:client:useanchor")
AddEventHandler("rsg_potfishing:client:useanchor", function()
	-- check player is driving a boat
	local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
	local vehicleclass = GetVehicleClass(vehicle)
	if vehicleclass == 14 then -- check its a boat
		if anchored == false then
			SetBoatAnchor(vehicle, true)
			QBCore.Functions.Notify("Anchor successfully deployed!", "success")
			anchored = true
		else
			SetBoatAnchor(vehicle, false)
			ClearPedTasks(ped)
			QBCore.Functions.Notify("Anchor successfully lifted!", "success")
			anchored = false
		end
	else
		QBCore.Functions.Notify("You need to be in control of a boat to do this!", "error")
	end
end)

RegisterNetEvent('rsg_potfishing:client:UseJerrycan')
AddEventHandler('rsg_potfishing:client:UseJerrycan', function()
    local ped = PlayerPedId()
    local boat = IsPedInAnyBoat(ped)
    local vehicle = GetPlayersLastVehicle()
    local vehicleCoords = GetEntityCoords(vehicle)
    if boat then
        local curVeh = GetVehiclePedIsIn(ped, false)
        if GetVehicleFuelLevel(curVeh) < 95 then
            QBCore.Functions.Progressbar("refuel_boat", "Refueling boat ..", Config.RefuellBoatTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                exports['LegacyFuel']:SetFuel(curVeh, 100)
                QBCore.Functions.Notify('The boat has been refueled', 'success')
                TriggerServerEvent('qb-diving:server:RemoveItem', 'jerry_can', 1)
                TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['jerry_can'], "remove")
            end, function() -- Cancel
                QBCore.Functions.Notify('Refueling has been canceled!', 'error')
            end)
        else
            QBCore.Functions.Notify('Your boat have enough fuel', 'error')
        end
    elseif DoesEntityExist(vehicle) and #(GetEntityCoords(ped) - vehicleCoords) < 2.5 then
        if not DoesEntityExist(GetPedInVehicleSeat(vehicle, -1)) then
            if GetVehicleFuelLevel(vehicle) < 95 then
                QBCore.Functions.Progressbar("refuel_boat", "Refueling vehicle ..", Config.RefuellBoatTime, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "timetable@gardener@filling_can",
                    anim = "gar_ig_5_filling_can",
                    flags = 30,
                }, {}, {}, function() -- Done
                    StopAnimTask(PlayerPedId(), "timetable@gardener@filling_can", "gar_ig_5_filling_can", 1.0)
                    exports['LegacyFuel']:SetFuel(vehicle, 100)
                    QBCore.Functions.Notify('The vehicle has been refueled', 'success')
                    TriggerServerEvent('qb-diving:server:RemoveItem', 'jerry_can', 1)
                    TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['jerry_can'], "remove")
                end, function() -- Cancel
                    StopAnimTask(PlayerPedId(), "timetable@gardener@filling_can", "gar_ig_5_filling_can", 1.0)
                    QBCore.Functions.Notify('Refueling has been canceled!', 'error')
                end)
            else
                QBCore.Functions.Notify('Your vehicle have enough fuel', 'error')
            end 
        else
            QBCore.Functions.Notify('You can not refill the vehicle from inside', 'error')
        end
    else
        QBCore.Functions.Notify('There is no vehicle nearby', 'error')
    end
end)