/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
atom/proc/Safe()
	spawn(400)
		src.IsWood = 1




turf/proc/LavaFlood()
	spawn(10)
	for(var/turf/T in view(1,src))
		if(T.density == 0)
			if(T.name != "Magma")
				var/S = prob(20)
				if(S)
					T.name = "Magma"
					T.icon = 'Lava.dmi'
					T.icon_state = "Lava"
					T.density = 1
					T.Content3 = "Lava"
					T.LavaFlood()
					if(T.GoesTo)
						var/obj/Smoke/E = new
						E.loc = T.GoesTo
						if(E.z == 1)
							for(var/turf/T2 in view(0,E))
								T2.LavaFlood()
						if(E.z == 2)
							for(var/turf/T2 in view(0,E))
								T2.LavaFlood()
						del(E)

turf/proc/WaterFlood()
	spawn(10)
	for(var/turf/T in view(1,src))
		if(T.density == 0)
			if(T.CanFish == 0)
				var/S = prob(20)
				if(S)
					T.icon = 'water.dmi'
					T.icon_state = "water"
					T.CanFish = 1
					T.Detailed = 1
					T.Content3 = "Liquid"
					T.OIcon = "water"
					T.density = 1
					T.WaterFlood()
					if(T.GoesTo)
						var/obj/Smoke/E = new
						E.loc = T.GoesTo
						if(E.z == 1)
							for(var/turf/T2 in view(0,E))
								T2.WaterFlood()
						if(E.z == 2)
							for(var/turf/T2 in view(0,E))
								T2.WaterFlood()
						del(E)
mob/proc/FlameAttack()
	if(src.destination in view(1,src))
		view() << "[src] breathes fire over [src.destination]"
		var/obj/Fire/F = new
		F.loc = src.loc
		F.dir = src.dir
	spawn(250) FlameAttack()
mob/proc/TurnDemon()
	spawn(500)
		src.overlays += 'RedEye.dmi'
		spawn(500)
			src.icon += rgb(150,0,0)
			src.overlays -= 'RedEye.dmi'
			src.Strength += rand(3,5)
			spawn(500)
				src.icon = 'Demon.dmi'
				src.Strength += rand(3,5)
				src.LimbLoss()
obj/proc/Flame()
	for(var/atom/T in view(2,src))
		if(T.OnFire == 0)
			if(T.IsWood)
				if(T.Tree)
					T.overlays -= /obj/Trees/leaves3x2
					T.overlays -= /obj/Trees/leaves2x2
					T.overlays -= /obj/Trees/leaves1x2
					T.overlays -= /obj/Trees/leaves1x1
					T.overlays -= /obj/Trees/leaves2x1
					T.overlays -= /obj/Trees/leaves3x1

				T.Fire()
				del(src)
				return
	spawn(20) Flame()

obj/proc/DeleteSmoke()
	spawn(50)
		del(src)

obj/proc/SmokeMove()
	step_rand(src)
	spawn(8) SmokeMove()

atom/proc/Smoke()
	if(src.OnFire)
		var/obj/Smoke/S = new
		S.loc = locate(src.x,src.y,src.z)
		S.dir = NORTH



	else
		return
	spawn(12) Smoke()
atom/proc/Fire()
	src.Fuel = 100
	src.OnFire = 0
	src.overlays -= 'Fire.dmi'
	return
	if(src.OnFire == 0)
		if(src.IsWood)
			src.overlays += 'Fire.dmi'
			src.OnFire = 1
			src.Smoke()
		else
			return
	else
		if(src.IsWood)
			src.Fuel -= 10
			if(ismob(src))
				var/mob/M = src
				M.LeftLegHP -= 6
				M.RightLegHP -= 6
				M.RightArmHP -= 6
				M.LeftArmHP -= 6
				M.BloodContent -= 4
				M.LeftLeg = "Burned"
				M.RightLeg = "Burned"
				M.RightArm = "Burned"
				M.LeftArm = "Burned"
				M.BloodLoss()
	spawn(100)
		for(var/atom/T in view(2,src))
			if(T.OnFire == 0)
				if(T.IsWood)
					if(T.Tree)
						T.overlays -= /obj/Trees/leaves3x2
						T.overlays -= /obj/Trees/leaves2x2
						T.overlays -= /obj/Trees/leaves1x2
						T.overlays -= /obj/Trees/leaves1x1
						T.overlays -= /obj/Trees/leaves2x1
						T.overlays -= /obj/Trees/leaves3x1
					T.Fire()
	if(src.Fuel <= 0)
		if(isturf(src))
			src.overlays = null
			src.OnFire = 0
			src.IsWood = 0
			src.Fuel = 100
			src.opacity = 0
			src.density = 0
			src.CanDigAt = 0
			src.Detailed = 0
			src.icon = 'Cave.dmi'
			src.Tree = 0
			src.icon_state = src.OIcon
			src.GoesTo = null
			if(src.z == 1)
				var/obj/Support/Q = new
				Q.loc = locate(src.x,src.y,3)
				for(var/turf/TE in view(0,Q))
					if(TE.Supported == 1)
						TE.Supported = 0
						TE.icon_state = "DFloor"
						TE.name = "Floor"
						TE.density = 0
						TE.Detailed = 0
						if(TE.Content3 == "Peak")
							TE.icon = 'Cave.dmi'
							TE.icon_state = "Peak"
							TE.name = "MountainPeak"
						if(TE.Content == "Sky")
							TE.icon = 'Cave.dmi'
							TE.icon_state = "Sky"
							TE.name = "Sky"
				del(Q)
			return
		else
			src.Fuel = 100
			src.OnFire = 0
			src.overlays -= 'Fire.dmi'
			src.IsWood = 0
			src.Safe()
			return
	spawn(100) Fire()

mob/proc/Regen()
	if(src.HasLeftArm == 0)
		var/LA = prob(20)
		if(LA == 1)
			if(src.Crippled == 1)
				src.Crippled = 0
			if(src.CanUseLeftArm == 0)
				src.CanUseLeftArm = 1
			src.Owner << "[src] grows their left arm back!"
			src.HasLeftArm = 1
			src.LeftArmHP = 10
			src.LeftArm = "Mangled"
			src.LimbLoss()
	if(src.HasRightArm == 0)
		var/LA = prob(20)
		if(LA == 1)
			if(src.Crippled == 1)
				src.Crippled = 0
			if(src.CanUseRightArm == 0)
				src.CanUseRightArm = 1
			src.Owner << "[src] grows their right arm back!"
			src.HasRightArm = 1
			src.RightArmHP = 10
			src.RightArm = "Mangled"
			src.LimbLoss()
	if(src.HasLeftLeg == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their left leg back!"
			src.HasLeftLeg = 1
			src.LeftLegHP = 10
			src.LeftLeg = "Mangled"
			src.LimbLoss()
	if(src.HasRightLeg == 0)
		var/LA = prob(20)
		if(LA == 1)
			src.Owner << "[src] grows their right leg back!"
			src.HasRightLeg = 1
			src.RightLegHP = 10
			src.RightLeg = "Mangled"
			src.LimbLoss()
	spawn(600) Regen()


mob/verb/View_Admin_Logs()
	usr<<browse(file("Logs/Adminlog.html"))
mob/verb/MusicOff()
	usr << sound(null)
mob/verb/StopAll()
	for(var/mob/Monsters/M in usr.Selected)
		M.destination = null
		M.Target = null
		if(M.BowOn)
			M.BowOn = 0
mob/proc/Close()
	if(src.Up == 0)
		src.Up = 1
		Building(src)
		return
	else
		src.Up = 0
		for(var/obj/HUD/H in src.client.screen)
			del(H)
mob/verb/Ignore()
	var/T = input("Ignore/Un-Ignore who?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.key)
				if(S.ckey in usr.IgnoreList)
					S << "[usr] has removed you from their ignore list!<br>"
					usr << "You remove [S] from your ignore list<br>"
					usr.IgnoreList -= S.ckey
				else
					S << "[usr] has put you on their ignore list!<br>"
					usr << "You put [S] on your ignore list<br>"
					usr.IgnoreList += S.ckey
mob/verb/Test()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.CanBuild  == 0)
			usr << "One or more of the units you have selected can not build."
			return
		if(M.IsMist  == 1)
			usr << "Cant build while misted!"
			return
	if(usr.CanBuild == 1)
		if(usr.Up == 0)
			usr.Up = 1
			Building(usr)
			return
		else
			usr.Up = 0
			for(var/obj/HUD/H in usr.client.screen)
				del(H)

mob
	proc
		Stations()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.StationMenu()//Creates the OSI Background







		StationMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/Smelt = new/obj/HUD/ClickSmelt(usr.client)
				var/obj/Forge = new/obj/HUD/ClickForge(usr.client)
				var/obj/Carp = new/obj/HUD/ClickCarp(usr.client)
				var/obj/Potion = new/obj/HUD/ClickPotion(usr.client)
				var/obj/Pos = new/obj/HUD/ClickPos(usr.client)
				var/obj/Mas = new/obj/HUD/ClickMas(usr.client)
				var/obj/Glass = new/obj/HUD/ClickGlass(usr.client)
				var/obj/Kit = new/obj/HUD/ClickKit(usr.client)
				var/obj/Let = new/obj/HUD/ClickLet(usr.client)
				var/obj/Gem = new/obj/HUD/ClickGem(usr.client)
				var/obj/Bone = new/obj/HUD/ClickBone(usr.client)
				var/obj/Melt = new/obj/HUD/ClickMelt(usr.client)
				H.screen_loc = "3,17 to 17,4"
				usr.Text(usr,3,17,4,13,"--Work Stations Menu--")
				if(M.LizardMan == 1)
					Pos.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"PoisonCraft - Wood")
					Bone.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"BoneCraft - Wood")
					Let.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Leather - Wood")
					Carp.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Carpentry - Wood")
					Melt.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Melter - Stone")
				if(M.Goblin == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Potion.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"PotionStation - Wood")
					Glass.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"GlassForge - Stone")
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Let.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"Leather - Wood")
					Gem.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"GemCraft - Stone")
					Pos.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"AlchemyStation - Wood")
					Bone.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"BoneCraft - Wood")
					Melt.screen_loc = "11,10"
					usr.Text(usr,13,10,4,10,"Melter - Stone")
				if(M.Dwarf == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Kit.screen_loc = "4,8"
					usr.Text(usr,6,8,8,10,"Kitchen - Wood")
					Let.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Leather - Wood")
					Gem.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"GemCraft - Stone")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Vampire == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Gem.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"GemCraft - Stone")
					Pos.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"PoisonCraft - Wood")
					Bone.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"BoneCraft - Wood")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Human == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Potion.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"AlchemyStation - Wood")
					Glass.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"GlassForge - Stone")
					Mas.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"Masonary - Stone")
					Kit.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"Kitchen - Wood")
					Let.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Leather - Wood")
					Gem.screen_loc = "11,14"
					usr.Text(usr,13,14,4,10,"GemCraft - Stone")
					Melt.screen_loc = "11,12"
					usr.Text(usr,13,12,4,10,"Melter - Stone")
				if(M.Kobold == 1)
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Bone.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")
				if(M.Race == "Orc")
					Smelt.screen_loc = "4,16"
					usr.Text(usr,6,16,4,10,"Smelter - Stone")
					Forge.screen_loc = "4,14"
					usr.Text(usr,6,14,4,10,"Forge - Stone")
					Carp.screen_loc = "4,12"
					usr.Text(usr,6,12,4,10,"Carpentry - Wood")
					Mas.screen_loc = "4,10"
					usr.Text(usr,6,10,4,10,"Masonary - Stone")
					Let.screen_loc = "4,8"
					usr.Text(usr,6,8,4,10,"Leather - Wood")
					Bone.screen_loc = "4,6"
					usr.Text(usr,6,6,4,10,"BoneCraft - Wood")
					Pos.screen_loc = "4,4"
					usr.Text(usr,6,4,4,10,"PoisonCraft - Wood")
					Melt.screen_loc = "11,16"
					usr.Text(usr,13,16,4,10,"Melter - Stone")




