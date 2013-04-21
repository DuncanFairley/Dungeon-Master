mob
	Monsters
		Vampire
			icon = 'Vampire.dmi'
			density = 1
			AM = 1
			weightmax = 155
			CanDetail = 1
			Vampire = 1
			HumanParts = 1
			User = 0
			Humanoid = 1
			ImmunePosion = 1
			Carn = 1
			E = 1
			MineingSkill = 15
			WoodCuttingSkill = 15
			UsesPosion = 1
			Intelligent = 1
			SpearSkill = 30
			MakesBoneCraft = 1
			HP = 400
			MAXHP = 400
			SwordSkill  = 30
			BloodContent = 300
			MaxBloodContent = 300
			AxeSkill  = 25
			MaceSkill  = 25
			HumanParts = 1
			UnArmedSkill  = 40
			BowSkill = 25
			ShieldSkill  = 25
			ArmourSkill  = 25
			ForgingSkill  = 20
			WingsOut = 1
			WoodCraftingSkill  = 20
			MetalCraftingSkill  = 20
			SkinningSkill  = 20
			SmeltingSkill  = 20
			ButcherySkill  = 20
			LeatherCraftingSkill  = 20
			PosionSkill  = 20
			BoneCraftingSkill  = 20
			StoneCraftingSkill  = 20
			SneakingSkill  = 25
			LockPickingSkill = 25
			JewlCraftingSkill = 20
			CookingSkill  = 20
			FishingSkill  = 25
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

			Wings = "Good"

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

			LeftEyeHP = 140

			WingHP = 140

			RightEyeHP = 140

			RightLungHP = 140

			LeftLungHP = 140

			SpleenHP = 140

			TeethHP = 140

			LeftArmHP = 140

			RightArmHP = 140

			LeftLegHP = 140

			RightLegHP = 140

			HeadHP = 140

			LeftEarHP = 140

			RightEarHP = 140

			GutsHP = 140

			StomachHP = 140

			LeftKidneyHP = 140

			RightKidneyHP = 140

			LiverHP = 140

			BrainHP = 140

			HeartHP = 140

			ThroatHP = 140

			NoseHP = 140

			LeftArmMaxHP = 140

			RightArmMaxHP = 140

			LeftLegMaxHP = 140

			RightLegMaxHP = 140

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
						if(m)
							if(m.icon_state == "water")
								if(m.density == 1)
									view() << "As you walk past some water it splashes up onto you and you burn."
									src.HP -= 50
									if(src.HP <= 0)
										src.GoingToDie = 1
										src.Killer = "[m]"
										src.DeathType = "Melting Into Goo"
										src.Death()
						if(m)
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
										for(var/mob/Monsters/Wagon/S in view(1,src))
											if(S.Owner == src.Owner)
												if(S.weight <= S.weightmax)
													var/obj/Items/Seeds/TreeSeed/TS2 = new
													TS2.loc = S
													TS2.suffix = "(Carrying)"
													S.weight += TS2.weight
													var/obj/Items/Seeds/TreeSeed/TS = new
													TS.loc = S
													TS.suffix = "(Carrying)"
													S.weight += TS.weight
													var/obj/Items/woods/wood/MET = new
													MET.loc = S
													MET.suffix = "(Carrying)"
													S.weight += MET.weight
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
													m.layer = 1
													return
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
									var/CI
									CI = prob(3)

									if(CI == 1)
										view() << "Cave In!"
										for(var/turf/grounds/cellarfloor/CF in view(3,src))
											if(CF.density == 0)
												CF.T = prob(50)
											for(var/obj/Items/Furniture/Pillars/P in view(3,CF))
												for(var/turf/grounds/cellarfloor/CF2 in view(6,P))
													CF2.T = 0
											if(CF.T == 1)
												CF.opacity = 1
												CF.density = 1
												CF.CanDigAt = 1
												CF.icon_state = "CaveWall"
												CF.HP = 200
												CF.T = 0
												CF.IsCave = 1
												CF.Cant = 1
												CF.Detailed = 0
										for(var/turf/grounds/cavefloor/CF in view(3,src))
											if(CF.density == 0)
												CF.T = prob(50)
											for(var/obj/Items/Furniture/Pillars/P in view(3,CF))
												for(var/turf/grounds/cavefloor/CF2 in view(4,P))
													CF2.T = 0
											if(CF.T == 1)
												CF.opacity = 1
												CF.density = 1
												CF.CanDigAt = 1
												CF.icon_state = "CaveWall"
												CF.HP = 200
												CF.T = 0
												CF.IsCave = 1
												CF.Detailed = 0
												if(CF.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(CF.x,CF.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 1)
															T.Supported = 0
															T.icon_state = "DFloor"
															T.name = "Floor"
															T.density = 0
															T.Detailed = 0
															if(T.Content3 == "Peak")
																T.icon = 'Cave.dmi'
																T.icon_state = "Peak"
																T.name = "MountainPeak"
															if(T.Content == "Sky")
																T.icon = 'Cave.dmi'
																T.icon_state = "Sky"
																T.name = "Sky"
													del(Q)

									var/E
									var/D
									var/EM
									var/R
									var/S
									E = prob(35)
									D = prob(1)
									EM = prob(0.5)
									var/BUG2
									var/BUG3
									BUG3 = prob(2)
									if(BUG3 == 1)
										var/mob/Monsters/Mole/Mole = new
										Mole.loc = src.loc
										return
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
									BUG = prob(2)
									var/SIL
									var/CAP
									CAP = prob(3)
									if(CAP == 1)

										var/mob/Monsters/TowerCap/SS = new
										SS.loc = src.loc
										return
									SIL = prob(5)
									if(SIL == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/ores/silver/SS = new
													SS.loc = WA
													WA.weight += SS.weight
													SS.suffix = "(Carrying)"
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
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)

										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
										return
									if(G == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/ores/GoldNugget/GN = new
													GN.loc = WA
													WA.weight += GN.weight
													GN.suffix = "(Carrying)"
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
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/ores/metal/MET = new
													MET.loc = WA
													WA.weight += MET.weight
													MET.suffix = "(Carrying)"
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
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/ores/stone/ST = new
													ST.loc = WA
													WA.weight += ST.weight
													ST.suffix = "(Carrying)"
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
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/gems/UnCutDiamond/DI = new
													DI.loc = WA
													WA.weight += DI.weight
													DI.suffix = "(Carrying)"
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
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/gems/UnCutEmerald/UD = new
													UD.loc = WA
													WA.weight += UD.weight
													UD.suffix = "(Carrying)"
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
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
										for(var/mob/Monsters/Wagon/WA in view(1,src))
											if(WA.Owner == src.Owner)
												if(WA.weight <= WA.weightmax)
													var/obj/Items/gems/UnCutRuby/RE = new
													RE.loc = WA
													WA.weight += RE.weight
													RE.suffix = "(Carrying)"
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
				Age = rand(20,60)
				WalkTo()
				Bleeding()
				usr.Strength = rand(10,20)
				usr.Agility = rand(10,20)
				usr.Defence = rand(10,20)
				Hunger()
				Dig()
				Level()
				Heal()

				usr.DieAge = rand(1000,1250)
				Tiredness()
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