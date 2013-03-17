/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
#define DEBUG

area
	tree


mob/proc/LogIn()
	for(var/mob/Monsters/M in world)
		if(M.Owner == src)
			M.LoggedOut = 0
		if(usr.key=="Killerbass")
			usr.verbs+=typesof(/Admin/verb/)
mob
	Logout()
		Players -= usr
		usr.Save()
		usr.Up = 0
		world << "<b><font color=purple>[usr] Logs out"
		usr.Restart = 0
		usr.LoggedOut = 1
		for(var/obj/DigAt/D in world)
			if(D.Owner == usr)
				del(D)
		for(var/mob/Monsters/M in usr.UnitList)
			if(M.Owner == usr)
				M.LoggedOut = 1
				M.DigTarget = null
		for(var/mob/Monsters/M in usr.Selected)
			usr.Selected.Remove(M)
			M.destination = null







	Login()
		usr.Load()
		usr.IsWood = 0
		usr.Up = 0
		usr.Content = "CantBeCaged"
		Players += usr
		usr << "<font color = red size = 3> .:Help:.Please visit the <a href=\"http://dungeonmaster.murrawhip.net/forum/index.php?topic=241.0  \">NewbieGuide</a>"
		if(usr.client.address in banlist)
			usr<<"You have been banned."
			del usr
		if(usr.ListOn == 0)
			usr.Selected = list()
			usr.IgnoreList = list()
			usr.ListOn = 1
		if(usr.key == world.host)
			usr.name = "(Host):[usr.name]"
			usr.verbs+=typesof(/Admin/verb/)
			usr.GM = 1
		if(usr.key == "Ginseng")
			usr.name = "(Owner):Ginseng"
			usr.verbs+=typesof(/Admin/verb/)
			usr.GM = 1
		if(usr.key == "")//Lower levelled admin
			usr.name = "(Admin):Lower Levelled admin"
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs -= /Admin/verb/Edit/
			usr.verbs -= /Admin/verb/Create/
			usr.GM = 1
		world << "<b><font color=purple>[usr] Logs in"
		usr.Intro()
		usr << sound('M2.mid',1)
		usr.LoggedOut = 0
		usr.Address = usr.client.address
		if(usr.AMMode == 1)
			usr.Done = 1
			usr.User = 1
			return
		for(var/mob/Monsters/M in usr.UnitList)
			if(M.Owner == usr)
				usr.loc = M.loc
				usr.User = 1
				usr.LogIn()
				usr.Done = 1
				return
		usr.User = 0
		var/X
		var/Y
		X = rand(336,995)
		Y = rand(707,263)
		usr.loc = locate(X,Y,1)
		usr.density = 0
		usr.Rares = list()
		if(usr.LoggedIn == 0)
			usr.LoggedIn = 1
			usr.UnitList = list()
			var/Spid = prob(7)
			var/Vamp = prob(7)
			var/Dev = prob(5)
			if(Dev)
				usr.Rares += "Devourer"
			if(Vamp)
				usr.Rares += "Vampire"
			if(Spid)
				usr.Rares += "Spider"
		var/In = 0
		if(usr in PlayerList)
			In = 1
		if(In == 0)
			PlayerList += usr
		var/list/menu = new()
		if("Spider" in usr.Rares)
			menu += "Spiders - Rare"
		if("Vampire" in usr.Rares)
			menu += "Vampire - Rare"
		if("Devourer" in usr.Rares)
			menu += "Devourer - Rare"
		if(usr.key == "Ginseng")
			usr.Rares += "Vampire"
			usr.Rares += "Spider"
			usr.Rares += "Devourer"
			menu += "DarkLord"
			menu += "Vampire - Rare"
			menu += "Spiders - Rare"
			menu += "Devourer - Rare"
		menu += "Kobolds"
		menu += "Orcs"
		menu += "Goblins"
		menu += "Dwarfs"
		menu += "Humans"
		menu += "LizardMen"
		menu += "Adventure Mode"
		menu += "Cancel"
		var/Result = input("Which Race Would You Like To Play?", "Choose", null) in menu
		if (Result == "Cancel")
			usr.Restart = 0
			return
		if(Result == "Devourer - Rare")
			var/mob/Monsters/DevourerCacoon/C = new
			var/LocX = rand(250,800)
			var/LocY = rand(200,800)
			C.loc = locate(LocX,LocY,1)
			C.Owner = usr
			usr.loc = C.loc
			usr.UnitList += C
			usr.Done = 1
			usr.User = 1
			alert("Awoken after Two Thousand years of slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to break away from your cacoon and bring about a second coming of the dreaded Plague of Black Blight!")
			return
		if (Result == "Adventure Mode")
			usr.icon = null
			var/list/menu2 = new()
			menu2 += "New"
			var/Result2 = input("Which Race Would You Like To Play?", "Choose", null) in menu2
			if (Result2 == "Cancel")
				return
			if (Result2 == "New")
				var/list/menu4 = new()
				menu4 += "Kobold"
				menu4 += "Orc"
				menu4 += "Goblin"
				menu4 += "Dwarf"
				menu4 += "Human"
				menu4 += "LizardMan"
				if(usr.key == "Ginseng")
					menu4 += "Lord"
				var/Result4 = input("Which Race Would You Like To Play?", "Choose", null) in menu4
				if (Result4 == "Cancel")
					return
				if (Result4 == "Lord")
					usr.loc = locate(1,1,1)
					var/mob/Monsters/DarkKnight/K = new
					K.loc = usr.loc
					K.Age = 200
					K.name = "Dark Lord"
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					K.Birth()
					usr.Done = 1
					usr.User = 1
				if (Result4 == "LizardMan")
					var/X1 = rand(248,365)
					var/Y1 = rand(680,780)
					var/Z1 = 1
					usr.loc = locate(X1,Y1,Z1)
					usr.Race = "LizardMan - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/LizardMan/K = new
					if (choice == "Male")

						K.icon = 'LizardMan.dmi'
						K.icon_state = "Normal"
						K.Gender = "Male"
					if (choice == "Female")

						K.icon = 'LizardWoman.dmi'
						K.icon_state = "Normal"
						K.Gender = "Female"
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Weapons/Spears/Spear/D = new
					D.M = "Metal"
					D.CraftRank = "Poor Quality"
					D.MetalWeaponCraft()
					D.loc = K
					D.suffix = "(Carrying)"
					K.weight += D.weight
					var/obj/Items/Furniture/Beds/SleepingBag/SB = new
					SB.loc = K
					SB.suffix = "(Carrying)"
					var/obj/Items/Food/Meats/UnCookedWolfMeat/M = new
					M.loc = K
					K.weight += M.weight
					M.suffix = "(Carrying)"
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
				if (Result4 == "Goblin")
					usr.Race = "Goblin - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/Goblin/K = new
					if (choice == "Male")

						K.icon = 'Goblins.dmi'
						K.icon_state = "Normal"
						K.Gender = "Male"
					if (choice == "Female")

						K.icon = 'FemaleGoblin.dmi'
						K.icon_state = "Normal"
						K.Gender = "Female"
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Weapons/Spears/Spear/D = new
					D.M = "Metal"
					D.CraftRank = "Poor Quality"
					D.MetalWeaponCraft()
					D.loc = K
					D.suffix = "(Carrying)"
					K.weight += D.weight
					var/obj/Items/Weapons/Picks/PickAxe/P = new
					P.loc = K
					P.suffix = "(Carrying)"
					K.weight += P.weight
					var/obj/Items/Furniture/Beds/SleepingBag/SB = new
					SB.loc = K
					SB.suffix = "(Carrying)"
					var/obj/Items/Food/Meats/UnCookedWolfMeat/M = new
					M.loc = K
					K.weight += M.weight
					M.suffix = "(Carrying)"
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
				if (Result4 == "Kobold")
					usr.Race = "Kobold - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/Kobold/K = new
					if (choice == "Male")

						K.icon = 'Kobold.dmi'
						K.icon_state = "Normal"
						K.Gender = "Male"
					if (choice == "Female")

						K.icon = 'FemaleKobold.dmi'
						K.icon_state = "Normal"
						K.Gender = "Female"
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Weapons/Spears/Spear/D = new
					D.M = "Metal"
					D.CraftRank = "Poor Quality"
					D.MetalWeaponCraft()
					D.loc = K
					D.suffix = "(Carrying)"
					K.weight += D.weight
					var/obj/Items/Furniture/Beds/SleepingBag/SB = new
					SB.loc = K
					SB.suffix = "(Carrying)"
					var/obj/Items/Food/Meats/UnCookedWolfMeat/M = new
					M.loc = K
					K.weight += M.weight
					M.suffix = "(Carrying)"
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
				if (Result4 == "Dwarf")
					usr.Race = "Dwarf - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/Dwarf/K = new
					var/M
					if (choice == "Male")
						K.icon = 'Human.dmi'
						K.Gender = "Male"
						M = 1
					if (choice == "Female")
						K.icon = 'FemaleHuman.dmi'
						K.Gender = "Female"

						M = 0
					if(M == 1)

						K.icon_state = "Normal"
					if(M == 0)
						K.icon = 'FemaleHuman.dmi'

						K.icon_state = "Normal"
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Food/CookedMeats/Tomato/T = new
					T.loc = K
					T.suffix = "(Carrying)"
					K.weight += T.weight
					var/obj/Items/Weapons/Picks/PickAxe/P = new
					P.M = "Metal"
					P.CraftRank = "Poor Quality"
					P.MetalWeaponCraft()
					P.loc = K
					P.suffix = "(Carrying)"
					K.weight += P.weight
					var/obj/Items/Weapons/Axes/MetalAxe/A = new
					A.M = "Metal"
					A.CraftRank = "Poor Quality"
					A.MetalWeaponCraft()
					A.loc = K
					A.suffix = "(Carrying)"
					K.weight += A.weight
					var/obj/Items/Weapons/Daggers/MetalDagger/D = new
					D.M = "Metal"
					D.CraftRank = "Poor Quality"
					D.MetalWeaponCraft()
					D.loc = K
					D.suffix = "(Carrying)"
					K.weight += D.weight
					var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
					Z.CraftRank = "Poor Quality"
					Z.loc = K
					Z.Defence = 1
					K.Defence += 1
					K.WearingLegs = 1
					Z.suffix = "(Equiped)"
					K.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
					var/obj/Items/Furniture/Beds/SleepingBag/SB = new
					SB.loc = K
					SB.suffix = "(Carrying)"
					var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
					Z2.CraftRank = "Poor Quality"
					Z2.loc = K
					Z2.Defence = 1
					K.Defence += 1
					K.WearingChest = 1
					Z2.suffix = "(Equiped)"
					K.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
				if (Result4 == "Orc")
					usr.Race = "Orc - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/Orc/K = new
					if (choice == "Male")
						K.icon = 'OrcMale.dmi'
						K.Gender = "Male"
						M = 1
					if (choice == "Female")
						K.Gender = "Female"
						K.icon = 'OrcFemale.dmi'
						M = 0
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Food/Meats/UnCookedKoboldMeat/T = new
					T.loc = K
					T.suffix = "(Carrying)"
					K.weight += T.weight
					var/obj/Items/Weapons/Picks/PickAxe/P = new
					P.M = "Metal"
					P.CraftRank = "Poor Quality"
					P.MetalWeaponCraft()
					P.loc = K
					P.suffix = "(Carrying)"
					K.weight += P.weight
					var/obj/Items/Weapons/Axes/MetalOrcAxe/A = new
					A.M = "Metal"
					A.CraftRank = "Poor Quality"
					A.MetalWeaponCraft()
					A.loc = K
					A.suffix = "(Carrying)"
					K.weight += A.weight
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
				if (Result4 == "Human")
					usr.Race = "Human - Adventure Mode"
					var/choice = alert(usr, "Choose Gender", "Choose", "Male", "Female", null)
					var/mob/Monsters/Human/K = new
					var/M
					if (choice == "Male")
						K.icon = 'Human.dmi'
						K.Gender = "Male"
						M = 1
					if (choice == "Female")
						K.Gender = "Female"
						K.icon = 'FemaleHuman.dmi'
						M = 0
					if(M == 1)

						K.icon_state = "Normal"
					if(M == 0)
						K.icon = 'FemaleHuman.dmi'

						K.icon_state = "Normal"
					if(M == 1)
						if(K.Black == 1)
							K.icon = 'HumanBlack.dmi'
							K.icon_state = "Normal"
					if(M == 0)
						if(K.Black == 1)
							K.icon = 'FemaleHumanBlack.dmi'
							K.icon_state = "Normal"
					K.loc = usr.loc
					K.Age = 18
					usr.Using = K
					usr.Selected.Add(K)
					K.Owner = usr
					usr.destination = K
					usr.WalkToA()
					var/obj/Items/Food/CookedMeats/Tomato/T = new
					T.loc = K
					T.suffix = "(Carrying)"
					K.weight += T.weight
					var/obj/Items/Weapons/Picks/PickAxe/P = new
					P.M = "Metal"
					P.CraftRank = "Poor Quality"
					P.MetalWeaponCraft()
					P.loc = K
					P.suffix = "(Carrying)"
					K.weight += P.weight
					var/obj/Items/Weapons/Axes/MetalAxe/A = new
					A.M = "Metal"
					A.CraftRank = "Poor Quality"
					A.MetalWeaponCraft()
					A.loc = K
					A.suffix = "(Carrying)"
					K.weight += A.weight
					var/obj/Items/Weapons/Daggers/MetalDagger/D = new
					D.M = "Metal"
					D.CraftRank = "Poor Quality"
					D.MetalWeaponCraft()
					D.loc = K
					D.suffix = "(Carrying)"
					K.weight += D.weight
					var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
					Z.CraftRank = "Poor Quality"
					Z.loc = K
					Z.Defence = 1
					K.Defence += 1
					K.WearingLegs = 1
					Z.suffix = "(Equiped)"
					K.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
					var/obj/Items/Furniture/Beds/SleepingBag/SB = new
					SB.loc = K
					SB.suffix = "(Carrying)"
					K.weight += SB.weight
					var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
					Z2.CraftRank = "Poor Quality"
					Z2.loc = K
					Z2.Defence = 1
					K.Defence += 1
					K.WearingChest = 1
					Z2.suffix = "(Equiped)"
					K.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
					K.Birth()
					usr.Done = 1
					usr.User = 1
					var/mob/Monsters/Wagon/W = new
					W.loc = usr.loc
					W.Owner = usr
					W.Gender = null
					W.destination = K
		if (Result == "DarkLord")
			var/mob/Monsters/DarkKnight/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = null
			B.Age = 150
			B.icon_state = "Normal"
			usr.UnitList += B
			B.Birth()
			usr.Done = 1
			usr.User = 1
		if (Result == "Spiders - Rare")
			usr.Race = "Spiders"
			var/X2
			var/Y2
			X2 = rand(336,995)
			Y2 = rand(707,263)
			usr.loc = locate(X2,Y2,1)
			var/mob/Monsters/SpiderQueen/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Female"
			B.Age = 20
			B.icon_state = "Normal"
			B.name = "{[B.Owner]} Spider Queen"
			usr.UnitList += B
			B.Birth()
			usr.Done = 1
			usr.User = 1
			alert("After many weeks of travel from your old nests you arive at new lands, ready to create a new swarm, you begin to locate a suitable area for your hatchlings.")
		if (Result == "Vampire - Rare")
			usr.Race = "Vampires"
			var/X2
			var/Y2
			X2 = rand(187,600)
			Y2 = rand(200,200)
			usr.loc = locate(X2,Y2,1)
			var/mob/Monsters/Vampire/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "None"
			B.HasWings = 1
			B.overlays += 'Wings.dmi'
			B.Age = 20
			B.name = "{[B.Owner]} Vampire"
			if(usr.key == "Ginseng")
				B.Level = 20
			usr.UnitList += B
			for(var/turf/grounds/cavefloor/C in view(1,B))
				C.icon_state = "CaveFloor"
				C.CanDigAt = 0
				C.opacity = 0
				C.density = 0
			B.Birth()
			usr.Done = 1
			usr.User = 1
			alert("Created in the very deepest darkest regions of hell, vampires live a cursed exsistence, created by the dark gods for thier amusement you hunger for the blood of the living. You are a vampire lord, one of the first vampires to walk this land, and this is your new feeding ground.")
			alert("After your un-holy creation the dark gods summon you into a mountain cave. Confused and dazed, with nothing but your hunger for blood, you awake.")

		if (Result == "Humans")
			usr.Race = "Humans"
			var/mob/Monsters/HumanEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/Ingots/MetalIngot/Ingot1 = new
			Ingot1.loc = W
			W.weight += Ingot1.weight
			Ingot1.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot2 = new
			Ingot2.loc = W
			W.weight += Ingot2.weight
			Ingot2.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot3 = new
			Ingot3.loc = W
			W.weight += Ingot3.weight
			Ingot3.suffix = "(Carrying)"

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new
			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"

			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			var/mob/Monsters/Human/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			B.Age = 20
			W.destination = B
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/SD = new
			SD.loc = B
			SD.suffix = "(Carrying)"
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
			Z.CraftRank = "Poor Quality"
			Z.loc = B
			Z.Defence = 1
			B.Defence += 1
			B.WearingLegs = 1
			Z.suffix = "(Equiped)"
			B.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
			Z2.CraftRank = "Poor Quality"
			Z2.loc = B
			Z2.Defence = 1
			B.Defence += 1
			B.WearingChest = 1
			Z2.suffix = "(Equiped)"
			B.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[Safe_Guard(B.Owner)]"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			usr.UnitList += B
			var/obj/Items/Weapons/Picks/PickAxe/P = new
			P.M = "Metal"
			P.CraftRank = "Poor Quality"
			P.MetalWeaponCraft()
			P.loc = B
			P.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/A2 = new
			A2.M = "Metal"
			A2.CraftRank = "Poor Quality"
			A2.MetalWeaponCraft()
			A2.loc = B
			A2.suffix = "(Carrying)"
			B.weight = 95
			var/mob/Monsters/Human/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			B2.Gender = "Female"
			B2.Age = 20
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/obj/Items/Armours/Legs/LeatherLeggings/Z3 = new
			Z3.CraftRank = "Poor Quality"
			Z3.loc = B2
			Z3.Defence = 1
			B2.Defence += 1
			B2.WearingLegs = 1
			Z3.suffix = "(Equiped)"
			B2.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z4 = new
			Z4.CraftRank = "Poor Quality"
			Z4.loc = B2
			Z4.Defence = 1
			B2.Defence += 1
			B2.WearingChest = 1
			Z4.suffix = "(Equiped)"
			B2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/M2 = new
			M2.loc = B2
			if(B2.Black == 1)
				B2.icon = 'FemaleHumanBlack.dmi'
			else
				B2.icon = 'FemaleHuman.dmi'
			B2.icon_state = "Normal"
			M2.suffix = "(Carrying)"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			usr.UnitList += B2
			var/obj/Items/Weapons/Picks/PickAxe/P2 = new
			P2.M = "Metal"
			P2.CraftRank = "Poor Quality"
			P2.MetalWeaponCraft()
			P2.loc = B2
			P2.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/s = new
			s.M = "Metal"
			s.CraftRank = "Poor Quality"
			s.MetalWeaponCraft()
			s.loc = B2
			s.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/s2 = new
			s2.M = "Metal"
			s2.CraftRank = "Poor Quality"
			s2.MetalWeaponCraft()
			s2.loc = B2
			s2.suffix = "(Carrying)"
			B2.weight = 90
			var/mob/Monsters/Human/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			B3.Gender = "Male"
			B3.Age = 20
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			var/obj/Items/Armours/Legs/LeatherLeggings/Z5 = new
			Z5.CraftRank = "Poor Quality"
			Z5.loc = B3
			Z5.Defence = 1
			B3.Defence += 1
			B3.WearingLegs = 1
			Z5.suffix = "(Equiped)"
			B3.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z6 = new
			Z6.CraftRank = "Poor Quality"
			Z6.loc = B3
			Z6.Defence = 1
			B3.Defence += 1
			B3.WearingChest = 1
			Z6.suffix = "(Equiped)"
			B3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/M3 = new
			M3.loc = B3
			M3.suffix = "(Carrying)"
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			usr.UnitList += B3
			var/obj/Items/Weapons/Picks/PickAxe/P3 = new
			P3.M = "Metal"
			P3.CraftRank = "Poor Quality"
			P3.MetalWeaponCraft()
			P3.loc = B3
			P3.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/w = new
			w.M = "Metal"
			w.CraftRank = "Poor Quality"
			w.MetalWeaponCraft()
			w.loc = B3
			w.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/w2 = new
			w2.M = "Metal"
			w2.CraftRank = "Poor Quality"
			w2.MetalWeaponCraft()
			w2.loc = B3
			w2.suffix = "(Carrying)"
			B3.weight = 90
			if(B.Black == 1)
				B.icon = 'HumanBlack.dmi'
			else
				B.icon = 'Human.dmi'
			if(B3.Black == 1)
				B3.icon = 'HumanBlack.dmi'
			else
				B3.icon = 'Human.dmi'
			B.icon_state = "Normal"
			B2.icon_state = "Normal"
			B3.icon_state = "Normal"
			B.Birth()
			B2.Birth()
			B3.Birth()
			usr.Done = 1
			usr.User = 1
			alert("As part of the Human empire you were ordered to scout out new lands suitable for settlements, it now looks although your search has come to an end! it might be best if you set up camp for the winter ahead.")
		if (Result == "Orcs")
			var/X1 = rand(855,1000)
			var/Y1 = rand(788,350)
			usr.loc = locate(X1,Y1,1)
			usr.Race = "Orcs"
			var/mob/Monsters/OrcEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/Ingots/MetalIngot/Ingot1 = new
			Ingot1.loc = W
			W.weight += Ingot1.weight
			Ingot1.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot2 = new
			Ingot2.loc = W
			W.weight += Ingot2.weight
			Ingot2.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot3 = new
			Ingot3.loc = W
			W.weight += Ingot3.weight
			Ingot3.suffix = "(Carrying)"

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new

			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"
			var/mob/Monsters/Orc/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			B.Age = 20
			W.destination = B
			var/obj/Items/Food/Meats/UnCookedDeerMeat/SD = new
			SD.loc = B
			SD.suffix = "(Carrying)"
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[Safe_Guard(B.Owner)]"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			usr.UnitList += B
			var/obj/Items/Weapons/Picks/PickAxe/P = new
			P.M = "Metal"
			P.CraftRank = "Poor Quality"
			P.MetalWeaponCraft()
			P.loc = B
			P.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalOrcAxe/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/A1 = new
			A1.M = "Metal"
			A1.CraftRank = "Poor Quality"
			A1.MetalArmourCraft()
			A1.loc = B
			A1.suffix = "(Carrying)"
			B.weight = 75
			var/mob/Monsters/Orc/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			B2.Gender = "Female"
			B2.Age = 20
			B2.icon = 'OrcFemale.dmi'
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M2 = new
			M2.loc = B2
			B2.icon_state = "Normal"
			M2.suffix = "(Carrying)"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			usr.UnitList += B2
			var/obj/Items/Weapons/Picks/PickAxe/P2 = new
			P2.M = "Metal"
			P2.CraftRank = "Poor Quality"
			P2.MetalWeaponCraft()
			P2.loc = B2
			P2.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalOrcAxe/s = new
			s.M = "Metal"
			s.CraftRank = "Poor Quality"
			s.MetalWeaponCraft()
			s.loc = B2
			s.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/A2 = new
			A2.M = "Metal"
			A2.CraftRank = "Poor Quality"
			A2.MetalArmourCraft()
			A2.loc = B2
			A2.suffix = "(Carrying)"
			B2.weight = 75
			var/mob/Monsters/Orc/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			B3.Gender = "Male"
			B3.Age = 20
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M3 = new
			M3.loc = B3
			M3.suffix = "(Carrying)"
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			usr.UnitList += B3
			var/obj/Items/Weapons/Picks/PickAxe/P3 = new
			P3.M = "Metal"
			P3.CraftRank = "Poor Quality"
			P3.MetalWeaponCraft()
			P3.loc = B3
			P3.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalOrcAxe/w = new
			w.M = "Metal"
			w.CraftRank = "Poor Quality"
			w.MetalWeaponCraft()
			w.loc = B3
			w.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/A3 = new
			A3.M = "Metal"
			A3.CraftRank = "Poor Quality"
			A3.MetalArmourCraft()
			A3.loc = B3
			A3.suffix = "(Carrying)"
			B3.weight = 75
			B.icon_state = "Normal"
			B2.icon_state = "Normal"
			B3.icon_state = "Normal"
			B.icon = 'OrcMale.dmi'
			B2.icon = 'OrcFemale.dmi'
			B3.icon = 'OrcMale.dmi'
			B.Birth()
			B2.Birth()
			B3.Birth()
			usr.Done = 1
			usr.User = 1
			alert("Forever have the orcs roamed the lands of this world in nomadic tribes, searching for the perfect place to settle down. Upon reaching [WorldName] the orcs decided they liked it and soon discovered others did also, as the leader of your orc tribe you must decide which races, if any, are worthy of staying in your land and who should be removed, for if you are to create the perfect tribe there can be no room for weakness!")

		if (Result == "Dwarfs")
			usr.Race = "Dwarfs"
			var/mob/Monsters/DwarfEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/Ingots/MetalIngot/Ingot1 = new
			Ingot1.loc = W
			W.weight += Ingot1.weight
			Ingot1.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot2 = new
			Ingot2.loc = W
			W.weight += Ingot2.weight
			Ingot2.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot3 = new
			Ingot3.loc = W
			W.weight += Ingot3.weight
			Ingot3.suffix = "(Carrying)"

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new
			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"

			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			var/mob/Monsters/Dwarf/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			B.Age = 20
			W.destination = B
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/SD = new
			SD.loc = B
			SD.suffix = "(Carrying)"
			var/obj/Items/Armours/Legs/LeatherLeggings/Z = new
			Z.CraftRank = "Poor Quality"
			Z.loc = B
			Z.Defence = 1
			B.Defence += 1
			B.WearingLegs = 1
			Z.suffix = "(Equiped)"
			B.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z2 = new
			Z2.CraftRank = "Poor Quality"
			Z2.loc = B
			Z2.Defence = 1
			B.Defence += 1
			B.WearingChest = 1
			Z2.suffix = "(Equiped)"
			B.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[B.Owner]}"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			usr.UnitList += B
			var/obj/Items/Weapons/Picks/PickAxe/P = new
			P.M = "Metal"
			P.CraftRank = "Poor Quality"
			P.MetalWeaponCraft()
			P.loc = B
			P.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/A2 = new
			A2.M = "Metal"
			A2.CraftRank = "Poor Quality"
			A2.MetalWeaponCraft()
			A2.loc = B
			A2.suffix = "(Carrying)"
			B.weight = 95
			var/mob/Monsters/Dwarf/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			B2.Gender = "Female"
			B2.Age = 20
			B2.overlays -= 'Beards.dmi'
			B2.overlays -= 'BlackBeard.dmi'
			B2.overlays -= 'BrownBeard.dmi'
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/obj/Items/Armours/Legs/LeatherLeggings/Z3 = new
			Z3.CraftRank = "Poor Quality"
			Z3.loc = B2
			Z3.Defence = 1
			B2.Defence += 1
			B2.WearingLegs = 1
			Z3.suffix = "(Equiped)"
			B2.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z4 = new
			Z4.CraftRank = "Poor Quality"
			Z4.loc = B2
			Z4.Defence = 1
			B2.Defence += 1
			B2.WearingChest = 1
			Z4.suffix = "(Equiped)"
			B2.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/M2 = new
			M2.loc = B2
			M2.suffix = "(Carrying)"
			B2.icon_state = "Normal"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			usr.UnitList += B2
			var/obj/Items/Weapons/Picks/PickAxe/P2 = new
			P2.M = "Metal"
			P2.CraftRank = "Poor Quality"
			P2.MetalWeaponCraft()
			P2.loc = B2
			P2.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/s = new
			s.M = "Metal"
			s.CraftRank = "Poor Quality"
			s.MetalWeaponCraft()
			s.loc = B2
			s.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/s2 = new
			s2.M = "Metal"
			s2.CraftRank = "Poor Quality"
			s2.MetalWeaponCraft()
			s2.loc = B2
			s2.suffix = "(Carrying)"
			B2.weight = 90
			var/mob/Monsters/Dwarf/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			B3.Gender = "Male"
			B3.Age = 20
			var/obj/Items/Armours/Legs/LeatherLeggings/Z5 = new
			Z5.CraftRank = "Poor Quality"
			Z5.loc = B3
			Z5.Defence = 1
			B3.Defence += 1
			B3.WearingLegs = 1
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			Z5.suffix = "(Equiped)"
			B3.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
			var/obj/Items/Armours/ChestPlates/LeatherChestPlate/Z6 = new
			Z6.CraftRank = "Poor Quality"
			Z6.loc = B3
			Z6.Defence = 1
			B3.Defence += 1
			B3.WearingChest = 1
			Z6.suffix = "(Equiped)"
			B3.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/
			var/obj/Items/Food/CookedMeats/CookedDeerMeat/M3 = new
			M3.loc = B3
			M3.suffix = "(Carrying)"
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			usr.UnitList += B3
			var/obj/Items/Weapons/Picks/PickAxe/P3 = new
			P3.M = "Metal"
			P3.CraftRank = "Poor Quality"
			P3.MetalWeaponCraft()
			P3.loc = B3
			P3.suffix = "(Carrying)"
			var/obj/Items/Weapons/Axes/MetalAxe/w = new
			w.M = "Metal"
			w.CraftRank = "Poor Quality"
			w.MetalWeaponCraft()
			w.loc = B3
			w.suffix = "(Carrying)"
			var/obj/Items/Weapons/Daggers/MetalDagger/w2 = new
			w2.M = "Metal"
			w2.CraftRank = "Poor Quality"
			w2.MetalWeaponCraft()
			w2.loc = B3
			w2.suffix = "(Carrying)"
			B3.weight = 90
			B.icon = 'Human.dmi'
			B3.icon = 'Human.dmi'
			B2.icon = 'FemaleHuman.dmi'
			B.icon_state = "Normal"
			B3.icon_state = "Normal"
			B.Birth()
			B2.Birth()
			B3.Birth()
			usr.Done = 1
			usr.User = 1
			alert("You and your companions have arived at the new un-explored lands, here many adventures and dangers await you. You should think about creating a secure place to live deep in the mountains, so that you may start to create a vast dwarven city.")
		if (Result == "Kobolds")
			usr.Race = "Kobolds"
			var/mob/Monsters/KoboldEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new
			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"

			var/obj/Items/Bones/Bones/BO1 = new
			BO1.loc = W
			W.weight += BO1.weight
			BO1.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO2 = new
			BO2.loc = W
			W.weight += BO2.weight
			BO2.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO3 = new
			BO3.loc = W
			W.weight += BO3.weight
			BO3.suffix = "(Carrying)"


			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			var/mob/Monsters/Kobold/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			B.Age = 20
			W.destination = B
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[B.Owner]}"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			usr.UnitList += B
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M = new
			M.loc = B
			M.suffix = "(Carrying)"
			B.weight = 30
			var/obj/Items/Weapons/Spears/Spear/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/mob/Monsters/Kobold/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			B2.icon_state = "Normal"
			usr.UnitList += B2
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M2 = new
			M2.loc = B2
			M2.suffix = "(Carrying)"
			B2.weight = 30
			B2.Age = 20
			var/obj/Items/Weapons/Spears/Spear/A2 = new
			A2.M = "Metal"
			A2.CraftRank = "Poor Quality"
			A2.MetalWeaponCraft()
			A2.loc = B2
			A2.suffix = "(Carrying)"
			B2.Gender = "Female"
			var/mob/Monsters/Kobold/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			usr.UnitList += B3
			var/obj/Items/Food/Meats/UnCookedDeerMeat/f = new
			f.loc = B3
			f.suffix = "(Carrying)"
			B3.weight = 30
			var/obj/Items/Weapons/Spears/Spear/f2 = new
			f2.M = "Metal"
			f2.CraftRank = "Poor Quality"
			f2.MetalWeaponCraft()
			f2.loc = B3
			f2.suffix = "(Carrying)"
			B3.Gender = "Male"
			B3.Age = 20
			B.icon = 'Kobold.dmi'
			B2.icon = 'FemaleKobold.dmi'
			B3.icon = 'Kobold.dmi'
			B.icon_state = "Normal"
			B2.icon_state = "Normal"
			B3.icon_state = "Normal"
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			B.Birth()
			B2.Birth()
			B3.Birth()
			usr.Done = 1
			usr.User = 1
			alert("Tempted by the un-found treasures of this new land you finally arive, it might be best to create a secure cave so that you may one day make a vast Kobold army to raid this land with.")
		if (Result == "LizardMen")
			var/X1 = rand(248,365)
			var/Y1 = rand(680,780)
			var/Z1 = 1
			usr.loc = locate(X1,Y1,Z1)
			usr.Race = "LizardMen"
			var/mob/Monsters/LizardManEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new
			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"

			var/obj/Items/Bones/Bones/BO1 = new
			BO1.loc = W
			W.weight += BO1.weight
			BO1.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO2 = new
			BO2.loc = W
			W.weight += BO2.weight
			BO2.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO3 = new
			BO3.loc = W
			W.weight += BO3.weight
			BO3.suffix = "(Carrying)"


			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			var/mob/Monsters/LizardMan/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			B.icon = 'LizardMan.dmi'
			B.Age = 20
			W.destination = B
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[B.Owner]}"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			usr.UnitList += B
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M = new
			M.loc = B
			M.suffix = "(Carrying)"
			B.weight = 30
			var/obj/Items/Weapons/Spears/Spear/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/mob/Monsters/LizardMan/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			B2.icon_state = "Normal"
			usr.UnitList += B2
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M2 = new
			M2.loc = B2
			M2.suffix = "(Carrying)"
			B2.weight = 30
			B2.Age = 20
			var/obj/Items/Weapons/Spears/Spear/A2 = new
			A2.M = "Metal"
			A2.CraftRank = "Poor Quality"
			A2.MetalWeaponCraft()
			A2.loc = B2
			A2.suffix = "(Carrying)"
			B2.Gender = "Female"
			B2.icon = 'LizardWoman.dmi'
			var/mob/Monsters/LizardMan/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			usr.UnitList += B3
			var/obj/Items/Food/Meats/UnCookedDeerMeat/f = new
			f.loc = B3
			f.suffix = "(Carrying)"
			B3.weight = 30
			var/obj/Items/Weapons/Spears/Spear/f2 = new
			f2.M = "Metal"
			f2.CraftRank = "Poor Quality"
			f2.MetalWeaponCraft()
			f2.loc = B3
			f2.suffix = "(Carrying)"
			B3.Gender = "Male"
			B3.Age = 20
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			B.Birth()
			B2.Birth()
			B3.Birth()
			B3.icon = 'LizardMan.dmi'
			usr.Done = 1
			usr.User = 1
			alert("Native to this land the lizardmen live a harsh life in a horrific enviroment, disturbed by the other races your lizardmen decide to hunt down and kill the inruders so that this land may be yours once more.")

		if (Result == "Goblins")
			usr.Race = "Goblins"
			var/mob/Monsters/GoblinEscort/Escort = new
			Escort.loc = locate(usr.x+1,usr.y+1,usr.z)
			Escort.Owner = usr
			Escort.HomeLoc = Escort.loc
			Escort.ReturnHome2()
			var/mob/Monsters/Wagon/W = new
			W.loc = usr.loc
			W.Owner = usr
			W.Gender = null

			var/obj/Items/Ingots/MetalIngot/Ingot1 = new
			Ingot1.loc = W
			W.weight += Ingot1.weight
			Ingot1.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot2 = new
			Ingot2.loc = W
			W.weight += Ingot2.weight
			Ingot2.suffix = "(Carrying)"
			var/obj/Items/Ingots/MetalIngot/Ingot3 = new
			Ingot3.loc = W
			W.weight += Ingot3.weight
			Ingot3.suffix = "(Carrying)"

			var/obj/Items/woods/wood/Log1 = new
			Log1.loc = W
			W.weight += Log1.weight
			Log1.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log2 = new
			Log2.loc = W
			W.weight += Log2.weight
			Log2.suffix = "(Carrying)"
			var/obj/Items/woods/wood/Log3 = new
			Log3.loc = W
			W.weight += Log3.weight
			Log3.suffix = "(Carrying)"

			var/obj/Items/Skins/DeerSkin/Skin1 = new
			Skin1.loc = W
			W.weight += Skin1.weight
			Skin1.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin2 = new
			Skin2.loc = W
			W.weight += Skin2.weight
			Skin2.suffix = "(Carrying)"
			var/obj/Items/Skins/DeerSkin/Skin3 = new
			Skin3.loc = W
			W.weight += Skin3.weight
			Skin3.suffix = "(Carrying)"

			var/obj/Items/Bones/Bones/BO1 = new
			BO1.loc = W
			W.weight += BO1.weight
			BO1.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO2 = new
			BO2.loc = W
			W.weight += BO2.weight
			BO2.suffix = "(Carrying)"
			var/obj/Items/Bones/Bones/BO3 = new
			BO3.loc = W
			W.weight += BO3.weight
			BO3.suffix = "(Carrying)"

			var/obj/Items/ores/stone/brick1 = new
			brick1.loc = W
			W.weight += brick1.weight
			brick1.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick2 = new
			brick2.loc = W
			W.weight += brick2.weight
			brick2.suffix = "(Carrying)"
			var/obj/Items/ores/stone/brick3 = new
			brick3.loc = W
			W.weight += brick3.weight
			brick3.suffix = "(Carrying)"

			var/mob/Monsters/Goblin/B = new
			B.loc = usr.loc
			B.Owner = usr
			B.Gender = "Male"
			W.destination = B
			var/obj/Items/Furniture/Beds/SleepingBag/SB = new
			SB.loc = B
			SB.suffix = "(Carrying)"
			var/obj/Items/Weapons/Picks/PickAxe/P = new
			P.M = "Metal"
			P.CraftRank = "Poor Quality"
			P.MetalWeaponCraft()
			P.loc = B
			P.suffix = "(Carrying)"
			var/T = input("What Name Will You Give Your [B.Gender] Creature?")as null|text
			if(!T)
				if(B.Owner)
					B.name = "{[B.Owner]}"
			else
				if(B.Owner)
					B.name = "{[B.Owner]} [T]"
			var/obj/Items/Food/Meats/UnCookedDeerMeat/M = new
			M.loc = B
			M.suffix = "(Carrying)"
			B.weight = 75
			B.Age = 20
			var/obj/Items/Weapons/Swords/GoblinSword/A = new
			A.M = "Metal"
			A.CraftRank = "Poor Quality"
			A.MetalWeaponCraft()
			A.loc = B
			A.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/A2 = new
			A2.M = "Wood"
			A2.CraftRank = "Poor Quality"
			A2.WoodArmourCraft()
			A2.loc = B
			A2.suffix = "(Carrying)"
			var/mob/Monsters/Goblin/B2 = new
			B2.loc = locate(usr.x+1,usr.y,usr.z)
			B2.Owner = usr
			B2.Gender = "Female"
			B2.Age = 20
			var/obj/Items/Furniture/Beds/SleepingBag/SB2 = new
			SB2.loc = B2
			SB2.suffix = "(Carrying)"
			var/obj/Items/Weapons/Picks/PickAxe/P2 = new
			P2.M = "Metal"
			P2.CraftRank = "Poor Quality"
			P2.MetalWeaponCraft()
			P2.loc = B2
			P2.suffix = "(Carrying)"
			var/T2 = input("What Name Will You Give Your [B2.Gender] Creature?")as null|text
			if(!T2)
				B2.name = "{[B2.Owner]}"
			else
				B2.name = "{[B.Owner]} [T2]"
			B2.icon_state = "Normal"
			var/obj/Items/Food/Meats/UnCookedDeerMeat/g = new
			g.loc = B2
			g.suffix = "(Carrying)"
			B2.weight = 70
			var/obj/Items/Weapons/Spears/Spear/h = new
			h.M = "Metal"
			h.CraftRank = "Poor Quality"
			h.MetalWeaponCraft()
			h.loc = B2
			h.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/f = new
			f.M = "Wood"
			f.CraftRank = "Poor Quality"
			f.WoodArmourCraft()
			f.loc = B2
			f.suffix = "(Carrying)"
			var/mob/Monsters/Goblin/B3 = new
			B3.loc = locate(usr.x+2,usr.y,usr.z)
			B3.Owner = usr
			B3.Gender = "Male"
			B3.Age = 20
			var/obj/Items/Weapons/Picks/PickAxe/P3 = new
			P3.M = "Metal"
			P3.CraftRank = "Poor Quality"
			P3.MetalWeaponCraft()
			P3.loc = B3
			P3.suffix = "(Carrying)"
			var/T3 = input("What Name Will You Give Your [B3.Gender] Creature?")as null|text
			if(!T3)
				B3.name = "{[B3.Owner]}"
			else
				B3.name = "{[B.Owner]} [T3]"
			var/obj/Items/Food/Meats/UnCookedDeerMeat/u = new
			u.loc = B3
			u.suffix = "(Carrying)"
			B3.weight = 75
			var/obj/Items/Furniture/Beds/SleepingBag/SB3 = new
			SB3.loc = B3
			SB3.suffix = "(Carrying)"
			var/obj/Items/Weapons/Swords/GoblinSword/j = new
			j.M = "Metal"
			j.CraftRank = "Poor Quality"
			j.MetalWeaponCraft()
			j.loc = B3
			j.suffix = "(Carrying)"
			var/obj/Items/Armours/Shields/WoodenBuckler/o = new
			o.M = "Wood"
			o.CraftRank = "Poor Quality"
			o.WoodArmourCraft()
			o.loc = B3
			o.suffix = "(Carrying)"
			B.icon = 'Goblins.dmi'
			B2.icon = 'FemaleGoblin.dmi'
			B3.icon = 'Goblins.dmi'
			B.icon_state = "Normal"
			B2.icon_state = "Normal"
			B3.icon_state = "Normal"
			B.Birth()
			B2.Birth()
			B3.Birth()
			usr.Done = 1
			usr.User = 1
			usr.UnitList += B
			usr.UnitList += B2
			usr.UnitList += B3
			alert("Lured to this land in the hopes of starting a dark dungeon you and your companions finally arive, it might be best to create a basic cave to get started with.")


