atom/proc/Safe()
	spawn(400) src.IsWood = 1



turf/proc/SparkleGlow()
	src.overlays += /obj/sparkle/
	spawn(15) src.overlays -= /obj/sparkle/
turf/proc/ForceField()
	if(src.density == 0)
		for(var/mob/Monsters/M in src) return
		src.overlays += /obj/forcefield/
		src.density = 1
		spawn(300)
			src.overlays -= /obj/forcefield/
			src.density = 0
turf/proc/ForestGrowth()
	var/GrowGrow = prob(4)
	if(GrowGrow)
		for(var/turf/T in range(5,src))
			var/GrowProb = prob(4)
			if(GrowProb == 1)
				if(T.icon_state == "Desert" || T.icon_state == "Grass" || T.Content == "Marsh")
					for(var/obj/Items/Seeds/S in view(0,T))
						return
					var/obj/Items/Seeds/TreeSeed/A1 = new()
					A1.loc = T
					if(T.icon_state == "Grass")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.icon_state == "Desert")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
					if(T.Content == "Marsh")
						A1.suffix = "(Planted)"
						A1.icon_state = ""
						A1.TreeGrow()
						return
	else
		return
turf/proc/MeteorStrike()
	switch(rand(1,8))
		if(1)
			src.icon = 'Lava.dmi'
			src.icon_state = "Lava"
			src.CanFish = 0
			src.Detailed = 0
			src.Content3 = "Lava"
			src.Content3 = "Lava"
			src.OIcon = "Lava"
			src.Cant = 1
			src.density = 1
			src.opacity = 0
			src.name = "Lava"
			src.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
		if(2)
			src.name = "cavefloor"
			src.icon = 'Cave.dmi'
			src.icon_state = "CaveFloor"
			src.CanDigAt = 0
			src.density = 0
			src.CanFish = 0
			src.Detailed = 0
			src.Content3 = null
			src.opacity = 0
			src.Sky = 1
		if(3)
			src.CanFish = 0
			src.Content3 = null
			src.name = "Mountain"
			src.icon = 'Cave.dmi'
			src.icon_state = "CaveWall"
			src.density = 1
			src.CanDigAt = 1
			src.HP = 100
			src.opacity = 1
			src.Cant = 0
			src.Sky = 1
			src.OIcon = "CaveFloor"
		if(4)
		if(5) if(prob(10)) new/obj/Items/gems/UnCutDiamond(loc)
		if(6) if(prob(10)) new/obj/Items/gems/UnCutRuby(loc)
		if(7) if(prob(10)) new/obj/Items/gems/UnCutEmerald(loc)
		if(8)
			for(var/mob/Monsters/MM in view(0,src)) MM.Fire()
			for(var/turf/grounds/GG in view(0,src)) GG.Fire()
mob/proc/FlameAttack()
	if(src.destination in view(1,src))
		view() << "[src] breathes fire over [src.destination]"
		var/obj/Fire/F = new
		F.loc = src.loc
		F.dir = src.dir
	spawn(750) FlameAttack()
obj/proc/Flame() if(IsWood)
	if(ismob(src)) return
	for(var/atom/T in view(2,src))
		if(T.OnFire == 0)
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
obj/proc/DeleteSmoke() spawn(30) del(src)
obj/proc/SmokeMove() spawn() while(1)
	step_rand(src)
	sleep(10)
atom/proc/Smoke()
	if(src.OnFire)
		var/obj/Smoke/S = new
		S.loc = locate(src.x,src.y,src.z)
		S.dir = NORTH
	else
		return
	spawn(50) Smoke()
