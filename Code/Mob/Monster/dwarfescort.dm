mob
	Monsters

		DwarfEscort

			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Dwarf = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			Alive =1
			HP = 300
			Escort = 1
			MAXHP = 300
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			User = 0
			SneakingSkill = 20
			UsesPosion = 1
			PosionSkill = 40
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			FishingSkill = 25
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 10
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
								var/BUG3
								BUG3 = prob(2)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
									return
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
				usr.G = prob(33)
				usr.B = prob(33)
				usr.BB = prob(33)
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				NPCHumanName()
				Leave()
				usr.name = "{Escort} Dwarf [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()
				..()
				if(G == 1)
					usr.overlays += 'Beards.dmi'
				if(B == 1)
					usr.overlays += 'BlackBeard.dmi'
				if(BB == 1)
					usr.overlays += 'BrownBeard.dmi'
				if(BB == 0)
					if(B == 0)
						if(G == 0)
							usr.overlays += 'Beards.dmi'
							usr.G = 1

			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Owner == src.Owner)
						var/list/menu = new()
						menu += "Follow Me"
						menu += "Stop"
						menu += "Attack Mode On/Off"
						menu += "Tell To Leave"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Tell To Leave")
							if(M in view(1,src))
								usr << "[src] : As you wish, good bye."
								del(src)
								return
						if (Result == "Attack Mode On/Off")
							if(M in view(1,src))
								if(src.AttackModeOn == 1)
									src.AttackModeOn = 0
									usr << "[src] : I shall stand down, for now"
									return
								if(src.AttackModeOn == 0)
									src.AttackModeOn = 1
									usr << "[src] : Ready for duty!"
									return
						if (Result == "Stop")
							if(M in view(1,src))
								if(src.ReturningHome == 0)
									src.destination = null
									usr << "[src] : as you wish."

						if (Result == "Follow Me")
							if(M in view(1,src))
								if(src.ReturningHome == 0)
									src.destination = M
									usr << "[src] : I shall follow you for a while, then I must return to my guard post!"