obj/Hud/Left
	icon = 'HUD.dmi'
	icon_state = "Left"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,2 to 1,18"
		c.screen += src
obj/Hud/Right
	icon = 'HUD.dmi'
	icon_state = "Right"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,2 to 19,18"
		c.screen += src
obj/Hud/Top
	icon = 'HUD.dmi'
	icon_state = "Top"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,19 to 18,19"
		c.screen += src

obj/Hud/Day
	icon = 'HUD.dmi'
	icon_state = "Moon"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "10,19"
		c.screen += src
obj/Hud/Bottom
	icon = 'HUD.dmi'
	icon_state = "Bottom"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,1 to 18,1"
		c.screen += src
obj/Hud/BottomLeft
	icon = 'HUD.dmi'
	icon_state = "BottomRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,1"
		c.screen += src
obj/Hud/TopLeft
	icon = 'HUD.dmi'
	icon_state = "TopLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,19"
		c.screen += src
obj/Hud/TopRight
	icon = 'HUD.dmi'
	icon_state = "TopRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,19"
		c.screen += src
obj/Hud/BottomRight
	icon = 'HUD.dmi'
	icon_state = "BottomLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,1"
		c.screen += src
obj/Hud/Warp
	icon = 'HUD.dmi'
	icon_state = "Warp"
	layer = 10
	name = "Warp to a set of X,Y,Z cords. Hot Key - (G)"
	New(client/c)
		screen_loc = "1,3"
		c.screen += src
	DblClick()
		if(usr)
			if(usr.Done == 1)
				if(usr.User == 1)
					var/varX = input("X")as num
					var/varY = input("Y")as num
					var/varZ = input("Z")as num
					usr.loc = locate(varX,varY,varZ)