mob
	proc
		FarmLand()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.FarmMenu()//Creates the OSI Background







		FarmMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Farm = new/obj/HUD/ClickFarm(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Farm Menu--")
				if(M.Human == 1)
					Farm.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"FarmLand - Humans")
mob
	proc
		Stairs()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.StairMenu()//Creates the OSI Background







		StairMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Stair = new/obj/HUD/ClickStair(usr.client)
				var/obj/Stair2 = new/obj/HUD/ClickStair2(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Stair Menu--")
				if(M.LizardMan == 0)
					Stair.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"Stairs")
				if(M.LizardMan == 1)
					Stair2.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BambooStairs")

mob
	proc
		Traps()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.TrapMenu()//Creates the OSI Background







		TrapMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/Trap = new/obj/HUD/ClickTraps(usr.client)
				var/obj/StoneTrap = new/obj/HUD/ClickStoneFall(usr.client)
				var/obj/RibTrap = new/obj/HUD/ClickRibTrap(usr.client)
				var/obj/BST = new/obj/HUD/ClickBSTTrap(usr.client)
				var/obj/BoneAlarm = new/obj/HUD/ClickBoneAlarm(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Trap Menu--")
				Trap.screen_loc = "5,13"
				usr.Text(usr,7,13,4,10,"Pit Trap")
				StoneTrap.screen_loc = "5,11"
				usr.Text(usr,7,11,4,10,"StoneFall Trap")
				if(M.Kobold == 1)
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
					BoneAlarm.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"BoneAlarm Trap")
				if(M.Goblin == 1)
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
					BoneAlarm.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"BoneAlarm Trap")

mob
	proc
		Floors()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.FloorMenu()//Creates the OSI Background







		FloorMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/WoodFloor = new/obj/HUD/ClickWoodFloor(usr.client)
				var/obj/OrcFloor = new/obj/HUD/ClickOrcFloor(usr.client)
				var/obj/TribalFloor = new/obj/HUD/ClickTribalFloor(usr.client)
				var/obj/StoneFloor = new/obj/HUD/ClickStoneFloor(usr.client)
				var/obj/BoneFloor = new/obj/HUD/ClickBoneFloor(usr.client)
				var/obj/Dest = new/obj/HUD/ClickDestroy(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Floor Menu--")
				if(M.Vampire == 0)
					if(M.LizardMan == 1)
						TribalFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"TribalFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Race == "Orc")
						OrcFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodenFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if(M.Goblin == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						BoneFloor.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneFloor")
						Dest.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"DestroyFloor")
					if(M.Dwarf == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Human == 1)
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if(M.Kobold == 1)
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")

mob
	proc
		Bridge()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.BridgeMenu()//Creates the OSI Background







		BridgeMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/TribalBridge = new/obj/HUD/ClickTribalBridge(usr.client)
				var/obj/StoneBridge = new/obj/HUD/ClickStoneBridge(usr.client)
				var/obj/WoodBridge = new/obj/HUD/ClickWoodBridge(usr.client)
				var/obj/WoodOrcBridge = new/obj/HUD/ClickWoodOrcBridge(usr.client)
				var/obj/BoneBridge = new/obj/HUD/ClickBoneBridge(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Bridge Menu--")
				if(M.Vampire == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
					BoneBridge.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"BoneBridge")
				if(M.LizardMan == 1)
					TribalBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"TribalBridge")
				if(M.Goblin == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
					BoneBridge.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"BoneBridge")
				if(M.Dwarf == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
				if(M.Human == 1)
					StoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneBridge")
					WoodBridge.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodBridge")
				if(M.Kobold == 1)
					BoneBridge.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneBridge")
				if(M.Race == "Orc")
					WoodOrcBridge.screen_loc = "5,13"
					usr.Text(usr,7,11,4,10,"WoodBridge")
mob
	proc
		Walls()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.WallMenu()//Creates the OSI Background







		WallMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				var/obj/H = new/obj/HUD/Middle2(usr.client)
				var/obj/O = new/obj/HUD/TopLeft(usr.client)
				var/obj/A = new/obj/HUD/TopRight(usr.client)
				var/obj/B = new/obj/HUD/BottomLeft(usr.client)
				var/obj/C = new/obj/HUD/BottomRight(usr.client)
				var/obj/D = new/obj/HUD/TopMiddle(usr.client)
				var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
				var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
				var/obj/G = new/obj/HUD/RightMiddle(usr.client)
				var/obj/WoodWall = new/obj/HUD/ClickWoodWall(usr.client)
				var/obj/OrcWall = new/obj/HUD/ClickOrcWall(usr.client)
				var/obj/TribalWall = new/obj/HUD/ClickTribalWall(usr.client)
				var/obj/StoneWall = new/obj/HUD/ClickStoneWall(usr.client)
				var/obj/BoneWall = new/obj/HUD/ClickBoneWall(usr.client)
				var/obj/SecretWall = new/obj/HUD/ClickSecretWall(usr.client)
				var/obj/Detail = new/obj/HUD/ClickDetail(usr.client)
				H.screen_loc = "4,14 to 14,4"
				O.screen_loc = "4,14"
				A.screen_loc = "14,14"
				B.screen_loc = "4,4"
				C.screen_loc = "14,4"
				D.screen_loc = "4,14 to 14,14"
				E.screen_loc = "4,4 to 14,4"
				F.screen_loc = "4,4 to 4,14"
				G.screen_loc = "14,4 to 14,14"
				usr.Text(usr,4,14,4,10,"--Wall Menu--")
				if(M.Vampire == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
					BoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"BoneWall")
					StoneWall.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"StoneWall")
					SecretWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"SecretWall")
				if(M.Goblin == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
				if(M.Race == "Orc")
					OrcWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
				if(M.LizardMan == 1)
					TribalWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"TribalWall")
				if(M.Human == 1)
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"WoodWall")
				if(M.Dwarf == 1)
					WoodWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"WoodWall")
				if(M.Kobold == 1)
					BoneWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneWall")
				if(M.Goblin == 1)
					BoneWall.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneWall")
				if(M.Kobold == 0)
					if(M.Human == 1)
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
					if(M.Goblin == 1)
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
					if(M.Dwarf == 1)
						StoneWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneWall")
				if(M.Vampire == 0)
					if(M.Kobold == 1)
						SecretWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"SecretWall")
					if(M.LizardMan == 1)
						SecretWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"SecretWall")
					if(M.Race == "Orc")
						SecretWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"SecretWall")
					if(M.Kobold == 0)
						if(M.LizardMan == 0)
							if(M.Race != "Orc")
								SecretWall.screen_loc = "5,9"
								usr.Text(usr,7,9,4,10,"SecretWall")
				if(M.Dwarf == 1)
					Detail.screen_loc = "11,13"
					usr.Text(usr,12,13,4,10,"Detail")
