mob
	Monsters
		Goblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 95
			MineingSkill = 10
			WoodCuttingSkill = 10
			Goblin = 1
			BowSkill = 20
			Humanoid = 1
			UsesPicks = 1
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			Intelligent = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 10
			ShieldSkill = 15
			SpearSkill = 20
			PosionSkill = 30
			BoneCraftingSkill = 15
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 15
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 20
			MaceSkill = 10
			UsesPosion = 1
			FishingSkill = 15
			JewlCraftingSkill = 15
			MetalCraftingSkill = 15
			WoodCraftingSkill = 10
			SmeltingSkill = 15
			StoneCraftingSkill = 15
			LeatherCraftingSkill = 15

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

			LeftEyeHP = 95

			WingHP = 95

			RightEyeHP = 95

			RightLungHP = 95

			LeftLungHP = 95

			SpleenHP = 95

			TeethHP = 95

			LeftArmHP = 95

			RightArmHP = 95

			LeftLegHP = 95

			RightLegHP = 95

			HeadHP = 95

			LeftEarHP = 95

			RightEarHP = 95

			GutsHP = 95

			StomachHP = 95

			LeftKidneyHP = 95

			RightKidneyHP = 95

			LiverHP = 95

			BrainHP = 95

			HeartHP = 95

			ThroatHP = 95

			NoseHP = 95

			LeftArmMaxHP = 95

			RightArmMaxHP = 95

			LeftLegMaxHP = 95

			RightLegMaxHP = 95

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
							src.DamageTypePost()
							src.Hunger -= 0.2
							if(m.HP <= 0)
								del(m)
							return
						if(m.icon_state == "Lava")
							if(m.density == 1)
								if(src.IsWood)
									src.Owner << "[src] is Burning To Death!"

									src.Fire()
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
								if(src.HasPick == 1)
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
										CI = prob(1)

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
													CF.Cant = 1
													CF.IsCave = 1
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
										R = prob(0.5)
										S = prob(70)
										var/BUG3
										BUG3 = prob(2)
										if(BUG3 == 1)
											var/mob/Monsters/Mole/Mole = new
											Mole.loc = src.loc
											return
										var/BUG2
										BUG2 = prob(2)
										if(BUG2 == 1)
											var/mob/Monsters/DeathBeatle/DB = new
											DB.loc = src.loc
											return
										var/G
										G = prob(5)
										var/BUG
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
											return
										if(BUG == 1)

											var/mob/Monsters/CaveSpider/CS = new
											CS.loc = src.loc
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
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.icon = 'FemaleGoblin.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(4,9)
				usr.Agility = rand(8,12)
				usr.Defence = rand(3,8)


				Hunger()
				Heal()
				Bleeding()
				Dig()
				usr.DieAge = rand(110,120)
				Tiredness()
				Level()
				Bed()
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