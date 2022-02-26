QBCore = exports['qb-core']:GetCoreObject()

local cooldown = 0
local used = false
local jobSpawned = false
local refreshPed = false
local jobPed
local useBaitCooldown = 3
local illegalhunting = false
local hunting1 = false
local hunting2 = false

local HuntingZones =  { 
  'MTCHIL',
  'CANNY',
  'MTGORDO',
  'CMSW',
  'MTJOSE',
}

local HuntingAnimals = {
  'a_c_boar',
  'a_c_deer',
  'a_c_coyote',
  'a_c_mtlion',
  ''
}

local PoachingAnimals = {
  'a_c_husky',
  'cs_orleans',
  'a_c_husky',
  'a_c_chimp',
  'a_c_rhesus'
}







local hunting1 = PolyZone:Create({
  vector2(-1038.8045654296, 4901.2412109375),
  vector2(-1091.1923828125, 4859.3642578125),
  vector2(-1091.1215820312, 4825.0385742188),
  vector2(-1025.4008789062, 4753.3022460938),
  vector2(-1034.3443603516, 4710.3374023438),
  vector2(-927.85998535156, 4542.5517578125),
  vector2(-818.37982177734, 4578.015625),
  vector2(-780.34484863282, 4629.5361328125),
  vector2(-651.40478515625, 4868.2495117188),
  vector2(-674.4242553711, 4893.9375),
  vector2(-712.4755859375, 4913.44921875),
  vector2(-646.5297241211, 4971.1142578125),
  vector2(-624.30767822266, 4987.6918945312),
  vector2(-635.17657470704, 5042.0034179688),
  vector2(-653.0980834961, 5062.4765625),
  vector2(-684.53759765625, 5068.2963867188),
  vector2(-762.43658447266, 5047.5288085938),
  vector2(-786.80352783204, 5056.8403320312),
  vector2(-763.65802001954, 5086.0029296875),
  vector2(-771.650390625, 5103.3525390625),
  vector2(-815.06158447266, 5111.755859375),
  vector2(-852.68292236328, 5124.4345703125),
  vector2(-883.73260498046, 5069.4873046875),
  vector2(-953.28503417968, 5001.0512695312),
  vector2(-960.19384765625, 4968.0444335938)
}, {
  debugPoly = false,
  name="hunting1",
  minZ = 143.82234191894,
  maxZ = 294.69619750976

})

hunting1:onPlayerInOut(function(isPointInside)
  if isPointInside then
      inhunting1 = true
      exports['t-notify']:Alert({
        style = 'info', 
        message = 'Entered Hunting Area'
      })
--[[      exports['qb-target']:AddTargetEntity(HuntingAnimals, {
        options = {
            {
              --item = 'weapon-knife',
              event = "Leux-hunting:skinAnimal",
              icon = "far fa-hand-paper",
              label = "Skin",
            },
        },
        distance = 3.0
      })]]

  else
      inhunting1 = false
      exports['t-notify']:Alert({
        style = 'info', 
        message = 'Exited Hunting Area'
      })
--[[      exports['qb-target']:RemoveTargetEntity(HuntingAnimals, {
        options = {
            {
              event = "Leux-hunting:skinAnimal",
              icon = "far fa-hand-paper",
              label = "Skin",
            },
        },
        distance = 3.0
      })]]
  end
end)


local hunting2 = PolyZone:Create({
  vector2(5031.46, -4992.36),
  vector2(5117.32, -4965.71),
  vector2(5093.46, -4957.36),
  vector2(5076.55, -4948.27),
  vector2(5021.01, -4936.49),
  vector2(4963.61, -4948.76),
  vector2(4920.51, -4518.03),
  vector2(4574.47, -4495.4),
  vector2(4543.8, -4565.8),
  vector2(4524.2, -4597.74),
  vector2(4561.02, -4687.65),
  vector2(4696.17, -4640.88),
  vector2(4847.11, -4764.49),
  vector2(4891.55, -4754.8),
  vector2(4915.35, -4929.2),
  vector2(4841.45, -4853.53),
  vector2(4845.63, -4887.64),
  vector2(4928.14, -4859.69),
  vector2(4940.02, -4825.91)
  }, {
  debugPoly = true,
  name="hunting2",
  minZ = -20.82234191894,
  maxZ = 150.83

})