mob
	proc
		Building()//This is the proc that creates the OSI



			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)

			usr.BuildingMenu()//Creates the OSI Background







		BuildingMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				if(M.density == 1)
					if(M.Spider == 1)
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/SilkWall(usr.client)
						var/obj/Trap = new/obj/HUD/SpiderTrap(usr.client)
						var/obj/Post = new/obj/HUD/Post(usr.client)
						var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
						var/obj/Br = new/obj/HUD/B(usr.client)
						var/obj/Dec = new/obj/HUD/Dec(usr.client)
						var/obj/Lair = new/obj/HUD/Lair(usr.client)
						H.screen_loc = "4,14 to 14,4"
						O.screen_loc = "4,14"
						A.screen_loc = "14,14"
						B.screen_loc = "4,4"
						C.screen_loc = "14,4"
						D.screen_loc = "4,14 to 14,14"
						E.screen_loc = "4,4 to 14,4"
						F.screen_loc = "4,4 to 4,14"
						G.screen_loc = "14,4 to 14,14"
						usr.Text(usr,4,14,4,10,"--Build Menu--")
						Wall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"SilkWall")
						Trap.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StickyTrap")
						Post.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SilkPost")
						Cacoon.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Cacoon")
						Br.screen_loc = "5,5"
						usr.Text(usr,7,5,4,10,"SilkBridge")
						Dec.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Decorations")
						if(M.icon == 'SpiderQueenMature.dmi')
							Lair.screen_loc = "11,11"
							usr.Text(usr,13,11,4,10,"Lair")
					if(M.Spider == 0)
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/Walls(usr.client)
						var/obj/Floor = new/obj/HUD/Floors(usr.client)
						var/obj/Bridge = new/obj/HUD/Bridges(usr.client)
						var/obj/Trap = new/obj/HUD/Traps(usr.client)
						var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
						var/obj/Stations = new/obj/HUD/Stations(usr.client)
						var/obj/Farming = new/obj/HUD/Farming(usr.client)
						var/obj/Fire = new/obj/HUD/ClickFire(usr.client)
						H.screen_loc = "4,14 to 14,4"
						O.screen_loc = "4,14"
						A.screen_loc = "14,14"
						B.screen_loc = "4,4"
						C.screen_loc = "14,4"
						D.screen_loc = "4,14 to 14,14"
						E.screen_loc = "4,4 to 14,4"
						F.screen_loc = "4,4 to 4,14"
						G.screen_loc = "14,4 to 14,14"
						usr.Text(usr,4,14,4,10,"--Build Menu--")
						Wall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"Walls")
						Floor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"Floors")
						Bridge.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"Bridges")
						Trap.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Traps")
						Stairs.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Stairs")
						Stations.screen_loc = "11,11"
						usr.Text(usr,12,11,4,10,"Stations")
						Farming.screen_loc = "11,9"
						usr.Text(usr,12,9,4,10,"Farming")
						Fire.screen_loc = "11,7"
						usr.Text(usr,12,7,4,10,"CampFire")


mob/verb/Help()
	var/list/menu = new()
	menu += "Races"
	menu += "Cancel"
	var/Result = input("What information would you like to view?", "Choose", null) in menu
	if (Result != "Cancel")
		..()
	if (Result == "Races")
		var/list/menu2 = new()
		menu2 += "Goblins"
		menu2 += "Humans"
		menu2 += "Kobolds"
		menu2 += "Dwarfs"
		menu2 += "Spiders - Rare"
		menu2 += "Vampire - Rare"
		menu2 += "Cancel"
		var/Result2 = input("What information would you like to view?", "Choose", null) in menu2
		if (Result2 != "Cancel")
			..()
		if (Result2 == "Goblins")
			alert("Goblins : The Goblins are an agressive and paranoid race by nature, they have many enemies and few allies. Goblins, at most times, prefer creating massive castles or dungeons engraved into mountain sides, and like nothing more than fighting. It is not un-common for goblins to fight over territory and between them selves.")
			alert("Out of all the races in Dungeon Master, the Goblins could be the most balanced, with average strength and the advantage of quickness they make good warriors, they are also quite good at creating weapons and armours from metal, but unlike some other races are un-able to use gold or diamonds to craft with. Goblins live quite a long time, anywhere from 100 to 120 years of age. A major advantage for goblins is the fact that they eat their food raw. Like most races the goblins use pick axes to dig their dungeons.Goblins are one of the only races that can create potions.")

mob/verb/WayPoint()
	if(usr.User == 1)
		var/list/menu = new()
		menu += "Goto WayPoint"
		menu += "Goto WayPoint2"
		menu += "Goto WayPoint3"
		menu += "Set WayPoint"
		menu += "Set WayPoint2"
		menu += "Set WayPoint3"
		menu += "Cancel"
		var/Result = input("What Action Will You Choose?", "Choose", null) in menu
		if (Result != "Cancel")
			..()
		if (Result == "Goto WayPoint")
			usr.loc = usr.Waypoint
		if (Result == "Goto WayPoint2")
			usr.loc = usr.Waypoint2
		if (Result == "Goto WayPoint3")
			usr.loc = usr.Waypoint3
		if (Result == "Set WayPoint")
			usr.Waypoint = usr.loc
			usr << "Way Point Set!"
		if (Result == "Set WayPoint2")
			usr.Waypoint2 = usr.loc
			usr << "Way Point Set!"
		if (Result == "Set WayPoint3")
			usr.Waypoint3 = usr.loc
			usr << "Way Point Set!"
mob/verb/Reboot()
	set hidden = 1
	if(src.GM == 1)
		world << "<b><font color=red> World Rebooting!!"
		sleep(50)
		world.Reboot()
mob/verb/Restart()
	usr.Restarts()
mob/proc/Restarts()
	if(usr.Up == 1)
		usr.Close()
		usr.Up = 0
	if(usr.Restart == 1)
		return
	usr.Done = 0
	usr.Restart = 1
	var/choice2 = alert(usr, "Are you sure you want to restart?", "Choose", "No", "Yes", null)
	if (choice2 == null)
		usr.Restart = 0
		usr.Done = 1
	if (choice2 == "No")
		usr.Restart = 0
	if (choice2 == "Yes")
		usr.Function = null
		usr.Using = null
		usr.Waypoint = null
		usr.Waypoint2 = null
		usr.Waypoint3 = null
		if(client)
			for(var/mob/Monsters/M in usr.Selected)
				usr.Selected.Remove(M)

			for(var/mob/Monsters/M in world)
				if(M.Owner == usr)
					for(var/obj/DigAt/DD in world)
						if(DD.Owner == M.Owner)
							for(var/turf/T in DD.loc)
								if(T.density == 1)
									if(T.IsWall == 0)
										T.icon_state = "CaveWall"
								del(DD)
					for(var/obj/Items/I in M)
						if(I.Content3 == "Cage")
							I.loc = M.loc
					del(M)
			usr.HasQueen = 0
			usr.HasKing = 0
			usr.QueenLeader = null
			usr.KingLeader = null
			usr.UnitList = null
			usr.UnitList = list()
			usr.User = 0
			var/X
			var/Y
			X = rand(336,995)
			Y = rand(707,263)
			usr.loc = locate(X,Y,1)
			usr.density = 0
			if(usr.LoggedIn == 0)
				usr.LoggedIn = 1
			var/list/menu = new()
			if(usr.key == "Ginseng")
				usr.verbs+=typesof(/Admin/verb/)
			if("Spider" in usr.Rares)
				menu += "Spiders - Rare"
			if("Vampire" in usr.Rares)
				menu += "Vampire - Rare"
			if("Devourer" in usr.Rares)
				menu += "Devourer - Rare"
			if(usr.key == "Ginseng")
				menu += "DarkLord"
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
				usr.Restart = 0
				alert("Awoken after Two Thousand years in slumber, you have finally recovered and regenerated your body from wounds created all those years ago by the Gods that imprisoned you. Strong once more, you are now ready to break away from your cacoon and bring about a second coming of the dreaded Plague of Black Blight!")
				return
			if (Result == "Adventure Mode")
				usr.icon = null
				usr.User = 0
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
				B.Gender = "Male"
				B.HasWings = 1
				B.overlays += 'Wings.dmi'
				B.Age = 20
				B.name = "{[B.Owner]} Vampire"
				if(usr.key == "Ginseng")
					B.Level = 15
				for(var/turf/grounds/cavefloor/C in view(1,B))
					C.icon_state = "CaveFloor"
					C.CanDigAt = 0
					C.opacity = 0
					C.density = 0
				B.Birth()
				usr.Done = 1
				usr.User = 1
				alert("Awoken by an unknown force, you rise from your slumber once more. Sure that there is somthing a stir you decide to travel to the new lands that these mortals speak of. Not only will these new lands provide fresh victims but maybe they hold the answer to your awakening.")
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
				usr.UnitList += B
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
				usr.UnitList += B2
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
				usr.UnitList += B3
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
				alert("Lured to this land in the hopes of starting a dark dungeon you and your companions finally arive, it might be best to create a basic cave to get started with.")

		usr.Restart = 0

mob/proc/Plant2()
	for(var/mob/Monsters/M in oview(1,src))
		var/Chew = prob(75)
		if(Chew == 1)
			view() << "[src] spews corrosive posion spores into the air!!"
			M.BloodContent -= 25
			M.BloodLoss()
			M.LeftLungHP -= 15
			M.RightLungHP -= 15
	spawn(20) Plant2()