atom/proc/Fire() if(IsWood)
	var/FireResist = 0
	if(ismob(src))
		var/mob/M = src
		switch(M.Race)
			if("Dragon") return
			if("Gargoyle") return
		if(M.SubRace == "HalfDemon") return
	for(var/obj/Items/Equipment/Armour/A in src) if(A.suffix == "(Equipped)") if(A.Race == "Demon") FireResist += 20
	if(prob(FireResist)) return
	if(!src.OnFire)
		src.overlays += 'Fire.dmi'
		src.OnFire = 1
	else
		if(src.IsWood)
			if(src.icon_state == "WoodenDoor")
				del src
				return
			if(src.icon_state == "Open")
				del src
				return
			if(src.icon_state == "Wooden Chest")
				for(var/obj/Items/I in src)
					I.suffix = null
					I.loc = src.loc
				del src
				return
			if(src.Wagon == 1)
				for(var/obj/Items/I in src)
					I.suffix = null
					I.loc = src.loc
				del src
				return
			src.Fuel -= 10
			if(ismob(src))
				var/mob/M = src
				M.LeftLegHP -= 18
				M.RightLegHP -= 18
				M.RightArmHP -= 18
				M.LeftArmHP -= 18
				M.BloodContent -= 50
				M.LeftLeg = "Burned"
				M.RightLeg = "Burned"
				M.RightArm = "Burned"
				M.LeftArm = "Burned"
				M.BloodLoss()
				spawn(150)
					for(var/turf/grounds/W in view(1,src))
						if(W.icon_state == "water")
							src.OnFire = 0
							src.overlays -= 'Fire.dmi'
							src.Fuel = 100
							src.IsWood = 0
							src.Safe()
					if(src.OnFire == 1)
						src.Fuel = 100
						src.OnFire = 0
						src.overlays -= 'Fire.dmi'
						src.IsWood = 0
						for(var/mob/Monsters/MKM in view(0,src))
							if(MKM == src)
								view(MKM) << "[MKM] burns to death!"
								MKM.GoingToDie = 1
								MKM.Killer = "Fire"
								MKM.DeathType = "Burned To Death"
								MKM.Death()
								return
	spawn(200)
		for(var/atom/T in view(2,src))
			if(T.OnFire == 0)
				if(T.IsWood)
					if(ismob(src))
						..()
					else
						if(T.Tree)
							T.overlays -= /obj/Trees/leaves3x2
							T.overlays -= /obj/Trees/leaves2x2
							T.overlays -= /obj/Trees/leaves1x2
							T.overlays -= /obj/Trees/leaves1x1
							T.overlays -= /obj/Trees/leaves2x1
							T.overlays -= /obj/Trees/leaves3x1
						var/catchchance = prob(50)
						if(catchchance)
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
	spawn(200)
		Fire()
		return
mob/verb/MusicOff() usr << sound(null)
mob/verb/StopAll() for(var/mob/Monsters/M in usr.Selected)
	M.destination = null
	M.Target = null
	if(M.BowOn == 1 && M.PracticeSkill == 0)
		M.PracticeSkill = 1
		spawn(50)
			M.BowOn = 0
			M.PracticeSkill = 0
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
			if(T == S.name)
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
	for(var/mob/Monsters/M in usr.Selected) if(M.IsMist)
		usr << "Cant build while misted!"
		return
	if(usr.Up == 0)
		usr.Up = 1
		Building(usr)
		return
	else
		usr.Up = 0
		for(var/obj/HUD/H in usr.client.screen)
			del(H)
