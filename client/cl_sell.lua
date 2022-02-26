local carcasses = {
    { name = "huntingcarcass1", price = 100, illegal = false },
    { name = "huntingcarcass2", price = 175, illegal = false },
    { name = "huntingcarcass3", price = 225, illegal = false },
    { name = "huntingcarcass4", price = 300, illegal = false },
    { name = "meat", price = 25, illegal = false },
    { name = "leather", price = 50, illegal = false },
    { name = "deercarcass1", price = 125, illegal = false },
    { name = "deercarcass2", price = 175, illegal = false },
    { name = "deercarcass3", price = 225, illegal = false },
    { name = "deercarcass4", price = 300, illegal = false },
    { name = "boarcarcass1", price = 175, illegal = false },
    { name = "boarcarcass2", price = 250, illegal = false },
    { name = "boarcarcass3", price = 285, illegal = false },
    { name = "boarcarcass4", price = 450, illegal = false },
    { name = "wolfcarcass1", price = 75, illegal = false },
    { name = "wolfcarcass2", price = 175, illegal = false },
    { name = "wolfcarcass3", price = 225, illegal = false },
    { name = "wolfcarcass4", price = 450, illegal = false },
    { name = "mtlioncarcass1", price = 250, illegal = false },
    { name = "mtlioncarcass2", price = 450, illegal = false },
    { name = "mtlioncarcass3", price = 750, illegal = false },
    { name = "mtlioncarcass4", price = 850, illegal = false },
}

local illegalcarcasses = {
    { name = "illegalcarcass1", price = 300, illegal = false },
    { name = "illegalcarcass2", price = 500, illegal = false },
    { name = "illegalcarcass3", price = 700, illegal = false },
    { name = "illegalcarcass4", price = 1100, illegal = false },
    { name = "meat", price = 45, illegal = false },
    { name = "rareleather", price = 55, illegal = false },
    { name = "chimpcarcass1", price = 150, illegal = false },
    { name = "chimpcarcass2", price = 300, illegal = false },
    { name = "chimpcarcass3", price = 450, illegal = false },
    { name = "chimpcarcass4", price = 750, illegal = false },
    { name = "bigfootfur", price = 1500, illegal = false },
    { name = "leather1", price = 100, illegal = false },
 }


local function sellAnimals()
TriggerServerEvent("Leux-hunting:server:sell")
end

local listening = false
local function listenForKeypress()
    listening = true
    Citizen.CreateThread(function()
        while listening do
            if IsControlJustReleased(0, 38) then
                listening = false
                exports["aw3-ui"]:hideInteraction()
                sellAnimals()
            end
            Wait(0)
        end
    end)
end

local huntingsales = false
AddEventHandler("polyzonehelper:enter", function(name)
    if name ~= "huntingsales" then return end
    exports["aw3-ui"]:showInteraction("[E] Sell Animal Carcass")
    listenForKeypress()
end)

AddEventHandler("polyzonehelper:exit", function(name)
    if name ~= "huntingsales" then return end
    exports["aw3-ui"]:hideInteraction()
    listening = false
end)

function isNight()
	local hour = GetClockHours()
	if hour > 21 or hour < 3 then
	  return true
	end
  end
  
  local function sellPoachedAnimals()
TriggerServerEvent("Leux-hunting:server:sellpoached")
end