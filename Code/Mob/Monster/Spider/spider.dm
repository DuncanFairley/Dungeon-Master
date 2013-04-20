mob
	Monsters
		Spider
			icon = 'SpiderWarriorYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungHunter = 1
			Humanoid = 1
			AM = 1
			Carn = 1
			WoodCraftingSkill = 25
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			HumanParts = 1
			HoldingWeapon = 1
			WearingShield = 1
			ArmourSkill = 20
			Gender = "Male"
			FishingSkill = 25
			Delay = 3
			User = 0
			ImmunePosion = 1
			WearingBack = 1
			PosionSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
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

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			LeftArmMaxHP = 85

			RightArmMaxHP = 85

			LeftLegMaxHP = 85

			RightLegMaxHP = 85
			Bump(atom/m)
				if(m == src.destination)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.TP == 1)
							if(src.LoggedOut == 1)
								src.destination = null
								return
							flick("Dig",m)
							src.EXP += m.Content3
							src.Hunger -= 0.2
							src.DamageTypePost()
							if(m.HP <= 0)
								del(m)
							return
						if(m.icon_state == "Lava")
							if(m.density == 1)
								if(src.IsWood)
									src.Owner << "[src] is Burning To Death!"

									src.Fire()
						if(m.CaveWater == 1)
							flick("Dig",m)
							var/find
							find = prob(src.FishingSkill/10)
							if(find == 1)
								var/mob/Body/B = new
								B.loc = src.loc
								B.icon = 'cave.dmi'
								B.icon_state = "CaveFish"
								B.name = "CaveFish"
								B.Dead = 1
								B.FishDecay()
								B.Fish = 1
								B.weight = 5
								src.FishingSkill += 0.3
								return
						if(m.icon == 'Swamp.dmi')
							flick("Dig",m)
							var/find
							find = prob(src.FishingSkill/10)
							if(find == 1)
								var/TFish = prob(50)
								if(TFish == 1)
									var/mob/Body/B = new
									B.loc = src.loc
									B.icon = 'cave.dmi'
									B.icon_state = "TFish"
									B.name = "TropicalFish"
									B.Dead = 1
									B.FishDecay()
									B.Fish = 1
									B.weight = 5
									src.FishingSkill += 0.3
									return
								if(TFish == 0)
									var/mob/Body/B = new
									B.loc = src.loc
									B.icon = 'cave.dmi'
									B.icon_state = "BlowFish"
									B.name = "BlowFish"
									B.Dead = 1
									B.FishDecay()
									B.Fish = 1
									B.weight = 5
									src.FishingSkill += 0.3
									return
						if(m.icon_state == "water")
							flick("Dig",m)
							var/find
							find = prob(src.FishingSkill/10)
							if(find == 1)
								var/mob/Body/B = new
								B.loc = src.loc
								B.icon = 'cave.dmi'
								B.icon_state = "Fish"
								B.name = "Fish"
								B.Dead = 1
								B.FishDecay()
								B.Fish = 1
								B.weight = 5
								src.FishingSkill += 0.3
								return
						if(m.Tree == 1)
							m.HP -= src.WoodCuttingSkill / 4
							src.WoodCuttingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
								m.overlays = null
								m.overlays -= /obj/Trees/tree1x2
								m.overlays -= /obj/Trees/tree3x2
								m.overlays -= /obj/Trees/leaves3x2
								m.overlays -= /obj/Trees/leaves2x2
								m.overlays -= /obj/Trees/leaves1x2
								m.overlays -= /obj/Trees/leaves1x1
								m.overlays -= /obj/Trees/leaves2x1
								m.overlays -= /obj/Trees/leaves3x1
								m.IsWood = 0
								for(var/obj/DigAt/DD in view(1,src))
									if(DD.Owner == src)
										if(DD == src.DigTarget)
											src.DigTarget = null
											del(DD)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/Seeds/TreeSeed/TS2 = new
									TS2.loc = src.loc
									var/obj/Items/Seeds/TreeSeed/TS = new
									TS.loc = src.loc
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								if(m.Cactus == 1)
									m.icon_state = "Desert"
								if(m.Bamboo == 1)
									m.icon_state = "Marsh"
								if(m.Content3 == "PermTree")
									m.icon_state = "Snow"
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
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(4,9)
				usr.Agility = rand(10,13)
				usr.Defence = rand(5,10)
				Hunger()
				Bleeding()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star