mob/verb/MindFlayer()
	set hidden = 1
	for(var/mob/Monsters/M in usr.Selected)
		if(M.SubRace != "Illithid")
			usr << "One or more of the units you have selected can not use mental abilities."
			return
		if(M.IsMist  == 1)
			usr << "Cant use while misted!"
			return
	if(usr.Up == 0)
		usr.Up = 1
		MindPower(usr)
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
				var/obj/Kit = new/obj/HUD/ClickKit(usr.client)
				var/obj/Let = new/obj/HUD/ClickLet(usr.client)
				var/obj/Gem = new/obj/HUD/ClickGem(usr.client)
				var/obj/Bone = new/obj/HUD/ClickBone(usr.client)
				var/obj/Melt = new/obj/HUD/ClickMelt(usr.client)
				H.screen_loc = "3,17 to 17,4"
				usr.Text(usr,3,17,4,13,"--Work Stations Menu--")
				switch(M.Race)
					if("Lizardman","Elf","Frogman")
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
					if("Goblin","Svartalfar")
						Smelt.screen_loc = "4,16"
						usr.Text(usr,6,16,4,10,"Smelter - Stone")
						Forge.screen_loc = "4,14"
						usr.Text(usr,6,14,4,10,"Forge - Stone")
						Carp.screen_loc = "4,12"
						usr.Text(usr,6,12,4,10,"Carpentry - Wood")
						Potion.screen_loc = "4,10"
						usr.Text(usr,6,10,4,10,"PotionStation - Wood")
						Mas.screen_loc = "4,8"
						usr.Text(usr,6,8,4,10,"Masonary - Stone")
						Let.screen_loc = "4,6"
						usr.Text(usr,6,6,4,10,"Leather - Wood")
						Gem.screen_loc = "11,16"
						usr.Text(usr,13,16,4,10,"GemCraft - Stone")
						Pos.screen_loc = "11,14"
						usr.Text(usr,13,14,4,10,"AlchemyStation - Wood")
						Bone.screen_loc = "11,12"
						usr.Text(usr,13,12,4,10,"BoneCraft - Wood")
						Melt.screen_loc = "11,10"
						usr.Text(usr,13,10,4,10,"Melter - Stone")
					if("Vampire","Gargoyle","Demon")
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
					if("Dwarf")
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
					if("Human")
						Smelt.screen_loc = "4,16"
						usr.Text(usr,6,16,4,10,"Smelter - Stone")
						Forge.screen_loc = "4,14"
						usr.Text(usr,6,14,4,10,"Forge - Stone")
						Carp.screen_loc = "4,12"
						usr.Text(usr,6,12,4,10,"Carpentry - Wood")
						Potion.screen_loc = "4,10"
						usr.Text(usr,6,10,4,10,"AlchemyStation - Wood")
						Mas.screen_loc = "4,8"
						usr.Text(usr,6,8,4,10,"Masonary - Stone")
						Kit.screen_loc = "4,6"
						usr.Text(usr,6,6,4,10,"Kitchen - Wood")
						Let.screen_loc = "11,16"
						usr.Text(usr,13,16,4,10,"Leather - Wood")
						Gem.screen_loc = "11,14"
						usr.Text(usr,13,14,4,10,"GemCraft - Stone")
						Melt.screen_loc = "11,12"
						usr.Text(usr,13,12,4,10,"Melter - Stone")
					if("Kobold","Ratman","Orc")
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
					else
						Mas.screen_loc = "4,6"
						usr.Text(usr,6,6,4,10,"Masonary - Stone")
						Melt.screen_loc = "11,10"
						usr.Text(usr,13,10,4,10,"Melter - Stone")




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
				if(M.Race == "Human")
					Farm.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"FarmLand - Humans")
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
				if(M.Race == "Kobold")
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
				if(M.Race == "Ratman")
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")
				if(M.Race == "Goblin")
					RibTrap.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"RibCage Trap")
					BST.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"BoneSpike Trap")

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
				var/obj/TribalFloor = new/obj/HUD/ClickTribalFloor(usr.client)
				var/obj/StoneFloor = new/obj/HUD/ClickStoneFloor(usr.client)
				var/obj/BoneFloor = new/obj/HUD/ClickBoneFloor(usr.client)
				var/obj/DigChannel = new/obj/HUD/ClickDigChannel(usr.client)
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
				switch(M.Race)
					if("Lizardman","Frogman")
						TribalFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"TribalFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
						BoneFloor.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneFloor")
					if("Elf")
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if("Orc")
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodenFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if("Dwarf","Human")
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
						DigChannel.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"DigChannel")
					if("Gargoyle")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						Dest.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"DestroyFloor")
					if("Kobold","Ratman")
						BoneFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneFloor")
						Dest.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"DestroyFloor")
					if("Goblin","Svartalfar","Vampire")
						WoodFloor.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodFloor")
						StoneFloor.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneFloor")
						BoneFloor.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneFloor")
						Dest.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"DestroyFloor")
				if(M.SubRace == "Illithid")
					StoneFloor.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"StoneFloor")
					Dest.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"DestroyFloor")
				if(M.SandWorker == 1)
					BoneFloor.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneFloor")
					StoneFloor.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"StoneFloor")
					Dest.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"DestroyFloor")

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
				switch(M.Race)
					if("Lizardman","Frogman")
						TribalBridge.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"TribalBridge")
					if("Goblin","Svartalfar","Vampire","Gargoyle")
						StoneBridge.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneBridge")
						WoodBridge.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"WoodBridge")
						BoneBridge.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"BoneBridge")
					if("Dwarf","Human")
						StoneBridge.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneBridge")
						WoodBridge.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"WoodBridge")
					if("Kobold","Ratman")
						BoneBridge.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneBridge")
					if("Orc")
						WoodBridge.screen_loc = "5,13"
						usr.Text(usr,7,11,4,10,"WoodBridge")
					if("Elf")
						WoodBridge.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodBridge")
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
				var/obj/ElfWall = new/obj/HUD/ClickElfWall(usr.client)
				var/obj/TribalWall = new/obj/HUD/ClickTribalWall(usr.client)
				var/obj/StoneWall = new/obj/HUD/ClickStoneWall(usr.client)
				var/obj/BoneWall = new/obj/HUD/ClickBoneWall(usr.client)
				var/obj/SecretWall = new/obj/HUD/ClickSecretWall(usr.client)
				var/obj/Detail = new/obj/HUD/ClickDetail(usr.client)
				var/obj/ArrowSlit = new/obj/HUD/ClickArrowSlit(usr.client)
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
				switch(M.Race)
					if("Vampire","Svartalfar","Gargoyle","Goblin")
						WoodWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodWall")
						BoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"BoneWall")
						StoneWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"StoneWall")
						SecretWall.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"SecretWall")
					if("Orc")
						WoodWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodWall")
						SecretWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"SecretWall")
					if("Lizardman","Frogman")
						TribalWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"TribalWall")
						BoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"BoneWall")
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
					if("Human")
						WoodWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"WoodWall")
						StoneWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"StoneWall")
						ArrowSlit.screen_loc = "5,5"
						usr.Text(usr,7,5,4,10,"ArrowSlit")
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
					if("Dwarf")
						WoodWall.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"WoodWall")
						StoneWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"StoneWall")
						Detail.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Detail")
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
					if("Kobold","Ratman")
						BoneWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"BoneWall")
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,7,4,10,"SecretWall")
					if("Elf")
						ElfWall.screen_loc = "5,13"
						usr.Text(usr,7,13,4,10,"ElfWall")
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
					else
						SecretWall.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"SecretWall")
				if(M.SandWorker == 1)
					StoneWall.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"StoneWall")
					WoodWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"BoneWall")
				if(M.SubRace == "Illithid")
					StoneWall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"StoneWall")
