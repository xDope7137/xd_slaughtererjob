
RegisterServerEvent('tost:wkladajKurczki')
AddEventHandler('tost:wkladajKurczki', function()
	local _source = source
	local Player = XD.Functions.GetPlayer(_source)

	Player.Functions.AddItem('alivechicken', 5)
	TriggerClientEvent('inventory:client:ItemBox', _source, XD.Shared.Items["alivechicken"], 'add')
end)

RegisterServerEvent('tostKurczaki:przerob')
AddEventHandler('tostKurczaki:przerob', function(opcja)
	local _source = source
	local Player = XD.Functions.GetPlayer(_source)
	local zywyKurczak = Player.Functions.GetItemByName('alivechicken')
	local MartwyKurczak = Player.Functions.GetItemByName('slaughteredchicken')
	local ZapakowanyKurczak = Player.Functions.GetItemByName('packagedchicken')

	if opcja == 1 then
		if zywyKurczak ~= nil and zywyKurczak.amount > 0 then
			Player.Functions.RemoveItem('alivechicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, XD.Shared.Items["alivechicken"], 'remove')
			Player.Functions.AddItem('slaughteredchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, XD.Shared.Items["slaughteredchicken"], 'add')
		else
			TriggerClientEvent(NotifyTrigger, _source, "You dont have enough Alive Chickens", "error")
		end
	end

	if opcja == 2 then
		if MartwyKurczak ~= nil and MartwyKurczak.amount > 0 then
			Player.Functions.RemoveItem('slaughteredchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, XD.Shared.Items["slaughteredchicken"], 'remove')
			Player.Functions.AddItem('packagedchicken', 1)
			TriggerClientEvent('inventory:client:ItemBox', _source, XD.Shared.Items["packagedchicken"], 'add')
		else
			TriggerClientEvent(NotifyTrigger, _source, "You dont have enough Slaughtered Chickens", "error")
		end
	end
end)


RegisterServerEvent('tostKurczaki:sellchick')
AddEventHandler('tostKurczaki:sellchick', function(amt)
	local _source = source
	local Player = XD.Functions.GetPlayer(_source)
	local ZapakowanyKurczak = Player.Functions.GetItemByName('packagedchicken')

	if ZapakowanyKurczak ~= nil and  ZapakowanyKurczak.amount > 0 and tonumber(amt) >= 0 then
		Player.Functions.RemoveItem('packagedchicken', tonumber(amt))
		Player.Functions.AddMoney("cash", GotowkaSprzedaz * tonumber(amt))
		TriggerClientEvent(NotifyTrigger, _source, 'You Sold ' ..tonumber(amt)..'x Packed Chickens worth $' ..GotowkaSprzedaz * tonumber(amt).. '!', "success", 10000)
	else
		TriggerClientEvent(NotifyTrigger, _source, "You dont have enough Packaged Chickens", "error")
	end
end)