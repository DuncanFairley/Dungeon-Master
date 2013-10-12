mob
	HP=350
	MAXHP=350
	IsWood = 1
	Test
		density = 0
		IsMist = 1

mob/proc/ToggleSelect(Player/USR=Owner)
	if(USR.Selected.Find(src)) src.Deselect(USR)
	else src.Select(USR)
mob/proc/Select(mob/USER=Owner) if(ismob(USER))
	if(src.Egg || src.InHole || src.Sleeping) return
	if(!ismob(loc)&&!isobj(loc))
		if(!USER.Selected.Find(src))
			USER.Selected.Add(src)
			if(USER.client) USER.client.images += Star
mob/proc/Deselect(Player/USER=Owner) if(ismob(USER)) if(USER.Selected.Find(src))
	USER.Selected.Remove(src)
	if(USER.client) USER.client.images -= Star
mob
	Monsters
		HumanParts=1
		DblClick()
			if(Owner==usr) src.ToggleSelect()
			else if(usr.DE && usr.FreeSelect) src.ToggleSelect(usr)
		Devourer
			HoldingWeapon = "Mace"
			WearingShield = 1
			WeaponDamageMin=20
			WeaponDamageMax=24
			UsesEquipment=0
			BoneCraftingSkill = 25
			icon = 'Devourer.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 200
			Race = "Devourer"
			SubRace = "Blooded"
			Gender = "None"
			Carn = 1
			Infects = 1
			EggContent = 0
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 10
			SwordSkill = 20
			SneakingSkill = 0
			Delay = 4
			ShieldSkill = 10
			ImmunePoison = 1
			ButcherySkill = 5
			UnArmedSkill = 30
			FishingSkill = 25

			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 0
			HasRightLeg = 0
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			LeftLeg = "N/A"
			RightLeg = "N/A"
			OrganMaxHP = 150
			Undead = 1
			Defence = 75
			Age = 2000
			DieAge = 5000
			New()
				usr.Strength += rand(15,20)
				usr.Agility += rand(10,15)
				usr.Intelligence += rand(1,2)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			FleshCrawler
				parent_type=/mob/Monsters
				UsesEquipment=0
				WeaponDamageMin = 7
				WeaponDamageMax = 10
				icon = 'Devourer.dmi'
				icon_state = "FleshCrawler"
				Race="FleshCrawler"
				density = 1
				Carn = 1
				HoldingWeapon = "Claws"
				SneakingSkill = 250
				CantLoseLimbs = 1
				BloodContent = 200
				MaxBloodContent = 200
				Gender = "None"
				Delay = 3
				ImmunePoison = 1
				HasLeftEye = 1
				HasRightEye = 1
				HasRightLung  = 1
				HasLeftLung  = 1
				HasSpleen  = 1
				HasTeeth  = 1
				HasLeftArm  = 1
				HasRightArm = 1
				HasLeftLeg = 1
				HasRightLeg = 1
				HasHead = 1
				HasLeftEar = 1
				HasRightEar = 1
				HasGuts = 1
				HasStomach = 1
				HasLeftKidney = 1
				HasRightKidney = 1
				HasLiver = 1
				HasBrain = 1
				HasHeart = 1
				HasThroat = 1
				HasNose = 1
				OrganMaxHP = 60
				New()
					Age = rand(20,60)
					usr.Strength += rand(10,15)
					usr.Agility += rand(10,15)
					usr.Defence += rand(15,25)
					StartAllProcs()
					..()
					var/image/I = new('mob.dmi',src)
					src.Star = I
					spawn(2000)
						src.Killer = "Rapid Decay"
						src.GoingToDie = 1
						src.Death()
		DevourerZombie
			Undead=1
			Race = "Zombie"
			SubRace = "Blooded"
			icon = 'DevourerZombie.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			MineingSkill = 10
			WoodCuttingSkill = 20
			Infects = 1
			Carn = 1
			SpearSkill = 10
			SwordSkill = 10
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 10
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			SkinningSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			FishingSkill = 25
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 110
			Age = 0
			Strength=10
			Agility=10
			Defence=0
			Intelligence=0
			DieAge=1500
			New()
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Chests
			icon = 'Cave.dmi'
			density=0
			HumanParts=0
			weightmax=100000
			Wagon=1
			CantKill=1
			layer=4
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			SilverChest
				icon_state = "Silver Chest"
				desc = "This is a silver chest, it can ued to store items in."
			GoldChest
				icon_state = "Gold Chest"
				desc = "This is a gold chest, it can ued to store items in."
			MetalChest
				icon_state = "Metal Chest"
				desc = "This is a metal chest, it can ued to store items in."
			WoodenChest
				icon_state = "Wooden Chest"
				desc = "This is a wooden chest, it can ued to store items in."
			Wagon
				icon_state = "Wagon"
				weightmax = 1500
				HasLeftLeg = 1
				Delay = 4
				HasRightLeg = 1
				Fainted = 0
				CanWalk = 1
				New()
					WalkTo()
					..()
			Drill
				icon = 'MetalObjects.dmi'
				icon_state = "Drill"
				Drill = 1
				desc = "This is a drill, it can be used to extract ore from the ground.This type of drill can be placed in the ground and twisted around to dig with."
		Elf
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 120
			MineingSkill = 0
			WoodCuttingSkill = 70
			Race = "Elf"
			UsesPicks = 1
			Carn = 1
			SpearSkill = 45
			SwordSkill = 25
			AxeSkill = 5
			MaceSkill = 5
			PotionSkill = 10
			BowSkill = 40
			BloodContent = 300
			MaxBloodContent = 300
			UsesPoison = 1
			UnArmedSkill = 5
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			WoodCraftingSkill = 35
			MetalCraftingSkill = 5
			SkinningSkill = 15
			ButcherySkill = 25
			LeatherCraftingSkill = 25
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 5
			SneakingSkill = 25
			LockPickingSkill = 25
			CookingSkill = 25
			FishingSkill = 25

			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 110
			New(LOC,GENDER=prob(50))
				Age = rand(20,30)
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Hair="Elf[Gender]"
				usr.Strength += rand(2,4)
				usr.Agility += rand(9,14)
				usr.Defence += rand(5,10)
				usr.Intelligence += rand(1,3)
				usr.DieAge += rand(1600,1700)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Human
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 110
			MineingSkill = 10
			WoodCuttingSkill = 20
			Race = "Human"
			UsesPicks = 1
			Carn = 0
			SpearSkill = 10
			SwordSkill = 20
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			BowSkill = 15
			MaxBloodContent = 300
			UnArmedSkill = 10
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			SkinningSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PoisonSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			FishingSkill = 25

			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 110
			NPC
				CanBeSlaved = 1
				Owner = "{NPC Alliance}"
				name = "{NPC Alliance} Human"
				Paladin
					ReturnDelay=400
					EXP=1000
					SwordSkill=80
					name = "{NPC Alliance} Human Paladin"
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate))
							CraftItem(E,"Grand")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				PaladinGuard
					EXP=1500
					SwordSkill=100
					name = "{NPC Alliance} Human Paladin"
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate))
							CraftItem(E,"Grand")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Dragoon
					ReturnDelay=400
					EXP=20000
					SwordSkill=80
					ArmourSkill=40
					SneakingSkill=100
					name = "{NPC Alliance} Human Dragoon"
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius,new/obj/Items/Equipment/Armour/RightArm/DragoonRightGauntlet,new/obj/Items/Equipment/Armour/Helmet/DragoonHelmet,new/obj/Items/Equipment/Armour/Leggings/DragoonLeggings,new/obj/Items/Equipment/Armour/Chestplate/DragoonChestPlate,new/obj/Items/Equipment/Armour/LeftArm/DragoonLeftGauntlet))
							CraftItem(E,"Holy")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()

				Scout
					ReturnDelay=500
					name = "{NPC Alliance} Human Scout"
					EXP = 400
					SwordSkill=40
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/Gladius(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Quality")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Warrior
					ReturnDelay=50
					name = "{NPC Alliance} Human Warrior"
					EXP = 13000
					SwordSkill=150
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Weapon/Swords/StraightSword(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Guard
					name = "{NPC Alliance} Human Guard"
					EXP = 1000
					SpearSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
							CraftItem(E,"Impressive")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Noble
					IsRoyal=1
					name = "{NPC Alliance} Human Noble"
					EXP = 15000
					SwordSkill=200
					ArmourSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/GoldGladius(),new/obj/Items/Equipment/Armour/Chestplate/GoldChestPlate(),new/obj/Items/Equipment/Armour/Leggings/GoldLeggings()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Villager
					name = "{NPC Alliance} Human Villager"
					EXP = 100
					UnArmedSkill=40
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Poor")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Skorn
					Owner= "{NPC Demons}"
					name = "{NPC Demons} Follower of Skorn"
					SubRace="HalfDemon"
					EXP = 30000
					SpearSkill=200
					ShieldSkill=40
					ArmourSkill=50
					SneakingSkill=100
					WearingShield=1
					Defence=60
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Leggings/SkornLeggings,new/obj/Items/Equipment/Armour/Chestplate/SkornChestPlate,new/obj/Items/Equipment/Armour/Helmet/SkornPlateHelmet,new/obj/Items/Equipment/Armour/LeftArm/SkornLeftGauntlet,new/obj/Items/Equipment/Armour/RightArm/SkornRightGauntlet))
							CraftItem(E,"Unholy")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
						spawn() icon+=rgb(100,0,0)
					Skorn
						IsRoyal=1
						name = "{NPC Demons} Skorn, Lord of Pain"
						ShieldSkill=90
						ArmourSkill=90
						SneakingSkill=100
						EXP = 50000
						WeaponDamageMin=50
						WeaponDamageMax=70
						WearingShield=1
						Strength=50
						Agility=50
						Defence=90
						New()
							..()
							Gender = "Male"
							icon='Human.dmi'
							Black=null
							Hair=null
			New(LOC,GENDER=prob(50))
				Age = rand(20,30)
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				if(prob(50))
					Black=1
					icon = 'HumanBlack.dmi'
				if(Gender=="Female") Hair="Human[pick("Black","Brown")]"
				else Hair=0
				Strength += rand(5,10)
				Agility += rand(7,11)
				Defence += rand(4,9)
				Intelligence += rand(1,2)
				DieAge += rand(95,115)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Orc
			icon = 'Orc.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 15
			WoodCuttingSkill = 15
			Race = "Orc"
			UsesPicks = 1
			Carn = 1
			SpearSkill = 15
			SwordSkill = 20
			AxeSkill = 30
			MaceSkill = 25
			PotionSkill = 0
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 0
			ArmourSkill = 20
			UsesPoison = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			SkinningSkill = 20
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PoisonSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 130
			NPCOrc
				CanBeSlaved = 1
				Owner = "{NPC Orcs}"
				name = "{NPC Orcs} Orc"
				Scout
					ReturnDelay=300
					EXP=125
					name = "{NPC Orcs} Orc Scout"
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Hunter
					ReturnDelay=200
					name = "{NPC Orcs} Orc Hunter"
					EXP=800
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Warlord
					name = "{NPC Orcs} Orcish Warlord"
					EXP=50000
					ButcherySkill=150
					SneakingSkill=100
					Defence=40
					ArmourSkill=70
					ShieldSkill=70
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/DemonicWeapons/Butcher_Knife/B = new
						if(ForcePickUpItem(B)) ForceEquipItem(B)
						StayLocal()
						..()
				Warrior
					name = "{NPC Orcs} Orc Warrior"
					EXP=1000
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/MetalBuckler(),new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet()))
							CraftItem(E,"Impressive")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Guard
					EXP = 1000
					AxeSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/Shield/MetalBuckler()))
							CraftItem(E,"Epic")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()

			New(LOC,GENDER=prob(50))
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Strength += rand(7,14)
				Agility += rand(5,8)
				Defence += rand(6,12)
				Intelligence += rand(0.25,0.5)
				DieAge += rand(110,125)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Illithid
			icon = 'Illithid.dmi'
			icon_state = "Normal"
			Race = "Illithid"
			SubRace="Illithid"
			density = 1
			weightmax = 65
			MineingSkill = 15
			WoodCuttingSkill = 15
			CantLoseLimbs = 1
			Carn = 1
			SpearSkill = 20
			SwordSkill = 10
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 0
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 15
			ArmourSkill = 20
			UsesPoison = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			SkinningSkill = 20
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PoisonSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 130
			New()
				Strength += rand(2,5)
				Agility += rand(5,8)
				Defence += rand(2,5)
				Intelligence += rand(4.5,6.5)
				DieAge += rand(270,300)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Goblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			MineingSkill = 10
			WoodCuttingSkill = 10
			Race = "Goblin"
			BowSkill = 20
			UsesPicks = 1
			Carn = 1
			SwordSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 10
			ShieldSkill = 15
			SpearSkill = 20
			PoisonSkill = 30
			BoneCraftingSkill = 15
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 15
			LockPickingSkill = 20
			SneakingSkill = 20
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 15
			JewlCraftingSkill = 15
			MetalCraftingSkill = 15
			WoodCraftingSkill = 10
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 95
			NPC
				CanBeSlaved = 1
				Owner = "{NPC Goblins}"
				name = "{NPC Goblins} Goblin"
				Scout
					ReturnDelay=300
					name = "{NPC Goblins} Goblin Scout"
					SpearSkill=40
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Villager
					EXP = 100
					UnArmedSkill=40
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Poor")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Guard
					name = "{NPC Goblins} Goblin Guard"
					EXP=1000
					SpearSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
							CraftItem(E,"Impressive")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				King
					name = "{NPC Goblins} Goblin King"
					EXP=15000
					SwordSkill=150
					IsRoyal=1
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Swords/SilverSword(),new/obj/Items/Equipment/Armour/Chestplate/SilverChestPlate(),new/obj/Items/Equipment/Armour/Leggings/SilverLeggings(),new/obj/Items/Equipment/Armour/Crown/Bone))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Commander
					ReturnDelay=400
					name = "{NPC Goblins} Goblin Commander"
					EXP = 2500
					SwordSkill=150
					SneakingSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/Swords/Lichbane/D = new
						if(ForcePickUpItem(D)) ForceEquipItem(D)
						StayLocal()
						..()
			New(LOC,GENDER=prob(50))
				Age = rand(20,60)
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Strength += rand(4,9)
				Agility += rand(8,12)
				Defence += rand(3,8)
				Intelligence += rand(0.5,0.75)
				DieAge = rand(110,120)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		SandKing
			UsesEquipment=0
			icon = 'Sandking.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			Race = "SandKing"
			SubRace = "Sand"
			WearingCape = 1
			Carn = 1
			BloodContent = 300
			MaxBloodContent = 300
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			CanWalk = 0
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 95
			New()
				Age = 45
				usr.Strength += rand(10,15)
				usr.Agility += rand(1,2)
				usr.Defence += rand(20,40)
				FullHeal()
				Hunger()
				Heal()
				Bleeding()
				usr.DieAge = rand(1000,2000)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			Sand_Humanoid
				parent_type = /mob/Monsters/Dwarf
				icon = 'Sand Humanoid.dmi'
				Race = "Humanoid"
				SubRace = "Sand"
				Carn = 1
				SandWorker = 1
				Gender = "None"
				Delay = 3
				ImmunePoison = 1
				OrganMaxHP = 85
				New()
					..()
					Beard=null
					Hair=null
					Gender = "None"
					RebuildOverlays()
					Strength += rand(10,15)
					Agility += rand(10,15)
					Defence += rand(15,25)
					Intelligence += rand(0.25,0.5)
					DieAge += rand(900,1000)
			Sand_Maggot
				parent_type = /mob/Monsters/SandKing/Sand_Humanoid
				Race = "Maggot"
				UsesEquipment=0
				icon = 'SandSoldier.dmi'
				HoldingWeapon = "Claws"
				ClawSkill=25
				BloodContent = 300
				MaxBloodContent = 300
				OrganMaxHP = 85
			Sand_Dragon
				parent_type = /mob/Monsters/Dragon
				SubRace="Sand"
				icon_state="sand"
		Dwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 130
			MineingSkill = 50
			WoodCuttingSkill = 20
			Race = "Dwarf"
			UsesPicks = 1
			BloodContent = 300
			MaxBloodContent = 300
			Carn = 0

			BowSkill = 15
			AxeSkill = 20
			ArmourSkill = 40
			SneakingSkill = 10
			ShieldSkill = 20
			ButcherySkill = 10
			MaceSkill = 25
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 30
			MetalCraftingSkill = 25
			JewlCraftingSkill = 20
			FishingSkill = 15
			LeatherCraftingSkill = 15
			CookingSkill = 15

			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 125
			NPC
				CanBeSlaved = 1
				Owner = "{NPC Alliance}"
				name = "{NPC Alliance} Dwarf"
				Guard
					name = "{NPC Alliance} Dwarven Guard"
					EXP = 10000
					SpearSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings(),new/obj/Items/Equipment/Armour/Helmet/MetalHelmet))
							CraftItem(E,"Impressive")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
				Villager
					name = "{NPC Alliance} Dwarven Villager"
					EXP = 100
					UnArmedSkill=40
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Poor")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						Guarding()
						..()
			New(LOC,GENDER=prob(50))
				Age = rand(20,30)
				if(GENDER)
					Gender = "Male"
					Beard = pick("Grey","Brown","Black",null)
					Hair = 0
				else
					Gender = "Female"
					Beard = 0
					Hair = "HumanBrown"
				Strength += rand(7,14)
				Agility += rand(3,6)
				Defence += rand(7,13)
				Intelligence += rand(0.5,0.75)
				DieAge += rand(120,150)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Lizardman
			icon = 'Lizardman.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 10
			WoodCuttingSkill = 10
			Race = "Lizardman"
			BowSkill = 25
			Carn = 1
			SwordSkill = 20
			HasGland = 1
			ImmunePoison = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 15
			ShieldSkill = 20
			PoisonDMG = 5
			SpearSkill = 25
			PoisonSkill = 25
			BoneCraftingSkill = 20
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 20
			LockPickingSkill = 20
			SneakingSkill = 15
			MaceSkill = 10
			UsesPoison = 1
			FishingSkill = 20
			JewlCraftingSkill = 5
			MetalCraftingSkill = 10
			WoodCraftingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 115
			NPCLizardMan
				CanBeSlaved = 1
				Owner = "{NPC Lizardmen}"
				name = "{NPC Lizardmen} Lizardmen"
				New()
					..()
					StayLocal()
				Scout
					ReturnDelay=300
					name = "{NPC Lizardmen} Lizardmen Scout"
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
				Hunter
					ReturnDelay=200
					name = "{NPC Lizardmen} Lizardmen Hunter"
					EXP=500
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
				Warrior
					ReturnDelay=100
					name = "{NPC Lizardmen} Lizardmen Warrior"
					EXP = 1500
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/BoneBuckler(),new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Helmet/BoneHelmet(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
							CraftItem(E,"Impressive")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()

			New(LOC,GENDER=prob(50))
				Age = rand(20,60)
				if(GENDER) usr.Gender = "Male"
				else usr.Gender = "Female"
				usr.Strength += rand(6,11)
				usr.Agility += rand(8,12)
				usr.Defence += rand(9,12)
				usr.Intelligence += rand(0.25,0.5)
				usr.DieAge += rand(110,115)
				var/image/I = new('mob.dmi',src)
				src.Star = I
				StartAllProcs()
				..()
		Ratman
			icon = 'Ratmen.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Ratman"
			MineingSkill = 45
			WoodCuttingSkill = 45
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			Carn = 1
			SpearSkill = 25
			ArmourSkill = 10
			LockPickingSkill = 10
			SneakingSkill = 45
			UsesPoison = 1
			PoisonSkill = 45
			SkinningSkill = 15
			BoneCraftingSkill = 35
			ButcherySkill = 35
			UnArmedSkill = 20
			FishingSkill = 20
			MetalCraftingSkill = 5
			WoodCraftingSkill = 5
			StoneCraftingSkill = 25
			LeatherCraftingSkill = 20
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 65
			NPC
				CanBeSlaved = 1
				Owner = "{NPC Ratmen}"
				name = "{NPC Ratmen} Ratman"
				Scout
					ReturnDelay=500
					name = "{NPC Ratmen} Ratman Scout"
					EXP = 100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
							CraftItem(E,"Poor")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				King
					ReturnDelay=400
					name = "{NPC Ratmen} Ratman Commander"
					EXP = 2500
					SpearSkill=150
					SneakingSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet(),new/obj/Items/Equipment/Armour/Crown/Bone()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/Spears/Bloodwhisker/B = new
						if(ForcePickUpItem(B)) ForceEquipItem(B)
						StayLocal()
						..()
			New(LOC,GENDER=prob(50))
				Age = rand(5,10)
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Strength += rand(1,2)
				Agility += rand(10,15)
				Defence += rand(0,1)
				Intelligence += rand(0.25,0.5)
				DieAge += rand(40,50)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Svartalfar
			icon = 'Night Elf.dmi'
			icon_state = "Normal"
			ImmuneToTemperature=1
			density = 1

			Unholy = 1
			WeaponDamageMin = 15
			WeaponDamageMax = 20

			weightmax = 200
			Race = "Svartalfar"
			MagicalAptitude = 1
			ImmunePoison = 1
			Carn = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			SpearSkill = 35
			SwordSkill  = 35
			BloodContent = 300
			MaxBloodContent = 300
			AxeSkill  = 35
			MaceSkill  = 35
			UnArmedSkill  = 45
			BowSkill = 25
			ShieldSkill  = 35
			ArmourSkill  = 35
			WoodCraftingSkill  = 35
			MetalCraftingSkill  = 35
			SkinningSkill  = 35
			ButcherySkill  = 35
			LeatherCraftingSkill  = 35
			PoisonSkill  = 35
			PotionSkill = 20
			BoneCraftingSkill  = 35
			StoneCraftingSkill  = 35
			SneakingSkill  = 35
			LockPickingSkill = 35
			JewlCraftingSkill = 35
			CookingSkill  = 35
			FishingSkill  = 35
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 140
			New()
				Age = rand(10,20)
				usr.Strength += rand(7,9)
				usr.Agility += rand(14,20)
				usr.Defence += rand(15,18)
				usr.Intelligence += rand(4,6)
				usr.DieAge += rand(500,600)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Kobold
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 85
			Race = "Kobold"
			CliffClimber=1
			MineingSkill = 10
			WoodCuttingSkill = 10
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			Carn = 1
			SpearSkill = 25
			ArmourSkill = 10
			LockPickingSkill = 25
			SneakingSkill = 40
			UsesPoison = 1
			PoisonSkill = 40
			SkinningSkill = 15
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 15
			FishingSkill = 20
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 20
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 85
			NPC
				CanBeSlaved = 1
				Owner = "{NPC Kobolds}"
				name = "{NPC Kobolds} Kobold"
				Scout
					ReturnDelay=400
					name = "{NPC Kobolds} Kobold Scout"
					EXP = 100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear(),new/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate(),new/obj/Items/Equipment/Armour/Leggings/LeatherLeggings()))
							CraftItem(E,"Poor")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
				Chieftain
					ReturnDelay=400
					name = "{NPC Kobolds} Kobold Chieftain"
					EXP = 2500
					DaggerSkill=150
					SneakingSkill=100
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
							CraftItem(E,"Grand")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger/D = new
						D.name = "Sacrifical Blade of Dragethh"
						D.desc = "The kobolds probably stole it from the temple of some crazy cult of blood god worshippers, it is very sharp and radiates an aura of pure evil."
						if(ForcePickUpItem(D)) ForceEquipItem(D)
						StayLocal()
						..()

			New(LOC,GENDER=prob(50))
				Age = rand(20,60)
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Strength += rand(4,8)
				Agility += rand(9,13)
				Defence += rand(2,6)
				Intelligence += rand(0.1,0.2)
				DieAge += rand(95,110)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Zombie
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Zombie"
			BowSkill = 0
			Infects = 1
			BloodContent = 250
			MaxBloodContent = 250
			Carn = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			SpearSkill = 0
			ArmourSkill = 0
			UnArmedSkill = 15
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 100

			New()
				usr.Strength += rand(5,10)
				usr.Agility += rand(5,10)
				usr.Defence += rand(5,10)
				usr.Intelligence += rand(0.05,0.075)
				usr.DieAge += 10000
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Vampire
			Undead=1
			icon = 'Vampire.dmi'
			SavedIcon = 'Human.dmi'
			Race = "Vampire"
			SubRace = "Blooded"
			ImmuneToTemperature=1
			CliffClimber=1
			density = 1
			weightmax = 200
			ImmunePoison = 1
			Carn = 1
			Evolved = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPoison = 1
			SpearSkill = 35
			SwordSkill  = 35
			BloodContent = 300
			MaxBloodContent = 300
			AxeSkill  = 35
			MaceSkill  = 35
			UnArmedSkill  = 45
			BowSkill = 25
			ShieldSkill  = 35
			ArmourSkill  = 35
			WingsOut = 1
			WoodCraftingSkill  = 35
			MetalCraftingSkill  = 35
			SkinningSkill  = 35
			ButcherySkill  = 35
			LeatherCraftingSkill  = 35
			PoisonSkill  = 35
			BoneCraftingSkill  = 35
			StoneCraftingSkill  = 35
			SneakingSkill  = 35
			LockPickingSkill = 35
			JewlCraftingSkill = 35
			CookingSkill  = 35
			FishingSkill  = 35
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			HasWings = 1
			OrganMaxHP = 140
			New()
				Age = rand(20,60)
				usr.Strength += rand(15,25)
				usr.Agility += rand(15,25)
				usr.Defence += rand(25,45)
				usr.Intelligence += rand(5,7)
				usr.DieAge += rand(4000,4250)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Gargoyle
			UsesPoison=1
			icon = 'Gargoyle.dmi'
			density = 1
			weightmax = 160
			Race = "Gargoyle"
			SubRace = "Stone"
			IsWood = 0
			Running = 1
			Delay = 5
			Carn = 1
			ImmuneToMagic = 1
			ImmuneToTemperature = 1
			SpearSkill = 10
			HasWings = 1
			SwordSkill  = 10
			Skinned = 1
			AxeSkill  = 10
			MaceSkill  = 10
			ImmunePoison = 1
			UnArmedSkill  = 50
			BowSkill = 10
			ShieldSkill  = 10
			WearingFullPlateHelm = 1
			ArmourSkill  = 10
			WingsOut = 1
			WoodCraftingSkill  = 10
			MetalCraftingSkill  = 15
			SkinningSkill  = 10
			ButcherySkill  = 10
			LeatherCraftingSkill  = 10
			PoisonSkill  = 10
			BoneCraftingSkill  = 10
			StoneCraftingSkill  = 35
			SneakingSkill  = -10
			LockPickingSkill = 0
			JewlCraftingSkill = 35
			CookingSkill  = 0
			FishingSkill  = -10
			HasLeftEye = 1
			HasRightEye = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasNose = 1
			OrganMaxHP = 155
			New()
				Age = rand(20,60)
				usr.Strength += rand(20,25)
				usr.Agility += rand(2,5)
				usr.Defence += 40
				usr.Intelligence += rand(-5,-8)
				usr.DieAge += rand(2000,5000)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Demon
			BloodContent = 350
			MaxBloodContent = 350
			icon = 'Demon.dmi'
			ImmunePoison=1
			ImmuneToTemperature=1
			Race = "Demon"
			SubRace = "Blooded"
			IsWood = 0
			weightmax = 200
			MineingSkill = 10
			WoodCuttingSkill = 10
			Carn = 1
			BloodContent = 300
			MaxBloodContent = 300
			WingsOut = 1
			WoodCraftingSkill  = 20
			MetalCraftingSkill  = 20
			SkinningSkill  = 20
			ButcherySkill  = 20
			LeatherCraftingSkill  = 20
			PoisonSkill  = 20
			BoneCraftingSkill  = 20
			StoneCraftingSkill  = 20
			LockPickingSkill = 20
			JewlCraftingSkill = 20
			CookingSkill  = 20
			FishingSkill  = 25
			SneakingSkill  = 15
			text = "<font color=red>&"

			HasWings = 1
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 250

			SpearSkill = 20
			AxeSkill  = 20
			SwordSkill  = 60
			UnArmedSkill  = 30
			MaceSkill  = 20
			BowSkill = 15
			ShieldSkill  = 20
			ArmourSkill  = 35
			NPC
				IsRoyal=1//Stops ever changing owner, and grants better stats.
				CanBeSlaved = 1
				EXP=120000
				ReturnDelay=300
				UnArmedSkill=150
				SwordSkill=150
				MaceSkill=150
				SpearSkill=150
				AxeSkill=150
				DaggerSkill=150
				SneakingSkill=150
				BowSkill=150
				Defence=160
				Owner = "{NPC Demons}"
				name = "{NPC Demons} Demon"
				WeaponDamageMin=20
				WeaponDamageMax=20
				WearingChest=1
				WearingShield=1
				WearingHelmet=1
				WearingLegs=1
				WearingBack=1
				WearingCape=1
				WearingLeftArm=1
				WearingRightArm=1
				New()
					if(!HoldingWeapon)
						var/obj/Items/Equipment/Weapon/W
						switch(rand(1,6))
							if(1) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Sword(loc)
							if(2) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Axe(loc)
							if(3) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Mace(loc)
							if(4) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Spear(loc)
							if(5) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger(loc)
							if(6) W = new/obj/Items/Equipment/Weapon/DemonicWeapons/Bow(loc)
						if(W) if(ForcePickUpItem(W)) if(ForceEquipItem(W)) if(HoldingWeapon=="Bow") HoldingWeapon="Mace"
					..()
				Warrior //For map generated demons.
					name = "{NPC} Demon"
					New()
						StayLocal()
						loc=LocateValidLocation(X=103,XX=929,Y=130,YY=683,Z=4)
						if(prob(0.5)) new/mob/Monsters/Demon/NPC/Lord(loc)
						..()

				Lord
					IsRoyal=1
					name = "{NPC} Demon Lord"
					EXPNeeded=300000
					Level=100
					Strength = 30
					Agility = 30
					Defence = 230
					WeaponDamageMin = 40
					WeaponDamageMax = 65
					ImmunePoison=1
					SwordSkill = 150
					BloodContent = 400
					MaxBloodContent = 400
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/Crown/Bone()))
							CraftItem(E,"Unholy")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/DemonicWeapons/DestructionSword/E = new()
						if(ForcePickUpItem(E)) ForceEquipItem(E)
						StayLocal()
						..()
			New(LOC,GENDER=prob(50))
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Age = rand(200,600)
				usr.DieAge += rand(10000,12500)
				usr.Strength += rand(100,120)
				usr.Agility += rand(100,120)
				usr.Intelligence += rand(4,8)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Frogman
			UsesPoison=1
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Frogman"
			MineingSkill = 10
			WoodCuttingSkill = 10
			Carn = 1
			ButcherySkill = 10
			SneakingSkill = 20
			SkinningSkill = 10
			FishingSkill = 20
			JewlCraftingSkill = 5
			MetalCraftingSkill = 10
			WoodCraftingSkill = 15
			ArmourSkill = 15
			ShieldSkill = 20
			SpearSkill = 25
			PoisonSkill = 25
			BoneCraftingSkill = 20
			UnArmedSkill = 20
			SneakingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15
			ImmunePoison = 1
			UnArmedSkill = 10
			FishingSkill= 50
			HasLeftEye = 1
			HasRightEye = 1
			HasRightLung  = 1
			HasLeftLung  = 1
			HasSpleen  = 1
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			HasLeftEar = 1
			HasRightEar = 1
			HasGuts = 1
			HasStomach = 1
			HasLeftKidney = 1
			HasRightKidney = 1
			HasLiver = 1
			HasBrain = 1
			HasHeart = 1
			HasThroat = 1
			HasNose = 1
			OrganMaxHP = 85
			MaxBloodContent = 300
			NPC
				Owner = "{NPC Frogmen}"
				name = "{NPC Frogmen} Frogman"
				CanBeSlaved=1
				ReturnDelay=500
				New()
					..()
					StayLocal()
				Scout
					name = "{NPC Frogmen} Frogman Scout"
					EXP=400
					ReturnDelay=700
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/Spear()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
				Warrior
					name = "{NPC Frogmen} Frogman Warrior"
					EXP=700
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
				Chieftain
					name = "{NPC Frogmen} Frogman Cheiftain"
					EXP=1000
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Shield/BoneBuckler(),new/obj/Items/Equipment/Weapon/Spears/BoneSpear(),new/obj/Items/Equipment/Armour/Helmet/BoneHelmet(),new/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate(),new/obj/Items/Equipment/Armour/Leggings/BoneLeggings(),new/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet(),new/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet()))
							CraftItem(E,"Quality")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
			New(LOC,GENDER=prob(50))
				if(GENDER) Gender = "Male"
				else Gender = "Female"
				Age = rand(20,60)
				usr.Strength += rand(5,7)
				usr.Agility += rand(5,10)
				usr.Defence += rand(15,25)
				usr.Intelligence += rand(0.025,0.05)
				usr.DieAge += rand(100,120)
				StartAllProcs()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
		Skeleton
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1
			Fling = 1
			Carn = 1
			SpecialUnit = 1
			ButcherySkill = 1
			Race = "Skeleton"
			SubRace = "Blooded"
			ImmunePoison = 1
			ImmuneToTemperature = 1
			SneakingSkill = 10
			UnArmedSkill = 35
			HasTeeth  = 1
			HasLeftArm  = 1
			HasRightArm = 1
			HasLeftLeg = 1
			HasRightLeg = 1
			HasHead = 1
			OrganMaxHP=75
			NPC
				CanBeSlaved=1
				OrganMaxHP=1
				Owner = "{NPC Undead}"
				Warrior
					name = "{NPC Undead} Skeleton Warrior"
					WeaponDamageMin = 5
					WeaponDamageMax = 10
				Lord
					name = "{NPC Undead} Skeleton Lord"
					WeaponDamageMin = 5
					WeaponDamageMax = 10
					Strength=10
					Agility=10
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Weapon/Spears/MetalSpear(),new/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate(),new/obj/Items/Equipment/Armour/Leggings/MetalLeggings()))
							CraftItem(E,"Average")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						..()
				Lich
					IsRoyal=1
					OrganMaxHP=50
					name = "{NPC Undead} Skeletal Lich King"
					Strength=25
					Agility=25
					SneakingSkill=100
					UsesEquipment=0
					Defence=60
					EXPNeeded=1500
					New()
						for(var/obj/Items/Equipment/E in list(new/obj/Items/Equipment/Armour/Chestplate/NecroRobe(),new/obj/Items/Equipment/Armour/Crown/Bone()))
							CraftItem(E,"Legendary")
							if(ForcePickUpItem(E)) ForceEquipItem(E)
						var/obj/Items/Equipment/Weapon/Maces/AstralStaff/S = new
						S.name = "Brainmasher"
						S.desc = "Those nutty skeletons probably hacked down a magic tree to make this glorified club."
						S.WeaponDamageMin = 22
						S.WeaponDamageMax = 35
						if(ForcePickUpItem(S)) ForceEquipItem(S)
						..()
			New()
				usr.Strength += rand(6,11)
				usr.Agility += rand(8,12)
				usr.Defence += rand(9,12)
				usr.Intelligence += rand(0.25,0.5)
				usr.DieAge = rand(500,900)
				WalkTo()
				FullHeal()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I