mob/proc/Plant1()
	for(var/mob/Monsters/M in oview(1,src))
		var/Chew = prob(75)
		if(Chew == 1)
			var/Arm = prob(50)
			if(Arm == 1)
				if(M.HasLeftArm == 1)
					if(M.WearingLeftArm == 0)
						M.HasLeftArm = 0
						M.LeftArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseLeftArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s left arm off!!"
						M.RemoveAllShields()
						M.RemoveAllLeft()
						for(var/obj/Items/Armours/Shields/S in M)
							if(S.suffix == "(Equiped)")
								S.suffix = null
								M.WearingShield = 0
								M.Defence -= S.Defence
								M.RemoveAllShields()
								S.loc = M.loc
								view() <<"<b><font color=red>[M]'s left arm is torn off!, they drop their shield!"
						if(M.HasRightArm == 0)
							M.Crippled = 1
			if(Arm == 0)
				if(M.HasRightArm == 1)
					if(M.WearingRightArm == 0)
						M.HasRightArm = 0
						M.RightArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseRightArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s right arm off!!"
						M.RemoveAllWeapons()
						M.RemoveAllRight()
						for(var/obj/Items/Weapons/S in M)
							if(S.suffix == "(Equiped)")
								S.suffix = null
								M.HoldingWeapon = 0
								M.WeaponDamageMin -= S.WeaponDamageMin
								M.WeaponDamageMax -= S.WeaponDamageMax
								M.RemoveAllWeapons()
								S.loc = M.loc
								view() <<"<b><font color=red>[M]'s right arm is torn off!, they drop their weapon!"
						if(M.HasLeftArm == 0)
							M.Crippled = 1
	spawn(20) Plant1()


mob/verb/Credits()
	set hidden = 1
	alert("Cseru1 - Icons. Savaril - Icons. Ginseng - Icons/Code")
mob/verb/SendMSG()
	var/T = input("Whisper to who?")as null|text
	if(!T)
		..()
	else
		for(var/mob/S in world)
			if(T == S.key)
				if(usr.ckey in S.IgnoreList)
					usr << "You are on [S]'s ignore list<br>"
					return
				var/reason
				reason = input("Send Message To?","Message",reason)
				S << "[usr] : [Safe_Guard(reason)]"
				usr << "[usr] : [Safe_Guard(reason)]"
mob/verb/Mute()
	set hidden = 1
	if(usr.GM == 1)
		var/T = input("Mute who??")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					var/reason
					reason = input("Reason","Your Name",reason)
					if(S.Muted == 0)
						S << "[reason]"
						world << "[S] was muted"
						S.Muted = 1
						return
					if(S.Muted == 1)
						world << "[S] was un-muted"
						S.Muted = 0
						return


mob/verb/CertainUnit()
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





mob/verb/DeclareLeader()
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Spider == 1)
			return
		if(M.HasKing == 1)
			var/choice = alert(usr, "Are you sure you want to remove [M] from being/king/queen?", "Choose", "Yes", "No", null)
			if (choice == "Yes")
				for(var/obj/Items/Armours/Helmets/Crown/GC in M)
					if(GC.suffix == "( Wearing )")
						M.Defence -= GC.Defence
						GC.suffix = "(Carrying)"
						M.HasKing = 0
						usr.HasKing = 0
						M.overlays -= /obj/Items/Armours/Helmets/Crown/
						M.overlays -= /obj/Items/Armours/Helmets/BoneCrown/
						M.MAXHP -= 100
						M.SpearSkill -= 10
						M.SwordSkill -= 10
						M.AxeSkill -= 10
						M.MaceSkill -= 10
						M.AxeSkill -= 10
						M.UnArmedSkill -=10
						M.ShieldSkill -= 10
						M.ArmourSkill -= 10
						M.ForgingSkill -= 10
						M.WoodCraftingSkill -= 10
						M.MetalCraftingSkill -= 10
						M.SkinningSkill -=10
						M.SmeltingSkill -= 10
						M.ButcherySkill -= 10
						M.LeatherCraftingSkill -= 10
						M.PosionSkill -= 10
						M.BoneCraftingSkill -= 10
						M.StoneCraftingSkill -= 10
						M.SneakingSkill -= 10
						M.LockPickingSkill -= 10
						M.CookingSkill -= 10
						M.FishingSkill -= 10
						M.name = "{[M.Owner]}"
						usr.KingLeader = null
						return
				for(var/obj/Items/Armours/Helmets/BoneCrown/BC in M)
					if(BC.suffix == "( Wearing )")
						M.Defence -= BC.Defence
						BC.suffix = "(Carrying)"
						M.HasKing = 0
						usr.HasKing = 0
						M.overlays -= /obj/Items/Armours/Helmets/Crown/
						M.overlays -= /obj/Items/Armours/Helmets/BoneCrown/
						M.MAXHP -= 100
						M.SpearSkill -= 10
						M.SwordSkill -= 10
						M.AxeSkill -= 10
						M.MaceSkill -= 10
						M.AxeSkill -= 10
						M.UnArmedSkill -=10
						M.ShieldSkill -= 10
						M.ArmourSkill -= 10
						M.ForgingSkill -= 10
						M.WoodCraftingSkill -= 10
						M.MetalCraftingSkill -= 10
						M.SkinningSkill -=10
						M.SmeltingSkill -= 10
						M.ButcherySkill -= 10
						M.LeatherCraftingSkill -= 10
						M.PosionSkill -= 10
						M.BoneCraftingSkill -= 10
						M.StoneCraftingSkill -= 10
						M.SneakingSkill -= 10
						M.LockPickingSkill -= 10
						M.CookingSkill -= 10
						M.FishingSkill -= 10
						M.name = "{[M.Owner]}"
						usr.KingLeader = null
						return
		if(M.HasQueen == 1)
			var/choice = alert(usr, "Are you sure you want to remove [M] from being/king/queen?", "Choose", "Yes", "No", null)
			if (choice == "Yes")
				for(var/obj/Items/Armours/Helmets/Crown/GC in M)
					if(GC.suffix == "( Wearing )")
						M.Defence -= GC.Defence
						GC.suffix = "(Carrying)"
				for(var/obj/Items/Armours/Helmets/BoneCrown/BC in M)
					if(BC.suffix == "( Wearing )")
						M.Defence -= BC.Defence
						BC.suffix = "(Carrying)"
				M.HasQueen = 0
				usr.HasQueen = 0
				world << "<b><font color=blue>[M] has stepped down as Queen from the throne of [usr]'s Kingdom!"
				M.overlays -= /obj/Items/Armours/Helmets/Crown/
				M.overlays -= /obj/Items/Armours/Helmets/BoneCrown/
				M.MAXHP -= 100
				M.SpearSkill -= 10
				M.SwordSkill -= 10
				M.AxeSkill -= 10
				M.MaceSkill -= 10
				M.AxeSkill -= 10
				M.UnArmedSkill -=10
				M.ShieldSkill -= 10
				M.ArmourSkill -= 10
				M.ForgingSkill -= 10
				M.WoodCraftingSkill -= 10
				M.MetalCraftingSkill -= 10
				M.SkinningSkill -=10
				M.SmeltingSkill -= 10
				M.ButcherySkill -= 10
				M.LeatherCraftingSkill -= 10
				M.PosionSkill -= 10
				M.BoneCraftingSkill -= 10
				M.StoneCraftingSkill -= 10
				M.SneakingSkill -= 10
				M.LockPickingSkill -= 10
				M.CookingSkill -= 10
				M.FishingSkill -= 10
				M.name = "{[M.Owner]}"
				usr.QueenLeader = null
				return
		if(M.UsesPosion == 1)
			for(var/obj/Items/Armours/Helmets/BoneCrown/C in M)
				if(C in M)
					var/choice = alert(usr, "Are you sure you want to make [M] your King/Queen?", "Choose", "Yes", "No", null)
					if (choice == "Yes")
						if(M.Gender == "Female")
							if(usr.HasQueen == 0)
								usr.HasQueen = 1
								M.Defence += C.Defence
								M.HasQueen = 1
								M.overlays += /obj/Items/Armours/Helmets/BoneCrown/
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PosionSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10

								usr.QueenLeader = M
								if(M.Gender == "Female")
									M.name = "Queen [M.name]"
								C.suffix = "( Wearing )"
								break
						if(M.Gender == "Male")
							if(usr.HasKing == 0)
								usr.HasKing = 1
								M.Defence += C.Defence
								M.HasKing = 1
								M.overlays += /obj/Items/Armours/Helmets/BoneCrown/
								usr.KingLeader = M
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PosionSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10
								if(M.Gender == "Male")
									M.name = "King [M.name]"
								C.suffix = "( Wearing )"
								break

				else
					usr << "Need a Gold Crown First!"
		if(M.UsesPosion == 0)
			for(var/obj/Items/Armours/Helmets/Crown/C in M)
				if(C in M)
					var/choice = alert(usr, "Are you sure you want to make [M] your King/Queen?", "Choose", "Yes", "No", null)
					if (choice == "Yes")
						if(M.Gender == "Female")
							if(usr.HasQueen == 0)
								usr.HasQueen = 1
								M.DieAge += M.DieAge / 2
								M.Defence += C.Defence
								M.HasQueen = 1
								M.overlays += /obj/Items/Armours/Helmets/Crown/
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PosionSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10

								usr.QueenLeader = M
								if(M.Gender == "Female")
									M.name = "Queen [M.name]"
								C.suffix = "( Wearing )"
								break
						if(M.Gender == "Male")
							if(usr.HasKing == 0)
								usr.HasKing = 1
								M.DieAge += M.DieAge / 2
								M.Defence += C.Defence
								M.HasKing = 1
								M.overlays += /obj/Items/Armours/Helmets/Crown/
								usr.KingLeader = M
								M.MAXHP += 100
								M.SpearSkill += 10
								M.SwordSkill += 10
								M.AxeSkill += 10
								M.MaceSkill += 10
								M.AxeSkill += 10
								M.UnArmedSkill +=10
								M.ShieldSkill += 10
								M.ArmourSkill += 10
								M.ForgingSkill += 10
								M.WoodCraftingSkill += 10
								M.MetalCraftingSkill += 10
								M.SkinningSkill +=10
								M.SmeltingSkill += 10
								M.ButcherySkill += 10
								M.LeatherCraftingSkill += 10
								M.PosionSkill += 10
								M.BoneCraftingSkill += 10
								M.StoneCraftingSkill += 10
								M.SneakingSkill += 10
								M.LockPickingSkill += 10
								M.CookingSkill += 10
								M.FishingSkill += 10
								if(M.Gender == "Male")
									M.name = "King [M.name]"
								C.suffix = "( Wearing )"
								break

				else
					usr << "Need a Gold Crown First!"

