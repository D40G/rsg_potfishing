local QBCore = exports["qb-core"]:GetCoreObject()

Citizen.CreateThread(function()

	exports['qb-target']:AddBoxZone("Market-Vendor", vector3(-753.47, -1512.21, 5.01), 1, 1, {
		name = "Market Ventor",
		heading = 20,
		debugpoly = false,
		minZ=4.01,
		maxZ=6.01,
	}, {
		options = {
			{  
				type = "client",
				event = "rsg_potfishing:client:buypots",
				icon = "fas fa-fish",
				label = "Fishing Equipment",
			},
		    {
				type = "server",
				event = "rsg_potfishing:server:rebaitpots",
				icon = "fas fa-fish",
				label = "Rebait Fishing Pots",
		    },
		    {
				type = "server",
				event = "rsg_potfishing:server:sellCatch",
				icon = "fas fa-fish",
				label = "Sell Catch",
		    },
		},
		distance = 2.5
	})
	
end)

-- buy fishing pots
RegisterNetEvent('rsg_potfishing:client:buypots')
AddEventHandler('rsg_potfishing:client:buypots', function()
	local ShopItems = {}
	ShopItems.label = "Fishing Vendor"
	ShopItems.items = Config.FishingVendor
	ShopItems.slots = #Config.FishingVendor
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "FishingVendor_"..math.random(1, 99), ShopItems)
end)

Citizen.CreateThread(function()
    fishvendor = AddBlipForCoord(-753.4568, -1512.305, 5.0197486)
    SetBlipSprite (fishvendor, 374)
    SetBlipDisplay(fishvendor, 4)
    SetBlipScale  (fishvendor, 0.55)
    SetBlipAsShortRange(fishvendor, true)
    SetBlipColour(fishvendor, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Fish Vendor")
    EndTextCommandSetBlipName(fishvendor)
end)