mob
	proc
		MindPower()//This is the proc that creates the OSI
			for(var/obj/HUD/H in usr.client.screen)//Deletes any HUD on-screen
				del(H)
			usr.MindMenu()//Creates the OSI Background
		MindMenu()//Proc that creates the OSI Background
			for(var/mob/Monsters/M in usr.Selected)
				if(M.SubRace == "Illithid")
					var/obj/H = new/obj/HUD/Middle2(usr.client)
					var/obj/O = new/obj/HUD/TopLeft(usr.client)
					var/obj/A = new/obj/HUD/TopRight(usr.client)
					var/obj/B = new/obj/HUD/BottomLeft(usr.client)
					var/obj/C = new/obj/HUD/BottomRight(usr.client)
					var/obj/D = new/obj/HUD/TopMiddle(usr.client)
					var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
					var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
					var/obj/G = new/obj/HUD/RightMiddle(usr.client)
					var/obj/Wall = new/obj/HUD/Forcefield(usr.client)
					var/obj/Telekinesis = new/obj/HUD/Telekinesis(usr.client)
					var/obj/Mindcontrol = new/obj/HUD/Mindcontrol(usr.client)
					var/obj/Pyrokinesis = new/obj/HUD/Pyrokinesis(usr.client)
					var/obj/ReadMind = new/obj/HUD/ReadMind(usr.client)
					var/obj/Warp = new/obj/HUD/Warp(usr.client)
					//var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
					//var/obj/Br = new/obj/HUD/B(usr.client)
					//var/obj/Dec = new/obj/HUD/Dec(usr.client)
					var/obj/Scrying = new/obj/HUD/Scrying(usr.client)
					H.screen_loc = "4,14 to 14,4"
					O.screen_loc = "4,14"
					A.screen_loc = "14,14"
					B.screen_loc = "4,4"
					C.screen_loc = "14,4"
					D.screen_loc = "4,14 to 14,14"
					E.screen_loc = "4,4 to 14,4"
					F.screen_loc = "4,4 to 4,14"
					G.screen_loc = "14,4 to 14,14"
					usr.Text(usr,4,14,4,10,"--Mindcraft Menu--")
					Wall.screen_loc = "5,13"
					usr.Text(usr,7,13,4,10,"Forcefield")
					Telekinesis.screen_loc = "5,11"
					usr.Text(usr,7,11,4,10,"Telekinesis")
					Mindcontrol.screen_loc = "5,9"
					usr.Text(usr,7,9,4,10,"Mindcontrol")
					Pyrokinesis.screen_loc = "5,7"
					usr.Text(usr,7,7,4,10,"Pyrokinesis")
					ReadMind.screen_loc = "5,5"
					usr.Text(usr,7,5,4,10,"Read Mind")
					Warp.screen_loc = "11,13"
					usr.Text(usr,12,13,4,10,"Warp")
					Scrying.screen_loc = "11,11"
					usr.Text(usr,13,11,4,10,"Scrying")
