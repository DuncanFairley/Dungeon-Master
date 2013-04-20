mob
	Monsters
		NPCHuman
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
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 40
			ShieldSkill = 30
			SpearSkill = 55
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Demons}"
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
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			LeftArmMaxHP = 200

			RightArmMaxHP = 200

			LeftLegMaxHP = 200

			RightLegMaxHP = 200


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
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
										var/obj/Items/gems/UnCutRuby/RE = new
										RE.loc = src.loc
									m.opacity = 0
									m.density = 0
									m.CanDigAt = 0
									m.Detailed = 0
									m.icon = 'cave.dmi'
									m.icon_state = m.OIcon
									m.IsWood = 0
									if(m.Content3 == "Peak")
										m.icon_state = "Peak"
									if(m.Content == "Sky")
										m.icon_state = "Sky"
									if(m.z == 1)
										var/obj/Support/Q = new
										Q.loc = locate(m.x,m.y,3)
										for(var/turf/T in view(0,Q))
											if(T.Supported == 1)
												T.Supported = 0
												T.opacity = 0
												T.density = 0
												T.CanDigAt = 0
												T.Detailed = 0
												if(T.Content3 == "Peak")
													T.icon_state = "Peak"
												if(T.Content == "Sky")
													T.icon_state = "Sky"
										del(Q)
								return
					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,75)
				usr.MAXHP = 250
				usr.WeaponDamageMin = 35
				usr.WeaponDamageMax = 65
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.icon += rgb(125,0,0)
				usr.overlays += /obj/Items/Armours/Legs/SkornLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet
				usr.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/

				var/HasArmour = prob(20)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/SkornLeggings/L = new
					var/obj/Items/Armours/ChestPlates/SkornChestPlate/C = new
					var/obj/Items/Armours/Helmets/SkornPlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/SkornLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/SkornRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				NPCHumanName()
				usr.name = "[usr.name] Follower of Skorn"
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src