obj/Hud/Interact
	icon = 'HUD.dmi'
	icon_state = "Interact"
	layer = 10
	name = "Interact with an object or mob near by.Hot Key - (i)"
	New(client/c)
		screen_loc = "1,2"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			var/list/menu = new()
			menu += "Closest Creature"
			menu += "This Creature"

			menu += "Cancel"
			var/Result = input("Interact With What Object", "Choose", null) in menu
			if (Result != "Cancel")
				..()


			if (Result == "This Creature")
				var/list/menu2 = new()
				menu2 += "Rename"
				menu2 += "Run"
				menu2 += "Dig On/Off"
				if(M.Kobold == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Goblin == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Spider == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				if(M.Vampire == 1)
					for(var/turf/grounds/cavefloor/C in oview(1,M))
						for(var/turf/grounds/G in oview(1,M))
							if(C.density == 1)
								if(G.Content3 == "CanClimb")
									menu2 += "ClimbCliff"
					for(var/turf/grounds/Sky/S in oview(1,M))
						for(var/turf/grounds/MountainPeak/G in oview(1,M))
							menu2 += "ClimbDownCliff"
				for(var/obj/Items/Arrows/A in M)
					if(A.suffix == "(Stuck In)")
						menu2 += "Pull Out Arrow"
				if(M.AM == 1)
					if(M.density == 1)
						if(M.Vampire)
							menu2 += "Rest"
					if(M.Level >= 15)
						if(M.Vampire)
							menu2 += "Turn Into Mist"
					if(M.Level >= 10)
						if(M.Vampire)
							menu2 += "Morph"
					if(M.HasWings == 1)
						if(M.Vampire)
							menu2 += "Retract Wings"
						menu2 += "Fly"
					if(M.Spider == 1)
						menu2 += "Rest"
						if(M.Queen == 1)
							menu2 += "Lay Egg"
							menu2 += "Create Lair"

				menu2 += "Cancel"
				var/Result2 = input("Do What?", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "ClimbCliff")
					M.loc = locate(M.x,M.y,3)
				if (Result2 == "ClimbDownCliff")
					M.loc = locate(M.x,M.y,1)
				if (Result2 == "Run")
					if(M.Running == 0)
						view() << "[M] starts to run!"
						M.Running = 1
						M.Delay -= 1
						M.Tiredness -= 25
						M.Running()
				if(Result2 == "Pull Out Arrow")
					for(var/obj/Items/Arrows/A in M)
						if(A.suffix == "(Stuck In)")
							A.loc = M.loc
							M.weight -= A.weight
							A.suffix = null
							M.Owner << "[M] pulls out [A]"
							M.BloodContent -= rand(5,15)
							M.BloodLoss()
							break
							return
				if (Result2 == "Create Lair")
					if(M.CanBreed == 1)
						if(M.Spider == 0)
							return
						if(M.WebContent >= 200)
							M.WebContent -= 200
							M.LaysAdvancedEggs = 1
							for(var/turf/T in view(2,M))
								T.icon = 'Cave.dmi'
								T.icon_state = "SilkWall"
								T.Detailed = 1



				if (Result2 == "Lay Egg")
					if(M.CanLayEggs == 1)
						if(M.Spider == 0)
							return

						if(M.WebContent >= 50)
							var/list/menus = new()
							menus += "Warrior Spider"
							menus += "Worker Spider"
							menus += "Hunter Spider"
							menus += "Cancel"
							var/Results = input("Do What?", "Choose", null) in menus
							if (Results != "Cancel")
								..()
							if (Results == "Hunter Spider")
								if(M.LaysAdvancedEggs == 1)
									var/mob/Monsters/SpiderEgg/S = new
									S.loc = M.loc
									S.IsHunter = 1
									S.Owner = M.Owner
									M.WebContent -= 50
									var/mob/m = M.Owner
									m.UnitList += S
									return
							if (Results == "Worker Spider")
								if(M.LaysAdvancedEggs == 1)
									var/mob/Monsters/SpiderEgg/S = new
									S.loc = M.loc
									S.IsWorker = 1
									S.Owner = M.Owner
									M.WebContent -= 50
									var/mob/m = M.Owner
									m.UnitList += S
									return
							if (Results == "Warrior Spider")
								var/mob/Monsters/SpiderEgg/S = new
								S.loc = M.loc
								S.IsWarrior = 1
								S.Owner = M.Owner
								M.WebContent -= 50
								var/mob/m = M.Owner
								m.UnitList += S
								return
				if (Result2 == "Dig On/Off")

					if(M.Dig == 0)
						M.Dig = 1
						M.Dig()
						usr << "[M]'s Auto Dig is On!"
						return
					if(M.Dig == 1)
						M.Dig = 0
						M.destination = null
						M.DigTarget = null
						usr << "[M]'s Auto Dig is off!"
						for(var/obj/DigAt/DD in world)
							if(DD.Owner == M)
								del(DD)

				if (Result2 == "Morph")
					if(M.density == 1)
						if(M.IsMist == 0)
							if(M.Morphed == 0)
								var/list/menu5 = new()
								menu5 += "Human"
								menu5 += "Goblin"
								menu5 += "Kobold"
								menu5 += "Dwarf"
								menu5 += "LizardMan"
								menu5 += "Orc"
								menu5 += "Cancel"
								var/Result5 = input("Morph to what race?", "Choose", null) in menu5
								if (Result5 != "Cancel")
									..()
								if (Result5 == "Human")
									M.icon = 'Human.dmi'
									M.LimbLoss()
									M.Morphed = 1
									return
								if (Result5 == "Goblin")
									M.icon = 'Goblins.dmi'
									M.LimbLoss()
									M.Morphed = 1
									return
								if (Result5 == "Kobold")
									M.icon = 'Kobold.dmi'
									M.LimbLoss()
									M.Morphed = 1
									return
								if (Result5 == "LizardMan")
									M.icon = 'LizardMan.dmi'
									M.LimbLoss()
									M.Morphed = 1
									return
								if (Result5 == "Orc")
									M.icon = 'OrcMale.dmi'
									M.LimbLoss()
									M.Morphed = 1
									return
								if (Result5 == "Dwarf")
									M.icon = 'Human.dmi'
									M.LimbLoss()
									M.Morphed = 1
									M.overlays += 'Beards.dmi'
									return
							if(M.Morphed == 1)
								M.icon = 'Vampire.dmi'
								M.LimbLoss()
								M.Morphed = 0
								M.overlays -= 'Beards.dmi'
								return

				if (Result2 == "Turn Into Mist")
					if(M.density == 1)
						if(M.IsMist == 0)
							M.icon = 'Mist.dmi'
							M.density = 0
							M.Tiredness = M.Tiredness/2
							M.Owner << "[M] turns into mist, their tiredness is halved"
							M.IsMist = 1
							M.Old = M.weightmax
							M.weightmax = -10
							M.Morphed = 0
							M.CanBuild = 0
							for(var/obj/N in M)
								if(N.suffix == "(Equiped)")
									N.suffix = "(Mist Form)"
									M.overlays = null
									M.Defence -= N.Defence
							if(M.HasWings == 1)
								M.overlays = null
							return
					if(M.density == 0)
						if(M.IsMist == 1)
							for(var/turf/T in view(0,M))
								if(T.density)
									M.Owner << "Can not materialize in solid objects!"
									return
							M.icon = 'Vampire.dmi'
							M.density = 1
							M.WearingHelmet = 0
							M.WearingLegs = 0
							M.WearingChest = 0
							M.HoldingWeapon = 0
							M.WearingShield = 0
							M.WearingLeftArm = 0
							M.WearingRightArm = 0
							M.WearingFullPlateHelm = 0
							M.IsMist = 0
							M.weightmax = M.Old
							M.Owner << "[M] turns solid again."
							M.Old = null
							M.CanBuild = 1
							M.LimbLoss()
							for(var/obj/N in M)
								if(N.suffix == "(Mist Form)")
									N.suffix = "(Carrying)"
									M.overlays = null
							if(M.HasWings == 1)
								M.overlays += 'Wings.dmi'
								M.WingsOut = 1
							return
				if (Result2 == "Fly")
					if(M.HasLeftLeg == 1)
						if(M.HasRightLeg == 1)
							if(M.HasLeftArm == 1)
								if(M.HasRightArm == 1)
									if(M.density == 1)
										if(M.IsMist == 0)
											if(M.Vampire)
												M.icon = 'Fly.dmi'
												M.overlays -= 'Wings.dmi'
											if(M.Race == "Demon")
												M.icon = 'Fly2.dmi'
												M.overlays -= 'Wings2.dmi'
											if(M.Race == "Gargoyle")
												M.icon = 'Fly3.dmi'
												M.overlays -= 'Wings3.dmi'
											M.Tiredness = M.Tiredness/2
											M.density = 0
											M.Old2 = M.weightmax
											M.weightmax = -10
											M.Owner << "[M] starts to fly, their triedness is halved!"
											M.Morphed = 0
											return
									if(M.density == 0)
										if(M.IsMist == 0)
											if(M.Race == "Demon")
												M.icon = 'Demon.dmi'
												M.overlays += 'Wings2.dmi'
											if(M.Vampire)
												M.icon = 'Vampire.dmi'
												M.overlays += 'Wings.dmi'
											if(M.Race == "Gargoyle")
												M.icon = 'Gargoyle.dmi'
												M.overlays += 'Wings3.dmi'
											M.density = 1
											M.WingsOut = 1
											M.weightmax = M.Old2
											M.Old2 = null
											M.Owner << "[M] lands."
											M.LimbLoss()
											return
								else
									M.Owner << "[M] is in too much pain to fly!"
							else
								M.Owner << "[M] is in too much pain to fly!"
						else
							M.Owner << "[M] is in too much pain to fly!"
					else
						M.Owner << "[M] is in too much pain to fly!"
				if (Result2 == "Retract Wings")
					if(M.density == 1)
						if(M.WingsOut == 1)
							M.overlays -= 'Wings.dmi'
							M.overlays -= 'Wings2.dmi'
							M.overlays -= 'Wings3.dmi'
							M.WingsOut = 0
							return
						else
							if(M.Vampire)
								M.overlays += 'Wings.dmi'
							M.WingsOut = 1
							return
				if (Result2 == "Rest")
					if(M.IsMist == 0)
						M.density = 1
						M.AMBed()
				if (Result2 == "Rename")
					var/T = input("What Name Will You Give Your [M.Gender] Creature?")as null|text
					if(!T)
						if(M)
							M.name = "{[Safe_Guard(M.Owner)]"
					else
						if(M)
							M.name = "{[M.Owner]} [T]"
			if (Result == "Closest Creature")
				for(var/mob/Monsters/C in oview(1,M))
					if(M)
						if(C)
							var/list/menu2 = new()
							if(M.AM == 1)
								if(M.Vampire == 1)
									if(M.density)
										menu2 += "Feed From [C]"
							menu2 += "Rescue [C]"

							if(C.IsTrader == 1)
								menu2 += "Trade With [C]"
							if(M.Vampire == 0)
								if(M.Using == null)
									menu2 += "Breed With [C]"
							menu2 += "Cancel"
							var/Result2 = input("Interact With What Object", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()

							if (Result2 == "Trade With [C]")
								if(C.Goblin == 1)
									if(C.SellsPotion == 1)
										alert("[C] : Whats yous want?")
										var/choice = alert(usr, "What can I do for you?", "Choose", "Trade", "Nothing", null)
										if (choice == "Nothing")
											alert("[C] : See yous!")
											return
										if (choice == "Trade")
											for(var/obj/Items/Potions/HealPotion/P in view(C))
												if(P.BelongsToGoblin == 1)
													alert("[C] : Wants to trades hey? well me got a good deals for you! 200 gold shiny coins for a potion of heal, it give you limbs if they gone!")
													var/choice2 = alert(usr, "Is it a deal?", "Choose", "Yes", "No", null)
													if (choice2 == "No")
														alert("[C] :see you")
														return
													if (choice2 == "Yes")
														for(var/obj/Items/Coins/GoldCoin/GC in M)
															if(GC.CoinContent >= 200)
																var/obj/Items/Coins/GoldCoin/Coin = new
																Coin.loc = C.loc
																Coin.BelongsToGoblin = 1
																Coin.suffix = null
																Coin.CoinContent = 200
																Coin.name = "Gold Coins {[Coin.CoinContent]}"
																GC.CoinContent -= 200
																GC.name = "Gold Coins {[GC.CoinContent]}"
																if(GC.CoinContent <= 0)
																	del(GC)
																for(var/obj/Items/Potions/HealPotion/HP in view(C))
																	if(HP.BelongsToGoblin == 1)
																		HP.BelongsToGoblin = 0
																		HP.loc = M.loc
																		alert("[C] : Here you are, thanks for your buisness")
																	break
															break
															return
														return
								if(C.Human == 1)
									if(C.SellsPotion == 1)
										alert("[C] : Hello there")
										var/choice = alert(usr, "What can I do for you?", "Choose", "Trade", "Nothing", null)
										if (choice == "Nothing")
											alert("[C] : Be seeing you")
											return
										if (choice == "Trade")
											for(var/obj/Items/Potions/HealPotion/P in view(C))
												if(P.BelongsToHumans == 1)
													alert("[C] : Ah, you wish to trade, good good, I have many special potions, these potions will restore any lost limbs. For a price of say, 200 gold coins, I can supply you a potion.")
													var/choice2 = alert(usr, "Is it a deal?", "Choose", "Yes", "No", null)
													if (choice2 == "No")
														alert("[C] : Ok be seeing you")
														return
													if (choice2 == "Yes")
														for(var/obj/Items/Coins/GoldCoin/GC in M)
															if(GC.CoinContent >= 200)
																var/obj/Items/Coins/GoldCoin/Coin = new
																Coin.loc = C.loc
																Coin.BelongsToHumans = 1
																Coin.suffix = null
																Coin.CoinContent = 200
																Coin.name = "Gold Coins {[Coin.CoinContent]}"
																GC.CoinContent -= 200
																GC.name = "Gold Coins {[GC.CoinContent]}"
																if(GC.CoinContent <= 0)
																	del(GC)
																for(var/obj/Items/Potions/HealPotion/HP in view(C))
																	if(HP.BelongsToHumans == 1)
																		HP.BelongsToHumans = 0
																		HP.loc = M.loc
																		alert("[C] : Here you are, thanks for your buisness")
																	break
															break
															return
														return
							if (Result2 == "Pick Up [C]")
								if(C.Owner == M.Owner)
									if(M.weight <= M.weightmax)
										C.suffix = "(Carrying)"
										C.destination = null
										C.loc = M
										M.weight += C.weight
										C.BloodContent = 100
										C.BleedType = null
									else
										usr << "[src] : Cant carry too much!"
							if (Result2 == "Feed From [C]")
								var/Bite = null
								if(M.Strength >= C.Strength)
									Bite = prob(85)
								else
									Bite = prob(35)
								var/Infect = prob(15)
								if(Bite == null)
									Bite = 0
								if(M in view(1,C))
									if(Bite)
										if(M.density == 1)
											if(M.CoolDown == 0)
												if(M.HasTeeth == 1)
													if(C.WearingFullPlateHelm == 0)
														if(C.Vampire == 0)
															if(C.Wagon == 0)
																if(C.IsTree == 0)
																	if(M.IsMist == 0)
																		if(Infect == 1)
																			view() << "<b><font color=red>[C] is infected by a vampire!"
																			view() << "<b><font color=red>[M] feeds on [C]!"
																			C.BloodContent -= 15
																			C.BloodLoss()
																			M.Hunger = 100
																			M.EXP += 25
																			C.InfectedBy = M
																			C.FutureOwner = M.Owner
																			C.TurnVamp()
																			C.Death()
																			M.CoolDown = 1
																			spawn(300)
																				if(M)
																					M.CoolDown = 0
																			return
																		else
																			view() << "<b><font color=red>[M] feeds on [C]!"
																			C.BloodContent -= 15
																			C.BloodLoss()
																			M.Hunger = 100
																			M.EXP += 25
																			C.Death()
																			M.CoolDown = 1
																			spawn(300)
																				if(M)
																					M.CoolDown = 0
																			return

													else
														view() << "<b><font color=red>[M] teeth shatter!!!"
														M.TeethHP = 0
														M.Teeth = "Destroyed"
														M.BloodContent -= 10
														M.BloodLoss()
														for(var/obj/Items/Armours/NeckGuards/G in C)
															if(G.suffix == "(Equiped)")
																C.weight -= G.weight
																C << "[G] shatters!"
																C.WearingFullPlateHelm = 0
																del(G)
									else
										view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
										return



							if (Result2 == "Breed With [C]")
								if(M.Vampire == 1)
									return
								if(C.Gender == M.Gender)
									return
								else
									if(C.Gender == "Male")
										return
									if(M.Gender == "Male")
										if(C.IsTree == 0)
											if(C.Vampire == 0)
												if(M.Vampire == 0)
													if(C.Spider == 0)
														if(C.Wolf == 0)
															if(M.Wolf == 0)
																if(C.Owner == M.Owner)
																	if(C.Gender == "Female")
																		if(C.Age <= 100)
																			if(C.Age >= 5)
																				if(M.Age <= 100)
																					if(M.Age >= 5)
																						if(M.Spider == 0)
																							if(M in view(1,C))
																								if(C.Preg == 0)
																									view() << "[C] is due to have a baby!"
																									C.Preg = 1
																									C.overlays += /obj/preg/
																									C.TheDad = M
																									if(C.LizardMan)
																										var/mob/Monsters/LizardEgg/G = new
																										G.loc = C.loc
																										G.Owner = C.Owner
																										G.Mum = C
																										C.TheDad = M
																										C.overlays -= /obj/preg/
																									return
																			else
																				usr << "[C] is far too young!"
																		else
																			usr << "[C] is far too old!"
																else
																	var/choice = alert(C.Owner, "[usr] is asking to breed [M] with [C]", "Choose", "Yes", "No", null)
																	if (choice == "Yes")
																		if(M in view(1,C))
																			if(C.Gender == "Female")
																				if(C.Preg == 0)
																					if(C.Age >= 5)
																						if(M.Age <= 100)
																							if(M.Age >= 5)
																								if(M.Spider == 0)
																									if(C.Preg == 0)
																										view() << "[C] is due to have a baby!"
																										C.Preg = 1
																										C.overlays += /obj/preg/
																										C.TheDad = M
																										return
																	if (choice == "No")
																		return
													else
														if(C.Queen == 1)
															if(C.IsMatureQueen == 1)
																if(C.CanBreed == 0)
																	if(C.Level >= 5)
																		C.Ready()
																	else
																		usr << "Need Level 5!"

							if (Result2 == "Rescue [C]")
								if(M in view(1,C))
									if(C.InHole == 1)
										view() << "<b><font color=red>[M] Rescues [C] from a trap"
										C.InHole = 0
										C.SneakingSkill +=1
										C.HasPersonIn = 0
										for(var/obj/Items/Traps/PitTrap/P in view(0,C))
											del(P)


obj/Hud/Build
	icon = 'HUD.dmi'
	icon_state = "Build"
	layer = 10
	name = "Displays the build menu.Hot Key - (B)"
	New(client/c)
		screen_loc = "1,6"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(M.CanBuild  == 0)
				return
		if(usr.CanBuild == 1)
			if(usr.Up == 0)
				usr.Up = 1
				usr.Building()
				return
			else
				usr.Up = 0
				for(var/obj/HUD/H in usr.client.screen)
					del(H)
obj/Hud/Area
	icon = 'HUD.dmi'
	icon_state = "Area"
	layer = 10
	name = "Selects all of your units in the area.Hot Key - (A)"
	New(client/c)
		screen_loc = "1,7"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in orange(usr))
				if(c.Escort == 0)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(usr.Selected.Find(c))
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

obj/Hud/Pointer
	icon = 'HUD.dmi'
	icon_state = "Pointer"
	layer = 10
	name = "Materialize your self into the physical plain. Hot Key - (None)"
	New(client/c)
		screen_loc = "1,16"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			if(usr.Using)
				return
			if(usr.icon == 'Player.dmi')
				usr.icon = null
				return
			else
				usr.icon = 'Player.dmi'
				return

obj/Hud/All
	icon = 'HUD.dmi'
	icon_state = "All"
	layer = 10
	name = "Selects all your units in the world. Hot Key - (E)"
	New(client/c)
		screen_loc = "1,8"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			for(var/mob/Monsters/c in world)
				if(c.Escort == 0)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(usr.Selected.Find(c))
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star
obj/Hud/Cords
	icon = 'HUD.dmi'
	icon_state = "Cords"
	layer = 10
	name = "Displays your current X,Y,Z cords.Hot Key - (C)"
	New(client/c)
		screen_loc = "1,4"
		c.screen += src
	DblClick()
		usr << "[usr.x],[usr.y],[usr.z]<br>"
obj/Hud/MSG
	icon = 'HUD.dmi'
	icon_state = "MSG"
	layer = 10
	name = "Send a msg to a single player.Hot Key - (W)"
	New(client/c)
		screen_loc = "1,11"
		c.screen += src
	DblClick()
		var/T = input("Whisper to who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					var/reason
					reason = input("Send Message To?","Message",reason)
					S << "[usr] : [Safe_Guard(reason)]"
					usr << "[usr] : [Safe_Guard(reason)]"
obj/Hud/Say
	icon = 'HUD.dmi'
	icon_state = "Say"
	layer = 10
	name = "Send a msg to the world.Hot Key - (S)"
	New(client/c)
		screen_loc = "1,10"
		c.screen += src
	DblClick()
		var/T = input("Shout")as null|text
		if(!T)
			return
		if(usr.CanSpeak == 0)
			usr << "Must Wait before speaking again!"
			return
		if(usr.Muted == 1)
			usr << "You are Muted"
			return
		else
			for(var/mob/M in world)
				if(usr.WC == 0)
					M << "<font color = green>[usr] says :[Safe_Guard(T)]<br>"
			usr.CanSpeak = 0
			usr.Speak()
			Log_chat("<font color = green>[usr] says :[T]<br>")

			return
obj/Hud/Way
	icon = 'HUD.dmi'
	icon_state = "Way"
	layer = 10
	name = "Create or goto waypoint. Hot Key - (Q)"
	New(client/c)
		screen_loc = "1,9"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			var/list/menu = new()
			menu += "Goto WayPoint"
			menu += "Set WayPoint"
			menu += "Cancel"
			var/Result = input("What Action Will You Choose?", "Choose", null) in menu
			if (Result != "Cancel")
				..()
			if (Result == "Goto WayPoint")
				usr.loc = usr.Waypoint
			if (Result == "Set WayPoint")
				usr.Waypoint = usr.loc
				usr << "Way Point Set!"
obj/Hud/Who
	icon = 'HUD.dmi'
	icon_state = "Who"
	layer = 10
	name = "Displays who is currently online. Hot Key - (H)"
	New(client/c)
		screen_loc = "1,5"
		c.screen += src
	DblClick()
		var/PlayerCount
		usr << "<font color = red size = 4>((-Players Online-))"
		for (var/mob/M in world)
			if (M.client)
				PlayerCount ++
				usr << "--<font color = purple>[M]"
		usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"
obj/Hud/Restart
	icon = 'HUD.dmi'
	icon_state = "Restart"
	layer = 10
	name = "Restart and begin again somewhere else.Hot Key - (R)"
	New(client/c)
		screen_loc = "1,12"
		c.screen += src
	DblClick()
		usr.Restarts()
obj/Hud/Updates
	icon = 'HUD.dmi'
	icon_state = "Updates"
	layer = 10
	name = "Shows current updates.Hot Key - (T)"
	New(client/c)
		screen_loc = "1,14"
		c.screen += src
	DblClick()
		usr.Updates()
obj/Hud/Find
	icon = 'HUD.dmi'
	icon_state = "Find"
	layer = 10
	name = "Locate a lost unit..Hot Key - (N)"
	New(client/c)
		screen_loc = "1,15"
		c.screen += src
	DblClick()
		if(usr.User == 1)
			var/T = input("Find Who?")as null|text
			if(!T)
				..()
			else
				for(var/mob/S in world)
					if(T == S.name)
						if(S.Owner == usr)
							usr.loc = S.loc
							return
obj/Hud/Stop
	icon = 'HUD.dmi'
	icon_state = "Stop"
	layer = 10
	name = "Stops all your units and removes all targets.Hot Key - (P)"
	New(client/c)
		screen_loc = "1,13"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			M.destination = null
			M.Target = null
client
	macro_mode=1
	Southeast()
		if(mob.User == 0)
			return
		else
			..()
	Southwest()
		if(mob.User == 0)
			return
		else
			..()
	Northeast()
		if(mob.User == 0)
			return
		else
			..()
	Northwest()
		if(mob.User == 0)
			return
		else
			..()
	North()
		if(mob.User == 0)
			return
		else
			..()
	South()
		if(mob.User == 0)
			return
		else
			..()
	East()
		if(mob.User == 0)
			return
		else
			..()
	West()
		if(mob.User == 0)
			return
		else
			..()
	New()
		new/obj/Hud/Left(src)
		new/obj/Hud/Right(src)
		new/obj/Hud/Top(src)
		new/obj/Hud/Bottom(src)
		new/obj/Hud/BottomLeft(src)
		new/obj/Hud/TopLeft(src)
		new/obj/Hud/TopRight(src)
		new/obj/Hud/BottomRight(src)
		new/obj/Hud/Interact(src)
		new/obj/Hud/Warp(src)
		new/obj/Hud/Cords(src)
		new/obj/Hud/Who(src)
		new/obj/Hud/Build(src)
		new/obj/Hud/Area(src)
		new/obj/Hud/All(src)
		new/obj/Hud/Way(src)
		new/obj/Hud/Day(src)
		new/obj/Hud/Say(src)
		new/obj/Hud/Stop(src)
		new/obj/Hud/MSG(src)
		new/obj/Hud/Restart(src)
		new/obj/Hud/Updates(src)
		new/obj/Hud/Find(src)
		new/obj/Hud/Pointer(src)
		..()


	Click(atom/m)

		if(usr.Function == "PatrolPoint1")
			for(var/mob/Monsters/M in usr.Selected)
				M.PatrolPoint1 = m
				M.Owner << "Starting point selected, click a seperate tile to finish creating a patrol route.<br>"
				usr.Function = "PatrolPoint2"
				return
		if(usr.Function == "PatrolPoint2")
			for(var/mob/Monsters/M in usr.Selected)
				M.PatrolPoint2 = m
				M.Owner << "Patrol route created.<br>"
				usr.Function = null
				return
		if(ismob(m))
			var/mob/mb = m
			if(mb.client)
				return
		for(var/mob/Monsters/M in usr.Selected)
			if(M.CanSee == 0)
				M.Owner << "[M] cant see!!"
				return
			if(m.NPC == 1)
				if(M in view(1,m))
					return
			if(m.BelongsToHumans == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Human == 1)
							if(G.Owner == "{NPC Humans}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromHumans = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
			if(m.BelongsToSkorn == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Human == 1)
							if(G.Owner == "{NPC Skorn}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromSkorn = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
			if(m.BelongsToKobold == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Kobold == 1)
							if(G.Owner == "{NPC Kobold}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromKobolds = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
			if(m.BelongsToDwarf == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Dwarf == 1)
							if(G.Owner == "{NPC Dwarf}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromDwarfs = 1
									view() << "<b><font color=red>[G] : Theif!!!!"
			if(m.BelongsToGoblin == 1)
				if(m in view(1,M))
					for(var/mob/Monsters/G in view(G))
						if(G.Goblin == 1)
							if(G.Owner == "{NPC Goblin}")
								var/Steal
								Steal = prob(M.SneakingSkill)
								if(Steal == 0)
									G.destination = M
									M.StoleFromGoblins = 1
									view() << "<b><font color=red>[G] : Theif!!!!"

			if(M.Wagon == 1)
				if(M.Wolf == 1)
					if(m.suffix == "(Carrying)")
						return
					if(m.suffix == "(Equiped)")
						return
					else
						M.destination = m


			if(M.Wagon == 0)
				if(M.Wagon == 0)
					M.destination = m



				if(isobj(m))
					M.destination = null
				if(m.Owner == M.Owner)
					M.destination = null
				if(M.Crippled == 1)
					if(M.Told == 0)
						M.Told = 1
						usr << "[M] has a crippled arm!"
					return

				if(M.HoldingWeapon == "Bow")
					if(M.Target == null)
						if(isobj(m))
							if(m.TP == 1)
								if(m == M)
									continue
								else
									M.Target = m
									M.destination = null
									usr << "[M] targets [m] - press P to stop targetting."
									if(M.BowOn == 0)
										M.BowOn = 1
										M.BowTarget()
						if(ismob(m))
							if(m.Wagon == 0)
								if(m.Dead == 0)
									if(m.WS == 0)
										if(m == M)
											continue
										if(m.Owner == M.Owner)
											continue
										else
											M.Target = m
											M.destination = null
											usr << "[M] targets [m] - press P to stop targetting."
											if(M.BowOn == 0)
												M.BowOn = 1
												M.BowTarget()
				if(m.Gems == 1)
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A2 = m
							A2.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Silver Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "PickUp")
								if(m.suffix == null)
									if(usr.Selected.Find(m))
										usr.Selected.Remove(m)
										usr.client.images -= m.Star
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
									A1.Owner = M.Owner
							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Gold Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
							if (Result == "PickUp")
								if(m.suffix == null)
									if(usr.Selected.Find(m))
										usr.Selected.Remove(m)
										usr.client.images -= m.Star
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
									A1.Owner = M.Owner
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Metal Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
							if (Result == "PickUp")
								if(m.suffix == null)
									if(usr.Selected.Find(m))
										usr.Selected.Remove(m)
										usr.client.images -= m.Star
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
									A1.Owner = M.Owner
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Wooden Chest")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drop"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Take Contents"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc

							if (Result == "Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
							if (Result == "PickUp")
								if(m.suffix == null)
									if(usr.Selected.Find(m))
										usr.Selected.Remove(m)
										usr.client.images -= m.Star
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
									A1.Owner = M.Owner
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight

									return
				if(m.icon_state == "Drill")
					if(M.Wagon == 0)
						M.destination = null
					if(m in view(1,M))
						if(M.Wagon == 0)

							var/list/menu = new()
							menu += "Drill"
							menu += "Drop Drill"
							menu += "PickUp"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc


							if (Result == "PickUp")
								if(M.Tame == 1)
									return
								if(m.suffix == null)
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
							if (Result == "Drop Drill")
								if(m.suffix == "(Carrying)")
									var/mob/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Drill")
								if(m)
									if(m.suffix == null)
										if(m in view(1,M))
											for(var/turf/grounds/GB in view(0,m))
												var/Break = prob(10)
												if(Break == 1)
													del(m)
													return
												var/E
												var/D
												var/EM
												var/R
												var/S
												E = prob(35)
												D = prob(1)
												EM = prob(0.5)
												R = prob(0.5)
												S = prob(70)
												var/G
												G = prob(5)
												var/SIL
												SIL = prob(5)
												if(SIL == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/silver/SS = new
																SS.loc = WA
																WA.weight += SS.weight
																SS.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/silver/SS = new
													SS.loc = M.loc
												if(G == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/GoldNugget/GN = new
																GN.loc = WA
																WA.weight += GN.weight
																GN.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/GoldNugget/GN = new
													GN.loc = M.loc

												if(E == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/metal/MET = new
																MET.loc = WA
																WA.weight += MET.weight
																MET.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/metal/MET = new
													MET.loc = M.loc
												if(S == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/ores/stone/ST = new
																ST.loc = WA
																WA.weight += ST.weight
																ST.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/ores/stone/ST = new
													ST.loc = M.loc
												if(D == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutDiamond/DI = new
																DI.loc = WA
																WA.weight += DI.weight
																DI.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutDiamond/DI = new
													DI.loc = M.loc
												if(EM == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutEmerald/UD = new
																UD.loc = WA
																WA.weight += UD.weight
																UD.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutEmerald/UD = new
													UD.loc = M.loc
												if(R == 1)
													for(var/mob/Monsters/Wagon/WA in view(1,m))
														if(WA.Owner == M.Owner)
															if(WA.weight <= WA.weightmax)
																var/obj/Items/gems/UnCutRuby/RE = new
																RE.loc = WA
																WA.weight += RE.weight
																RE.suffix = "(Carrying)"
																GB.opacity = 0
																GB.density = 0
																GB.CanDigAt = 0
																GB.icon_state = "CaveFloor"
																return
													var/obj/Items/gems/UnCutRuby/RE = new
													RE.loc = M.loc

				if(m)
					if(m.icon_state == "Wagon")
						if(M.Wagon == 0)
							M.destination = null
						if(m in view(1,M))
							if(M.Wagon == 0)

								var/list/menu = new()
								menu += "Drop Contents"
								menu += "Pull"
								menu += "Stop Pulling"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc

								if (Result == "Pull")
									if(m.suffix == null)
										var/mob/A1 = m
										A1.destination = M
										A1.Owner = M.Owner
								if (Result == "Stop Pulling")
									if(m.suffix == null)
										var/mob/A1 = m
										A1.destination = null


								if (Result == "Drop Contents")
									for(var/obj/A1 in m)
										A1.loc = M.loc
										A1.suffix = null
										m.weight -= A1.weight
									for(var/mob/A2 in m)
										A2.loc = M.loc
										A2.suffix = null
										m.weight -= A2.weight


				if(m)
					if(m.Tame == 1)
						M.destination = null
						if(m in view(1,M))
							if(M.Wagon == 0)
								if(m.Owner == M.Owner)
									var/list/menu = new()
									menu += "[m.Gender]"
									menu += "Tell Pet To Stop"
									menu += "Tell Pet To Follow"
									menu += "Tell Pet To Breed"
									menu += "Kill"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									var/mob/G = m
									if (Result == "Tell Pet To Breed")
										if(G)
											if(G.Wolf == 1)
												for(var/mob/Monsters/Wolf/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											if(G.Deer == 1)
												for(var/mob/Monsters/Deer/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											if(G.Mole == 1)
												for(var/mob/Monsters/Mole/D in view(1,G))
													if(D.Gender == G.Gender)
														..()
													if(D.Gender == "Female")
														if(G.Gender == "Male")
															if(D.Preg == 0)
																view() << "[D] is due to have a baby!"
																D.Preg = 1
																D.overlays += /obj/preg/
																return
											for(var/mob/Monsters/CaveSpider/D in view(1,G))
												if(D.Gender == G.Gender)
													..()
												if(D.Gender == "Female")
													if(G.Gender == "Male")
														if(D.Preg == 0)
															view() << "[D] is due to have a baby!"
															D.Preg = 1
															D.overlays += /obj/preg/
															return
											for(var/mob/Monsters/DeathBeatle/D in view(1,G))
												if(D.Gender == G.Gender)
													..()
												if(D.Gender == "Female")
													if(G.Gender == "Male")
														if(D.Preg == 0)
															view() << "[D] is due to have a baby!"
															D.Preg = 1
															D.overlays += /obj/preg/
															return
									if (Result == "Kill")
										G.HP = 0
										G.GoingToDie = 1
										G.Death()
										return
									if (Result == "Tell Pet To Stop")
										G.destination = null
									if (Result == "Tell Pet To Follow")
										if(M in usr.Selected)
											G.destination = M
											G.PetFollow()
									if (Result == "Inspect")
										usr << m.desc
									if (Result == "Drop")
										if(m.suffix == "(Carrying)")
											var/obj/A1 = m
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

				if(m)
					if(m.icon_state == "Empty")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A3 = m
								A3.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				if(m.icon_state == "Nugget")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A3 = m
							A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return


				if(m.icon_state == "GoldDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									if(m in M)
										M.weight -= m.weight
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "MetalDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "BoneDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.Owner = M.Owner
									A3.Death()
									return
				if(m.icon_state == "WoodenDoor")
					M.destination = null

					if(m in M)
						if(m.Owner == null)
							m.Owner = M.Owner
						if(m.Owner == M.Owner)
							var/obj/A3 = m
							if(m.Placed == 0)
								if(M.Wagon == 0)


									A3.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Place"
							menu += "Destroy"
							if(A3.Placed == 1)
								menu += "Lock"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Lock")
								A3.Locked = 1
								view() << "[M] locks [A3]"
							if (Result == "Destroy")
								if(m.Owner == M.Owner)
									del(m)
									return
							if (Result == "Place")
								if(A3.Placed == 0)
									A3.loc = M.loc
									A3.dir = M.dir
									A3.density = 1
									M.weight -= A3.weight
									A3.Placed = 1
									A3.opacity = 1
									A3.Door = 1
									A3.Locked = 0
									A3.Owner = M.Owner
									A3.Death()
									return

				if(m.icon_state == "Cage")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A4 = m
							A4.loc = M
							var/list/menu = new()
							if(M.density == 1)
								menu += "Drop"
								menu += "Inspect"
								for(var/mob/Monsters/Q in m)
									if(Q.Cantame == 1)
										menu += "Tame"
									if(Q.CanBeSlaved == 1)
										menu += "Enslave"
									if(Q.CanBeCaged == 1)
										menu += "Un-Enslave"
									menu += "Contents"
									menu += "TakeItems"
									menu += "Release"
								menu += "Capture"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Contents")
								for(var/mob/Monsters/A in m)
									usr << "[A] - [A.Gender]"
							if (Result == "TakeItems")
								for(var/mob/Monsters/A in m)
									for(var/obj/O in A)
										O.loc = M.loc
										A.weight -= O.weight
										A.WearingShield = 0
										A.WearingChest = 0
										A.WearingHelmet = 0
										A.HoldingWeapon = 0
										A.WearingLeftArm = 0
										A.WearingRightArm = 0
										A.WearingBack = 0
										A.WearingFullPlateHelm = 0
										if(O.suffix == "(Equiped)")
											if(O.Defence)
												A.Defence -= O.Defence
										A.WearingLegs = 0
										O.suffix = null
										A.overlays = null
										if(A.LizardMan)
											A.overlays += 'LizardTail.dmi'
										if(A.Race == "Demon")
											A.overlays += 'Wings2.dmi'
										if(A.Race == "Gargoyle")
											A.overlays += 'Wings3.dmi'
										if(A.Vampire)
											if(A.WingsOut)
												A.overlays += 'Wings.dmi'
										if(A.Gender == "Male")
											if(A.G == 1)
												A.overlays += 'Beards.dmi'
											if(A.B == 1)
												A.overlays += 'BlackBeard.dmi'
											if(A.BB == 1)
												A.overlays += 'BrownBeard.dmi'
							if (Result == "Un-Enslave")
								for(var/mob/Monsters/A in m)
									var/mob/F = A.Owner
									F.UnitList -= A
									A.Owner = null
									A.CanBeSlaved = 1
									view() << "[A] has been un-enslaved!"
									A.name = "Ex-Slave"
									A.loc = M.loc
									A.Content3 = null
									m.underlays = null
									m.overlays = null
									m.HasPersonIn = 0
									A.InHole = 0
							if (Result == "Enslave")
								for(var/mob/Monsters/A in m)
									var/mob/O = M.Owner
									O.UnitList += A
									A.Owner = M.Owner
									A.CanBeSlaved = 0
									A.Content3 = "Tamed"
									view() << "[A] has been enslaved!"
									A.name = "{[M.Owner]}"
									A.loc = M.loc
									m.underlays = null
									m.overlays = null
									m.HasPersonIn = 0
									A.InHole = 0
									A.CanBeCaged = 1
									A.OnGuard = 0
									A.PatrolPoint1 = null
									A.PatrolPoint2 = null
									A.HomeLoc = null
									A.Target = null
									A.Level()
									A.Hunger()
									A.Heal()
									A.Dig()
									A.Tiredness()
									A.Bed()
							if (Result == "Capture")

								for(var/mob/Monsters/C in oview(1,M))


									if(m.HasPersonIn == 0)
										if(M.CanBeCaged == 0)
											if(C.Wagon == 0)
												if(C.Content == "CantBeCaged")
													usr << "That creature cant be caged!"
													return
												if(C.CanBeCaged == 1)
													if(C.Owner == M.Owner)
														C.destination = null
														M.destination = null
														C.loc = m
														view() << "<b><font color=red>[C] is loaded into [m]"
														m.underlays += C
														m.HasPersonIn = 1
														C.OldOwner = C.Owner
														C.OnGuard = 0
														C.HomeLoc = null
														C.Target = null
														C.PatrolPoint1 = null
														C.PatrolPoint2 = null
														C.Owner = null
														C.InHole = 1
														if(ismob(C.Owner))
															var/mob/S = C.Owner
															if(S.Selected.Find(C))
																S.Selected.Remove(C)
																S.client.images -= C.Star
														return
												if(C.Beatle == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.OldOwner = C.Owner
													C.Owner = null
													C.OnGuard = 0
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.HomeLoc = null
													C.Target = null
													C.InHole = 1
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.Bug == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.OldOwner = C.Owner
													C.Owner = null
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.OnGuard = 0
													C.HomeLoc = null
													C.Target = null
													C.InHole = 1
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.Mole == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.OldOwner = C.Owner
													C.Owner = null
													C.OnGuard = 0
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.HomeLoc = null
													C.Target = null
													C.InHole = 1
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.Deer == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.OnGuard = 0
													C.HomeLoc = null
													C.Target = null
													C.OldOwner = C.Owner
													C.Owner = null
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.InHole = 1
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.Wolf == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.OldOwner = C.Owner
													C.Owner = null
													C.InHole = 1
													C.OnGuard = 0
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.HomeLoc = null
													C.Target = null
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.Fainted == 1)
													C.destination = null
													M.destination = null
													C.loc = m
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													m.HasPersonIn = 1
													C.InHole = 1
													C.OnGuard = 0
													C.HomeLoc = null
													C.Target = null
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.BleedType = null
													C.BloodContent = C.MaxBloodContent
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return
												if(C.InHole == 1)
													for(var/obj/Items/Traps/PitTrap/P in oview(1,M))
														if(C.loc == P.loc)
															if(P.HasPersonIn == 1)
																del(P)
													C.destination = null
													M.destination = null
													C.loc = m
													m.HasPersonIn = 1
													C.OnGuard = 0
													C.HomeLoc = null
													C.PatrolPoint1 = null
													C.PatrolPoint2 = null
													C.Target = null
													view() << "<b><font color=red>[C] is loaded into [m]"
													m.underlays += C
													C.BleedType = null
													C.BloodContent = C.MaxBloodContent
													if(ismob(C.Owner))
														var/mob/S = C.Owner
														if(S.Selected.Find(C))
															S.Selected.Remove(C)
															S.client.images -= C.Star
													return


							if (Result == "Tame")
								for(var/mob/Monsters/C in m)
									C.loc = M.loc
									view() << "<b><font color=red>[C] is tamed by [M]"
									m.underlays = null
									m.overlays = null
									m.HasPersonIn = 0
									C.name = "{[M.Owner]} [C]"
									C.Tame = 1
									C.destination = M
									C.InHole = 0
									C.WalkTo()
									C.CanBuild = 0
									C.Owner = C.OldOwner
									C.OldOwner = null
									if(C.Wolf == 1)
										C.Owner = M.Owner
									if(C.Mole == 1)
										C.Owner = M.Owner
									if(C.Deer == 1)
										C.Owner = M.Owner
									if(C.Bug == 1)
										C.Owner = M.Owner
									if(C.Beatle == 1)
										C.Owner = M.Owner
									var/mob/F = M.Owner
									F.UnitList += C
							if (Result == "Release")
								for(var/mob/Monsters/C in m)
									C.loc = M.loc
									view() << "<b><font color=red>[C] is released from [m] by [M]"
									m.underlays = null
									m.overlays = null
									m.HasPersonIn = 0
									if(C.OldOwner)
										C.Owner = C.OldOwner
										C.OldOwner = null
									C.InHole = 0

				if(m.IsPotion == 1)
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drink")
								if(m.suffix == "(Carrying)")
									if(M.Spider == 0)
										if(M.HasStomach == 1)
											if(m.name == "Vampirism Cure")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/Work = prob(60)
												if(Work == 1)
													if(M.InfectedBy)
														view() << "[M] is no longer sick!"
														M.InfectedBy = null
												else
													view() << "[src] had no effect!"
												return
											if(m.name == "Potion of LongLife")
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												var/A
												A = rand(5,15)
												M.DieAge += A
												usr << "[M]'s life is extended for another [A] years!"
												if(M.Pale == 0)
													M.icon += rgb(25,25,25)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(M.Pale == 1)
													M.icon += rgb(50,50,50)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(M.Pale == 2)
													M.icon += rgb(75,75,75)
													view() << "[M]'s soul darkens!"
													M.Pale += 1
													return

											if(m.name == "Potion of Internal Restoration")
												usr << "[M] drinks [m]"
												M.HasHeart = 1
												M.HasRightLung = 1
												M.HasLeftLung = 1
												M.HasLeftKidney = 1
												M.HasRightKidney = 1
												M.HasLiver = 1
												M.HasSpleen = 1
												m.icon_state = "Empty"
												m.IsEmpty = 1
												M.Heart = "Good"
												M.LeftLung = "Good"
												M.RightLung = "Good"
												M.LeftKidney = "Good"
												M.RightKidney = "Good"
												M.Spleen = "Good"
												M.Liver = "Good"
												M.HeartHP = 100
												M.LeftLungHP = 100
												M.RightLungHP = 100
												M.SpleenHP = 100
												M.LeftKidneyHP = 100
												M.RightKidneyHP = 100
												M.SpleenHP = 100
												M.Crippled = 0
												m.name = "Empty Bottle"
												M.LimbLoss()
											if(m.name == "Potion of Restoration")
												usr << "[M] drinks [m]"
												M.HasLeftLeg = 1
												M.HasRightLeg = 1
												M.HasLeftArm = 1
												M.HasRightArm = 1
												M.HasTeeth = 1
												M.Teeth = "Good"
												M.TeethHP = M.TeethHPMax
												m.icon_state = "Empty"
												m.IsEmpty = 1
												M.LeftArm = "Good"
												M.RightArm = "Good"
												M.LeftLeg = "Good"
												M.RightLeg = "Good"
												M.RightLegHP = M.RightLegMaxHP
												M.LeftLegHP = M.LeftLegMaxHP
												M.LeftArmHP = M.LeftArmMaxHP
												M.RightArmHP = M.RightArmMaxHP
												M.Crippled = 0
												M.CanUseRightArm = 1
												M.CanUseLeftArm = 1
												M.CanWalk = 1
												m.name = "Empty Bottle"
												M.LimbLoss()
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Coin")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Split"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Split")
								if(m.suffix == "(Carrying)")
									if(m)
										if(M.weight <= M.weightmax)
											if(m.Gold == 1)
												if(m.suffix == "(Carrying)")
													var/N = input("Ammount")as null|num
													if(!N)
														return
													if(N >= m.CoinContent)
														return
													if(N <= 0)
														return
													var/obj/Items/Coins/GoldCoin/B = new
													B.CoinContent = N
													m.CoinContent -= N
													B.loc = M
													M.weight += B.weight
													B.suffix = "(Carrying)"
													B.name = "Gold Coins {[B.CoinContent]}"
													m.name = "Gold Coins {[m.CoinContent]}"
													return
											if(m.Silver == 1)
												if(m.suffix == "(Carrying)")
													var/N = input("Ammount")as null|num
													if(!N)
														return
													if(N >= m.CoinContent)
														return
													if(N <= 0)
														return
													var/obj/Items/Coins/SilverCoin/B = new
													B.CoinContent = N
													m.CoinContent -= N
													B.loc = M
													M.weight += B.weight
													B.suffix = "(Carrying)"
													B.name = "Silver Coins {[B.CoinContent]}"
													m.name = "Silver Coins {[m.CoinContent]}"
													return
							if (Result == "Combine")
								if(m.suffix == "(Carrying)")
									if(m)
										if(m.Gold == 1)
											for(var/obj/Items/Coins/GoldCoin/C in M)
												if(C.suffix == "(Carrying)")
													if(C == m)
														return
													m.CoinContent += C.CoinContent
													m.name = "Gold Coins {[m.CoinContent]}"
													M.weight -= C.weight
													del(C)
													return
									if(m)
										if(m.Silver == 1)
											for(var/obj/Items/Coins/SilverCoin/C in M)
												if(C.suffix == "(Carrying)")
													if(C == m)
														return
													m.CoinContent += C.CoinContent
													m.name = "Silver Coins {[m.CoinContent]}"
													M.weight -= C.weight
													del(C)
													return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Silver")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "SilverBar")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Arrow")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Silk")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon == 'Statue.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Name"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Name")
								var/T = input("Write On Statue")as null|text
								if(!T)
									return
								else
									m.name = T
									return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return



				if(m.icon_state == "Sand")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A5 = m
							A5.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return



				if(m.icon_state == "SpearHead")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)


							var/obj/A6 = m
							A6.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/obj/A = m
								A.loc = M
								M.weight += A.weight
								A.suffix = "(Carrying)"
								for(var/obj/Items/Shafts/SpearShaft/SS in M)
									for(var/obj/Items/Shafts/SpearHead/SH in M)
										var/obj/Items/Weapons/Spears/Spear/S = new
										S.loc = M.loc
										S.M = "Metal"
										if(M.MetalCraftingSkill <= 100)
											S.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											S.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											S.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											S.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											S.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											S.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											S.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											S.CraftRank = "Poor Quality"
										S.MetalWeaponCraft()
										M.MetalCraftingSkill += 0.1
										M.weight -= S.weight
										del(SS)
										del(SH)
										break
										return

				if(m.icon_state == "Shaft")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A7 = m
							A7.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/obj/A = m
								A.loc = M
								M.weight += A.weight
								A.suffix = "(Carrying)"
								for(var/obj/Items/Shafts/SpearShaft/SS in M)
									for(var/obj/Items/Shafts/SpearHead/SH in M)
										var/obj/Items/Weapons/Spears/Spear/S = new
										S.loc = M.loc
										S.M = "Metal"
										if(M.MetalCraftingSkill <= 100)
											S.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											S.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											S.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											S.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											S.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											S.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											S.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											S.CraftRank = "Poor Quality"
										S.MetalWeaponCraft()
										M.MetalCraftingSkill += 0.1
										M.weight -= S.weight
										del(SS)
										del(SH)
										break
										return
				if(m.IsSkin == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A8 = m
							A8.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Fungas")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A = m
							A.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							if(M.Vampire == 0)
								menu += "Eat"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Eat")
								if(m in M)
									if(M.Carn == 0)
										var/die = prob(33)
										if(die == 1)
											view() << "<b><font color=red>[M] tryed to eat fungas but it killed [M]"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Food Posioning"
											M.Death()
											return
										else
											view() << "<b><font color=blue>[M] eats [m]"
											if(m.Posioned == 1)
												view() << "<b><font color=red>[M] was posioned!"
												M.HP = 0
												M.GoingToDie = 1
												M.Killer = "[m]"
												M.DeathType = "Posion"
												M.Death()
												return
											M.Hunger += 100
											M.said = 0
											M.weight -= m.weight
											if(M.Hunger >= 100)
												M.Hunger = 100
											del(m)
											return
									else
										view() << "<b><font color=blue>[M] eats [m]"
										if(m.Posioned == 1)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Posion"
											M.Death()
											return
										M.Hunger += 100
										M.said = 0
										M.weight -= m.weight
										if(M.Hunger >= 100)
											M.Hunger = 100
										del(m)
										return
				if(m)
					if(m.icon_state == "Meat")
						M.destination = null
						if(m in M)

							if(M.Wagon == 0)


								var/obj/A = m
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Vampire == 0)
									menu += "Eat"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

								if (Result == "Eat")
									if(m in M)
										if(M.Carn == 0)
											var/die = prob(33)
											if(die == 1)
												view() << "<b><font color=red>[M] tryed to eat meat raw but it killed [M]"
												M.HP = 0
												M.GoingToDie = 1
												M.Killer = "[m]"
												M.DeathType = "Food Posioning"
												M.Death()
												return
											else
												view() << "<b><font color=blue>[M] eats [m]"
												if(m.Posioned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[m]"
													M.DeathType = "Posion"
													M.Death()
													return
												M.Hunger += 100
												if(M.Spider == 1)
													M.WebContent += 25
													if(M.WebContent >= M.MaxWebContent)
														M.WebContent = M.MaxWebContent
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= m.weight
												del(m)
												return
										else
											view() << "<b><font color=blue>[M] eats [m]"
											if(m.Posioned == 1)
												view() << "<b><font color=red>[M] was posioned!"
												M.HP = 0
												M.GoingToDie = 1
												M.Killer = "[m]"
												M.DeathType = "Posion"
												M.Death()
												return
											M.Hunger += 100
											if(M.Spider == 1)
												M.WebContent += 25
												if(M.WebContent >= M.MaxWebContent)
													M.WebContent = M.MaxWebContent
											M.said = 0
											if(M.Hunger >= 100)
												M.Hunger = 100
											M.weight -= m.weight
											del(m)
											return

				if(m)
					if(m.icon_state == "Cooked")
						M.destination = null
						if(m in M)

							if(M.Wagon == 0)


								var/obj/A = m
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Vampire == 0)
									menu += "Eat"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

								if (Result == "Eat")
									if(m in M)
										view() << "<b><font color=blue>[M] eats [m]"
										if(m.Posioned == 1)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Posion"
											M.Death()
											return
										M.Hunger += 100
										M.said = 0
										if(M.Hunger >= 100)
											M.Hunger = 100
										M.weight -= m.weight
										del(m)
										return


				if(m)
					if(m.icon_state == "Stone")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

				if(m)
					if(m.icon_state == "SleepingBag")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A10 = m
								A10.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				if(m)
					if(m.icon_state == "LeatherBed")
						M.destination = null
						if(m in M)
							if(M.Wagon == 0)
								var/obj/A10 = m
								A10.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
				if(m.icon_state == "Toxic")
					M.destination = null
					if(m in M)
						if(M.Wagon == 0)
							var/obj/A11 = m
							A11.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Drink")
								M.HP = 0
								M.GoingToDie = 1
								M.Killer = "[M]"
								M.DeathType = "Posion"
								M.Death()
								del(m)
								return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Weapon"
								menu2 += "Food"
								menu2 += "Trap"
								menu2 += "Arrows"
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										menu2 += "Posion In Sleep"

								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Arrows")
									for(var/obj/Items/Armours/Back/LeatherQuiver/V in M)
										for(var/obj/Items/Arrows/A in V)
											if(A.Posioned == 0)
												if(m.Content >= 10)
													M.weight -= m.weight
													del(m)
													break
													return
												A.Posioned = 1
												A.name = "[A] - Posion Tipped"
												if(m.PosionContent >= 45)
													m.PosionContent = 45
												A.PosionContent = m.PosionContent
												m.Content += 1
												M.Owner << "Arrow Posioned!"
								if (Result2 == "Weapon")
									for(var/obj/Items/Posions/Toxic/P in M)
										for(var/obj/Items/Weapons/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												W.WeaponDamageMin += rand(2,4)
												W.WeaponDamageMax += rand(2,4)
												W.name = "[W] - Posion Tipped"
												if(m.PosionContent >= 45)
													m.PosionContent = 45
												W.PosionContent = m.PosionContent
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Trap")
									for(var/obj/Items/Posions/Toxic/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(1,M))
											if(W.IsSpiked == 1)
												if(W.Posioned == 0)
													usr << "[M] tips posion over spiked pit trap"
													W.Posioned = 1
													if(m.PosionContent >= 45)
														m.PosionContent = 45
													W.PosionContent = m.PosionContent
													M.weight -= P.weight
													del(P)
													break
													return
								if (Result2 == "Food")

									for(var/obj/Items/Posions/Toxic/P in M)
										for(var/obj/Items/Food/Meats/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												M.weight -= P.weight
												del(P)
												break
												return
									for(var/obj/Items/Posions/Toxic/P in M)
										for(var/obj/Items/Food/CookedMeats/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Posion In Sleep")
									for(var/mob/Monsters/S in view(1,M))
										if(S.Sleeping == 1)
											for(var/obj/Items/Posions/Toxic/P in M)
												if(S.Posioned == 0)
													S.Posioned = 1
													S.HP = 0
													S.Death()
													S.GoingToDie = 1
													S.Killer = "[M]"
													S.DeathType = "Posion"
													view() << "<b><font color=red>[S] is posioned!"
													M.weight -= P.weight
													del(P)
													break
													return
								return
				if(m.icon_state == "Posion")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A11 = m
							A11.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Combine"
							menu += "Drink"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Drink")
								M.HP = 0
								M.GoingToDie = 1
								M.Killer = "[M]"
								M.DeathType = "Posion"
								M.Death()
								del(m)
								return
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Weapon"
								menu2 += "Food"
								menu2 += "Trap"
								menu2 += "Arrows"
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										menu2 += "Posion In Sleep"

								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Arrows")
									for(var/obj/Items/Armours/Back/LeatherQuiver/V in M)
										for(var/obj/Items/Arrows/A in V)
											if(A.Posioned == 0)
												if(m.Content >= 10)
													M.weight -= m.weight
													del(m)
													break
													return
												A.Posioned = 1
												A.name = "[A] - Posion Tipped"
												if(m.PosionContent >= 45)
													m.PosionContent = 45
												A.PosionContent = m.PosionContent
												m.Content += 1
												M.Owner << "Arrow Posioned!"
								if (Result2 == "Weapon")
									for(var/obj/Items/Posions/Posion/P in M)
										for(var/obj/Items/Weapons/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												W.WeaponDamageMin += rand(1,2)
												W.WeaponDamageMax += rand(1,2)
												W.name = "[W] - Posion Tipped"
												if(m.PosionContent >= 45)
													m.PosionContent = 45
												W.PosionContent = m.PosionContent
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Trap")
									for(var/obj/Items/Posions/Posion/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(1,M))
											if(W.IsSpiked == 1)
												if(W.Posioned == 0)
													usr << "[M] tips posion over spiked pit trap"
													W.Posioned = 1
													if(m.PosionContent >= 45)
														m.PosionContent = 45
													W.PosionContent = m.PosionContent
													M.weight -= P.weight
													del(P)
													break
													return
								if (Result2 == "Food")
									for(var/obj/Items/Posions/Posion/P in M)
										for(var/obj/Items/Food/Meats/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												M.weight -= P.weight
												del(P)
												break
												return
									for(var/obj/Items/Posions/Posion/P in M)
										for(var/obj/Items/Food/CookedMeats/W in M)
											if(W.Posioned == 0)
												W.Posioned = 1
												M.weight -= P.weight
												del(P)
												break
												return
								if (Result2 == "Posion In Sleep")
									for(var/mob/Monsters/S in view(1,M))
										if(S.Sleeping == 1)
											for(var/obj/Items/Posions/Posion/P in M)
												if(S.Posioned == 0)
													S.Posioned = 1
													S.HP = 0
													S.Death()
													S.GoingToDie = 1
													S.Killer = "[M]"
													S.DeathType = "Posion"
													view() << "<b><font color=red>[S] is posioned!"
													M.weight -= P.weight
													del(P)
													break
													return
								return



				if(m.IsHead == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A12 = m
							A12.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Make Into Skull"
							for(var/obj/Items/Traps/Spikes/S in M)
								menu += "Put On Spike"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Put On Spike")
								if(m.weight == 25)
									usr << "Un-able to put on spike!<br>"
									return
								for(var/obj/Items/Traps/Spikes/S in M)
									if(S.icon_state == "Spike")
										if(S.HasHeadOn == 0)
											S.name = m.name
											S.overlays += m
											S.HasHeadOn = 1
											M.weight -= m.weight
											del(m)
											return
							if (Result == "Make Into Skull")
								if(m.weight == 25)
									usr << "Un-able to create skull!<br>"
									return
								var/obj/Items/Bones/Skull/B2 = new
								B2.loc = M.loc
								M.ButcherySkill += 1
								M.weight -= m.weight
								B2.name = m.name
								del(m)
								return
				if(m)
					if(m.icon_state == "Gland")
						M.destination = null
						if(m in M)

							if(M.Wagon == 0)


								var/obj/A12 = m
								A12.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << m.desc
								if (Result == "Drop")
									if(m.suffix == "(Carrying)")
										var/obj/A1 = m
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return

				if(m.icon_state == "Spike")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A13 = m
							A13.loc = M
							var/list/menu = new()
							menu += "Drop"
							for(var/mob/Monsters/Vampire/V in view(1,M))
								menu += "Stab Heart"
							menu += "Inspect"
							menu += "Combine"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Stab Heart")
								if(M.CoolDown == 0)
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										if(V.Sleeping == 1)
											view() << "[M] stabs a Vampire in the heart killing it!"
											V.GoingToDie = 1
											V.Killer = "[M]"
											V.DeathType = "Punctured Heart"
											V.Death()

							if (Result == "Combine")
								var/list/menu2 = new()
								menu2 += "Trap"
								menu2 += "Cancel"
								var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
								if (Result2 != "Cancel")
									..()
								if (Result2 == "Trap")
									for(var/obj/Items/Traps/Spikes/WoodenSpike/P in M)
										for(var/obj/Items/Traps/PitTrap/W in view(0,M))
											if(W.Hole == 0)
												if(W.IsSpiked == 0)
													W.IsSpiked = 1
													M.weight -= P.weight
													del(P)
													break
									return



				if(m.icon_state == "GPillar")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A14 = m
							A14.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Pillar")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A14 = m
							A14.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Metal")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A14 = m
							A14.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

				if(m.icon_state == "Chitin Buckler")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/ChitinBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/ChitinBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Bone Buckler")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/BoneBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/BoneBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Silver Buckler")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/SilverBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/SilverBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Gold Buckler")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/GoldBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/GoldBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Metal Buckler")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/MetalBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/MetalBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
				if(m.icon == 'GoblinBuckler.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A15= m
							A15.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.WearingShield = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Armours/Shields/WoodenBuckler/
									M.Defence -= A2.Defence
							if (Result == "Equip")
								if(m in M)
									if(M.ShieldSkill >= m.Skill)
										if(M.CanUseLeftArm == 1)
											if(M.WearingShield == 0)
												var/obj/A = m
												M.WearingShield = 1
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Armours/Shields/WoodenBuckler/
												M.Defence += A.Defence
										else
											usr << "[M] has a crippled arm!"
									else
										usr << "Not enough skill to use!"
































				if(m.icon_state == "sign")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)
							var/list/menu = new()
							menu += "Drop"
							menu += "Write"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Write")
								var/T = input("Write On Sign")as null|text
								if(!T)
									return
								else
									m.name = T
									return
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									A1.dir = M.dir
									return
				if(m.TS == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A16 = m
							A16.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inscribe"
							menu += "Inspect"

							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Inscribe")
								var/T = input("Inscribe Tomb Stone")as null|text
								if(!T)
									return
								else
									m.name = T
									m.icon_state = "TombStone2"
									return
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Throne")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A16 = m
							A16.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"

							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(M.dir == NORTH)
										m.dir = NORTH
										m.layer = 5
									else
										m.dir = M.dir
									return
					else
						M.destination = m

				if(m.TP == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A16 = m
							A16.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"

							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
					else
						if(M.HoldingWeapon != "Bow")
							M.destination = m


























				if(m.icon_state == "BoneAxe")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A17 = m
							A17.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Axes/BoneAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Axe"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Axes/BoneAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Gold Axe")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A17 = m
							A17.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Axes/GoldAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Axe"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Axes/GoldAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "MetalOrcAxe")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A17 = m
							A17.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Axes/MetalOrcAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Axe"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Axes/MetalOrcAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Axe")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A17 = m
							A17.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Axes/MetalAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Axe"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Axes/MetalAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax

				if(m.icon_state == "Gold Dagger")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A18 = m
							A18.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Daggers/GoldDagger/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Dagger"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Daggers/GoldDagger/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Metal Dagger")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A18 = m
							A18.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Daggers/MetalDagger/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Dagger"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Daggers/MetalDagger/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax

				if(m.icon_state == "MetalBow")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Bows/MetalBow/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
									M.BowOn = 0
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Bow"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Bows/MetalBow/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
											M.BowOn = 0
				if(m.icon_state == "WoodBow")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Bows/WoodenBow/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
									M.BowOn = 0
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Bow"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Bows/WoodenBow/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
											M.BowOn = 0
				if(m.icon_state == "BoneBow")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Bows/BoneBow/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
									M.BowOn = 0
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Bow"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Bows/BoneBow/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
											M.BowOn = 0

				if(m.icon_state == "Bone Mace")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Maces/SkullMace/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Mace"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Maces/SkullMace/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "GoldMace")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Maces/GoldMace/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Mace"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Maces/GoldMace/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Mace")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Maces/MetalMace/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = "Mace"
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Maces/MetalMace/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Gold Pick")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									M.HasPick = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Picks/GoldPickAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = 1
											M.HasPick = 1
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Picks/GoldPickAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax
				if(m.icon_state == "Metal Pick")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A19 = m
							A19.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									M.HasPick = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Picks/PickAxe/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.CanUseRightArm == 1)
										if(M.HoldingWeapon == 0)
											var/obj/A = m
											M.HoldingWeapon = 1
											M.HasPick = 1
											A.loc = M
											A.suffix = "(Equiped)"
											M.overlays += /obj/Items/Weapons/Picks/PickAxe/
											M.WeaponDamageMin += A.WeaponDamageMin
											M.WeaponDamageMax += A.WeaponDamageMax

				if(m.icon_state == "BoneSword")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/BoneSword/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/BoneSword/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Gold Gladius")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/GoldGladius/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/GoldGladius/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "HellSword")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/HellForgedSword/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/Explode = prob(50)
												if(M.Race == "Demon")
													Explode = 0
												if(Explode == 1)
													M.HasLeftArm = 0
													M.HasLeftLeg = 0
													M.HasRightLeg = 0
													M.Crippled = 1
													M.HasRightArm = 0
													M.CanWalk = 0
													M.LimbLoss()
													M.ArmFling()
													M.ArmFling()
													M.LegFling()
													M.LegFling()
													M.BloodContent -= 100
													M.BloodLoss()
													view() << "[M] tries to wield [m] but it rejects them! the blade fades away"
													del(m)
													return
												else
													view() << "[M] succesfully wields the dangerous blade."
													var/obj/A = m
													M.HoldingWeapon = "Sword"
													A.loc = M
													A.suffix = "(Equiped)"
													M.overlays += /obj/Items/Weapons/Swords/HellForgedSword/
													M.WeaponDamageMin += A.WeaponDamageMin
													M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Gladius")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/Gladius/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/Gladius/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Gold Sword")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/GoldStraightSword/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/GoldStraightSword/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Sword")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/StraightSword/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/StraightSword/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon == 'GoblinSword.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Swords/GoblinSword/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SwordSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Sword"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Swords/GoblinSword/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Silver Spear")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/SilverSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
									M.UsingSilver = 0
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												M.UsingSilver = 1
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/SilverSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Gold Spear")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/GoldSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/GoldSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Wood Spear")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/WoodenSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/WoodenSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Metal Spear")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/MetalSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/MetalSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon_state == "Chitin Spear")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/ChitinSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/ChitinSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon == 'BoneSpear.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A20 = m
							A20.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/BoneSpear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/BoneSpear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"
				if(m.icon == 'Spear.dmi')
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A21 = m
							A21.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Equip"
							menu += "Un-Equip"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									if(A1.Content3 == 0)
										A1.DeleteItem()
									return

							if (Result == "Un-Equip")
								if(m.suffix == "(Equiped)")
									var/obj/A2 = m
									M.HoldingWeapon = 0
									A2.loc = M
									A2.suffix = "(Carrying)"
									M.overlays -= /obj/Items/Weapons/Spears/Spear/
									M.WeaponDamageMin -= A2.WeaponDamageMin
									M.WeaponDamageMax -= A2.WeaponDamageMax
							if (Result == "Equip")
								if(m in M)
									if(M.SpearSkill >= m.Skill)
										if(M.CanUseRightArm == 1)
											if(M.HoldingWeapon == 0)
												var/obj/A = m
												M.HoldingWeapon = "Spear"
												A.loc = M
												A.suffix = "(Equiped)"
												M.overlays += /obj/Items/Weapons/Spears/Spear/
												M.WeaponDamageMin += A.WeaponDamageMin
												M.WeaponDamageMax += A.WeaponDamageMax

									else
										usr << "Not enough skill to use!"

				if(m.icon_state == "Skull")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A22 = m
							A22.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/WoodenSpade/S in M)
								menu += "Bury"
							for(var/obj/Items/Shafts/Spade/S in M)
								menu += "Bury"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Bury")
								if(m in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = m
									A2.loc = G
									M.weight -= m.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return

				if(m.icon_state == "Grave")
					M.destination = null
					if(m in view(1,M))

						if(M.Wagon == 0)


							var/list/menu = new()
							menu += "Rob Grave"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Rob Grave")
								for(var/obj/Q in m)
									Q.loc = M.loc
									Q.suffix = null
								for(var/mob/Z in m)
									Z.loc = M.loc
									Z.suffix = null
								del(m)
								return
							if (Result == "Inspect")
								for(var/atom/F in m)
									usr << F
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
				if(m.icon_state == "Shell")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A23 = m
							A23.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/Spade/S in M)
								menu += "Bury"
							for(var/obj/Items/Shafts/WoodenSpade/S in M)
								menu += "Bury"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Bury")
								if(m in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = m
									A2.loc = G
									M.weight -= m.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return
				if(m.icon_state == "Bone")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A23 = m
							A23.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/WoodenSpade/S in M)
								menu += "Bury"
							for(var/obj/Items/Shafts/Spade/S in M)
								menu += "Bury"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Bury")
								if(m in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = m
									A2.loc = G
									M.weight -= m.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return



				if(m.icon_state == "Wood")
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)


							var/obj/A = m
							A.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return


				if(m.Dead == 1)
					M.destination = null
					if(m in M)

						if(M.Wagon == 0)



							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/WoodenSpade/S in M)
								menu += "Bury"
							for(var/obj/Items/Shafts/Spade/S in M)
								menu += "Bury"
							if(M.Carn == 1)
								menu += "Tear Meat Off"
								menu += "Tear Skin Off"
							if(M.HoldingWeapon == "Dagger")
								menu += "Tear Meat Off"
								menu += "Tear Skin Off"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								if(m)
									usr << m.desc
							if (Result == "Drop")
								if(m.suffix == "(Carrying)")
									var/obj/A1 = m
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return

							if (Result == "Bury")
								if(m in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = m
									A2.loc = G
									M.weight -= m.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return

							if (Result == "Tear Skin Off")
								if(m in M)
									if(m.Race == "Orc")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/OrcSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
									if(m.Race == "Gremlin")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/GremlinSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
									if(m.Race == "Demon")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DemonSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
									if(m.Mole == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/MoleSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.FrogMan == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/FrogManSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.LizardMan == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/LizardSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Spider == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/SpiderSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Wolf == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/WolfFur/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Vampire == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/VampireSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Deer == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DeerSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Human == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												if(m.Black == 0)
													var/obj/Items/Skins/HumanSkin/DS = new
													DS.loc = M.loc
													M.SkinningSkill += 1
													return
												if(m.Black == 1)
													var/obj/Items/Skins/HumanSkinBlack/DS = new
													DS.loc = M.loc
													M.SkinningSkill += 1
													return













										else
											usr << "This has already been skinned!"
										return
									if(m.Goblin == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/GoblinSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return
									if(m.Kobold == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/KoboldSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return



										else
											usr << "This has already been skinned!"
										return
									if(m.Dwarf == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DwarfSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 1
												return

										else
											usr << "This has already been skinned!"
										return

							if (Result == "Tear Meat Off")
								if(m in M)
									if(m.LizardMan == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedLizardMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Glands/PosionGland/PG = new
											PG.loc = M.loc
											PG.Posioned = 1
											var/obj/Items/Bones/LizardHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Race == "Gargoyle")
										if(M.ButcherySkill >= 1)
											var/obj/Items/ores/stone/B = new
											B.loc = M.loc
											B.name = "[m]"
											var/obj/Items/Bones/GargoyleHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Race == "Orc")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedOrcMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/OrcHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Race == "Gremlin")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedGremlinMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/GremlinHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Race == "Demon")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedDemonMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/DemonHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Wolf == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedWolfMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/Skull/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Skull"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return

									if(m.FrogMan == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedFrogManMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/FrogManHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return

									if(m.Vampire == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedVampireMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/VampireHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return

									if(m.Deer == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedDeerMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/Skull/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Skull"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return












									if(m.icon_state == "CaveFish")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedCaveFishMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.icon_state == "TFish")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedTropicalFishMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.icon_state == "BlowFish")
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedBlowFishMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return


									if(m.Fish == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedFishMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return



									if(m.Kobold == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedKoboldMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/KoboldHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return

									if(m.Goblin == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedGoblinMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/GoblinHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return


									if(m.Dwarf == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedDwarfMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Bones/DwarfHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return
									if(m.Human == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedHumanMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											if(m.Black == 0)
												var/obj/Items/Bones/HumanHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
											if(m.Black == 1)
												var/obj/Items/Bones/HumanHeadBlack/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
											M.ButcherySkill += 1
											M.weight -= m.weight
											del(m)
											return

									if(m.Spider == 1)
										var/S
										S = prob(30)
										if(S == 1)
											var/obj/Items/Silks/SpiderSilk/SS = new
											SS.loc = M.loc
										var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
										DS.loc = M.loc
										var/obj/Items/Glands/PosionGland/PG = new
										PG.loc = M.loc
										PG.Posioned = 1
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return
									if(m.Bug == 1)
										var/Silk
										Silk = prob(10)
										if(Silk == 1)
											var/obj/Items/Silks/SpiderSilk/S = new
											S.loc = M.loc
										var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
										DS.loc = M.loc
										var/obj/Items/Glands/PosionGland/PG = new
										PG.loc = M.loc
										PG.Posioned = 1
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return
									if(m.Race == "Plant")
										var/obj/Items/Glands/PosionRoots/PG = new
										PG.loc = M.loc
										var/obj/Items/Seeds/CarnivorousPlantSeed/PG2 = new
										PG2.loc = M.loc
										var/obj/Items/Seeds/CarnivorousPlantSeed/PG3 = new
										PG3.loc = M.loc
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return
									if(m.Race == "Plant2")
										var/obj/Items/Glands/PosionRoots/PG = new
										PG.loc = M.loc
										var/obj/Items/Seeds/PosionSporeSeed/PG2 = new
										PG2.loc = M.loc
										var/obj/Items/Seeds/PosionSporeSeed/PG3 = new
										PG3.loc = M.loc
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return
									if(m.Beatle == 1)
										var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
										DS.loc = M.loc
										var/obj/Items/Glands/ToxicGland/PG = new
										PG.loc = M.loc
										PG.Posioned = 1
										var/obj/Items/Bones/Shell/DS2 = new
										DS2.loc = M.loc
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return
									if(m.Mole == 1)
										var/obj/Items/Food/Meats/UnCookedMoleMeat/DS = new
										DS.loc = M.loc
										var/obj/Items/Bones/Skull/DS2 = new
										DS2.loc = M.loc
										DS2.name = m.name
										var/obj/Items/Bones/Bones/DS3 = new
										DS3.loc = M.loc
										DS3.name = m.name
										M.ButcherySkill += 1
										M.weight -= m.weight
										del(m)
										return



