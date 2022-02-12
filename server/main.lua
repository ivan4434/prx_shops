PRX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	PRX = obj
end)

RegisterServerEvent('prx_shops:buyItem')
AddEventHandler('prx_shops:buyItem', function(item, value, price, label)
	local _source = source
	local xPlayer = PRX.GetPlayerFromId(_source)
	local accountMoney = 0

	local coste = price*value
	
	accountMoney = xPlayer.getMoney()
	local necesario = price - accountMoney
		if accountMoney <= coste then
			notification('No tienes dinero ~r~suficiente. Necesitas ~g~'..necesario..'€')
		else
			xPlayer.removeMoney(coste)
			xPlayer.addInventoryItem(item, value)
			notification('Has ~g~comprado~s~ '..value..' '..label..' por ~g~'..price*value..'€')
		end
end)

RegisterServerEvent('prx_shops:buyGun')
AddEventHandler('prx_shops:buyGun', function(item, value, price, label)
	local _source = source
	local xPlayer = PRX.GetPlayerFromId(_source)
	local accountMoney = 0

	local coste = price*value
	
	accountMoney = xPlayer.getMoney()
	local necesario = price - accountMoney
		if accountMoney <= coste then
			notification('No tienes dinero ~r~suficiente. Necesitas ~g~'..necesario..'€')
		else
			xPlayer.removeMoney(coste)
			xPlayer.addWeapon(item, value)
			notification('Has ~g~comprado~s~ '..value..' '..label..' por ~g~'..price*value..'€')
		end
end)

function notification(text)
	TriggerClientEvent('prx:showNotification', source, text)
end