mob
	proc
		Building()
			for(var/obj/HUD/H in usr.client.screen) del(H)
			usr.BuildingMenu()
		BuildingMenu()
			for(var/mob/Monsters/M in usr.Selected)
				if(M.density == 1) switch(M.Race)
					if("Spider")
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
						var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
						var/obj/Trap = new/obj/HUD/SpiderTrap(usr.client)
						var/obj/Post = new/obj/HUD/Post(usr.client)
						var/obj/Cacoon = new/obj/HUD/Cacoon(usr.client)
						var/obj/Br = new/obj/HUD/SilkBridge(usr.client)
						var/obj/Dec = new/obj/HUD/Dec(usr.client)
						var/obj/Lair = new/obj/HUD/Lair(usr.client)
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
						Dest.screen_loc = "11,9"
						usr.Text(usr,13,9,4,10,"DestroyFloor")
						Stairs.screen_loc = "11,7"
						Stairs.icon_state="SpiderDown"
						usr.Text(usr,12,7,4,10,"Stairs")
					if("Devourer")
						var/obj/H = new/obj/HUD/Middle2(usr.client)
						var/obj/O = new/obj/HUD/TopLeft(usr.client)
						var/obj/A = new/obj/HUD/TopRight(usr.client)
						var/obj/B = new/obj/HUD/BottomLeft(usr.client)
						var/obj/C = new/obj/HUD/BottomRight(usr.client)
						var/obj/D = new/obj/HUD/TopMiddle(usr.client)
						var/obj/E = new/obj/HUD/BottomMiddle(usr.client)
						var/obj/F = new/obj/HUD/LeftMiddle(usr.client)
						var/obj/G = new/obj/HUD/RightMiddle(usr.client)
						var/obj/Wall = new/obj/HUD/ClickDevourerWall(usr.client)
						var/obj/Stairs = new/obj/HUD/Stairs(usr.client)
						var/obj/Trap = new/obj/HUD/ClickCacoonTrap(usr.client)
						var/obj/Bonecraft = new/obj/HUD/BuiltInBonecraft(usr.client)
						var/obj/Cacoon = new/obj/HUD/CreateZombieCacoon(usr.client)
						var/obj/Organ = new/obj/HUD/CreateOrgan(usr.client)
						var/obj/Improve = new/obj/HUD/ImproveDevourer(usr.client)
						var/obj/Lair = new/obj/HUD/ClickDevourerFloor(usr.client)
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
						usr.Text(usr,7,13,4,10,"FleshWall")
						Trap.screen_loc = "5,11"
						usr.Text(usr,7,11,4,10,"Trap")
						Bonecraft.screen_loc = "5,9"
						usr.Text(usr,7,9,4,10,"Bonecraft")
						Cacoon.screen_loc = "5,7"
						usr.Text(usr,7,7,4,10,"Cacoon")
						Organ.screen_loc = "5,5"
						usr.Text(usr,7,5,4,10,"Organ")
						Improve.screen_loc = "11,13"
						usr.Text(usr,12,13,4,10,"Enhance")
						Stairs.screen_loc = "11,7"
						usr.Text(usr,12,7,4,10,"Stairs")
						Lair.screen_loc = "11,11"
						usr.Text(usr,13,11,4,10,"Floor")
					else
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
mob/verb/WayPoint()
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
	if (Result == "Goto WayPoint") usr.loc = usr.Waypoint
	if (Result == "Goto WayPoint2") usr.loc = usr.Waypoint2
	if (Result == "Goto WayPoint3") usr.loc = usr.Waypoint3
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
mob/verb/SendMSG(var/mob/M in Players, msg as text)
	set hidden = 1
	if(usr.ckey in M.IgnoreList)
		usr << "You are on [M]'s ignore list<br>"
		return
	if(Muted)
		usr << "You are muted."
		return
	usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PM>[M]</a>:</font color> [html_encode(msg)]"
	M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
	for(var/mob/D in Players2) if(D != M && D != usr) if(D.GM == 1 && D.DE == 1) D<<"<b><font color=silver>[usr] sent to [M]:</font color> [msg]"
mob/verb/AddAlly()
	var/T = input("Set who as an ally?")as null|text
	if(T) for(var/mob/S in Players2) if(T == S.name)
		if(S.name in usr.AllyList)
			usr << "This person is already your ally"
			return
		else
			usr.AllyList += S.name
			usr << "You have added [S] to your allies list, your units will no longer attack [S]'s unless you remove him/her from your ally list."
			S << "[usr] has added you to their ally list"
