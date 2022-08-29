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
				type = "server",
				event = "rsg_potfishing:server:sellCatch",
				icon = "fas fa-fish",
				label = "Sell Catch",
		    },
		    {
				type = "server",
				event = "rsg_potfishing:server:rebaitpots",
				icon = "fas fa-fish",
				label = "Rebait Fishing Pots",
		    },
			{  
				type = "client",
				event = "rsg_potfishing:client:buypots",
				icon = "fas fa-fish",
				label = "Buy Fishing Pots",
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
    marketvendor = AddBlipForCoord(-753.4568, -1512.305, 5.0197486)
    SetBlipSprite (marketvendor, 374)
    SetBlipDisplay(marketvendor, 4)
    SetBlipScale  (marketvendor, 0.9)
    SetBlipAsShortRange(marketvendor, true)
    SetBlipColour(marketvendor, 3)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Market Vendor")
    EndTextCommandSetBlipName(marketvendor)
end)