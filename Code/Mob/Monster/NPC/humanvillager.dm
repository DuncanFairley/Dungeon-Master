mob
	Monsters
		NPCHumanVillager
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

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

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return

					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.MAXHP = 100
				usr.WillJoin = prob(33)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				NPCHumanName()
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src