mob/verb/RemoveAlly()
	var/T=input("Which ally would you like to remove?")as null|anything in AllyList
	if(T) for(var/mob/S in Players2) if(T == S.name) if(S.name in usr.AllyList)
		usr.AllyList -= S.name
		usr << "You have removed [S] from your allies list, your units can now attack his/her units."
		S << "[usr] has removed you from their ally list"
mob/verb/Rename() for(var/mob/Monsters/M in Selected)
	var/PrefixLength=length("[M.Owner]")+4
	if(M.IsRoyal) PrefixLength+=length(GenderToLeader(M.Gender))+1
	var/NAME
	if(copytext(M.name,1,PrefixLength) == "[GenderToLeader(M.Gender)] {[M.Owner]} " || copytext(M.name,1,PrefixLength) == "{[M.Owner]} ")
		NAME=input("Rename your [M.Gender] [M.Race] to what?","Rename","[copytext(M.name,PrefixLength,0)]") as text|null
	else NAME=input("Rename your [M.Gender] [M.Race] to what?","Rename","[M.name]") as text|null
	if(NAME)
		if(length(NAME)>25)
			usr<<"This name is far too long. Try a shorter one."
			continue
		if(M.IsRoyal) M.name="[GenderToLeader(M.Gender)] {[M.Owner]} [NAME]"
		else M.name="{[M.Owner]} [NAME]"
mob/verb/Who()
	var/PlayerCount
	usr << "<font color = red size = 4>((-Players Online-))"
	for (var/mob/M in world)
		if(M.client)
			if(M.Content2 != "Invisible")
				PlayerCount ++
				usr << "--<font color = purple>[M]"
			else if(usr.key == world.host)
				PlayerCount ++
				usr << "--<font color = red>[M.name] - Invisible"
	usr << "<font color = red size = 3> ((-[PlayerCount] Player(s) Online-))"
mob/verb/Check_Clan_Members()
	for(var/mob/M in Players2)
		if(M.Faction == usr.Faction)
			usr << "<b><font color=red>[M.name]"
mob/verb/Check_Shrines()
	for(var/obj/PowerupPillar/P in world)
		if(P.invisibility == 0)
			if(P.Content2 == usr.Faction) usr << "<b><font color=blue>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"
			else usr << "<b><font color=red>[P] - [P.x],[P.y],[P.z] - Owner = [P.Content2]"
mob/verb/Create_A_Clan()
	var/T = input("Clan Name")as null|text
	if(!T) return
	if(length(T)>25)
		usr<<"This clan name is far too long."
		return
	for(var/mob/K in Players2) if(K.Faction == T)
		usr << "There is already a clan with this name."
		return
	if(CoolDown("CreateClan",300))
		usr.IsClanLeader = 1
		usr.verbs+=typesof(/Clan/verb)
		usr.Faction = T
		usr << "Clan [T] created"
	else usr << "You need to wait a while before creating a new clan."
mob/verb/ListAllies()
	var/AllyCount
	usr << "<font color = yellow size = 4>((-Allies-))"
	for(var/mob/M in Players2)
		if(M.name in usr.AllyList)
			AllyCount ++
			usr << "--<font color = yellow>[M]"
	usr << "<font color = yellow size = 3> ((-[AllyCount] Allies-))"
mob/verb/WorldChat()
	if(CoolDown("WorldChatEnter",30))
		if(usr.WC == 1)
			usr.WC = 0
			world << "<font color = blue>[usr] Enters World Chat!"
			return
		if(usr.WC == 0)
			usr.WC = 1
			world << "<font color = blue>[usr] Leaves World Chat!"
			usr << "Press L to re-join!"
			return
mob/verb/GMChat()
	set hidden = 1
	var/T = input("Shout")as null|text
	if(T)
		for(var/mob/M in world)
			if(usr.GM == 1)
				if(M.GM == 1)
					M << "<font color = yellow><strong>[usr] says: </strong>[T]<br>"
		return
mob/verb/Send_File(var/mob/person in Players,filez as file)
	set hidden = 1
	if(usr in person.IgnoreList)
		usr << "[person] is ignoring you."
		return
	else
		switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")
mob/verb/ClanChat()
	if(usr.Faction != "Player")
		var/T = input("Shout")as null|text
		if(!T) return
		for(var/mob/M in Players2)
			if(M.Faction == usr.Faction) M << "<b><font color=red>[usr] Clanchats:</b><font color=red> [Safe_Guard(T)]"
			else if(M.key == world.host) M << "<b><font color=silver>[usr.Faction] - [usr] Clanchats:</b><font color=silver> [Safe_Guard(T)]"
	else usr << "You're not in a clan."
