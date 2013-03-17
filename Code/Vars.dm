/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
obj/proc/DeleteItem()
	if(src.suffix)
		src.Content3 = 0
		return
	if(src.Content3 <= 3)
		src.Content3 += 1
	if(src.Content3 >= 3)
		del(src)
		return
	spawn(1000) DeleteItem()



obj/proc/CursedItem()
	spawn(6000)
	if(src.suffix == null)
		del(src)
	else
		spawn(1) CursedItem()
mob/proc
	textlist(var/textlist)
		writing=list();for(var/t=1,t<=length(textlist),t++)writing+=copytext(textlist,t,t+1)
	Text(mob/m,var/x,var/y,var/offx,var/offy,var/t)
		if(m.key!=null)
			textlist(t)
			for(var/w in writing)
				var/obj/HUD/Text/s=new(m.client)
				s.screen_loc="[x]:[offx],[y]:[offy]"
				s.icon_state=w
				s.name="\proper[w]"
				offx+=8
				if(offx >= 32) {/*sleep(0.1);*/offx-=32 ; x++}
var/writing
mob/proc/FrogResetTarget()
	src.Stunned = 0
	src.Fainted = 0
	if(src.CanBeSlaved == 1)
		src.destination = null
	else
		return
	spawn(500) FrogResetTarget()

mob/proc/ResetTarget()
	if(src.CanBeSlaved)
		src.destination = null
	else
		return
	spawn(500) ResetTarget()
mob/proc/Running()
	spawn(300)
		src.Delay += 1
		view() << "[src] stops running!"
		spawn(100)
		src.Running = 0
mob/proc/RanWalk()
	if(src.InHole == 0)
		if(src.CanWalk)
			if(src.destination == null)
				step_rand(src)
				for(var/mob/Monsters/M in view(4,src))
					if(M.Owner == src.Owner)
						..()
					else
						if(M.CantKill == 0)
							src.destination = M
			if(destination)
				step_towards(src,src.destination)


	spawn(5) RanWalk()




mob/proc/RandomWalk()
	if(src.CanBeSlaved)
		if(src.InHole == 0)
			if(src.CanWalk)
				if(src.destination)
					step_towards(src,src.destination)
				if(src.destination == null)
					step_rand(src)
					for(var/mob/Monsters/M in view(4,src))
						if(M.Owner == src.Owner)
							..()
						else
							if(M.CantKill == 0)
								src.destination = M

	else
		src.WalkTo()
		return
	spawn(6) RandomWalk()
obj/proc/Portal()
	for(var/mob/M in view(0,src))
		if(M.loc != locate(M.x,M.y,4))
			M.loc = locate(M.x,M.y-1,4)
			var/C = prob(15)
			var/P = prob(25)
			if(M.client == null)
				if(C)
					if(M.CanSee)
						if(M.Wagon == 0)
							M.Owner << "[M] goes insane from the horror and tears their own eyes out!"
							M.HasLeftEye = 0
							M.HasRightEye = 0
							M.CanSee = 0
							M.RightEyeHP = 0
							M.LeftEyeHP = 0
							M.LeftEye = "Destroyed"
							M.RightEye = "Destroyed"
				if(C == 0)
					if(P)
						if(ismob(M.Owner))
							var/mob/O = M.Owner
							if(O.EntPortal <= 5)
								if(M.Wagon == 0)
									if(M.Spider == 0)
										if(M.Vampire == 0)
											M.Owner << "[M] is possessed by the demonic forces surrounding the portal!"
											O.EntPortal += 1
											M.TurnDemon()
		else
			M.loc = locate(M.x,M.y-1,src.Content)
	spawn(10) Portal()
obj/proc/Spawn()
	if(src.Content >= 0)
		var/mob/Monsters/DemonNPC/D = new
		D.loc = src.loc
		src.Content -= 1


	else
		src.Portal()
		return
	spawn(200) Spawn()
mob/proc/FindItems()
	for(var/obj/Items/I in view(6,src))
		if(I.suffix == null)
			if(I.Door == 0)
				if(I.IsTrap == 0)
					if(I.Content3 != "Cage")
						if(src.Target == null)
							src.Target = I
	for(var/obj/Items/I in view(0,src))
		if(src.Target == I)
			del(I)
	if(src.Target)
		var/obj/A = src.Target
		if(A.suffix == null)
			step_towards(src,src.Target)
		else
			src.Target = null
	else
		step_rand(src)
	spawn(10) FindItems()

mob/proc/TurnOffAttack()
	src.destination = null
	spawn(500) TurnOffAttack()

mob/proc/PetFollow()
	if(destination)
		step_towards(src,src.destination)

	else
		return
	spawn(5) PetFollow()


mob/proc/Ready()
	src.Owner << "<b><font color=purple>[src]'s egg sack begins to swell she may now create a lair!"
	src.icon = 'SpiderQueenMature.dmi'
	src.icon_state = "Normal"
	src.MaxWebContent += 100
	src.WebContent = src.MaxWebContent
	src.CanBreed = 1