mob/verb/Who()
	var/PlayerCount
	usr << "<font color = red size = 4>((-Players Online-))"
	for (var/mob/M in world)
		if (M.client)
			PlayerCount ++
			usr << "--<font color = purple>[M]"
	usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"

mob/proc/Speak()
	spawn(25)
		src.CanSpeak = 1
mob/verb/WorldChat()
	if(no == 0)
		if(usr.WC == 1)
			usr.WC = 0
			world << "<font color = blue>[usr] Enters World Chat!"
			no = 1
			sleep(30)
			no = 0
			return
		if(usr.WC == 0)
			usr.WC = 1
			world << "<font color = blue>[usr] Leaves World Chat!"
			usr << "Press L to re-join!"
			no = 1
			sleep(30)
			no = 0
			return
mob/verb/GMChat()
	set hidden = 1
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
			if(usr.GM == 1)
				if(M.GM == 1)
					M << "<font color = yellow>[usr] says :[Safe_Guard(T)]<br>"
		usr.CanSpeak = 0
		usr.Speak()
		Log_chat("<font color = black>[usr] says :[T]<br>")
		return
mob/verb/WorldSay()
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
				if(M.WC == 0)
					M << "<font color = green>[usr] says :[Safe_Guard(T)]</html> <br>"
		usr.CanSpeak = 0
		usr.Speak()
		Log_chat("<font color = green>[usr] says :[T]<br>")
		return


mob/verb/GetCords()
	src << "[src.x],[src.y],[src.z]<br>"

mob/verb/Coords(varX as num, varY as num, varZ as num)
	if(usr)
		if(usr.Done == 1)
			if(usr.User == 1)
				set desc = "X,Y,Z"


				if(varX > world.maxx) // if the number they put in is higher than the map's highest point make it go as close as it can, that way they dont go off map and have to relog
					src.x = world.maxx
				else
					if(varX < 1) // if its less than one go to one since you cant have negative map points
						src.x = 1
				if(varY > world.maxy)
					src.y = world.maxy
				else
					if(varY < 1)
						src.y = 1
				if(varZ > world.maxz)
					src.z = world.maxz
				else
					if(varZ < 1)
						src.z = 1
					if(varZ > 1)
						src.z = 1
				src.loc = locate(varX,varY,varZ)
mob/verb/Zip()
	if(usr.User == 1)
		for(var/mob/Monsters/c in usr.Selected)
			usr.Selected.Remove(c)
			usr.client.images -= c.Star

mob/verb/Goto()
	if(usr.User == 1)
		for(var/mob/Monsters/c in usr.Selected)
			if(c.Wagon == 0)
				usr.loc = c.loc
mob/verb/Every()
	if(usr.User == 1)
		for(var/mob/Monsters/c in world)
			if(c.Escort == 0)
				if(c.InHole == 0)
					if(c.Owner == usr)
						if(c.CanBuild == 1)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(c in usr.Selected)
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

mob/verb/All()
	if(usr.User == 1)
		for(var/mob/Monsters/c in orange(usr))
			if(c.Escort == 0)
				if(c.CanBuild == 1)
					if(c.InHole == 0)
						if(c.Owner == usr)
							if(c.Sleeping == 0)
								if(c.Wagon == 0)
									if(c.Egg == 0)
										if(c in usr.Selected)
											..()
										else
											usr.Selected.Add(c)
											usr.client.images += c.Star

mob/verb/Interact()
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
								M.overlays += 'LizardTail.dmi'
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
							M.overlays -= 'LizardTail.dmi'
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
						M.Morphed = 0
						M.weightmax = -10
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
						M.WearingBack = 0
						M.IsMist = 0
						M.weightmax = M.Old
						M.Owner << "[M] turns solid again."
						M.Old = null
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
				if(M.Race == "Demon")
					return
				if(M.Race == "Gargoyle")
					return
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
							if(C.InHole == 1)
								if(M in view(1,C))
									view() << "<b><font color=red>[M] Rescues [C] from a trap"
									C.InHole = 0
									C.SneakingSkill +=1
									C.HasPersonIn = 0
									for(var/obj/Items/Traps/PitTrap/P in view(0,C))
										del(P)
mob/verb/Emote(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				view(M) << "<font color = blue>[M] [Safe_Guard(T)]"
				return
mob/verb/UnitSay(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Tame == 0)
				if(M.Wagon == 0)
					view(M) << "<font color = blue>[M] says :[Safe_Guard(T)]"
					return
mob/proc/Patrol()
	if(src.PatrolPoint1)
		if(src.PatrolPoint2)
			if(src.destination == null)
				src.destination = src.PatrolPoint1
			if(src.destination == src.PatrolPoint1)
				if(src.PatrolPoint1 in view(0,src))
					src.destination = src.PatrolPoint2
			if(src.destination == src.PatrolPoint2)
				if(src.PatrolPoint2 in view(0,src))
					src.destination = src.PatrolPoint1
			for(var/mob/Monsters/M in oview(6,src))
				if(M.destination == src)
					if(M.Wagon == 0)
						src.destination = M
						src.Target = M
				if(M.Owner == src.Owner)
					for(var/mob/Monsters/S in oview(6,M))
						if(S.destination == M)
							if(S.Body == 0)
								if(S.Wagon == 0)
									if(S.Drill == 0)
										src.destination = S
										src.Target = S
		else
			return
	else
		return
	spawn(20) Patrol()

mob/verb/Guard()
	var/list/menu17 = new()
	menu17 += "Agressive Mode On"
	menu17 += "Agressive Mode Off"
	menu17 += "Guard On"
	menu17 += "Guard Off"
	menu17 += "Set Patrol Points"
	menu17 += "Patrol On"
	menu17 += "Patrol Off"
	menu17 += "Cancel"
	var/Result17 = input("What Action Will You Choose?", "Choose", null) in menu17
	if (Result17 != "Cancel")
		..()
	if (Result17 == "Patrol On")
		for(var/mob/Monsters/M in usr.Selected)
			M.destination = null
			M.ContinuePatrol()
			M.Patrol()
	if (Result17 == "Patrol Off")
		for(var/mob/Monsters/M in usr.Selected)
			M.destination = null
			M.PatrolPoint1 = null
			M.PatrolPoint2 = null
	if (Result17 == "Set Patrol Points")
		for(var/mob/Monsters/M in usr.Selected)
			M.PatrolPoint1 = null
			M.PatrolPoint2 = null
			usr << "Click tile to place first patrol point<br>"
			usr.Function = "PatrolPoint1"
	if (Result17 == "Guard On")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 0)
					usr << "[M] is now guarding!"
					M.HomeLoc = M.loc
					M.OnGuard = 1
					M.MobAttack()
					M.MobReturnHome()


	if (Result17 == "Agressive Mode Off")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 1)
					usr << "[M] has stopped agressive guarding!"
					M.OnGuard = 0
					M.HomeLoc = null
					M.Target = null
	if (Result17 == "Agressive Mode On")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 0)
					usr << "[M] is now agressive guarding!"
					M.HomeLoc = M.loc
					M.OnGuard = 1
					M.AgressiveAttack()
					M.MobReturnHome()


	if (Result17 == "Guard Off")
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Wagon == 0)
				if(M.OnGuard == 1)
					usr << "[M] has stopped guarding!"
					M.OnGuard = 0
					M.HomeLoc = null
					M.Target = null



mob/proc/ContinuePatrol()
	if(src.PatrolPoint1)
		if(src.PatrolPoint2)
			if(src.Sleeping == 0)
				src.destination = src.PatrolPoint1
				src.Target = null
		else
			return
	else
		return
	spawn(350) ContinuePatrol()
mob/proc/MobReturnHome()
	if(src.OnGuard == 1)
		if(src.Sleeping == 0)
			src.destination = src.HomeLoc
			src.Target = null
	else
		return
	spawn(500) MobReturnHome()
mob/proc/AgressiveAttack()
	if(src.loc == src.HomeLoc)
		if(src.destination == src.HomeLoc)
			src.destination = null
	if(src.OnGuard)
		for(var/mob/Monsters/M in oview(6,src))
			if(M.Owner != src.Owner)
				if(M.Wagon == 0)
					if(src.destination == null)
						src.destination = M
						src.Target = M
	spawn(7) AgressiveAttack()