mob/verb/WorldSay()
	var/T = input("Shout")as null|text
	if(!T) return
	if(usr.Muted == 1)
		usr << "You are Muted"
		return
	if(CoolDown("OOC",5)) for(var/Player/M in world) if(usr.WC == 0) if(M.WC == 0)
		if(usr in M.IgnoreList) ..()
		else M << "<font color=green><strong>OOC: [usr]</strong>: [Safe_Guard(T)]</html> <br>"
	else usr << "Must Wait before speaking again!"
mob/verb/GetCords() src << "[src.x],[src.y],[src.z]<br>"
mob/verb/Coords(X as num, Y as num, Z as num)
	set desc = "X,Y,Z"
	if(X > world.maxx) X = world.maxx
	else if(X < 1) X = 1
	if(Y > world.maxy) Y = world.maxy
	else if(Y < 1) Y = 1
	if(Z > world.maxz) Z = world.maxz
	else if(Z < 1) Z = 1
	loc = locate(X,Y,Z)
mob/verb/Zip() for(var/mob/Monsters/c in usr.Selected) c.Deselect(src)
mob/verb/Goto() for(var/mob/Monsters/c in usr.Selected) usr.loc = c.loc
mob/verb/Every() for(var/mob/Monsters/c in world) if(c.Owner == src)
	if(c in Selected) continue
	if(c.Wagon) continue
	c.Select(src)
mob/verb/All() for(var/mob/Monsters/c in orange(usr)) if(c.Owner == src)
	if(c in Selected) continue
	if(c.Wagon) continue
	c.Select(src)
mob/verb/Emote(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		M.EmoteLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] [Safe_Guard(T)]<br />"
		if(src.Muted)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				var/list/viewmob = list()
				for(var/mob/m in view(M))
					viewmob += m.Owner
				for(var/mob/g in viewmob)
					var/mob/replace = g
					for(var/mob/g2 in viewmob)
						if(g2 == g)
							viewmob.Remove(g)
					viewmob += replace
				for(var/mob/g in viewmob)
					if(g in view(M))
						g << "[M] [Safe_Guard(T)]"
					else if(M.Owner == g)
						g << "[M] [Safe_Guard(T)]"
					else
						g << "([M.x],[M.y],[M.z])   [M] [Safe_Guard(T)]"
			for(var/mob/K in range(10,M))
				if(K.GM == 1)
					for(var/mob/KM in view(M))
						if(KM.Owner == K)
							return
					K << "[M] [Safe_Guard(T)]"
mob/verb/UnitSay(T as text)
	for(var/mob/Monsters/M in usr.Selected)
		if(!T)
			return
		usr.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		M.ChatLog += "[time2text(world.realtime,"MMM DD - hh:mm")]  [M] says:[Safe_Guard(T)]<br />"
		if(src.Muted == 1)
			src << "You are Muted"
			return
		else
			if(M.Wagon == 0)
				var/list/viewmob = list()
				for(var/mob/m in view(M))
					viewmob += m.Owner
				for(var/mob/g in viewmob)
					var/mob/replace = g
					for(var/mob/g2 in viewmob)
						if(g2 == g)
							viewmob.Remove(g)
					viewmob += replace
				for(var/mob/g in viewmob)
					if(g in view(M))
						g << "<font color = blue>[M] says:[Safe_Guard(T)]"
					else if(M.Owner == g)
						g << "<font color = blue>[M] says :[Safe_Guard(T)]"
					else
						g << "<font color = blue>([M.x],[M.y],[M.z])   [M] says:[Safe_Guard(T)]"
			for(var/mob/K in range(10,M))
				if(K.GM == 1)
					for(var/mob/KM in view(M))
						if(KM.Owner == K)
							return
					K << "<font color = blue>[M] says:[Safe_Guard(T)]"
mob/verb/PlaceTapestry()
	if(usr.Function == "Tapestry")
		usr << "No longer placing/removing tapestries."
		usr.Function = null
	else
		usr.Function = "Tapestry"
		usr << "Now placing/removing tapestries. Single Click a wall near a selected unit."
mob/proc/CreatePotion()
	var/mob/WorkShops/PotionStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Potion Station"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PotionStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Potion Station"
	src.WoodCraftingSkill += 1
