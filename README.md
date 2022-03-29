
![image](https://user-images.githubusercontent.com/68282622/160637413-8a9e686b-f1d2-4900-bf4b-4d717e852968.png)


# leuxums-qbhunting based off of QBUS-NOPIXEL-HUNTING
VERSION 0.2
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
    
    ["doggydave"] = {
        model = 'cs_karen_daniels', -- Change the ped to whatever you want (https://docs.fivem.net/docs/game-references/ped-models/)
        coords = vector4(186.3, -583.21, 43.87, 192.59), --Change the coords, Go to /admin, developer options and select vector4
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        flag = 1,
        --scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            options = {
                      {
					type = "client",
					event = "qb-shops:marketsho",
					targeticon = "fas fa-shopping-bag",
					label = 'I need some special animals for testing, up for the job?',
				},
				{
					type = "client",
					event = "qb-shops:marketshop",
					targeticon = "fas fa-shopping-bag",
					label = 'Doggy Daves Appliances',
				},
				{
					type = "server",
					event = "Leux-hunting:server:sellpoached",
					targeticon = "fas fa-shopping-bag",
					label = 'Sell',
				},
			},
        },
        distance = 3.5,
    },

```
add this to your qb-target/init.lua (make sure that its under Config.TargetModels
```
["animal1"] = {
		models = {
			"a_c_boar"
		},
         options = {
			{
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:boarAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Boar',
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
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:deerAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Deer',
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
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:wolfAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Coyote',
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
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:skinmtlion",
				targeticon = "far fa-hand-paper",
				label = 'Skin Mountain Lion',
			},
        },
        distance = 3.5,
    },
    ["poachedanimal1"] = {
		models = {
			"a_c_chimp"
		},
         options = {
			{
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:skinpoachedchimpanzeeAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Chimpanzee',
			},
        },
        distance = 3.5,
    },
    ["poachedanimal2"] = {
		models = {
			"a_c_husky"
		},
         options = {
			{
			     item = 'weapon_knife',
				type = "client",
				event = "Leux-hunting:wolfAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Husky',
			},
        },
        distance = 3.5,
    },
    ["poachedanimal3"] = {
		models = {
			"cs_orleans"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinbigfoot",
				targeticon = "far fa-hand-paper",
				label = 'Skin Bigfoot',
			},
        },
        distance = 3.5,
    },
    ["poachedanimal4"] = {
		models = {
			"a_c_rhesus"
		},
         options = {
			{
				type = "client",
				event = "Leux-hunting:skinpoachedchimpanzeeAnimal",
				targeticon = "far fa-hand-paper",
				label = 'Skin Chimpanzee',
			},
        },
        distance = 3.5,
    },