mob/proc/MobAttack()
	if(src.loc == src.HomeLoc)
		if(src.destination == src.HomeLoc)
			src.destination = null
	if(src.OnGuard)
		for(var/mob/Monsters/M in oview(6,src))
			if(M.destination == src)
				if(M.Wagon == 0)
					if(src.destination == null)
						src.destination = M
						src.Target = M
			if(M.Owner == src.Owner)
				for(var/mob/Monsters/S in oview(6,M))
					if(S.destination == M)
						if(src.destination == null)
							if(S.Body == 0)
								if(S.Wagon == 0)
									if(S.Drill == 0)
										src.destination = S
										src.Target = S


	spawn(7) MobAttack()
mob/proc/MobAttack2()
	if(src.OnGuard == 1)
		for(var/mob/Monsters/M in oview(5,src))
			if(M.Owner == src.Owner)
				..()
			if(src.Target == null)
				src.destination = M
				src.Target = M
	else
		return




	spawn(5) MobAttack2()

mob/proc/Attacks()
	if(src.Tame == 0)
		if(src.destination == null)
			for(var/mob/Monsters/M in oview(6,src))
				if(src.Wolf)
					if(M.Wolf == 0)
						if(M.Wagon == 0)
							src.destination = M




	else
		return
	spawn(10) Attacks()

