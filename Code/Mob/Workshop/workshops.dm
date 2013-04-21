mob
	WorkShops
		IsWood = 0
		WS = 1
		Forge
			Left
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopLeft2"
			Right
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "WorkShopRight2"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
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
							M.DestroyForge()
					if (Result == "Craft")
						var/list/menu2 = new()
						if(M.Race == "Orc")
							menu2 += "Metal OrcAxe"
							menu2 += "Metal OrcSword"
						if(M.Human == 1)
							menu2 += "Metal Drill"
						menu2 += "Metal Spear Head"
						menu2 += "Metal Cage"
						menu2 += "Metal ChestPlate"
						menu2 += "Metal Leggings"
						menu2 += "Metal Left Gauntlet"
						menu2 += "Metal Right Gauntlet"
						menu2 += "MetalNeckGuard"
						menu2 += "Metal Training Post"
						menu2 += "Metal Helmet"
						menu2 += "Metal Spear"
						menu2 += "Metal Buckler"
						menu2 += "Metal Chest"
						menu2 += "MetalSpade"
						if(M.Race != "Orc")
							menu2 += "MetalStraightSword"
							menu2 += "MetalGladius"
						menu2 += "Metal Bow"
						menu2 += "Metal Arrows"
						if(M.Race != "Orc")
							menu2 += "Gold Cage"
							menu2 += "Gold Coin"
							menu2 += "Gold Crown"
							menu2 += "Golden Throne"
						if(M.Race != "Orc")
							menu2 += "Silver Training Post"
							menu2 += "Silver Coin"
							menu2 += "Silver Arrows"
						for(var/obj/Items/gems/Diamond/R in M)
							if(M.Kobold == 0)
								menu2 += "Diamond Encrusted Metal ChestPlate"
								menu2 += "Diamond Encrusted Silver ChestPlate"
								menu2 += "Diamond Encrusted Metal Leggings"
								menu2 += "Diamond Encrusted Silver Leggings"
								menu2 += "Diamond Encrusted Metal Helmet"
							if(M.Dwarf == 1)
								menu2 += "Diamond Encrusted Gold ChestPlate"
								menu2 += "Diamond Encrusted Gold Leggings"
								menu2 += "Diamond Encrusted Gold Helmet"
						for(var/obj/Items/gems/Emerald/R in M)
							if(M.Kobold == 0)
								menu2 += "Emerald Encrusted Metal ChestPlate"
								menu2 += "Emerald Encrusted Silver ChestPlate"
								menu2 += "Emerald Encrusted Metal Leggings"
								menu2 += "Emerald Encrusted Silver Leggings"
								menu2 += "Emerald Encrusted Metal Helmet"
							if(M.Dwarf == 1)
								menu2 += "Emerald Encrusted Gold ChestPlate"
								menu2 += "Emerald Encrusted Gold Leggings"
								menu2 += "Emerald Encrusted Gold Helmet"
						for(var/obj/Items/gems/Ruby/R in M)
							if(M.Kobold == 0)
								menu2 += "Ruby Encrusted Metal ChestPlate"
								menu2 += "Ruby Encrusted Silver ChestPlate"
								menu2 += "Ruby Encrusted Metal Leggings"
								menu2 += "Ruby Encrusted Silver Leggings"
								menu2 += "Ruby Encrusted Metal Helmet"
							if(M.Dwarf == 1)
								menu2 += "Ruby Encrusted Gold ChestPlate"
								menu2 += "Ruby Encrusted Gold Leggings"
								menu2 += "Ruby Encrusted Gold Helmet"
						if(M.Goblin == 0)
							if(M.Kobold == 0)
								menu2 += "Gold Spear"
								menu2 += "Gold Axe"
								menu2 += "Gold Dagger"
								menu2 += "Gold Mace"
								menu2 += "Gold Door"
								menu2 += "Gold Bed"
								menu2 += "Gold Training Post"
								menu2 += "Gold ChestPlate"
								menu2 += "Gold Leggings"
								menu2 += "Gold Helmet"
								menu2 += "Gold Buckler"
								menu2 += "Gold Chest"
								menu2 += "Golden Pillar"
								menu2 += "GoldStraightSword"
								menu2 += "GoldGladius"
								menu2 += "GoldLeftGauntlet"
								menu2 += "GoldRightGauntlet"
								menu2 += "GoldNeckGuard"
								menu2 += "Silver ChestPlate"
								menu2 += "Silver Chest"
								menu2 += "Silver Leggings"
								menu2 += "Silver Helmet"
								menu2 += "Silver Buckler"
								menu2 += "Silver Spear"
								menu2 += "Silver Left Gauntlet"
								menu2 += "Silver Right Gauntlet"
								menu2 += "SilverNeckGuard"
								menu2 += "Metal Flask"
								menu2 += "Metal Axe"
								menu2 += "Metal Bed"
								menu2 += "Metal Door"
								menu2 += "Metal Dagger"



						if(M.Kobold == 0)
							menu2 += "Metal Mace"
						if(M.UsesPicks == 1)
							menu2 += "Metal PickAxe"
							if(M.Goblin == 0)
								menu2 += "Gold PickAxe"
						if(M.Goblin == 1)
							menu2 += "Goblin Sword"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "MetalNeckGuard")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/MetalNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Metal"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "SilverNeckGuard")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/SilverNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Silver"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "GoldNeckGuard")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M)
										var/obj/Items/Armours/NeckGuards/GoldNeckGuard/LB = new
										LB.loc = M.loc
										LB.M = "Gold"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "Golden Pillar")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M.Vampire == 1)
										var/obj/Items/Furniture/Pillars/GoldPillar/LB = new
										LB.loc = M.loc
										LB.M = "Gold"
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.MetalCraftingSkill += 1
										LB.FurnitureCraft()
										del(S)
										break
										return
						if (Result2 == "Silver Arrows")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M.WearingBack == 1)
										for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
											if(L.suffix == "(Equiped)")
												var/obj/Items/Arrows/SilverArrow/LB = new
												LB.loc = L
												var/obj/Items/Arrows/SilverArrow/LB2 = new
												LB2.loc = L
												var/obj/Items/Arrows/SilverArrow/LB3 = new
												LB3.loc = L
												var/obj/Items/Arrows/SilverArrow/LB4 = new
												LB4.loc = L
												var/obj/Items/Arrows/SilverArrow/LB5 = new
												LB5.loc = L
												M.MetalCraftingSkill += 1
												M.weight -= S.weight
												LB.Owner = M.Owner
												LB2.Owner = M.Owner
												LB3.Owner = M.Owner
												LB4.Owner = M.Owner
												LB5.Owner = M.Owner
												L.Content += 5
												M.Owner << "Arrows placed in quiver!"
									else
										M.Owner << "[M] - I,ve got no quiver to put arrows in!"
										return
									del(S)
									break
									return
						if (Result2 == "Metal Arrows")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M.WearingBack == 1)
										for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
											if(L.suffix == "(Equiped)")
												var/obj/Items/Arrows/MetalArrow/LB = new
												LB.loc = L
												var/obj/Items/Arrows/MetalArrow/LB2 = new
												LB2.loc = L
												var/obj/Items/Arrows/MetalArrow/LB3 = new
												LB3.loc = L
												var/obj/Items/Arrows/MetalArrow/LB4 = new
												LB4.loc = L
												var/obj/Items/Arrows/MetalArrow/LB5 = new
												LB5.loc = L
												M.MetalCraftingSkill += 1
												M.weight -= S.weight
												LB.Owner = M.Owner
												LB2.Owner = M.Owner
												LB3.Owner = M.Owner
												LB4.Owner = M.Owner
												LB5.Owner = M.Owner
												L.Content += 5
												M.Owner << "Arrows placed in quiver!"
									else
										M.Owner << "[M] - I,ve got no quiver to put arrows in!"
										return
									del(S)
									break
									return
						if (Result2 == "Metal Flask")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Shafts/MetalFlask/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Metal Drill")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Drill/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Gold Chest")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/GoldChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Silver Chest")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/SilverChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Metal Chest")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/MetalChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "MetalSpade")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Shafts/Spade/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Spear Head")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Shafts/SpearHead/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Door")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/GoldDoor/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalDoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Training Post")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/GoldTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.TrainCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Training Post")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/MetalTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.TrainCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Training Post")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/SilverTrainingPost/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.TrainCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Door")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/MetalDoor/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalDoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Golden Throne")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Chairs/GoldenThrone/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Bed")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Beds/GoldBed/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Bed")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Furniture/Beds/MetalBed/LB = new
									LB.M = S.name
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Coin")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Coins/SilverCoin/LB = new
									LB.loc = M.loc
									LB.CoinContent = rand(50,100)
									LB.name = "Silver Coins {[LB.CoinContent]}"
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Coin")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Coins/GoldCoin/LB = new

									LB.loc = M.loc
									LB.CoinContent = rand(50,100)
									LB.name = "Gold Coins {[LB.CoinContent]}"
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return

						if (Result2 == "Metal Cage")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Traps/Cages/MetalCage/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Cage")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Traps/Cages/GoldCage/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Crown")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/Crown/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Diamond Encrusted Metal Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/DiamondMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Metal Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/EmeraldMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Metal Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/RubyMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Gold ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/RubyGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Gold ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Silver ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Metal ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Metal ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/RubyMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Metal ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Gold Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/DiamondGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 15
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Gold Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/RubyGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Gold Helmet")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Helmets/EmeraldGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Gold ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Silver ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
									return
						if (Result2 == "Ruby Encrusted Silver ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/ChestPlates/RubySilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Metal Right Gauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/MetalRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Left Gauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/MetalLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/SilverChestPlate/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "GoldRightGauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/GoldRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "GoldLeftGauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/GoldLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/GoldChestPlate/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Diamond Encrusted Gold Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/DiamondGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Silver Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/DiamondSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Diamond Encrusted Metal Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/DiamondMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 25
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Metal Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/RubyMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Gold Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/RubyGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Metal Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/MetalIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/EmeraldMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Metal"
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Gold Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/EmeraldGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Gold"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Emerald Encrusted Silver Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/EmeraldSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Ruby Encrusted Silver Leggings")
							if(M in view(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverBar/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											break
											return
										var/obj/Items/Armours/Legs/RubySilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.MetalCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.MetalCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.MetalCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.MetalCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.MetalCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.MetalCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.MetalCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										LB.Defence += 10
										LB.M = "Silver"
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										del(R)
										break
										return
						if (Result2 == "Silver Leggings")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/SilverLeggings/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Leggings")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/GoldLeggings/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Helmet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/SilverHelmet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Helmet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/GoldHelmet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Right Gauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/RightArms/SilverRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Left Gauntlet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/LeftArms/SilverLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Buckler")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Shields/SilverBuckler/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Buckler")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Armours/Shields/GoldBuckler/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Buckler")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Armours/Shields/MetalBuckler/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Helmet")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Helmets/MetalHelmet/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Leggings")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/Legs/MetalLeggings/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal ChestPlate")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Armours/ChestPlates/MetalChestPlate/LB = new
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Mace")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/GoldMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold PickAxe")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Picks/GoldPickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Axe")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/GoldAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Dagger")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/GoldDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Silver Spear")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/SilverBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/SilverSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Silver"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Spear")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/GoldSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Bow")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Bows/MetalBow/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Spear")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Spears/MetalSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Mace")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Maces/MetalMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldGladius")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoldGladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalGladius")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/Gladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldStraightSword")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/GoldBar/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoldStraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Gold"
									LB.GoldWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalStraightSword")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/StraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcSword")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									LB.name = "MetalOrcSword"
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Goblin Sword")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal PickAxe")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Picks/PickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Dagger")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Daggers/MetalDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcAxe")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/MetalOrcAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Axe")
							if(M in view(1,src))
								for(var/obj/Items/Ingots/MetalIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Weapons/Axes/MetalAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.MetalCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.MetalCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.MetalCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.MetalCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.MetalCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.MetalCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.MetalCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.M = "Metal"
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return