hunting2:onPlayerInOut(function(isPointInside)
  if isPointInside then
      inhunting2 = true
      exports['t-notify']:Alert({
        style = 'info', 
        message = 'Entered Illegal Hunting Area'
      })
--[[      exports['qb-target']:AddTargetEntity(PoachingAnimals, {
        options = {
            {
              --item = 'weapon-knife',
              event = "Leux-hunting:skinpoachedAnimal",
              icon = "far fa-hand-paper",
              label = "Skin",
            },
        },
        distance = 3.0
      })]]

  else
      inhunting2 = false
      exports['t-notify']:Alert({
        style = 'info', 
        message = 'Exited Illegal Hunting Area'
      })
--[[      exports['qb-target']:RemoveTargetEntity(PoachingAnimals, {
        options = {
            {
              event = "Leux-hunting:skinpoachedAnimal",
              icon = "far fa-hand-paper",
              label = "Skin",
            },
        },
        distance = 3.0
      })]]
  end
end)





















local dumbass = vector3(-772.96, 5597.13, 33.61)

Citizen.CreateThread(function()
  blip = AddBlipForCoord(-679.89,5838.79,16.33)
  SetBlipSprite(blip, 141)
  SetBlipDisplay(blip, 4)
  SetBlipScale(blip, 0.8)
  SetBlipColour(blip, 1)
  SetBlipAsShortRange(blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString("Hunting Shop")
  EndTextCommandSetBlipName(blip)

  local legalHunts = {
    `a_c_boar`,
    `a_c_deer`,
    `a_c_coyote`,
    `a_c_mtlion`,
  }

  local chimpanzee = {
    `a_c_chimp`,
    `a_c_rhesus`,
  }
  
  local deer = {
    `a_c_deer`,
  }
  
  local boar = {
    `a_c_boar`,
  }
  
  local wolf = {
    `a_c_coyote`,
  }
  
  local husky = {
    `a_c_husky`,
  }
  
  local bigfoot = {
    `cs_orleans`,
  }
  local poachinglegalHunts = {
    `a_c_husky`,
    `a_c_chimp`,
    `a_c_rhesus`,
  }
  
  local illlegalHunts = {
    `a_c_chop`,
    `a_c_husky`,
    `a_c_retriever`,
    `a_c_westy`,
    `a_c_shepherd`,
    `a_c_poodle`,
    `u_m_y_gunvend_01`,
  }

	exports['qb-target']:AddTargetModel(legalHunts, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:skinAnimal",
        icon = "far fa-hand-paper",
        label = "Skin",
        canInteract = function()
					if inhunting1 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })

--exports['qb-target']:AddTargetModel(poachinglegalHunts, {
 --   options = {
  --    {
   --     item = 'weapon_knife',
   --     event = "Leux-hunting:skinpoachedAnimal",
   --     icon = "far fa-hand-paper",
   --     label = "Skin",
   --     canInteract = function()
	--				if inhunting2 then 
	--					  return true
	--				else 
	--					  return false
	--				end 
	--			end,
    --  },
 --   },
 --   job = {"all"},
 --   distance = 6.5
 -- })

  exports['qb-target']:AddTargetModel(deer, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:skinpoachedchimpanzeeAnimal",
        icon = "far fa-hand-paper",
        label = "Skin Chimpanzee",
        canInteract = function()
					if inhunting2 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })

  exports['qb-target']:AddTargetModel(chimpanzee, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:deerAnimal",
        icon = "far fa-hand-paper",
        label = "Skin Chimp",
        canInteract = function()
					if inhunting1 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })

  exports['qb-target']:AddTargetModel(boar, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:boarAnimal",
        icon = "far fa-hand-paper",
        label = "Skin Boar",
        canInteract = function()
					if inhunting1 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })

  exports['qb-target']:AddTargetModel(wolf, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:wolfAnimal",
        icon = "far fa-hand-paper",
        label = "Skin Coyote",
        canInteract = function()
					if inhunting1 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })
  
  exports['qb-target']:AddTargetModel(husky, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:wolfAnimal",
        icon = "far fa-hand-paper",
        label = "Skin Husky",
        canInteract = function()
					if inhunting2 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })
  
  exports['qb-target']:AddTargetModel(bigfoot, {
    options = {
      {
        item = 'weapon_knife',
        event = "Leux-hunting:skinbigfoot",
        icon = "far fa-hand-paper",
        label = "Skin Bigfoot",
        canInteract = function()
					if inhunting2 then 
						  return true
					else 
						  return false
					end 
				end,
      },
    },
    job = {"all"},
    distance = 6.5
  })


  --//ARP\\-- To be finished for events
  --if Config.EnablePoaching then
  -- if illegalhunting then
  --   exports['qb-targer']:AddTargetModel(illlegalHunts, {
  --     options = {
  --       {
  --         event = "Leux-hunting:skinAnimalIllegal",
  --         icon = "far fa-hand-paper",
  --         label = "Skin",
  --       },
  --     },
  --     job = {"all"},
  --     distance = 1.5
  --   })
  -- end
  --//ARP\\-- To be finished for events

