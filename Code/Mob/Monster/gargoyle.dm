mob
	Monsters
		Gargoyle
			icon = 'Gargoyle.dmi'
			density = 1
			AM = 1
			weightmax = 160
			CanDetail = 1
			Race = "Gargoyle"
			HumanParts = 1
			User = 0
			IsWood = 0
			Humanoid = 1
			Running = 1
			Delay = 5

			Carn = 1
			E = 1
			Intelligent = 1
			SpearSkill = 10
			HP = 400
			HasWings = 1
			MAXHP = 400
			SwordSkill  = 10
			Skinned = 1
			AxeSkill  = 10
			MaceSkill  = 10
			ImmunePosion = 1
			HumanParts = 1
			UnArmedSkill  = 50
			BowSkill = 10
			ShieldSkill  = 10
			WearingFullPlateHelm = 1
			ArmourSkill  = 10
			ForgingSkill  = 10
			WingsOut = 1
			WoodCraftingSkill  = 10
			MetalCraftingSkill  = 15
			SkinningSkill  = 10
			SmeltingSkill  = 15
			ButcherySkill  = 10
			LeatherCraftingSkill  = 10
			PosionSkill  = 10
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

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "None"

			LeftLung = "None"

			Spleen = "None"

			Teeth = "Good"

			LeftArm = "Good"

			Wings = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "None"

			Stomach= "None"

			LeftKidney= "None"

			RightKidney= "None"

			Liver= "None"

			Brain= "None"

			Heart= "None"

			Throat= "None"

			Nose= "Good"

			LeftEyeHP = 155

			WingHP = 155

			RightEyeHP = 155

			TeethHP = 155

			LeftArmHP = 155

			RightArmHP = 155

			LeftLegHP = 155

			RightLegHP = 155

			HeadHP = 155

			LeftEarHP = 155

			RightEarHP = 155

			NoseHP = 155

			LeftArmMaxHP = 155

			RightArmMaxHP = 155

			LeftLegMaxHP = 155

			RightLegMaxHP = 155

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
				usr.Strength = rand(20,25)
				usr.Agility = rand(2,5)
				usr.Defence = rand(30,50)
				Dig()
				Level()
				usr.DieAge = rand(2000,5000)
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