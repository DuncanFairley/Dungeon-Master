/*
Includes:
Tower Cap
Lizard Egg
Spider Egg
Mole
Cave Spider
Death Beatle
Silk Worm
Grown Posion Spore Plant
Posion Spore Plant
Grown Carnivorous Plant
Carnivorous Plant
Deer
*/

mob
	Monsters

		TowerCap
			icon = 'Cave.dmi'
			icon_state = "TowerCap"
			IsTree = 1
			density = 1
			Humanoid = 0
			Intelligent = 0
			weightmax = 10
			SpecialUnit = 1
			DieAge = 25
			HP = 10
			CanKill = 1

		LizardEgg
			icon = 'LizardEgg.dmi'
			density = 1
			DieAge = 3000000
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			LizardMan = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP

		SpiderEgg
			icon = 'SpiderEgg.dmi'
			icon_state = "Egg"
			density = 1
			DieAge = 3
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			Spider = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
		Mole
			icon = 'Mole.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			DieAge = 10
			Cantame = 1
			Humanoid = 1
			SpecialUnit = 1
			Mole = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP



		CaveSpider
			icon = 'Bugs.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			Posionus = 1
			DieAge = 10
			Cantame = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			SpecialUnit = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP




		DeathBeatle
			icon = 'DeathBeatle.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			SpecialUnit = 1
			CanKill = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1

			Posionus = 1
			Cantame = 1
			DieAge = 10
			Beatle = 1
			Humanoid = 0

			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(3,5)
				usr.Agility = rand(3,5)
				usr.Defence = rand(3,5)
				usr.MAXHP = rand(25,35)
				usr.HP = usr.MAXHP

		SilkWorm
			icon = 'Bugs.dmi'
			icon_state = "DoomWorm"
			density = 1
			weightmax = 10

			Bug = 1
			Posionus = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,2)
				usr.Agility = rand(1,2)
				usr.Defence = rand(1,2)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP

		GrownPosionSporePlant
			name = "PosionSporePlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SneakingSkill = 500
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant2()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP

		PosionSporePlant
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			SneakingSkill = 500
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant2()
		GrownCarnivorousPlant
			name = "CarnivorousPlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			SneakingSkill = 500
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant1()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP


		CarnivorousPlant
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			SneakingSkill = 500
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant1()

		Deer
			icon = 'Animal.dmi'
			density = 1
			weightmax = 100
			Deer = 1
			DieAge = 10
			Age = 1
			Cantame = 1
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP