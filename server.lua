local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('Leux-hunting:skinReward')
AddEventHandler('Leux-hunting:skinReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("huntingcarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass1"], "add")
    Player.Functions.AddItem("meat", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("huntingcarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass2"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("huntingcarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass3"], "add")
    Player.Functions.AddItem("meat", 8)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  else 
    Player.Functions.AddItem("huntingcarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["huntingcarcass4"], "add")
    Player.Functions.AddItem("meat", 10)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:removeBait')
AddEventHandler('Leux-hunting:removeBait', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  Player.Functions.RemoveItem("huntingbait", 1)
end)

RegisterServerEvent('Leux-hunting:removepoachingBait')
AddEventHandler('Leux-hunting:removepoachingBait', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  Player.Functions.RemoveItem("poachingbait", 1)
end)

RegisterServerEvent('remove:money')
AddEventHandler('remove:money', function(totalCash)
  local src = source
  local Player = DoxCore.Functions.GetPlayer(src)
  if Player.PlayerData.money['cash'] >= (150) then
    Player.Functions.RemoveMoney('cash', 150)
    TriggerClientEvent("Leux-hunting:setammo", src)
    TriggerClientEvent("QBCore:Notify", src, 'Reloaded.')
  else
    TriggerClientEvent("QBCore:Notify", src, 'Not enough cash on you.', 'error')
  end
end)

QBCore.Functions.CreateUseableItem("huntingbait", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)

  TriggerClientEvent('Leux-hunting:usedBait', source)
end)

QBCore.Functions.CreateUseableItem("poachingbait", function(source, item)
  local Player = QBCore.Functions.GetPlayer(source)

  TriggerClientEvent('Leux-hunting:usedPoaching', source)
end)

local carcasses = {
  huntingcarcass1 = 200,
  huntingcarcass2 = 300,
  huntingcarcass3 = 400,
  huntingcarcass4 = 550,
  meat = 25,
  leather = 50,
  deercarcass1 = 125,
  deercarcass2 = 235,
  deercarcass3 = 450,
  deercarcass4 = 550,
  boarcarcass1 = 125,
  boarcarcass2 = 250,
  boarcarcass3 = 290,
  boarcarcass4 = 450,
  wolfcarcass1 = 75,
  wolfcarcass2 = 120,
  wolfcarcass3 = 230,
  wolfcarcass4 = 300,
  mtlioncarcass1 = 200,
  mtlioncarcass2 = 275,
  mtlioncarcass3 = 320,
  mtlioncarcass4 = 495
}

local illegalcarcasses = {
  illegalcarcass1 = 225,
  illegalcarcass2 = 325,
  illegalcarcass3 = 450,
  illegalcarcass4 = 500,
  meat = 45,
  chimpcarcass1 = 225,
  chimpcarcass2 = 325,
  chimpcarcass3 = 450,
  chimpcarcass4 = 595,
  bigfootfur = 1500
}

RegisterServerEvent('Leux-hunting:server:sell')
AddEventHandler('Leux-hunting:server:sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k,v in pairs(carcasses) do
        local item = Player.Functions.GetItemByName(k)
        if item ~= nil then
            if Player.Functions.RemoveItem(k, item.amount) then
                Player.Functions.AddMoney('cash', v * item.amount)
            end
        end
    end
end)

RegisterServerEvent('Leux-hunting:server:sellpoached')
AddEventHandler('Leux-hunting:server:sellpoached', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k,v in pairs(illegalcarcasses) do
        local item = Player.Functions.GetItemByName(k)
        if item ~= nil then
            if Player.Functions.RemoveItem(k, item.amount) then
                Player.Functions.AddMoney('cash', v * item.amount)
            end
        end
    end
end)

RegisterServerEvent('Leux-hunting:poachingchimpReward')
AddEventHandler('Leux-hunting:poachingchimpReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("chimpcarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chimpcarcass1"], "add")
    Player.Functions.AddItem("meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("chimpcarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chimpcarcass2"], "add")
    Player.Functions.AddItem("meat", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("chimpcarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chimpcarcass3"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  else 
    Player.Functions.AddItem("chimpcarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["chimpcarcass4"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:deerReward')
AddEventHandler('Leux-hunting:deerReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("deercarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["deercarcass1"], "add")
    Player.Functions.AddItem("meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("deercarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["deercarcass2"], "add")
    Player.Functions.AddItem("meat", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("deercarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["deercarcass3"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  else 
    Player.Functions.AddItem("deercarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["deercarcass4"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 3)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:boarReward')
AddEventHandler('Leux-hunting:boarReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("boarcarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["boarcarcass1"], "add")
    Player.Functions.AddItem("meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("boarcarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["boarcarcass2"], "add")
    Player.Functions.AddItem("meat", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("boarcarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["boarcarcass3"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  else 
    Player.Functions.AddItem("boarcarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["boarcarcass4"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:wolfReward')
AddEventHandler('Leux-hunting:wolfReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("wolfcarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["wolfcarcass1"], "add")
    Player.Functions.AddItem("meat", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("wolfcarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["wolfcarcass2"], "add")
    Player.Functions.AddItem("meat", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("wolfcarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["wolfcarcass3"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  else 
    Player.Functions.AddItem("wolfcarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["wolfcarcass4"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:bigfootReward')
AddEventHandler('Leux-hunting:bigfootReward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("illegalcarcass1", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["illegalcarcass1"], "add")
    Player.Functions.AddItem("meat", 3)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("illegalcarcass2", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["illegalcarcass2"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("illegalcarcass3", 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["illegalcarcass3"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  else 
    Player.Functions.AddItem("bigfootfur", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["bigfootfur"], "add")
    Player.Functions.AddItem("meat", 7)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather1", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather1"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)

RegisterServerEvent('Leux-hunting:mountainlionReward')
AddEventHandler('Leux-hunting:mountainlionreward', function()
  local src = source
  local Player = QBCore.Functions.GetPlayer(src)
  local randomAmount = math.random(1,30)
  if randomAmount > 1 and randomAmount < 15 then
    Player.Functions.AddItem("mtlioncarcass1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mtlioncarcass1"], "add")
    Player.Functions.AddItem("meat", 3)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 15 and randomAmount < 23 then
    Player.Functions.AddItem("mtlioncarcass2", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mtlioncarcass2"], "add")
    Player.Functions.AddItem("meat", 4)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  elseif randomAmount > 23 and randomAmount < 29 then
    Player.Functions.AddItem("mtlioncarcass3", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mtlioncarcass3"], "add")
    Player.Functions.AddItem("meat", 5)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather"], "add")
  else 
    Player.Functions.AddItem("mtlioncarcass4", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["mtlioncarcass4"], "add")
    Player.Functions.AddItem("meat", 7)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["meat"], "add")
    Player.Functions.AddItem("leather1", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["leather1"], "add")
  end

 TriggerClientEvent('player:receiveItem', _source, 'meat',math.random(1,10))
end)