```


Add to shared
```
	 -- Hunting Items
	['meat'] 						 = {['name'] = 'meat', 			 	  	  	['label'] = 'Meat', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'meat.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['leather'] 						 = {['name'] = 'leather', 			 	  	  	['label'] = 'Level 1 Leather ', 	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'leather.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
     ['huntingcarcass1'] 						 = {['name'] = 'huntingcarcass1', 			 	  	  	['label'] = 'Level 1 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass2'] 						 = {['name'] = 'huntingcarcass2', 			 	  	  	['label'] = 'Level 2 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass3'] 						 = {['name'] = 'huntingcarcass3', 			 	  	  	['label'] = 'Level 3 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingcarcass4'] 						 = {['name'] = 'huntingcarcass4', 			 	  	  	['label'] = 'Level 4 carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['huntingbait'] 						 = {['name'] = 'huntingbait', 			 	  	  	['label'] = 'Hunting Bait', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingbait.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A mixture of old meats and vegetables to attract animals'},
	['illegalcarcass1'] 						 = {['name'] = 'illegalcarcass1', 			 	  	  	['label'] = 'Level 1 poached carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['illegalcarcass2'] 						 = {['name'] = 'illegalcarcass2', 			 	  	  	['label'] = 'Level 2 poached carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['illegalcarcass3'] 						 = {['name'] = 'illegalcarcass3', 			 	  	  	['label'] = 'Level 3 poached carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['illegalcarcass4'] 						 = {['name'] = 'illegalcarcass4', 			 	  	  	['label'] = 'Level 4 poached carcass', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['poachingbait'] 						 = {['name'] = 'poachingbait', 			 	  	  	['label'] = 'Poaching Bait', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingbait.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A mixture of old meats and vegetables to attract rare animals on a special island'},
	['bigfootfur'] 						 = {['name'] = 'bigfootfur', 			 	  	  	['label'] = 'Big Foot Fur', 	['weight'] = 500, 		['type'] = 'item', 		['image'] = 'bigfootfur.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'The fur of an ancient, mythical animal'},
	['chimpcarcass1'] 						 = {['name'] = 'chimpcarcass1', 			 	  	  	['label'] = 'Level 1 poached chimp', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['chimpcarcass2'] 						 = {['name'] = 'chimpcarcass2', 			 	  	  	['label'] = 'Level 2 poached chimp', 	['weight'] = 115, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['chimpcarcass3'] 						 = {['name'] = 'chimpcarcass3', 			 	  	  	['label'] = 'Level 3 poached chimp', 	['weight'] = 120, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['chimpcarcass4'] 						 = {['name'] = 'chimpcarcass4', 			 	  	  	['label'] = 'Level 4 poached chimp', 	['weight'] = 125, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['deercarcass1'] 						 = {['name'] = 'deercarcass1', 			 	  	  	['label'] = 'Level 1 poached deer', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['deercarcass2'] 						 = {['name'] = 'deercarcass2', 			 	  	  	['label'] = 'Level 2 poached deer', 	['weight'] = 115, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['deercarcass3'] 						 = {['name'] = 'deercarcass3', 			 	  	  	['label'] = 'Level 3 poached deer', 	['weight'] = 120, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['deercarcass4'] 						 = {['name'] = 'deercarcass4', 			 	  	  	['label'] = 'Level 4 poached deer', 	['weight'] = 125, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['boarcarcass1'] 						 = {['name'] = 'boarcarcass1', 			 	  	  	['label'] = 'Level 1 boar', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['boarcarcass2'] 						 = {['name'] = 'boarcarcass2', 			 	  	  	['label'] = 'Level 2 boar', 	['weight'] = 115, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['boarcarcass3'] 						 = {['name'] = 'boarcarcass3', 			 	  	  	['label'] = 'Level 3 boar', 	['weight'] = 120, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['boarcarcass4'] 						 = {['name'] = 'boarcarcass4', 			 	  	  	['label'] = 'Level 4 boar', 	['weight'] = 125, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['wolfcarcass1'] 						 = {['name'] = 'wolfcarcass1', 			 	  	  	['label'] = 'Level 1 wolf', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['wolfcarcass2'] 						 = {['name'] = 'wolfcarcass2', 			 	  	  	['label'] = 'Level 2 wolf', 	['weight'] = 115, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['wolfcarcass3'] 						 = {['name'] = 'wolfcarcass3', 			 	  	  	['label'] = 'Level 3 wolf', 	['weight'] = 120, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['wolfcarcass4'] 						 = {['name'] = 'wolfcarcass4', 			 	  	  	['label'] = 'Level 4 wolf', 	['weight'] = 125, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},
	['mtlioncarcass1'] 						 = {['name'] = 'mtlioncarcass1', 			 	  	  	['label'] = 'Level 1 mountain lion', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'huntingcarcass1.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['mtlioncarcass2'] 						 = {['name'] = 'mtlioncarcass2', 			 	  	  	['label'] = 'Level 2 mountain lion', 	['weight'] = 115, 		['type'] = 'item', 		['image'] = 'huntingcarcass2.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['mtlioncarcass3'] 						 = {['name'] = 'mtlioncarcass3', 			 	  	  	['label'] = 'Level 3 mountainlion', 	['weight'] = 125, 		['type'] = 'item', 		['image'] = 'huntingcarcass3.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['mtlioncarcass4'] 						 = {['name'] = 'mtlioncarcass4', 			 	  	  	['label'] = 'Level 4 mountain lion', 	['weight'] = 150, 		['type'] = 'item', 		['image'] = 'huntingcarcass4.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to a certified hunter'},
	['leather1'] 						 = {['name'] = 'leather1', 			 	  	  	['label'] = 'Level 2 Leather ', 	['weight'] = 200, 		['type'] = 'item', 		['image'] = 'leather.png', 				['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = 'A sellable resource to an uncertified hunter'},

		    		    
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
     ["poachingstore"] = {
            [1] = {
            name = "weapon_knife",
            price = 95,
            amount = 5,
            info = {},
            type = "item",
            slot = 1,
            requiresLicense = false
        },
        [2] = {
            name = "weapon_huntingrifle",
            price = 1100,
            amount = 5,
            info = {},
            type = "item",
            slot = 2,
            requiresLicense = true
        },
        [3] = {
            name = "snp_ammo",
            price = 125,
            amount = 5,
            info = {},
            type = "item",
            slot = 3,
            requiresLicense = true
        },
        [4] = {
            name = "poachingbait",
            price = 40,
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
["poachingstore"] = {
        ["label"] = "Poaching Store",
        ["type"] = "weapon",
        ["coords"] = {
            [1] = vector3(186.12, -583.7, 43.87)
        },
        ["products"] = Config.Products["poachingstore"],
        ["showblip"] = false,
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
