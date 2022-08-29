QBCore = exports['qb-core']:GetCoreObject()
local Zones = {}
local zonename = NIL
local inFishingZone = false

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
				QBCore.Functions.Notify('you have entered a legal fishing zone', "success")
			else
				inFishingZone = false
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
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", 60000, false, true, {
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
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", 60000, false, true, {
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
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", 60000, false, true, {
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
				QBCore.Functions.Progressbar("start-fishing", "Checking Fishing Pot..", 60000, false, true, {
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