mob/proc/CheckSpiderHunterAge()
	if(src.CanGrowShell == 1)
		if(src.Defence <= 50)
			src.Defence += 1
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanGrowShell == 0)
		if(src.Age >= 2)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.MakesPosion == 1)
		src.PosionDMG += 0.3
	if(src.MakesPosion == 0)
		if(src.Age >= 2)
			src.MakesPosion = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] s a posion gland!"
			src.Owner << "<b><font color=purple>[src] grows a silk gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PosionDMG = 7
			src.CanBuildSilk = 1
			src.MaxWebContent += 100
			src.WebContent = 100
			src.icon = 'SpiderHunterOlder.dmi'
			src.icon_state = "Normal"
mob/proc/CheckSpiderWorkerAge()
	if(src.MakesPosion == 1)
		src.PosionDMG += 0.3
	if(src.MakesPosion == 0)
		if(src.Age >= 2)
			src.MakesPosion = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] grows a posion gland!"
			src.Owner << "<b><font color=purple>[src] grows a silk gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PosionDMG = 3
			src.CanBuildSilk = 1
			src.MaxWebContent += 100
			src.WebContent = 100
			src.IsYoungWorker = 0
			src.icon = 'SpiderWorkerOlder.dmi'
			src.icon_state = "Normal"
mob/proc/CheckSpiderWarriorAge()
	if(src.CanGrowShell == 1)
		if(src.Defence <= 50)
			src.Defence += 1
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanGrowShell == 0)
		if(src.Age >= 2)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.MakesPosion == 1)
		src.PosionDMG += 0.5
	if(src.MakesPosion == 0)
		if(src.Age >= 2)
			src.MakesPosion = 1
			src.HasGland = 1
			src.Owner << "<b><font color=purple>[src] grows a posion gland!"
			src.Owner << "<b><font color=purple>[src] has grown!"
			src.PosionDMG = 8
			src.IsYoungWarrior = 0
			src.icon = 'SpiderWarriorOlder.dmi'
			src.icon_state = "Normal"



mob/proc/CheckSpiderAge()
	if(src.CanGrowShell == 0)
		if(src.Age >= 23)
			src.CanGrowShell = 1
			src.Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour!"
	if(src.CanGrowShell == 1)
		if(src.Defence <= 50)
			src.Defence += 2
			src.Owner << "<b><font color=purple>[src]'s chitinous armour grows stronger"
	if(src.CanBuildSilk == 1)
		src.MaxWebContent += 15
		src.Owner << "<b><font color=purple>[src]'s glands produce more silk."
	if(src.MakesPosion == 1)
		src.PosionDMG += 1
		src.Owner << "<b><font color=purple>[src]'s glands produce deadlier posion."
	if(src.IsYoungQueen == 1)
		if(src.CanBuildSilk == 0)
			if(src.Age >= 22)
				src.CanBuildSilk = 1
				src.Owner << "<b><font color=purple>[src] grows a silk gland!"
				src.WebContent = 150
				src.MaxWebContent = 150
		if(src.MakesPosion == 0)
			if(src.Age >= 23)
				src.MakesPosion = 1
				src.Owner << "<b><font color=purple>[src] grows a posion gland!"
				src.PosionDMG = 15
				src.HasGland = 1
	if(src.IsYoungQueen == 1)
		if(src.Age >= 24)
			src.IsYoungQueen = 0
			src.IsOlderQueen = 1
			src.Owner << "<b><font color=purple>[src] grows an egg sack!"
			src.icon = 'SpiderQueenOlder.dmi'
			src.icon_state = "Normal"
			src.CanLayEggs = 1
	if(src.IsOlderQueen == 1)
		if(src.Age >= 29)
			src.IsOlderQueen = 0
			src.IsMatureQueen = 1
			src.Owner << "<b><font color=purple>[src]'s organs have matured enough so that she may breed."



