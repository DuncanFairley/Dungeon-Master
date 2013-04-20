mob
	Monsters
		FrogMan
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			FrogMan = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			Carn = 1
			Intelligent = 1
			CanBeSlaved = 1
			ButcherySkill = 10
			SneakingSkill = 20
			SpecialUnit = 1
			SkinningSkill = 10
			UsesPosion = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			ImmunePosion = 1
			UnArmedSkill = 10
			Owner = "{NPC FrogMen}"
			FishingSkill= 50
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
						if(m)
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
						if(m.CanDigAt == 1)
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
			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} FrogMan"
				WalkTo()
				Bleeding()
				FrogResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star