--if Config.EnablePoaching1 then
  -- if illegalhunting then
  --   exports['qb-targer']:AddTargetModel(illlegalHunts, {
  --     options = {
  --       {
  --         event = "Leux-hunting:skinAnimalIllegal",
  --         icon = "far fa-hand-paper",
  --         label = "Skin",
  --       },
  --     },
  --     job = {"all"},
  --     distance = 1.5
  --   })
  -- end

  SetScenarioTypeEnabled('WORLD_DEER_GRAZING',false)
  SetScenarioTypeEnabled('WORLD_COYOTE_WANDER',false)
  SetScenarioTypeEnabled('WORLD_COYOTE_REST',false)
  --SetScenarioTypeEnabled('WORLD_RABBIT_EATING',false)
  SetScenarioTypeEnabled('WORLD_BOAR_GRAZING',false)
  SetScenarioTypeEnabled('WORLD_MOUNTAIN_LION_WANDER',false)
  SetScenarioTypeEnabled('WORLD_MOUNTAIN_LION_REST',false)
end)

-- Citizen.CreateThread(function()
-- 	while true do
-- 	Wait(1000)
-- 		if refreshPed then
--       if DoesEntityExist(jobPed) then
--         exports['qb-target']:AddEntityZone('huntPed', jobPed, {
--         name="huntPed",
--         debugPoly=false,
--         useZ = true
--           }, {
--           options = {
--             {
--             event = "Leux-hunting:general",
--             icon = "fab fa-shopify",
--             label = "Hunting Shop",
--             },
--           },
--             job = {"all"},
--             distance = 1.5
--           })    
--         refreshPed = false
--       end
--     end
-- 	end
-- end)

--[[Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local pedCoords = GetEntityCoords(PlayerPedId())
    local dst = #(dumbass - pedCoords)
    --print(dst)
    if dst < 40 and jobSpawned == false then
      TriggerEvent('Leux-hunting:spawnJobPed',dumbass, 225.87)
      jobSpawned = true
      refreshPed = true
    end
    if dst >= 41  then
      if DoesEntityExist(jobPed) then
        DeletePed(jobPed)
      end
      jobSpawned = false
    end
  end
end)--]]

--[[RegisterNetEvent('Leux-hunting:spawnJobPed')
AddEventHandler('Leux-hunting:spawnJobPed',function(coords, heading)
  local hash = GetHashKey('ig_hunter')
  if not HasModelLoaded(hash) then
    RequestModel(hash)
    Wait(10)
  end
  while not HasModelLoaded(hash) do
    Wait(10)
  end
  jobPed = CreatePed(5, hash, coords, heading, false, false)
  FreezeEntityPosition(jobPed, true)
  SetEntityInvincible(jobPed, true)
  SetBlockingOfNonTemporaryEvents(jobPed, true)
  SetModelAsNoLongerNeeded(hash)
end)--]]


