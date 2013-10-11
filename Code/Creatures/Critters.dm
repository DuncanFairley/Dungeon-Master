mob/var
	Critter=0
mob/Monsters/Critters
	Strength=1
	Agility=1
	Defence=1
	HP=15
	MAXHP=15
	Critter = 1
	weightmax = 10
	Age=6
	DieAge = 16
	HumanParts = 0
	Cantame = 1
	CantLoseLimbs = 1

	//Stops procs from doing anything
	ToggleSelect()
	Select()
	Deselect()
	//Saves having to put a if(!Critter) on the selection.

	New()
		if(prob(50)) Gender = "Male"
		else Gender = "Female"
	DblClick()
		if(!Tame) return
		if(Owner!=usr) return
		for(var/mob/Monsters/M in usr.UnitList) if(!M.Critter) if(src in view(1,M)) if(!M.Wagon)
			var/list/menu = new()
			menu += "Tell Pet To Stop"
			menu += "Tell Pet To Follow"
			menu += "Tell Pet To Breed"
			menu += "Kill"
			menu += "Cancel"
			var/Result = input("What do you wish to do with the [Gender] [name]?", "Choose", null) in menu
			if (Result == "Tell Pet To Breed") for(var/mob/Monsters/Critters/C in view(1,src)) BreedWith(C)
			if (Result == "Kill")
				HP = 0
				GoingToDie = 1
				Death()
			if (Result == "Tell Pet To Stop") destination = null
			if (Result == "Tell Pet To Follow") if(M in usr.Selected)
				destination = M
				PetFollow()
	TowerCap
		icon = 'Cave.dmi'
		icon_state = "TowerCap"
		Race = "TowerCap"
		DieAge = 25
		Cantame = 0
		New()
	Mole
		icon = 'Mole.dmi'
		icon_state = "Normal"
		Race = "Mole"
	CaveSpider
		icon = 'Bugs.dmi'
		icon_state = "Normal"
		Race = "CaveSpider"
		WebContent=10
		MaxWebContent=10
		HasGland=1
	DeathBeatle
		HasGland=3
		icon = 'DeathBeatle.dmi'
		icon_state = "Normal"
		Race = "DeathBeatle"
	Deer
		icon = 'Animal.dmi'
		Race = "Deer"
		weightmax = 100
	PoisonSporePlant
		HasGland=2
		icon = 'Swamp.dmi'
		icon_state = "Plant2"
		DieAge = 1000
		Race = "Plant"
		SubRace = "2"
		Cantame = 0
		SneakingSkill = 500
		HP = 5000
		New()
			spawn() while(1)
				var/TOLD=null
				for(var/mob/Monsters/M in oview(1,src)) if(M.Race!="Plant") if(prob(75))
					if(!TOLD)
						view(src) << "[src] spews corrosive posion spores into the air!!"
						TOLD=1
					M.BloodContent -= 25
					M.BloodLoss()
					M.LeftLungHP -= 15
					M.RightLungHP -= 15
				sleep(20)
			usr.Strength = rand(1,1)
			usr.Agility = rand(1,1)
			usr.Defence = rand(1,1)
			usr.MAXHP = rand(5,10)
			usr.HP = usr.MAXHP
			for(var/turf/grounds/G in view(0,usr))
				if(G.Detailed == 1)
					del(usr)
	CarnivorousPlant
		HasGland=2
		icon = 'Swamp.dmi'
		icon_state = "Plant1"
		Race = "Plant"
		SubRace = "1"
		SneakingSkill = 500
		Cantame = 0
		DieAge = 1000
		HP = 5000
		New()
			usr.Strength = rand(1,1)
			usr.Agility = rand(1,1)
			usr.Defence = rand(1,1)
			usr.MAXHP = rand(5,10)
			usr.HP = usr.MAXHP
			for(var/turf/grounds/G in view(0,usr)) if(G.Detailed) del(usr)
			spawn() for(var/mob/Monsters/M in oview(1,src))
				if(prob(75))
					if(prob(50)) if(M.HasLeftArm) if(!M.WearingLeftArm && M.UsesEquipment)
						M.HasLeftArm = 0
						M.LeftArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseLeftArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s left arm off!!"
						for(var/obj/Items/Equipment/Armour/Shield/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s left arm is torn off!, they drop their shield!"
					else if(M.HasRightArm) if(!M.WearingRightArm && M.UsesEquipment)
						M.HasRightArm = 0
						M.RightArm = "Destroyed"
						M.BloodContent -= 25
						M.BloodLoss()
						M.CanUseRightArm = 0
						M.LimbLoss()
						M.Owner << "[src] chews [M]'s right arm off!!"
						for(var/obj/Items/Equipment/Weapon/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s right arm is torn off!, they drop their weapon!"
	Gremlin
		icon = 'Dwarf.dmi'
		density = 1
		weightmax = 100
		Race = "Gremlin"
		DieAge = 100
		SneakingSkill = 200
		Cantame = 0
		WearingFullPlateHelm = 1
		New()
			usr.Strength = rand(1,1)
			usr.Agility = rand(1,1)
			usr.Defence = rand(1,1)
			usr.Intelligence = rand(-1,-2)
			usr.MAXHP = rand(5,10)
			usr.HP = usr.MAXHP
			spawn() while(src)
				sleep(10)
				for(var/obj/Items/I in view(6,src)) if(I.suffix == null) if(I.Door == 0) if(I.IsTrap == 0) if(I.Content3 != "Cage")
					if(src.Target == null) src.Target = I
					if(src.loc == I.loc && src.Target == I) del(I)
				if(src.Target)
					var/obj/A = src.Target
					if(A.suffix == null) step_towards(src,src.Target)
					else src.Target = null
				else step_rand(src)