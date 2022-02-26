# leuxums-qbhunting based off of QBUS-NOPIXEL-HUNTING
THIS SCRIPT WAS MADE IN PARTNERSHIP WITH MIDDY USING QB-LOCK
https://github.com/M-Middy
middys link to his github page

Discord:
leuxum#4926

Target

1. add this to your qb-target/init.lua (make sure its under Config.Peds)
```
   ["Hunting"] = {
        model = 'ig_hunter', -- Change the ped to whatever you want (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector4(-774.12, 5604.64, 33.74, 167.68), --Change the coords, Go to /admin, developer options and select vector4
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        flag = 1,
        --scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            options = {
                {
                    item = 'weaponlicense',
                    type = "client",
                    event = "qb-shops:marketshop",
                    icon = "fas fa-shopping-cart",
                    label = "Open Shop",
                },
                {
                    type = "server",
                    event = "Leux-hunting:server:sell",
                    icon = "fas fa-circle",
                    label = "Sell",
                },
            },
        },
        distance = 3.5,
    },
```
2. add this to your qb-target/init.lua (make sure its under Config.TargetModels)

["animal1"] = {
		models = {
			"a_c_boar"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin',
			},
        },
        distance = 3.5,
    },
    ["huntinganimal2"] = {
		models = {
			"a_c_deer"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin',
			},
        },
        distance = 3.5,
    },
    ["huntinganimal3"] = {
		models = {
			"a_c_coyote"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin',
			},
        },
        distance = 3.5,
    },
    ["huntinganimal4"] = {
		models = {
			"a_c_mtlion"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin',
			},
        },
        distance = 3.5,
    },

```


Add to shared
	 -- Hunting Items
	['meat'] 						 = {['name'] = 'meat', 			 	  	  	['label'] = 'Meat', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'meat.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['leather'] 						 = {['name'] = 'leather', 			 	  	  	['label'] = 'Leather', 	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'leather.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
        ['huntingcarcass1'] 						 = {['name'] = 'huntingcarcass1', 			 	  	  	['label'] = 'Level 1 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass2'] 						 = {['name'] = 'huntingcarcass2', 			 	  	  	['label'] = 'Level 2 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass3'] 						 = {['name'] = 'huntingcarcass3', 			 	  	  	['label'] = 'Level 3 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass4'] 						 = {['name'] = 'huntingcarcass4', 			 	  	  	['label'] = 'Level 4 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingbait'] 						 = {['name'] = 'huntingbait', 			 	  	  	['label'] = 'Hunting Bait', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingbait.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A mixture of old meats and vegetables to attract animals'},
			    		    
````
add to qb-shops/config.lua (part1)
````
["huntingstore"] = {
            [1] = {
            name = "weapon_knife",
            price = 150,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
            requiresLicense = false
        },
        [2] = {
            name = "weapon_huntingrifle", --replace with the gun that you wish to sell
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
            requiresLicense = true
        },
        [3] = {
            name = "snp_ammo", --replace with the ammo that your gun uses
            price = 150,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
            requiresLicense = true
        },
        [4] = {
            name = "huntingbait",
            price = 25,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
            requiresLicense = false
        },
     },
````
add to qb-shops/config.lua (part2)
````
["huntingstore"] = {
        ["label"] = "Hunting Store",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(-774.45, 5603.32, 33.74)
        },
        ["products"] = Config.Products["huntingstore"],
        ["showblip"] = true,
    },
````
add to qb-shops/client/main.lua (around lines 164 but can vary) (part3)
````
elseif Config.Locations[store]["products"] == Config.Products["huntingstore"] then
				SetBlipSprite(StoreBlip, 141)
				SetBlipScale(StoreBlip, 0.70)
				SetBlipColour(StoreBlip, 1)
````
lastly put the item images into your qb-inventory/html/images

common problems

why can i not see the shop when i use target?

you need to make sure that you have the item weaponlicense in your inventory

why can i not see the gun or ammo in the store is it broken?

no, you need to set your job as police and give yourself a weapons license using
/grantlicense <id> weapon

or in qb-shops where it says

[2] = {
            name = "weapon_huntingrifle",
            price = 1500,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
            requiresLicense = true --you just switch this to false meaning everybody will have access to it
        },