RegisterNetEvent('Leux-hunting:spawnAnimal')
AddEventHandler('Leux-hunting:spawnAnimal', function()
  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local radius = 50.0
  local x = coords.x + math.random(-radius,radius)
  local y = coords.y + math.random(-radius,radius)
  local safeCoord, outPosition = GetSafeCoordForPed(x,y,coords.z,false,16)
  --animal = Config.HuntingAnimals[math.random(#Config.HuntingAnimals)] --HuntingAnimals
  animal = HuntingAnimals[math.random(#HuntingAnimals)]
  local hash = GetHashKey(animal)
  if not HasModelLoaded(hash) then
    RequestModel(hash)
    Wait(10)
  end
  while not HasModelLoaded(hash) do
    Wait(10)
  end
  if outPosition.x > 1 or outPosition.x < -1  then
    --Wait(2000)
    Wait(8000)
    baitAnimal = CreatePed(28, hash, outPosition.x, outPosition.y, outPosition.z, 0, true, false)
  else
    QBCore.Functions.Notify("You are too far away from the bait", "error")
  end
  if DoesEntityExist(baitAnimal) then
    TaskGoToCoordAnyMeans(baitAnimal,coords,2.0,0,786603,0)
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(1000)
    if DoesEntityExist(baitAnimal) then
      local ped = PlayerPedId()
      local coords = GetEntityCoords(PlayerPedId())
      local animalCoords = GetEntityCoords(baitAnimal)
      local dst = #(coords - animalCoords)
      HideHudComponentThisFrame(14)
      if dst < 2.5 then -- spook animal
        TaskCombatPed(baitAnimal,ped,0,16)
      end
    end
  end
end)

RegisterNetEvent('Leux-hunting:skinAnimal')
AddEventHandler('Leux-hunting:skinAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:skinReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:usedBait')
AddEventHandler('Leux-hunting:usedBait', function()
  --for k,v in pairs (HuntingZones) do
  if inhunting1 then
    if cooldown <= 0 then
      LoadAnimDict('amb@medic@standing@kneel@base')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Setting Bait..", 5000)
      Citizen.Wait(5000)
      TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
      local seconds = math.random(10,35)
      local circles = 1
      local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
      if success then
        local seconds1 = math.random(10,35)
        local circles1 = 1
        local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
        if success1 then
          local seconds2 = math.random(10,35)
          local circles2 = 1
          local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
          if success2 then
            Citizen.Wait(100)
            ClearPedTasksImmediately(PlayerPedId())
            used = true
            usedBait()
            TriggerEvent('Leux-hunting:spawnAnimal')
            TriggerServerEvent('Leux-hunting:removeBait')
            TriggerEvent("QBCore:Notify", "Success, move away and wait for the animal to arrive", "success")
          end
        end
      end
    end
  else
    QBCore.Functions.Notify("You Are Not In a Hunting Zone", "error")
  end
end)

function baitCooldown()
  Citizen.CreateThread(function()
    while cooldown > 0 do
      Wait(2000)
      cooldown = cooldown - 1000
    end
  end)
end

function usedBait()
  Citizen.CreateThread(function()
    while used do
      print('waiting to spawn')
      Wait(1500)
      print('spawning')
      TriggerEvent('Leux-hunting:spawnAnimal')
      used = false
    end
  end)
end

function playerAnim()
	LoadAnimDict( "mp_safehouselost@" )
  TaskPlayAnim( PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end

function LoadAnimDict(dict)
  while (not HasAnimDictLoaded(dict)) do
    RequestAnimDict(dict)
    Citizen.Wait(10)
  end
end


  --poaching
  
  function usedillegalBait()
  Citizen.CreateThread(function()
    while used do
      print('waiting to spawn')
      Wait(1500)
      print('spawning')
      TriggerEvent('Leux-hunting:spawnpoaching')
      used = false
    end
  end)
end

RegisterNetEvent('Leux-hunting:spawnpoaching')
AddEventHandler('Leux-hunting:spawnpoaching', function()
  local ped = PlayerPedId()
  local coords = GetEntityCoords(ped)
  local radius = 50.0
  local x = coords.x + math.random(-radius,radius)
  local y = coords.y + math.random(-radius,radius)
  local safeCoord, outPosition = GetSafeCoordForPed(x,y,coords.z,false,16)
  --animal1 = Config.PoachingAnimals[math.random(#Config.PoachingAnimals)] --HuntingAnimals
  animal1 = PoachingAnimals[math.random(#PoachingAnimals)]
  local hash = GetHashKey(animal1)
  if not HasModelLoaded(hash) then
    RequestModel(hash)
    Wait(10)
  end
  while not HasModelLoaded(hash) do
    Wait(10)
  end
  if outPosition.x > 1 or outPosition.x < -1  then
    --Wait(2000)
    Wait(8000)
    baitAnimal = CreatePed(28, hash, outPosition.x, outPosition.y, outPosition.z, 0, true, false)
  else
    QBCore.Functions.Notify("You are too far away from the bait", "error")
  end
  if DoesEntityExist(baitAnimal) then
    TaskGoToCoordAnyMeans(baitAnimal,coords,2.0,0,786603,0)
  end
end)

RegisterNetEvent('Leux-hunting:usedPoaching')
AddEventHandler('Leux-hunting:usedPoaching', function()
  --for k,v in pairs (HuntingZones) do
  if inhunting2 then
    if cooldown <= 0 then
      LoadAnimDict('amb@medic@standing@kneel@base')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Setting Bait..", 5000)
      Citizen.Wait(5000)
      TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
      local seconds = math.random(10,35)
      local circles = 1
      local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
      if success then
        local seconds1 = math.random(10,35)
        local circles1 = 1
        local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
        if success1 then
          local seconds2 = math.random(10,35)
          local circles2 = 1
          local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
          if success2 then
            Citizen.Wait(100)
            ClearPedTasksImmediately(PlayerPedId())
            used = true
            usedillegalBait()
            TriggerEvent('Leux-hunting:spawnpoaching')
            TriggerServerEvent('Leux-hunting:removepoachingBait')
            TriggerEvent("QBCore:Notify", "Success, move away and wait for the animal to arrive", "success")
          end
        end
      end
    end
  else
    QBCore.Functions.Notify("You Are Not In a Poaching Zone", "error")
  end
end)

RegisterNetEvent('Leux-hunting:skinpoachedAnimal')
AddEventHandler('Leux-hunting:skinpoachedAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:poachingReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:skinpoachedchimpanzeeAnimal')
AddEventHandler('Leux-hunting:skinpoachedchimpanzeeAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Chimpanzee..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:poachingchimpReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:deerAnimal')
AddEventHandler('Leux-hunting:deerAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Deer..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:deerReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:boarAnimal')
AddEventHandler('Leux-hunting:boarAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Boar..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:boarReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:wolfAnimal')
AddEventHandler('Leux-hunting:wolfAnimal', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Wolf..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:wolfReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:skinbigfoot')
AddEventHandler('Leux-hunting:skinbigfoot', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Bigfoot..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:bigfootReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

RegisterNetEvent('Leux-hunting:skinmtlion')
AddEventHandler('Leux-hunting:skinmtlion', function()
  local weapon = GetSelectedPedWeapon(PlayerPedId())
  if DoesEntityExist(baitAnimal) then
    if QBCore.Shared.Weapons[weapon]["name"] ~= "weapon_unarmed" and not QBCore.Shared.Weapons["weapon_huntingrifle"] then
      LoadAnimDict('amb@medic@standing@kneel@base')
      LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
      TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
      TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
      QBCore.Functions.Progressbar("eat_something", "Skinning Mountain Lion..", 5000)
        Citizen.Wait(5000)
          TriggerEvent('animations:client:EmoteCommandStart', {"medic"})
          local seconds = math.random(10,35)
          local circles = 1
          local success = exports['qb-lock']:StartLockPickCircle(circles, seconds, success)
          if success then
            local seconds1 = math.random(10,35)
            local circles1 = 1
            local success1 = exports['qb-lock']:StartLockPickCircle(circles1, seconds1, success1)
            if success1 then
              local seconds2 = math.random(10,35)
              local circles2 = 1
              local success2 = exports['qb-lock']:StartLockPickCircle(circles2, seconds2, success2)
              if success2 then
                ClearPedTasksImmediately(PlayerPedId())
                DeleteEntity(baitAnimal)
                TriggerServerEvent('Leux-hunting:mountainlionReward')
              end
            end
          end
    else
      QBCore.Functions.Notify("You need a knife", "error")
    end
  else
    QBCore.Functions.Notify("You have already skinned 1 animal for the bait or this is another hunters animal", "error")
  end
end)

Citizen.CreateThread(function()
  while true do
    Wait(1000)
    if DoesEntityExist(baitAnimal) then
      local ped = PlayerPedId()
      local coords = GetEntityCoords(PlayerPedId())
      local animalCoords = GetEntityCoords(baitAnimal)
      local dst = #(coords - animalCoords)
      HideHudComponentThisFrame(14)
      if dst < 2.5 then -- spook animal
        TaskCombatPed(baitAnimal,ped,0,16)
      end
    end
  end
end)



RegisterCommand('getzone', function()
  Coords = GetEntityCoords(PlayerPedId())
  ZoneName = GetNameOfZone(Coords)
  print(ZoneName)
end)

RegisterCommand('testhuntingspawn',function()
   TriggerEvent('Leux-hunting:spawnAnimal')
end)

RegisterCommand('testpoachingspawn',function()
   TriggerEvent('Leux-hunting:spawnAnimal')
end)
