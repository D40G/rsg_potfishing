local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem("fishingpotbaited", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("rsg_potfishing:client:startfishing", src)
end)

QBCore.Functions.CreateUseableItem("boatanchor", function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent("rsg_potfishing:client:useanchor", src)
end)

QBCore.Functions.CreateUseableItem("jerry_can", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("rsg_potfishing:client:UseJerrycan", source, item.name)
end)

-- bronzezone reward
RegisterServerEvent('rsg_potfishing:server:bronzezoneReward')
AddEventHandler('rsg_potfishing:server:bronzezoneReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 80 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local crabamount = math.random(1,2)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('crab', crabamount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crab'], "add")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpot'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..crabamount..' crab', 'success')
		end
			
	elseif randomNumber > 80 and randomNumber <= 100 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local lobsteramount = math.random(1,2)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('lobster', lobsteramount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lobster'], "add")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpot'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..lobsteramount..' lobster', 'success')
		end
    end
end)

-- silverzone reward
RegisterServerEvent('rsg_potfishing:server:silverzoneReward')
AddEventHandler('rsg_potfishing:server:silverzoneReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 80 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local crabamount = math.random(2,4)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('crab', crabamount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crab'], "add")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpot'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..crabamount..' crab', 'success')
		end
			
	elseif randomNumber > 80 and randomNumber <= 100 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local lobsteramount = math.random(2,4)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('lobster', lobsteramount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lobster'], "add")
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpot'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..lobsteramount..' lobster', 'success')
		end
    end
end)

-- goldzone reward
RegisterServerEvent('rsg_potfishing:server:goldzoneReward')
AddEventHandler('rsg_potfishing:server:goldzoneReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 80 then
		local _subRan = math.random(1,100)
		if _subRan >= 70 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local crabamount = math.random(4,8)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('crab', crabamount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crab'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..crabamount..' crab', 'success')
		end
			
	elseif randomNumber > 80 and randomNumber <= 100 then
		local _subRan = math.random(1,100)
		if _subRan >= 70 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local lobsteramount = math.random(4,8)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('lobster', lobsteramount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['lobster'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..lobsteramount..' lobster', 'success')
		end
    end
end)

-- crayfishzone reward
RegisterServerEvent('rsg_potfishing:server:crayfishzoneReward')
AddEventHandler('rsg_potfishing:server:crayfishzoneReward', function()
    local src = tonumber(source)
    local Player = QBCore.Functions.GetPlayer(src)
	local randomNumber = math.random(1,100)
	
	if randomNumber > 0 and randomNumber <= 80 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local crayfishamount = math.random(1,2)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('crayfish', crayfishamount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crayfish'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..crayfishamount..' crayfish', 'success')
		end
			
	elseif randomNumber > 80 and randomNumber <= 100 then
		local _subRan = math.random(1,100)
		if _subRan >= 80 then
			TriggerClientEvent('QBCore:Notify', src, 'you lost the pot on the rocks!', 'error')
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "remove")
		else
			local crayfishamount = math.random(4,8)
			Player.Functions.RemoveItem('fishingpotbaited', 1)
			Player.Functions.AddItem('fishingpot', 1)
			Player.Functions.AddItem('crayfish', crayfishamount)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['crayfish'], "add")
			TriggerClientEvent('QBCore:Notify', src, 'you caught '..crayfishamount..' crayfish', 'success')
		end
    end
end)

-- sell catch
RegisterServerEvent("rsg_potfishing:server:sellCatch")
AddEventHandler("rsg_potfishing:server:sellCatch", function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local price = 0
    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == "crab" then 
                    price = price + Config.CrabPrice * Player.PlayerData.items[k].amount
                    Player.Functions.RemoveItem("crab", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "lobster" then 
                    price = price + Config.LobsterPrice * Player.PlayerData.items[k].amount
					Player.Functions.RemoveItem("lobster", Player.PlayerData.items[k].amount, k)
				elseif Player.PlayerData.items[k].name == "crayfish" then 
                    price = price + Config.CrayfishPrice * Player.PlayerData.items[k].amount
					Player.Functions.RemoveItem("crayfish", Player.PlayerData.items[k].amount, k)
                end
            end
        end
		if price > 0 then
			Player.Functions.AddMoney("cash", price, "sold-catch")
			TriggerClientEvent('QBCore:Notify', src, 'Thank you, catch sold for $'..price, 'success')
		else
			TriggerClientEvent('QBCore:Notify', src, 'You have nothing to sell to me!', 'error')
		end
	end
end)

-- rebait pots
RegisterServerEvent("rsg_potfishing:server:rebaitpots")
AddEventHandler("rsg_potfishing:server:rebaitpots", function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local amountpots = Player.Functions.GetItemByName('fishingpot').amount
	local rebaitprice = Config.RebaitPrice
	if amountpots > 0 then
		local totalprice = amountpots * rebaitprice
		local cashBalance = Player.PlayerData.money["cash"]
		if cashBalance > totalprice then
			Player.Functions.RemoveItem('fishingpot', amountpots)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpot'], "remove")
			Player.Functions.AddItem('fishingpotbaited', amountpots)
			TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingpotbaited'], "add")
			Player.Functions.RemoveMoney('cash', totalprice)
		else
			TriggerClientEvent('QBCore:Notify', src, 'You do not have enough cash to do that!', 'error')
		end
	else
		TriggerClientEvent('QBCore:Notify', src, 'You do not have any fishing pots!', 'error')
	end
end)