mob/proc/Detail()
	for(var/mob/Monsters/M in usr.Selected)
		var/mob/Test/left = new
		left.loc = locate(M.x-1,M.y,M.z)
		for(var/turf/TUR in view(0,left))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTH
				src.destination = null
			if(TUR.dir == SOUTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == NORTHWEST)
				TUR.dir = NORTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHEAST
		var/mob/Test/right = new
		right.loc = locate(M.x+1,M.y,M.z)
		for(var/turf/TUR in view(0,right))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTH
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == NORTHEAST)
				TUR.dir = SOUTH
			if(TUR.dir == WEST)
				TUR.dir = SOUTHWEST
			if(TUR.dir == EAST)
				TUR.dir = NORTHWEST
		var/mob/Test/top = new
		top.loc = locate(M.x,M.y+1,M.z)
		for(var/turf/TUR in view(0,top))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = WEST
				src.destination = null
			if(TUR.dir == NORTHEAST)
				TUR.dir = WEST
			if(TUR.dir == NORTHWEST)
				TUR.dir = WEST
			if(TUR.dir == NORTH)
				TUR.dir = SOUTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = SOUTHWEST
		var/mob/Test/bot = new
		bot.loc = locate(M.x,M.y-1,M.z)
		for(var/turf/TUR in view(0,bot))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = EAST
				src.destination = null
			if(TUR.dir == SOUTHEAST)
				TUR.dir = EAST
			if(TUR.dir == SOUTHWEST)
				TUR.dir = EAST
			if(TUR.dir == NORTH)
				TUR.dir = NORTHEAST
			if(TUR.dir == SOUTH)
				TUR.dir = NORTHWEST
		var/mob/Test/botleft = new
		botleft.loc = locate(M.x-1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHWEST
				src.destination = null
		var/mob/Test/botright = new
		botright.loc = locate(M.x+1,M.y-1,M.z)
		for(var/turf/TUR in view(0,botright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = SOUTHEAST
				src.destination = null
		var/mob/Test/topright = new
		topright.loc = locate(M.x+1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topright))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHEAST
				src.destination = null
		var/mob/Test/topleft = new
		topleft.loc = locate(M.x-1,M.y+1,M.z)
		for(var/turf/TUR in view(0,topleft))
			if(TUR.icon_state == "CaveWall")
				TUR.icon = 'Cave.dmi'
				TUR.icon_state = "StoneWall"
				TUR.HP += 200
				TUR.name = "DetailedWall"
				TUR.dir = NORTHWEST
				src.destination = null
		del(topleft)
		del(topright)
		del(botright)
		del(botleft)
		del(bot)
		del(top)
		del(left)
		del(right)
mob/proc/Save()
	var/sav = "players/[src.ckey]_save.sav"
	var/savefile/S = new(sav)
	S["Kills"] << src.Kills
	S["Points"] << src.Points
mob/proc/Load()
	var/sav = "players/[src.ckey]_save.sav"
	if(length(file(sav)))
		var/savefile/S = new(sav)
		S["Kills"] >> src.Kills
		S["Points"] >> src.Points
mob/proc/Dig()
	if(Dig)
		if(src.Sleeping == 0)
			for(var/obj/DigAt/D in oview(src))
				if(D.Owner == src)
					if(src.DigTarget == D)
						for(var/turf/T in view(0,D))
							src.destination = T
					if(src.DigTarget == null)
						src.DigTarget = D




	else
		return
	spawn(1) Dig()
mob/proc/Heat()
	if(src)
		for(var/mob/Monsters/M in view(4,src))
			if(M)
				if(M.Coldness >= 0)
					M.Coldness = 0
	spawn(75) Heat()
mob
	var
		Kills = 0
		Points = 0
		UnitList = null
		EntPortal = 0

		PatrolPoint1

		PatrolPoint2

		CanSpeak = 1



		Waypoint = null
		Waypoint2 = null
		Waypoint3 = null

		IgnoreList

		HasLeftEye

		IsSkorn = 0


		StoleFromSkorn = 0

		IsBleeding = 0

		SaidBleed = 0

		CanUseLeftArm = 1

		CanUseRightArm = 1

		CanWalk = 1

		AITree = 0

		Killer = null

		DeathType = null

		BloodContent = 0

		MaxBloodContent = 0

		HasRightEye

		HasRightLung

		Function = null

		HasLeftLung

		HitWings

		Wings

		WingHP = 100

		Morphed = 0

		HasSpleen

		WingsOut = 0

		CanLayEggs = 0

		HasTeeth

		HasLeftArm

		TreeTarget = null


		HasRightArm

		CanGrowShell = 0

		HasLeftLeg

		HasRightLeg

		CanBreed = 0

		HasHead

		HasLeftEar

		HasRightEar

		HasGuts

		HasStomach

		HasLeftKidney

		HasRightKidney

		HasLiver

		LoggedIn = 0

		HasBrain

		HasHeart

		SkillDMG


		HasThroat

		HasNose

		BleedType



		Stunned = 0



		Fainted



		LeftEye

		RightEye

		RightLung

		HasGland = 0

		LeftLung

		Alive = 1

		Spleen

		Teeth

		LeftArm

		RightArm

		LeftLeg

		RightLeg

		Head

		LeftEar

		RightEar

		Guts

		Stomach

		LeftKidney

		RightKidney

		CanSee = 1

		Liver

		Brain

		Heart

		Throat

		Nose

		HitHead

		HitLeftArm

		HitRightArm

		HitLeftLeg

		HitRightLeg

		HitLowerBody

		HitUpperBody

		BowOn = 0

		HitLeftEar

		HitRightEar
		EXP = 0

		HitGuts

		HitStomach

		HitLeftKidney

		HitRightKidney

		HitLiver

		HitBrain

		HitHeart

		HitThroat

		HitNose

		HitLeftEye

		HitRightEye

		HitRightLung

		HitLeftLung

		HitSpleen

		HitTeeth

		HitSkull

		LeftEyeHP = 100

		RightEyeHP = 100

		RightLungHP = 100

		LeftLungHP = 100

		SpleenHP = 100

		TeethHP = 100

		LeftArmHP = 100

		RightArmHP = 100

		LeftLegHP = 100

		RightLegHP = 100

		HeadHP = 100

		LeftEarHP = 100

		RightEarHP = 100

		SellsPotion = 0

		GutsHP = 100

		StomachHP = 100

		LeftKidneyHP = 100

		RightKidneyHP = 100

		LiverHP = 100

		BrainHP = 100

		HeartHP = 100

		ThroatHP = 100

		NoseHP = 100

		DamageType

		LeftArmMaxHP = 100

		RightArmMaxHP = 100

		LeftLegMaxHP = 100

		RightLegMaxHP = 100

		TeethHPMax = 100

		Age = 0
		Muted = 0
		IsYoungWarrior = 0
		IsWarrior = 0
		IsHunter = 0
		StealTarget
		MakesPosion = 0
		IsYoungQueen = 0
		IsOlderQueen = 0
		IsMatureQueen = 0
		Crippled = 0
		MakesBoneCraft = 0
		Sleeping = 0
		OldIcon = null
		OldState = null
		ShieldSkill = 0
		Egg = 0
		HammerSkill = 0

		WearingBack = 0
		AxeSkill = 0
		Delay = 4
		ButcherySkill = 0
		HoldingWeapon = 0
		LeatherCraftingSkill = 0
		Using = null
		StoneCraftingSkill = 0
		CanKill = 0
		Posionus = 0
		Posion = 0
		UsesPosion = 0
		CanBuild = 1
		WearingLeftArm = 0
		WearingRightArm = 0
		WearingFullPlateHelm = 0
		CanBuildSilk = 0
		Fling = 0
		CanBeCaged = 0
		CanFarm = 0
		DigTarget = null
		BuildingSkill = 0

		WoodCraftingSkill = 0
		MetalCraftingSkill = 0
		SkinningSkill = 0
		SpecialUnit = 0
		SmeltingSkill = 0
		SpearSkill = 0
		SunSafe = 0
		speeding = 0
		Running = 0
		OldOwner = null
		SettingAIWood = 0
		ReturnOwner = null
		IsYoungHunter = 0
		OnGuard = 0
		WebContent = 0
		MaxWebContent = 0
		Queen = 0
		FishingSkill = 0
		HasWings = 0
		Level = 0
		IsWorker = 0
		DayWalker = 0
		InfectedBy = null
		Infects = 0
		IsTrader = 0
		ImmunePosion = 0
		ListOn = 0
		LoggedOut = 0
		StoleFromDwarfs = 0
		StoleFromKobolds = 0
		StoleFromGoblins = 0
		Cantame = 0
		Mum = null
		Dad = null
		TheDad = null
		ReturningHome = 0
		AttackModeOn = 1
		ForgingSkill = 0
		JewlCraftingSkill = 0
		BoneCraftingSkill = 0
		SneakingSkill = 0
		KingLeader = null
		QueenLeader = null
		DieAge = 0
		HasKing = 0
		HasQueen  = 0
		PosionHits = 0
		FangsHit = 0
		MaceSkill = 0
		Strength
		WearingLegs = 0
		WillJoin = 0
		TalkingTo
		PotionSkill = 0
		EXPNeeded = 100
		LockPickingSkill = 0
		Intelligent = 0
		Humanoid
		Freeze = 0
		HasPick = 0
		UsesPicks = 0
		Hunger = 100
		WearingHelmet = 0
		MaxHunger = 100
		UnArmedSkill = 0
		RunAwayFrom = null
		HomeLoc = null
		Tiredness = 100
		FutureOwner = null
		BoneCraft = 0
		BreedLimit = 0
		WearingShield = 0
		Leave = 0
		CookingSkill = 0
		LaysAdvancedEggs = 0
		Preg = 0
		Rares = null
		Address = null
		MineingSkill = 0
		WoodCuttingSkill = 0



atom
	var
		Deer = 0
		Dead = 0
		Dwarf = 0
		CanEat
		User = 0
		ArmourSkill = 0
		Defence
		Agility
		Human = 0
		LizardMan = 0
		Vampire = 0
		Cant = 0
		WearingChest = 0
		Goblin = 0
		Posioned = 0
		CraftRank = null
		HumanParts = 0
		BelongsToHumans = 0
		StoleFromHumans = 0
		Beatle = 0
		Star
		Gender = "None"
		CanFish = 0
		Undead = 0
		CoinContent = 0
		Owner
		Up = 0
		CantKill = 0
		Tame = 0
		Tree = 0
		Bamboo = 0
		Icon = null
		State = null
		AMMode = 0
		Coldness = 0
		HasHeadOn = 0
		Sky = 0
		Chest = 0
		BelongsToSkorn = 0
		Mole = 0
		GoingToDie = 0


		IsPotion = 0
		Cactus = 0


		WS = 0

		IsEmpty = 0

		HasWater = null





		Historys
		Born
		SwordSkill = 0
		Done = 0
		Dig = 0

		Drill = 0
		PermSnow = 0
		IsWall = 0
		Days = 0
		BowSkill
		CaveWater = 0
		T = 0

		Race = null
		IsBodyPart = 0
		CF = 0
		IsCave = 1

		UsingSilver = 0
		PosionDMG = 0
		PosionContent = 0
		IsHead = 0

		Old
		Old2

		Wait = 0


		IsTree = 0
		EncrustedRuby = 0

		Spider = 0
		EncrustedEmerald = 0
		EncrustedDiamond = 0
		Restart = 0
		CoolDown = 0


		GoesTo = null
		Underground = 1
		no = 0
		FrogMan = 0
		isbridge = 0
		Wolf = 0
		NPC = 0
		BOwner = null
		BelongsToDwarf = 0
		IsYoungWorker = 0
		BelongsToGoblin = 0
		BelongsToKobold = 0


		Content = 0
		Content2 = 0
		Content3 = 0

		Fish = 0
		Mason = 0
		GM = 0
		WC = 0

		Kobold = 0

		G = 0
		BB = 0
		B = 0

		OnFire = 0
		Fuel = 75
		OIcon = null
		IsWood = 0
		CanBeSlaved = 0
		Door = 0

		IsGem = 0
		Escort = 0
		CanDigAt = 0
		CanDetail = 0
		html
		Placed = 0
		Locked = 0
		Supported = 0
		Told = 0
		IsGlass = 0
		IsPW = 0

		Detailed = 0
		IsTrap = 0

		Hole = 0
		InHole = 0
		IsSpiked = 0
		HasPersonIn = 0

		Wagon = 0
		Body = 0
		IsSkin = 0

		Kit = 0
		said = 0
		Gold = 0
		Silver = 0
		Gems = 0
		Skinned = 0
		TP = 0
		Carn = 0
		Pale = 0
		Jailed = 0
		PosionSkill = 0
		Stop = 0
		Target
		WorkShop = 0

		CR = 0
		M = 0

		said2 = 0
		Skill = 0
		Black = 0
		Carpentry = 0
		Smelter =0
		HasPlantIn = 0
		Forge = 0

		Bug = 0
		AM = 0
		E = 0

		IsMist = 0

		TS = 0
obj/proc/TowerCapGrow()
	sleep(1000)
	var/mob/Monsters/TowerCap/C = new
	C.loc = src.loc
	del(src)
	return
obj/proc/GrapeGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/GrapeVine/T = new
		T.loc = src.loc
		T.name = "Grape Vine Plant"
		del(src)
	if(Winter == 1)
		del(src)
	return
obj/proc/TomatoGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/TomatoPlant/T = new
		T.loc = src.loc
		T.name = "Tomato Plant"
		del(src)
	if(Winter == 1)
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return
obj/proc/Seek()
	if(src.Target)
		walk_towards(src,src.Target,2)
	else
		src.BowSkill = 0
		return
	spawn(0.1) Seek()
obj/proc/GarlicGrow()
	sleep(1000)
	if(Winter == 0)
		var/obj/Items/Plants/GarlicPlant/T = new
		T.loc = src.loc
		T.name = "Garlic Plant"
		del(src)
	if(Winter == 1)
		for(var/turf/T in view(0,src))
			T.HasPlantIn = 0
			del(src)
	return
mob/proc/BowTarget()
	if(src.BowOn == 0)
		return
	if(src.HoldingWeapon == "Bow")
		if(src.HasRightArm == 1)
			if(src.Sleeping == 0)
				if(src.Target)
					if(src.Target in oview(5,src))
						for(var/obj/Items/Armours/Back/LeatherQuiver/L in src)
							if(L.suffix == "(Equiped)")
								for(var/obj/Items/Arrows/A in L)
									view() << 'Arrow.ogg'
									A.loc = src.loc
									A.suffix = null
									A.Owner = src.Owner
									A.Target = src.Target
									A.density = 1
									A.BowSkill = src.BowSkill
									A.Seek()
									src.BowSkill += 0.3
									src.EXP += 4
									src.destination = null
									L.Content -= 1
									break
							break

					else
						src.Target = null
						src.BowOn = 0
		else
			src.BowOn = 0
			return
	else
		src.BowOn = 0
		return
	if(src.BowOn)
		spawn(50) BowTarget()
obj/proc/PosionSporeGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/GrownPosionSporePlant/P = new
					P.loc = src.loc
	del(src)
	return
obj/proc/CarnGrow()
	sleep(750)
	if(src)
		for(var/turf/T in view(0,src))
			if(T.Detailed == 0)
				if(T.Content == "Marsh")
					var/mob/Monsters/GrownCarnivorousPlant/P = new
					P.loc = src.loc
	del(src)
	return
obj/proc/TreeGrow()
	sleep(1000)
	if(Winter == 0)
		for(var/turf/T in view(0,src))
			if(T.icon_state == "Grass")
				T.icon = 'plants.dmi'
				T.icon_state = "tree 2x1"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.overlays += /obj/Trees/leaves3x2
				T.overlays += /obj/Trees/leaves2x2
				T.overlays += /obj/Trees/leaves1x2
				T.overlays += /obj/Trees/leaves1x1
				T.overlays += /obj/Trees/leaves2x1
				T.overlays += /obj/Trees/leaves3x1
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Snow")
				T.icon = 'plants.dmi'
				T.icon_state = "SnowTree"
				T.overlays += /obj/Trees/tree2x2
				T.overlays += /obj/Trees/tree1x2
				T.overlays += /obj/Trees/tree3x2
				T.Tree = 1
				T.IsWood = 1
				T.density = 1
				T.opacity = 1
				T.HP = 250
				T.name = "Tree"
			if(T.icon_state == "Desert")
				T.icon_state = "Cactus"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.opacity = 1
				T.IsWood = 1
				T.name = "Cactus"
				T.Cactus = 1
			if(T.Content == "Marsh")
				T.icon_state = "Bamboo"
				T.Tree = 1
				T.density = 1
				T.HP = 250
				T.IsWood = 1
				T.opacity = 1
				T.name = "Bamboo"
				T.Bamboo = 1
	del(src)
	return
mob/proc/Struggle()
	if(src)
		for(var/obj/Items/Traps/PitTrap/P in view(0,src))
			if(src.InHole == 1)
				var/E
				E = prob(src.SneakingSkill/2)
				if(E == 1)
					view()<< "<b><font color=red>[src] has escaped from a pit trap!"
					src.Owner << "<b><font color=red>[src] has escaped from a pit trap!"
					src.InHole = 0
					src.SneakingSkill += 0.5
					del(P)

			else
				return
	spawn(100) Struggle()
mob/proc/SunLight()
	if(src.Vampire == 1)
		if(src.Underground == 0)
			if(src.SunSafe == 0)
				src.Owner << "<b><font color=red>[src] takes damage from the sun!"
				src.HP -= 50
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "The Sun"
					src.DeathType = "Being Burned"
					src.Death()
					return
			else
				return
		else
			return
	spawn(50) SunLight()
mob/proc/CreateZombie()
	spawn(500)
		if(src)
			var/mob/Monsters/Zombie/Z = new
			Z.icon = src.icon
			Z.icon_state = src.icon_state
			if(src.Owner)
				var/mob/O = src.Owner
				Z.Owner = O
				Z.name = "([O]) Zombie"
				O.UnitList += Z
			Z.Zombie()
			Z.LimbLoss()
			var/obj/Bloods/Zombie/O = new
			Z.overlays += O
			Z.loc = src.loc
			range(8,src) << "<font color = teal>[src] begins to twitch, after a moment, they rise up from the dead and begin to walk!<br>"
			Z.Owner << "<font color = teal>A Zombie has risen at [Z.x],[Z.y],[Z.z]<br>"
			del(src)
mob/proc/TurnVamp()
	if(src.CanKill)
		return
	if(src.InfectedBy)
		spawn(300)
			view() << "[src] starts to look sick."
			src.overlays += 'RedEye.dmi'

	if(src.InfectedBy)
		spawn(300)
			view() << "[src] turns into a vampire!"
			if(ismob(src.Owner))
				var/mob/S = src.Owner
				S.Selected.Remove(src)
				S.client.images -= src.Star
				S.UnitList -= src
				if(S.HasKing == 1)
					if(src.HasKing == 1)
						src.HasKing = 0
						S.HasKing = 0
				if(S.HasQueen == 1)
					if(src.HasQueen == 1)
						src.HasQueen = 0
						S.HasQueen = 0
			src.Owner << "[src] has turned into a vampire! [x],[y],[z]"
			var/mob/E = src.InfectedBy
			if(ismob(E.Owner))
				src.Owner = E.Owner
				if(ismob(E.Owner))
					var/mob/M = E.Owner
					M.UnitList += src
			src.name = "Vampire"
			if(src.Spider == 1)
				src.Spider = 0
				src.Vampire = 1
			if(src.Race == "Orc")
				src.Race = null
				src.Vampire = 1
			if(src.Goblin == 1)
				src.Goblin = 0
				src.Vampire = 1
			if(src.Kobold == 1)
				src.Kobold = 0
				src.Vampire = 1
			if(src.Dwarf == 1)
				src.Dwarf = 0
				src.Vampire = 1
				src.overlays -= 'Beards.dmi'
				src.overlays -= 'BlackBeard.dmi'
				src.overlays -= 'BrownBeard.dmi'
			if(src.Human == 1)
				src.Human = 0
				src.Vampire = 1
			if(src.Wolf == 1)
				src.Wolf = 0
				src.Vampire = 1
			if(src.Deer == 1)
				src.Deer = 0
				src.Vampire = 1
			if(src.Bug == 1)
				src.Bug = 0
				src.Vampire = 1
			if(src.LizardMan == 1)
				src.LizardMan = 0
				src.Vampire = 1
			src.AM = 1

obj/proc/TomatoDecay()
	spawn(19000)
	if(src.suffix == null)
		for(var/turf/t in view(0,src))
			if(t.icon_state == "FarmLand")
				if(t.HasPlantIn == 1)
					t.HasPlantIn = 0
		del(src)
	else
		src.TomatoDecay()
obj/proc/DeleteLimbs()
	spawn(1000)
	del(src)
obj/proc/ItemDecay()
	spawn(19000)
	if(src.suffix == null)
		del(src)
	else
		src.ItemDecay()
mob/proc/Infection(var/mob/InfectorOwner)
	src.Infects = 1
	spawn(1250)
		if(src)
			src.Owner << "<font color = teal>[src] begins to look pale.<br>"
			var/Heal = prob(33)
			spawn(1250)
				if(src)
					if(Heal)
						src.Owner << "<font color = teal>[src] seems to have recovered from whatever horrid plague had stricken them.<br>"
						src.Infects = 0
						return
					else
						src.Owner << "<font color = teal>[src] begins to gurgle and splutter blood everywhere, they become a Zombie!<br>"
						var/mob/Monsters/Zombie/Z = new
						Z.icon = src.icon
						Z.icon_state = src.icon_state
						Z.Zombie()
						Z.loc = src.loc
						Z.Owner = InfectorOwner
						Z.name = "([Z.Owner]) Zombie"
						InfectorOwner.UnitList += Z
						Z.LimbLoss()
						var/obj/Bloods/Zombie/O = new
						Z.overlays += O
						Z.Owner << "<font color = teal>A new infection was created at [src.x],[src.y],[src.z]<br>"
						for(var/obj/Items/I in src)
							I.loc = src.loc
							I.suffix = null
						del(src)
						return
mob/proc/Zombie()
	if(src)
		if(src.Owner)
			if(src.icon_state == "NoLeftArm")
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightArm")
				src.HasRightArm = 0
			if(src.icon_state == "NoLeftLeg")
				src.HasLeftLeg = 0
			if(src.icon_state == "NoRightLeg")
				src.HasRightLeg = 0
			if(src.icon_state == "NoLegs")
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArms")
				src.HasRightArm = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoRightLegNoLeftArm")
				src.HasRightLeg = 0
				src.HasLeftArm = 0
			if(src.icon_state == "NoLeftLegNoRightArm")
				src.HasLeftLeg = 0
				src.HasRightArm = 0
			if(src.icon_state == "NoRightArmNoRightLeg")
				src.HasRightArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "NoLeftArmNoLeftLeg")
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoRightArm")
				src.HasRightArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoLegsNoLeftArm")
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoLeftLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasLeftLeg = 0
			if(src.icon_state == "NoArmsNoRightLeg")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
			if(src.icon_state == "None")
				src.HasRightArm = 0
				src.HasLeftArm = 0
				src.HasRightLeg = 0
				src.HasLeftLeg = 0
mob/proc/BodyDecay()
	spawn(4000)
	if(src.suffix == null)
		del(src)
	else
		src.BodyDecay()
mob/proc/FishDecay()
	spawn(2000)
		if(src.suffix == null)
			del(src)

obj/proc/BoneWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(1,2)
		src.WeaponDamageMax = rand(2,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(1,3)
		src.WeaponDamageMax = rand(3,4)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(2,4)
		src.WeaponDamageMax = rand(4,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(6,9)
		src.WeaponDamageMax = rand(9,16)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,11)
		src.WeaponDamageMax = rand(11,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(10,19)
		src.WeaponDamageMax = rand(19,22)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(22,26)
		src.WeaponDamageMax = rand(26,30)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(30,34)
		src.WeaponDamageMax = rand(34,38)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"


obj/proc/WoodDoorCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = rand(300,370)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = rand(380,400)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = rand(400,420)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = rand(500,550)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = rand(600,650)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = rand(700,750)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = rand(800,850)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = rand(900,1000)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
obj/proc/TrainCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = 99999999999999999999
		src.Content3 = 0.6
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = 999999999999999999999
		src.Content3 = 0.8
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.2
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.4
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.6
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = 999999999999999999999
		src.Content3 = 1.8
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = 999999999999999999999
		src.Content3 = 2
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"

obj/proc/MetalDoorCraft()
	if(src.CraftRank == "Poor Quality")
		src.HP = rand(400,500)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.HP = rand(600,650)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.HP = rand(700,750)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.HP = rand(800,950)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.HP = rand(1000,1050)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.HP = rand(1100,1150)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.HP = rand(1200,1250)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.HP = rand(1300,1350)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could take [src.HP] Damage, it is made of [src.M]"
obj/proc/MetalWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(1,2)
		src.WeaponDamageMax = rand(2,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(1,3)
		src.WeaponDamageMax = rand(3,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(2,4)
		src.WeaponDamageMax = rand(4,6)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(6,10)
		src.WeaponDamageMax = rand(10,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,12)
		src.WeaponDamageMax = rand(12,18)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(10,20)
		src.WeaponDamageMax = rand(20,25)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(20,25)
		src.WeaponDamageMax = rand(26,30)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(30,35)
		src.WeaponDamageMax = rand(36,40)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"

obj/proc/GoldWeaponCraft()
	if(src.CraftRank == "Poor Quality")
		src.WeaponDamageMin = rand(2,3)
		src.WeaponDamageMax = rand(3,4)

		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.WeaponDamageMin = rand(2,3)
		src.WeaponDamageMax = rand(3,5)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Quality")
		src.WeaponDamageMin = rand(3,4)
		src.WeaponDamageMax = rand(4,6)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage it is made of [src.M]"

	if(src.CraftRank == "Impressive Quality")
		src.WeaponDamageMin = rand(7,10)
		src.WeaponDamageMax = rand(10,17)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its design is quite impressive it is made of [src.M]"

	if(src.CraftRank == "Grand Quality")
		src.WeaponDamageMin = rand(8,12)
		src.WeaponDamageMax = rand(12,18)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, it has the mark of a grand crafter it is made of [src.M]"

	if(src.CraftRank == "Masterful Quality")
		src.WeaponDamageMin = rand(11,16)
		src.WeaponDamageMax = rand(16,20)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, its quality is un-matched it is made of [src.M]"

	if(src.CraftRank == "Epic Quality")
		src.WeaponDamageMin = rand(17,21)
		src.WeaponDamageMax = rand(22,28)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage, this weapon is godly it is made of [src.M]"

	if(src.CraftRank == "Legendary Quality")
		src.WeaponDamageMin = rand(28,33)
		src.WeaponDamageMax = rand(33,44)
		src.name = "[src] - [src.CraftRank]"
		desc = "this is a [src] it looks like it could do [src.WeaponDamageMin]/[src.WeaponDamageMax] Damage,this weapon is godly, its craftmanship is legendary, it is made of [src.M]"

obj/proc/FurnitureCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(40,50)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(40,50)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(40,60)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(60,70)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(70,80)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(80,90)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(100,100)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"
		src.CR = rand(100,100)
		desc = "this is [src] it has a impressiveness rating of [src.CR] and is made of [src.M]"
obj/proc/MetalArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,5)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,10)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(10,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(17,20)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/BoneArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,13)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/WoodArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,2)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(4,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,14)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(13,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
obj/proc/LeatherArmourCraft()
	if(src.CraftRank == "Poor Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,1)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Average Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(1,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(2,3)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Impressive Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(3,4)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Grand Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(5,9)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Masterful Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(9,11)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Epic Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(11,15)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
	if(src.CraftRank == "Legendary Quality")
		src.name = "[src] - [src.CraftRank]"

		src.Defence = rand(15,17)
		desc = "this is [src] it has a defence rating of [src.Defence] and is made of [src.M]"
mob/proc/Leave()
	if(src.Leave == 1)
		src.Owner << "[src] : I have to leave now, good bye."
		del(src)
	if(src.Leave == 0)
		src.Leave = 1
	spawn(24000) Leave()
mob/proc/ReturnHome2()
	if(src.Sleeping == 0)
		src.ReturningHome = 1
	spawn(1000) ReturnHome2()

mob/proc/ReturnHome()
	if(src.Sleeping == 0)
		src.ReturningHome = 1
	spawn(1000) ReturnHome()

mob/proc/Escort()

	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.InHole == 0)
		if(src.ReturningHome)
			if(src.loc == src.HomeLoc)
				src.ReturningHome = 0
				src.destination = null
		if(src.ReturningHome == 0)
			for(var/mob/Monsters/M in oview(6,src))
				if(M.destination == src)
					if(src.destination == null)
						src.destination = M
				if(src.Owner == M.Owner)
					for(var/mob/Monsters/S in oview(6,M))
						if(S.destination == M)
							if(src.AttackModeOn)
								if(src.destination == null)
									if(src.Sleeping == 0)
										if(S.Body == 0)
											if(S.Wagon == 0)
												if(S.Drill == 0)
													if(S.InHole == 0)
														src.destination = S
														Speed = 10

		if(src.ReturningHome)
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					src.destination = src.HomeLoc
	spawn(Speed) Escort()
mob/proc/FOS()
	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.InHole == 0)
		if(src.loc == src.HomeLoc)
			src.ReturningHome = 0
			src.destination = null
		if(src.ReturningHome == 0)
			for(var/mob/Monsters/M in view(4,src))
				if(src.destination == null)
					if(src.Sleeping == 0)
						if(src.Owner == M.Owner)
							..()
						else
							if(M.Body == 0)
								if(M.Wagon == 0)
									if(M.Drill == 0)
										src.destination = M
										Speed = 10

		if(src.ReturningHome)
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					src.destination = src.HomeLoc
	spawn(Speed) FOS()
mob/proc/NPCAttack()
	if(src.Alive == 0)
		return
	var/Speed = 20
	if(src.loc == src.HomeLoc)
		src.ReturningHome = 0
		src.destination = null
	if(src.ReturningHome == 0)
		for(var/mob/Monsters/M in view(3,src))
			if(src.InHole == 0)
				if(src.Sleeping == 0)
					if(src.Kobold)
						if(M.StoleFromKobolds)
							Speed = 10
							src.destination = M
					if(src.Owner == "{NPC Humans}")
						if(M.StoleFromHumans)
							Speed = 10
							src.destination = M
					if(src.Dwarf)
						if(M.StoleFromDwarfs)
							Speed = 10
							src.destination = M
					if(src.Goblin)
						if(M.StoleFromGoblins)
							Speed = 10
							src.destination = M
					if(M.destination == src)
						src.destination = M
						Speed = 10
	if(src.ReturningHome)
		if(src.InHole == 0)
			if(src.Sleeping == 0)
				src.destination = src.HomeLoc
	spawn(Speed) NPCAttack()






mob
	var
		list

			Selected



atom
	var
		HP
		MAXHP
		WeaponDamageMin = 0
		WeaponDamageMax = 0
atom
	var
		grass
		weight = 0
		weightmax
