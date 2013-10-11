mob
	WorkShops
		Kitchen
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Cook"
					menu += "Tear all Meat from Corpses"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in view(1,src))
							M.DestroyKit()
					if(Result == "Tear all Meat from Corpses")
						for(var/mob/Body/m in M)
							if(m in M)
								if(M in range(1,src))
									if(m.LizardMan == 1)
										if(M.ButcherySkill >= 1)
											var/obj/Items/Food/Meats/UnCookedLizardMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Bones/B = new
											B.loc = M.loc
											B.name = "[m]s Bones"
											var/obj/Items/Glands/PosionGland/PG = new
											PG.loc = M.loc
											PG.Posioned = 1
											var/obj/Items/Bones/LizardHead/B2 = new
											B2.loc = M.loc
											B2.name = "[m]s Head"
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Race == "Gargoyle")
											if(M.ButcherySkill >= 1)
												var/obj/Items/ores/stone/B = new
												B.loc = M.loc
												B.name = "[m]"
												var/obj/Items/Bones/GargoyleHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Race == "Orc")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedOrcMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/OrcHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Race == "Gremlin")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedGremlinMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/GremlinHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Race == "Demon")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedDemonMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/DemonHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Wolf == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedWolfMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/Skull/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Skull"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)


									if(m)
										if(m.FrogMan == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedFrogManMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/FrogManHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)


									if(m)
										if(m.Vampire == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedVampireMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/VampireHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)


									if(m)
										if(m.Deer == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedDeerMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/Skull/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Skull"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.icon_state == "CaveFish")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedCaveFishMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.icon_state == "TFish")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedTropicalFishMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.icon_state == "BlowFish")
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedBlowFishMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)



									if(m)
										if(m.Fish == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedFishMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Kobold == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedKoboldMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/KoboldHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)


									if(m)
										if(m.Goblin == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedGoblinMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/GoblinHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)



									if(m)
										if(m.Dwarf == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedDwarfMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												var/obj/Items/Bones/DwarfHead/B2 = new
												B2.loc = M.loc
												B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)

									if(m)
										if(m.Human == 1)
											if(M.ButcherySkill >= 1)
												var/obj/Items/Food/Meats/UnCookedHumanMeat/DS = new
												DS.loc = M.loc
												var/obj/Items/Bones/Bones/B = new
												B.loc = M.loc
												B.name = "[m]s Bones"
												if(m.Black == 0)
													var/obj/Items/Bones/HumanHead/B2 = new
													B2.loc = M.loc
													B2.name = "[m]s Head"
												if(m.Black == 1)
													var/obj/Items/Bones/HumanHeadBlack/B2 = new
													B2.loc = M.loc
													B2.name = "[m]s Head"
												M.ButcherySkill += 0.5
												M.weight -= m.weight
												del(m)


									if(m)
										if(m.Spider == 1)
											var/S
											S = prob(30)
											if(S == 1)
												var/obj/Items/Silks/SpiderSilk/SS = new
												SS.loc = M.loc
											var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Glands/PosionGland/PG = new
											PG.loc = M.loc
											PG.Posioned = 1
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Bug == 1)
											var/Silk
											Silk = prob(10)
											if(Silk == 1)
												var/obj/Items/Silks/SpiderSilk/S = new
												S.loc = M.loc
											var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Glands/PosionGland/PG = new
											PG.loc = M.loc
											PG.Posioned = 1
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Race == "Plant")
											var/obj/Items/Glands/PosionRoots/PG = new
											PG.loc = M.loc
											var/obj/Items/Seeds/CarnivorousPlantSeed/PG2 = new
											PG2.loc = M.loc
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Race == "Plant2")
											var/obj/Items/Glands/PosionRoots/PG = new
											PG.loc = M.loc
											var/obj/Items/Seeds/PosionSporeSeed/PG2 = new
											PG2.loc = M.loc
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Beatle == 1)
											var/obj/Items/Food/Meats/UnCookedBugMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Glands/ToxicGland/PG = new
											PG.loc = M.loc
											PG.Posioned = 1
											var/obj/Items/Bones/Shell/DS2 = new
											DS2.loc = M.loc
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

									if(m)
										if(m.Mole == 1)
											var/obj/Items/Food/Meats/UnCookedMoleMeat/DS = new
											DS.loc = M.loc
											var/obj/Items/Bones/Skull/DS2 = new
											DS2.loc = M.loc
											DS2.name = m.name
											var/obj/Items/Bones/Bones/DS3 = new
											DS3.loc = M.loc
											DS3.name = m.name
											M.ButcherySkill += 0.5
											M.weight -= m.weight
											del(m)

					if (Result == "Cook")

						for(var/obj/Items/Food/Meats/UnCookedOrcMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedOrcMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
						for(var/obj/Items/Food/Meats/UnCookedGremlinMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedGremlinMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
						for(var/obj/Items/Food/Meats/UnCookedTropicalFishMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedTropicalFishMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedLizardMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedLizardMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedDemonMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedDemonMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedVampireMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedVampireMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedFrogManMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedFrogManMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedBugMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedBugMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedWolfMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedWolfMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedHumanMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedHumanMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedFishMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedFishMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedBugMeat/B in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= B.weight
								del(B)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedBugMeat/CB = new
							CB.loc = M.loc
							M.CookingSkill+=2
							M.weight -= B.weight
							del(B)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedDeerMeat/D in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= D.weight
								del(D)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedDeerMeat/CD = new
							CD.loc = M.loc
							M.CookingSkill+=2
							M.weight -= CD.weight
							del(D)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedDwarfMeat/DW in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= DW.weight
								del(DW)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedDwarfMeat/CDW = new
							CDW.loc = M.loc
							M.CookingSkill+=2
							M.weight -= DW.weight
							del(DW)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedGoblinMeat/G in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= G.weight
								del(G)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedDeerMeat/CG = new
							CG.loc = M.loc
							M.CookingSkill+=2
							M.weight -= CG.weight
							del(G)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedKoboldMeat/S in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedKoboldMeat/CS = new
							CS.loc = M.loc
							M.CookingSkill+=2
							M.weight -= S.weight
							del(S)
							break
							return
						for(var/obj/Items/Food/Meats/UnCookedMoleMeat/S in M)
							var/fail
							fail = prob(M.CookingSkill*4)
							if(fail == 0)
								usr<< "Failed!"
								M.weight -= S.weight
								del(S)
								M.CookingSkill+=2
								break
								return
							var/obj/Items/Food/CookedMeats/CookedMoleMeat/CS = new
							CS.loc = M.loc
							M.CookingSkill+=2
							M.weight -= S.weight
							del(S)
							break
							return