mob
	WorkShops
		LeatherWorks
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
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in view(1,src))
							M.DestroyLeatherStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Leather Quiver"
						menu2 += "Leather Bed"
						menu2 += "Leather Leggings"
						menu2 += "Leather Left Glove"
						menu2 += "Leather Right Glove"
						menu2 += "Leather Top"
						menu2 += "Leather Helmet"
						menu2 += "Leather Flask"
						menu2 += "Leather Sleeping Bag"
						menu2 += "Strip all Skin from Corpses"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if(Result2 == "Strip all Skin from Corpses")
							for(var/mob/Body/m in M)
								if(M && m)
									if(m.Race == "Orc")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/OrcSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Race == "Gremlin")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/GremlinSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Race == "Demon")
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DemonSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Mole == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/MoleSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.FrogMan == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/FrogManSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.LizardMan == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/LizardSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Spider == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/SpiderSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Wolf == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/WolfFur/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Vampire == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/VampireSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Deer == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DeerSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Human == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												if(m.Black == 0)
													var/obj/Items/Skins/HumanSkin/DS = new
													DS.loc = M.loc
													M.SkinningSkill += 0.5
												if(m.Black == 1)
													var/obj/Items/Skins/HumanSkinBlack/DS = new
													DS.loc = M.loc
													M.SkinningSkill += 0.5
										else
											usr << "This has already been skinned!"
									if(m.Goblin == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/GoblinSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
									if(m.Kobold == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/KoboldSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5
										else
											usr << "This has already been skinned!"
									if(m.Dwarf == 1)
										if(m.Skinned == 0)
											m.Skinned = 1
											if(M.SkinningSkill)
												var/obj/Items/Skins/DwarfSkin/DS = new
												DS.loc = M.loc
												M.SkinningSkill += 0.5

										else
											usr << "This has already been skinned!"
						if (Result2 == "Leather Quiver")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Armours/Back/LeatherQuiver/LB = new
									LB.loc = M.loc
									LB.M = S
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.dir = NORTH
									del(S)
									break
									return
						if (Result2 == "Leather Flask")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Shafts/LeatherFlask/LB = new
									LB.loc = M.loc
									LB.M = S
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "Leather Helmet")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Helmets/LeatherHelmet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Right Glove")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/RightArms/LeatherRightGauntlet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Left Glove")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/LeftArms/LeatherLeftGauntlet/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Top")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/ChestPlates/LeatherChestPlate/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Leggings")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Armours/Legs/LeatherLeggings/LB = new
									LB.M = S
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.LeatherArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Sleeping Bag")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Beds/SleepingBag/LB = new
									LB.M = S.name
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Bed")
							if(M in view(1,src))
								for(var/obj/Items/Skins/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Beds/LeatherBed/LB = new
									LB.M = S.name
									if(M.LeatherCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.LeatherCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.LeatherCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.LeatherCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.LeatherCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.LeatherCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.LeatherCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.LeatherCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
