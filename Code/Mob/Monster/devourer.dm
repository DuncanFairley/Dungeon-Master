//contains: Devourer
//Contains: DevourerCacoon

mob
	Monsters
		Devourer
			icon = 'Devourer.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 200
			Race = "Devourer"
			Gender = "None"
			HP = 300
			MAXHP = 300
			Humanoid = 1
			AM = 1
			Carn = 1
			Infects = 1
			HumanParts = 1
			BloodContent = 400
			MaxBloodContent = 400
			Intelligent = 1
			ArmourSkill = 20
			SwordSkill = 20
			SneakingSkill = 0
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 4
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			ImmunePosion = 1
			WearingBack = 1
			HoldingWeapon = 1
			WearingShield = 1
			ButcherySkill = 5
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

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

			LeftLeg = "N/A"

			RightLeg = "N/A"

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

			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			LeftArmMaxHP = 150

			RightArmMaxHP = 150

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
						if(m.CanDigAt == 1)
							if(m.IsWall ==0)
								src.EXP += 0.4
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
								for(var/turf/T in view(1,m))
									if(T.CanFish)
										if(isturf(m))
											var/turf/H = m
											H.WaterFlood()
								for(var/turf/T in view(1,m))
									if(T.Content == "Lava")
										if(isturf(m))
											var/turf/H = m
											H.LavaFlood()
								for(var/obj/DigAt/DD in view(1,src))
									if(DD.Owner == src)
										if(DD == src.DigTarget)
											src.DigTarget = null
											del(DD)

								m.IsWall = 0
								var/E
								var/D
								var/EM
								var/R
								var/S
								E = prob(35)
								D = prob(1)
								EM = prob(0.5)
								var/BUG2
								BUG2 = prob(2)
								if(BUG2 == 1)
									var/mob/Monsters/DeathBeatle/DB = new
									DB.loc = src.loc
									return
								R = prob(0.5)
								S = prob(70)
								var/G
								G = prob(5)
								var/BUG
								var/BUG3
								BUG3 = prob(2)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
									return
								BUG = prob(2)
								var/CAP
								CAP = prob(3)
								if(CAP == 1)

									var/mob/Monsters/TowerCap/SS = new
									SS.loc = src.loc
									return
								var/SIL
								SIL = prob(5)
								if(SIL == 1)

									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)

									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
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
				Age = 2000
				WalkTo()
				Heal()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = 25
				Bleeding()
				Level()
				usr.DieAge = 5000
				Dig()
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
		DevourerCacoon
			icon = 'Devourer.dmi'
			icon_state = "Cacoon"
			density = 1
			DieAge = 10
			WearingFullPlateHelm = 1
			Race = "Devourer"
			Humanoid = 1
			Strength = 1
			Agility = 1
			Defence = 1
			MAXHP = 100
			HP = 100
			New()
				spawn(1250)
					if(src)
						range(8,src) << "[src] begins to stir with life.<br>"
						spawn(1250)
							if(src)
								range(8,src) << "[src] hatches.<br>"
								src.Owner << "[src] hatched.<br>"
								var/mob/Monsters/Devourer/D = new
								var/mob/O = src.Owner
								O.UnitList += D
								D.Owner = src.Owner
								D.loc = src.loc
								del(src)