mob/verb/dfdfgff()
	set hidden = 1
	return
	var/list/menu = new()
	for(var/mob/Monsters/A in usr.Selected)
		if(A.density == 1)
			if(A.Spider == 1)
				for(var/mob/Monsters/Wagon/W in usr.Selected)
					usr.Selected.Remove(W)
					usr.client.images -= W.Star
					usr.Selected.Remove(A)
					usr.client.images -= A.Star
					usr << "You cant build with a wagon selected!!!"
				menu += "Silk Contruction"
			if(A.Spider == 0)
				if(A.Chest == 0)
					menu += "WorkShops"
					menu += "Traps"
					menu += "Build Walls/Floors"
					menu += "Build Bridge"
					if(A.CanFarm == 1)
						menu += "Build FarmLand"
					menu += "Stairs"
	for(var/mob/Monsters/A in usr.Selected)
		if(A.CanDetail == 1)
			menu += "Detail"
	menu += "Cancel"
	var/Result = input("What Action Will You Choose?", "Choose", null) in menu
	if (Result != "Cancel")
		..()
	if (Result == "Build FarmLand")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/Shafts/Spade/S in M)
				for(var/turf/grounds/W in view(1,M))
					if(W.icon_state == "Grass")
						W.icon = 'Cave.dmi'
						W.icon_state = "FarmLand"
						W.name = "FarmLand"
						W.Detailed = 1
						return
			for(var/obj/Items/Shafts/WoodenSpade/S in M)
				for(var/turf/grounds/W in view(1,M))
					if(W.icon_state == "Grass")
						W.icon = 'Cave.dmi'
						W.icon_state = "FarmLand"
						W.name = "FarmLand"
						W.Detailed = 1
						return
	if (Result == "Build Bridge")
		for(var/mob/Monsters/M in usr.Selected)
			for(var/obj/Items/ores/stone/S in M)
				for(var/turf/grounds/waters/W in view(1,M))
					if(W.isbridge == 0)
						W.density = 0
						W.CanFish = 0
						W.isbridge = 1
						W.Cant = 1
						W.icon = 'Cave.dmi'
						W.icon_state = "Bridge"
						M.weight -= S.weight
						del(S)
						break
						return
				for(var/turf/grounds/lavas/W in view(1,M))
					if(W.isbridge == 0)
						W.density = 0
						W.isbridge = 1
						W.Cant = 1
						W.icon = 'Cave.dmi'
						W.icon_state = "LavaBridge"
						M.weight -= S.weight
						del(S)
						break
						return



	if (Result == "Silk Contruction")
		var/list/menu17 = new()
		for(var/mob/Monsters/A in usr.Selected)
			if(A.CanBuildSilk == 1)
				if(A.IsHunter == 0)
					if(A.WebContent >= 25)
						menu17 += "Hardened Silk Wall"
					if(A.WebContent >= 25)
						menu17 += "Silk Decoration"
					if(A.WebContent >= 25)
						menu17 += "Hardened Silk Bridge"
				if(A.WebContent >= 50)
					if(A.IsWorker == 0)
						menu17 += "Sticky Pit Trap"
				if(A.WebContent >= 75)
					menu17 += "Silk Training Post"
				if(A.WebContent >= 50)
					menu17 += "Cacoon"
			menu17 += "Cancel"
			var/Result17 = input("What Action Will You Choose?", "Choose", null) in menu17
			if (Result17 != "Cancel")
				..()
			if (Result17 == "Cacoon")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.WebContent >= 50)
						var/obj/Items/Traps/Cages/Cacoon/C = new
						C.loc = M.loc
						C.desc = "This is a cacoon, it is used by spiders to in-trap victims."
						M.WebContent -= 50
						return
			if (Result17 == "Sticky Pit Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						if(M.WebContent >= 50)
							M.CreatePit()
							M.WebContent -= 50
							break
			if (Result17 == "Silk Training Post")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						if(M.Spider == 1)
							if(M.WebContent >= 75)
								var/obj/Items/Furniture/Posts/SilkTrainingPost/P = new
								P.loc = M.loc
								M.WebContent -= 75
								M.weight -= W.weight
								P.HP = 3000
								del(W)
								break
								return
			if (Result17 == "Silk Decoration")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									var/D
									D = prob(50)
									if(D == 1)
										W.overlays += 'Decoration1.dmi'
									else
										W.overlays += 'Decoration2.dmi'
									M.WebContent -= 25
									break
									return
			if (Result17 == "Hardened Silk Bridge")
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						if(M.WebContent >= 25)
							for(var/turf/grounds/waters/W in view(1,M))
								if(W.isbridge == 0)
									W.density = 0
									W.CanFish = 0
									W.isbridge = 1
									W.icon = 'Spiders.dmi'
									W.icon_state = "Silk Bride"
									M.WebContent -= 25

			if (Result17 == "Hardened Silk Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									W.icon = 'Cave.dmi'
									W.icon_state = "SilkWall"
									W.name = "SilkWall"
									W.density = 1
									W.IsWall = 1
									M.WebContent -= 25
									W.CanDigAt = 1
									W.HP = 1000
									W.Detailed = 1
									break
									return

	if (Result == "Stairs")
		for(var/mob/Monsters/A in usr.Selected)
			var/list/menu13 = new()
			for(var/obj/Items/ores/stone/s in A)
				menu13 += "Down"
				menu13 += "Up"
			menu13 += "Cancel"
			var/Result13 = input("What Action Will You Choose?", "Choose", null) in menu13
			if (Result13 != "Cancel")
				..()
			if (Result13 == "Up")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(W.Cant == 1)
									if(W.GoesTo == null)
										if(M.Kobold == 1)
											W.icon = 'Cave.dmi'
											W.icon_state = "KoboldUp"
											W.Detailed = 1
										else
											W.icon = 'Cave.dmi'
											W.icon_state = "Up"
											W.Detailed = 1
										W.GoesTo = locate(W.x,W.y,W.z-1)
										for(var/mob/Monsters/Wagon/E in view(1,M))
											E.loc = W.GoesTo
										M.loc = W.GoesTo
										usr.loc = M.loc
										for(var/turf/grounds/W2 in view(0,M))
											if(W2.GoesTo == null)
												if(M.Kobold == 1)
													W2.overlays += /obj/Hole/
												else
													W2.icon = 'Cave.dmi'
													W2.icon_state = "Stairs"
												W2.density = 0
												W2.CanDigAt = 0
												W2.opacity = 0
												W2.Detailed = 1
												W2.Cant = 1
												W2.GoesTo = locate(W2.x,W2.y,W2.z+1)
										del(S)
			if (Result13 == "Down")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(W.Cant == 0)
									if(W.GoesTo == null)
										if(M.Kobold == 1)
											W.overlays += /obj/Hole/
											W.Detailed = 1
										else
											W.icon = 'Cave.dmi'
											W.icon_state = "Stairs"
											W.Detailed = 1
										W.GoesTo = locate(W.x,W.y,W.z+1)
										for(var/mob/Monsters/Wagon/E in view(1,M))
											E.loc = W.GoesTo
										M.loc = W.GoesTo
										usr.loc = M.loc
										for(var/turf/grounds/W2 in view(0,M))
											if(W2.GoesTo == null)
												if(M.Kobold == 1)
													W2.icon = 'Cave.dmi'
													W2.icon_state = "KoboldUp"
												else
													W2.icon = 'Cave.dmi'
													W2.icon_state = "Up"
												W2.density = 0
												W2.CanDigAt = 0
												W2.opacity = 0
												W2.Detailed = 1
												W2.Cant = 1
												W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
										del(S)
	if (Result == "Build Walls/Floors")
		for(var/mob/Monsters/B in usr.Selected)
			var/list/menu12 = new()
			for(var/obj/Items/ores/stone/s in B)
				menu12 += "Stone Wall"
			menu12 += "Stone Floor"
			for(var/obj/Items/ores/stone/s in B)
				menu12 += "Secret Wall"
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Kobold == 1)
					for(var/obj/Items/Bones/Bones/s in B)
						menu12 += "Bone Wall"
					menu12 += "Bone Floor"
				if(M.Vampire == 1)
					for(var/obj/Items/Bones/Bones/s in B)
						menu12 += "Bone Wall"
				if(M.Human == 1)
					for(var/obj/Items/woods/wood/s in B)
						menu12 += "Wooden Wall"
					menu12 += "Wooden Floor"
			menu12 += "Destroy Floor"
			menu12 += "Cancel"
			var/Result12 = input("What Action Will You Choose?", "Choose", null) in menu12
			if (Result12 != "Cancel")
				..()
			if (Result12 == "Destroy Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(W.Detailed == 1)
								W.icon_state = "CaveFloor"
								W.name = "Floor"
								W.density = 0
								W.Detailed = 0
								return
			if (Result12 == "Stone Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							W.icon_state = "DetailedFloor"
							W.name = "DetailedFloor"
							W.density = 0
							W.Detailed = 1
							return

			if (Result12 == "Wooden Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Human == 1)
								W.icon_state = "WoodFloor"
								W.name = "WoodFloor"
								W.density = 0
								W.Detailed = 1
								return

			if (Result12 == "Secret Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								W.icon_state = "CaveWall"
								W.name = "SecretWall"
								W.HP += 3000
								W.CanDigAt = 1
								M.weight -= S.weight
								M.StoneCraftingSkill += 1
								W.density = 1
								W.IsWall = 1
								W.opacity = 1
								W.Detailed = 1
								del(S)
								break
								return
			if (Result12 == "Wooden Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Wagon == 1)
									W.icon_state = "WoodWall"
									W.name = "WoodWall"
									W.HP += 1000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Human == 1)
									W.icon_state = "WoodWall"
									W.name = "WoodWall"
									W.HP += 1000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.WoodCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return

			if (Result12 == "Bone Floor")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/grounds/W in view(0,M))
						if(W.density == 0)
							if(M.Kobold == 1)
								W.icon_state = "BoneFloor"
								W.name = "BoneFloor"
								W.density = 0
								W.Detailed = 1
								return
			if (Result12 == "Bone Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Bones/Bones/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Kobold == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Wagon == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Vampire == 1)
									W.icon_state = "Bone Wall"
									W.name = "Bone Wall"
									W.HP += 1500
									W.CanDigAt = 1
									M.weight -= S.weight
									M.BoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return

			if (Result12 == "Stone Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(0,M))
							if(W.density == 0)
								if(M.Dwarf == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.IsWall = 1
									W.opacity = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Goblin == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Human == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Wagon == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
								if(M.Vampire == 1)
									W.icon_state = "DetailedWall"
									W.name = "DetailedWall"
									W.HP += 3000
									W.CanDigAt = 1
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									W.density = 1
									W.opacity = 1
									W.IsWall = 1
									W.Detailed = 1
									del(S)
									break
									return
	if (Result == "Detail")
		var/list/menu10 = new()
		for(var/mob/Monsters/Q in usr.Selected)
			for(var/obj/Items/ores/stone/ST in Q)
				menu10 += "Cave Wall"
			menu10 += "Cancel"
			var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
			if (Result10 != "Cancel")
				..()
			if (Result10 == "Cave Wall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.density == 1)
								if(W.Detailed == 0)
									if(M.Vampire == 1)
										W.icon_state = "DetailedWall"
										W.name = "DetailedWall"
										W.Detailed = 1
										W.HP += 3000
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										W.IsWall = 1
										del(S)
										break
										return
									if(M.Dwarf == 1)
										W.icon_state = "DetailedWall"
										W.name = "DetailedWall"
										W.Detailed = 1
										W.HP += 1500
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										W.IsWall = 1
										del(S)
										break
										return
									if(M.Goblin == 1)
										W.icon_state = "DetailedWall"
										W.Detailed = 1
										W.name = "DetailedWall"
										W.HP += 1500
										M.weight -= S.weight
										W.IsWall = 1
										M.StoneCraftingSkill += 1
										del(S)
										break
										return
									if(M.Wagon == 1)
										W.icon_state = "DetailedWall"
										W.Detailed = 1
										W.name = "DetailedWall"
										W.HP += 1500
										M.weight -= S.weight
										W.IsWall = 1
										M.StoneCraftingSkill += 1
										del(S)
										break
										return


	if (Result == "Traps")
		for(var/mob/Monsters/Q in usr.Selected)
			var/list/menu9 = new()
			menu9 += "Pit Trap"
			menu9 += "Stone Fall Trap"
			menu9 += "Cancel"
			var/Result9 = input("What Action Will You Choose?", "Choose", null) in menu9
			if (Result9 != "Cancel")
				..()
			if (Result9 == "Stone Fall Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a stone fall trap, it will fall on anyone who nears it.")
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/StoneTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateStone()
							M.weight -= W.weight
							del(W)
							break
			if (Result9 == "Pit Trap")
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreatePit()
							M.weight -= W.weight
							del(W)
							break
	if (Result == "WorkShops")
		for(var/mob/Monsters/Q in usr.Selected)
			var/list/menu2 = new()
			for(var/obj/Items/woods/wood/w in Q)
				menu2 += "LeatherCrafting"
				menu2 += "Carpentry"
				menu2 += "Camp Fire"
				if(Q.Goblin == 1)
					menu2 += "Potion Station"
				if(Q.Human == 1)
					menu2 += "Potion Station"
			for(var/obj/Items/ores/stone/s in Q)
				if(Q.Goblin == 1)
					menu2 += "Glass Forge"
				if(Q.Human == 1)
					menu2 += "Glass Forge"
				menu2 += "Smelter"
				menu2 += "Forge"
				menu2 += "Masonary"
			for(var/mob/Monsters/B in usr.Selected)
				if(B.Carn == 0)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "Kitchen"
				if(B.Kobold == 0)
					for(var/obj/Items/ores/stone/s in Q)
						menu2 += "GemCrafting"
				if(B.MakesBoneCraft == 1)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "BoneCrafting"
			for(var/mob/Monsters/B in usr.Selected)
				if(B.UsesPosion == 1)
					for(var/obj/Items/woods/wood/w in Q)
						menu2 += "PosionExtractionStation"
			menu2 += "Cancel"
			var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
			if (Result2 != "Cancel")
				..()
			if (Result2 == "GemCrafting")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a gem crafting station, it can be used to craft un-cut gems into something more intresting")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateGem()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Glass Forge")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a glass forge, it can be used to create items from glass.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateGlass()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Masonary")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a masonary station, it can be used to make stone items and statues")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMasonary()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Potion Station")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a potion station, it can be used to make various potions.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePotion()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "LeatherCrafting")
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a leather crafting station, it can be used to make leather armour, sheets and clothes")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateWorkShopLeather()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Camp Fire")
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a camp fire, it can be used to cook with.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							var/mob/WorkShops/CampFires/Fire/F = new
							F.loc = M.loc
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Kitchen")
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a kitchen, take un-cooked meat here to cook it.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateKit()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Carpentry")
				var/list/menu4 = new()
				menu4 += "Create"
				menu4 += "Info"
				menu4 += "Cancel"
				var/Result4 = input("What Action Will You Choose?", "Choose", null) in menu4
				if (Result4 != "Cancel")
					..()
				if (Result4 == "Info")
					alert("This is a carpentry crafting station, it can be used to make lots of things from wood")
					return
				if (Result4 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateCarpentry()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Smelter")
				var/list/menu5 = new()
				menu5 += "Create"
				menu5 += "Info"
				menu5 += "Cancel"
				var/Result5 = input("What Action Will You Choose?", "Choose", null) in menu5
				if (Result5 != "Cancel")
					..()
				if (Result5 == "Info")
					alert("This is a smelter  station, it can be used to create Ingots for armour and weapon creation")
					return
				if (Result5 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateSmelter()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "Forge")
				var/list/menu6 = new()
				menu6 += "Create"
				menu6+= "Info"
				menu6 += "Cancel"
				var/Result6 = input("What Action Will You Choose?", "Choose", null) in menu6
				if (Result6 != "Cancel")
					..()
				if (Result6 == "Info")
					alert("This is a forge  station, it can be used to create armour and weapons")
					return
				if (Result6 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateForge()
							M.weight -= W.weight
							del(W)
							break
			if (Result2 == "BoneCrafting")
				for(var/mob/Monsters/M2 in usr.Selected)
					if(M2.MakesBoneCraft == 1)
						var/list/menu7 = new()
						menu7 += "Create"
						menu7+= "Info"
						menu7 += "Cancel"
						var/Result7 = input("What Action Will You Choose?", "Choose", null) in menu7
						if (Result7 != "Cancel")
							..()
						if (Result7 == "Info")
							alert("This is a Bone crafting station, it can be used to create bone crafts, weapons and armours")
							return
						if (Result7 == "Create")
							for(var/mob/Monsters/M in usr.Selected)
								for(var/mob/WorkShops/LW in view(1,M))
									usr << "Too close to other station!"
									return
								for(var/obj/Items/woods/wood/W in M)
									M.CreateBone()
									M.weight -= W.weight
									del(W)
									break
			if (Result2 == "PosionExtractionStation")
				var/list/menu8 = new()
				menu8 += "Create"
				menu8+= "Info"
				menu8 += "Cancel"
				var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
				if (Result8 != "Cancel")
					..()
				if (Result8 == "Info")
					alert("This is a posion extraction station, it can be used to extract posion from glands")
					return
				if (Result8 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr << "Too close to other station!"
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePosion()
							M.weight -= W.weight
							del(W)
							break
mob/proc/CreatePotion()
	var/mob/WorkShops/PotionStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsPW = 1
	L.name = "Potion Station"
	L.overlays += /obj/WSoverlays/Posion/
	var/mob/WorkShops/PotionStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsPW = 1
	R.name = "Potion Station"
	src.WoodCraftingSkill += 1
mob/proc/CreateBone()
	var/mob/WorkShops/BoneCraft/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.BoneCraft = 1
	L.name = "BoneCraftingStation"
	L.overlays += /obj/WSoverlays/Bone/
	var/mob/WorkShops/BoneCraft/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.BoneCraft = 1
	R.name = "BoneCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreatePosion()
	var/mob/WorkShops/PosionStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Posion = 1
	L.name = "PosionStation"
	L.overlays += /obj/WSoverlays/Posion/
	var/mob/WorkShops/PosionStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Posion = 1
	R.name = "PosionStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateWorkShopLeather()
	var/mob/WorkShops/LeatherWorks/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.WorkShop = 1
	L.name = "LeatherCraftingStation"
	L.overlays += /obj/WSoverlays/Leather/
	var/mob/WorkShops/LeatherWorks/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.WorkShop = 1
	R.name = "LeatherCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateCarpentry()
	var/mob/WorkShops/Carpentry/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Carpentry = 1
	L.name = "CarpentryCraftingStation"
	L.overlays += /obj/WSoverlays/Carpentry/
	var/mob/WorkShops/Carpentry/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Carpentry = 1
	R.name = "CarpentryCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateSmelter()
	var/mob/WorkShops/Smelters/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Smelter = 1
	L.name = "SmelterStation"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/Smelters/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Smelter = 1
	R.name = "SmelterStation"
	src.StoneCraftingSkill += 1
mob/proc/CreatePit()
	var/obj/Items/Traps/PitTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.name = "Pit"
	src.StoneCraftingSkill += 1
mob/proc/CreateRib()
	var/obj/Items/Traps/RibTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Rib Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateBoneAlarm()
	var/obj/Items/Traps/BoneAlarm/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Bone Alarm Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateBST()
	var/obj/Items/Traps/BST/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Bone Spike Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateStone()
	var/obj/Items/Traps/StoneTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Stone Fall Trap"
	src.StoneCraftingSkill += 1
mob/proc/CreateForge()
	var/mob/WorkShops/Forge/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Forge = 1
	L.name = "ForgeStation"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Forge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Forge = 1
	R.name = "ForgeStation"
	src.StoneCraftingSkill += 1
mob/proc/CreateKit()
	var/mob/WorkShops/Kitchen/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Kit = 1
	L.name = "Kitchen"
	L.overlays += /obj/WSoverlays/Kitchen/
	var/mob/WorkShops/Kitchen/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Kit = 1
	R.name = "Kitchen"
	src.WoodCraftingSkill += 1
mob/proc/CreateGem()
	var/mob/WorkShops/GemCutter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsGem = 1
	L.name = "GemCutter"
	L.overlays += /obj/WSoverlays/Gem/
	var/mob/WorkShops/GemCutter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsGem = 1
	R.name = "GemCutter"
	src.StoneCraftingSkill += 1

mob/proc/CreateMasonary()
	var/mob/WorkShops/Masonary/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Mason = 1
	L.name = "Masonary"
	L.overlays += /obj/WSoverlays/Masonary/
	var/mob/WorkShops/Masonary/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Mason = 1
	R.name = "Masonary"
	src.StoneCraftingSkill += 1
mob/proc/CreateMelter()
	var/mob/WorkShops/Melter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.Mason = 1
	L.name = "Melter"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Melter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.Mason = 1
	R.name = "Melter"
	src.StoneCraftingSkill += 1
mob/proc/CreateGlass()
	var/mob/WorkShops/GlassForge/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.IsGlass = 1
	L.name = "Glass Forge"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/GlassForge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.IsGlass = 1
	R.name = "Glass Forge"
	src.StoneCraftingSkill += 1



mob/proc/CheckBody()
	if(ismob(src.Content))
		var/mob/m = src.Content
		if(m.icon == 'Skeleton.dmi')
			var/obj/Items/Bones/Bones/C = new
			C.loc = src.loc
			C.name = "[C]'s Bones"
			var/obj/Items/Bones/Skull/C2 = new
			C2.loc = src.loc
			C2.name = "[C]'s Skull"
			del(src)
			del(m)
			return

		if(m.Race == "Plant")
			src.Race = "Plant"
			src.icon_state = "Dead1"
		if(m.Race == "Plant2")
			src.Race = "Plant2"
			src.icon_state = "Dead2"
		if(m.Kobold)
			src.Kobold = 1
		if(m.LizardMan)
			src.LizardMan = 1
		if(m.FrogMan)
			src.FrogMan = 1
		if(m.Goblin)
			src.Goblin = 1
		if(m.Dwarf)
			src.Dwarf = 1
		if(m.Race == "Demon")
			src.Race = "Demon"
			if(m.density == 0)
				m.icon = 'Demon.dmi'
				m.LimbLoss()
		if(m.Human)
			src.Human = 1
			if(m.Black)
				src.Black = 1
		if(m.Bug)
			src.Posionus = 1
			src.Bug = 1
			src.weight = 10
		if(m.Deer)
			src.Deer = 1
		if(m.Race == "Gremlin")
			src.Race = "Gremlin"
		if(m.Race == "Orc")
			src.Race = "Orc"
		if(m.Race == "Gargoyle")
			src.Race = "Gargoyle"
		if(m.Spider)
			src.Spider = 1
		if(m.Vampire)
			src.Vampire = 1
			if(m.density == 0)
				m.icon = 'Vampire.dmi'
				m.LimbLoss()
			src.icon = m.icon
			src.icon_state = m.icon_state
			src.icon = turn(src.icon,90)
		if(m.Wolf)
			src.Wolf = 1
		if(m.Beatle)
			src.Beatle = 1
		if(m.Mole)
			src.Mole = 1
mob/proc/Death()
	if(src.Wagon == 0)
		if(src.GoingToDie)
			src.destination = null
			if(src.Killer && ismob(src.Killer))
				var/mob/K = src.Killer
				if(K.Owner && ismob(K.Owner))
					var/mob/KO = K.Owner
					KO.Kills += 1
					KO.Points += src.Strength / 10 + src.Agility / 10 + src.Level / 10 + 1
			if(src.IsTree)
				var/obj/Items/woods/wood/MET = new
				MET.loc = src.loc
				var/obj/Items/Food/Fungases/Fungas/F = new
				F.loc = src.loc
				var/obj/Items/Seeds/TowerCapSeed/S1 = new
				S1.loc = src.loc
				var/obj/Items/Seeds/TowerCapSeed/S2 = new
				S2.loc = src.loc
				del(src)
				return
			if(ismob(src.Owner))
				var/mob/S = src.Owner
				S.UnitList -= src
				if(src.HasQueen)
					if(S.HasQueen)
						S.HasQueen = 0
						S.QueenLeader = null
				if(src.HasKing)
					if(S.HasKing)
						S.HasKing = 0
						S.KingLeader = null
				for(var/mob/Monsters/m in S.UnitList)
					if(m.InfectedBy == src)
						m.Owner << "[src] has died and so has [m]!"
						m.DeathType = "their master dieing"
						m.Killer = "[src]"
						m.GoingToDie = 1
						m.Death()



			for(var/obj/A in src)
				A.loc = src.loc
				A.suffix = null
				A.Owner = null
				if(A.Content3 == 0)
					A.DeleteItem()
			for(var/mob/A in src)
				A.loc = src.loc
				A.suffix = null
				A.Owner = null
			var/mob/Body/B = new
			B.icon = src.icon
			B.icon_state = src.icon_state
			B.loc = src.loc
			B.icon = turn(B.icon,90)
			B.Dead = 1
			B.Content = src
			B.name = "[src]'s Body"
			if(src.OnFire)
				if(src.HumanParts)
					B.icon = 'DamagedParts.dmi'
					B.Skinned = 1
			B.CheckBody()
			for(var/obj/DigAt/DD in world)
				if(DD.Owner == src.Owner)
					del(DD)
			if(src.Infects)
				var/Rise = prob(33)
				if(Rise)
					src.CreateZombie()
					del(B)
					return
			if(src.Bug == 0)
				if(src.Wolf == 0)
					if(src.Deer == 0)
						if(src.Mole == 0)
							if(src.Beatle == 0)
								if(src.Race != "Plant")
									if(src.Race != "Plant2")
										Legends = {"[Legends]<p>[src] - born in [src.Born] and died [Date],[src] was [Age] when they died. [src] had a fighting rank of [src.Level]. was killed by [src.Killer] and died from [src.DeathType]"}
			if(src.NPC)
				for(var/mob/Monsters/M in oview(1,src))
					if(M.destination == src)
						M.destination = null
				src.NPC = 0
				src.Alive = 0
				src.Freeze = 1
				src.destination = null
				src.InHole = 1
				src.loc = locate(0,0,0)
				return
			del(src)


mob/proc/LegendView()
	src << browse(Legends)
mob/verb/Legends()
	usr.LegendView()
obj/proc/Death()
	if(src.HP <= 0)
		del(src)


mob/proc/FightSound()
	spawn(5)
		if(src.HoldingWeapon)
			var/S = rand(1,3)
			if(S == 1)
				view() << '1.ogg'
			if(S == 2)
				view() << '2.ogg'
			if(S == 3)
				view() << '3.ogg'

mob/proc/FightSound2()
	spawn(5)
		if(src.HoldingWeapon == 0)
			var/S = rand(1,3)
			if(S == 1)
				view() << 'P1.ogg'
			if(S == 2)
				view() << 'P2.ogg'
			if(S == 3)
				view() << 'P3.ogg'