mob/proc/CreateBone()
	var/mob/WorkShops/BoneCraft/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "BoneCraftingStation"
	L.overlays += /obj/WSoverlays/Bone/
	var/mob/WorkShops/BoneCraft/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "BoneCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreatePoison()
	var/mob/WorkShops/PoisonStation/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "PoisonStation"
	L.overlays += /obj/WSoverlays/Poison/
	var/mob/WorkShops/PoisonStation/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "PoisonStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateWorkShopLeather()
	var/mob/WorkShops/LeatherWorks/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "LeatherCraftingStation"
	L.overlays += /obj/WSoverlays/Leather/
	var/mob/WorkShops/LeatherWorks/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "LeatherCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateCarpentry()
	var/mob/WorkShops/Carpentry/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "CarpentryCraftingStation"
	L.overlays += /obj/WSoverlays/Carpentry/
	var/mob/WorkShops/Carpentry/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "CarpentryCraftingStation"
	src.WoodCraftingSkill += 1
mob/proc/CreateSmelter()
	var/mob/WorkShops/Smelters/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "SmelterStation"
	L.overlays += /obj/WSoverlays/Smelter/
	var/mob/WorkShops/Smelters/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "SmelterStation"
	src.StoneCraftingSkill += 1
mob/proc/CreatePit()
	var/obj/Items/Traps/PitTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.name = "Pit"
	if(src.SubRace == "Hunter")
		if(src.Level >= 20)
			L.icon = null
			L.Hole = 1
	src.StoneCraftingSkill += 1
mob/proc/CreateRib()
	var/obj/Items/Traps/RibTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Rib Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateBST()
	var/obj/Items/Traps/BST/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Bone Spike Trap"
	src.BoneCraftingSkill += 1
mob/proc/CreateCacoonTrap()
	var/obj/Items/Traps/CacoonTrap/L = new
	L.loc = src.loc
	L.Owner = src.Owner
	L.Hole = 1
	L.name = "Cacoon Trap"
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
	L.name = "ForgeStation"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Forge/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "ForgeStation"
	src.StoneCraftingSkill += 1
mob/proc/CreateKit()
	var/mob/WorkShops/Kitchen/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Kitchen"
	L.overlays += /obj/WSoverlays/Kitchen/
	var/mob/WorkShops/Kitchen/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Kitchen"
	src.WoodCraftingSkill += 1
mob/proc/CreateGem()
	var/mob/WorkShops/GemCutter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "GemCutter"
	L.overlays += /obj/WSoverlays/Gem/
	var/mob/WorkShops/GemCutter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "GemCutter"
	src.StoneCraftingSkill += 1

mob/proc/CreateMasonary()
	var/mob/WorkShops/Masonary/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Masonary"
	L.overlays += /obj/WSoverlays/Masonary/
	var/mob/WorkShops/Masonary/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Masonary"
	src.StoneCraftingSkill += 1
mob/proc/CreateMelter()
	var/mob/WorkShops/Melter/Left/L = new
	L.loc = locate(src.x-1,src.y,src.z)
	L.name = "Melter"
	L.overlays += /obj/WSoverlays/Forge/
	var/mob/WorkShops/Melter/Right/R = new
	R.loc = locate(src.x,src.y,src.z)
	R.name = "Melter"
	src.StoneCraftingSkill += 1
mob/proc/StopWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		src.CanWalk = 0
		spawn(20)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.WalkNumber = 0
				src.Stunned = 0
				src.CanWalk = 1
			return
mob/proc/StunnedWalk()
	if(src.Wagon == 0)
		src.WalkNumber += 1
		view(src) << "[src] is stunned!"
		src.Stunned = 1
		spawn(150)
			src.WalkNumber -= 1
			if(src.WalkNumber <= 0)
				src.Stunned = 0
				src.CanWalk = 1
				view(src) << "[src] is no longer stunned."
			return
mob/proc/Slowdown2()
	if(src.Wagon == 0)
		src.Delay += 5
		spawn(50)
			src.Delay -= 5
			return
mob/proc/LegendView() src << browse(Legends)
mob/verb/Legends() usr.LegendView()
obj/proc/Death() if(src.HP <= 0) del(src)

mob/proc/FightSound()
	spawn(5)
		if(src.HoldingWeapon)
			var/S = rand(1,3)
			if(S == 1)
				view() << '1.wav'
			if(S == 2)
				view() << '2.wav'
			if(S == 3)
				view() << '3.wav'
mob/proc/FightSound2()
	spawn(5)
		if(!HoldingWeapon)
			var/S = rand(1,3)
			if(S == 1)
				view() << 'P1.wav'
			if(S == 2)
				view() << 'P2.wav'
			if(S == 3)
				view() << 'P3.wav'