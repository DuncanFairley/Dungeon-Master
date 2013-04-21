mob/proc/DestroyLeatherStation() for(var/mob/WorkShops/LeatherWorks/LW in view(3,src)) del(LW)
mob/proc/DestroyCarpentryStation() for(var/mob/WorkShops/Carpentry/LW in view(3,src)) del(LW)
mob/proc/DestroySmelterStation() for(var/mob/WorkShops/Smelters/LW in view(3,src)) del(LW)
mob/proc/DestroyForge() for(var/mob/WorkShops/Forge/LW in view(3,src)) del(LW)
mob/proc/DestroyBone() for(var/mob/WorkShops/BoneCraft/LW in view(3,src)) del(LW)
mob/proc/DestroyPoison() for(var/mob/WorkShops/PoisonStation/LW in view(3,src)) del(LW)
mob/proc/DestroyKit() for(var/mob/WorkShops/Kitchen/LW in view(3,src)) del(LW)
mob/proc/DestroyGem() for(var/mob/WorkShops/GemCutter/LW in view(3,src)) del(LW)
mob/proc/DestroyMason() for(var/mob/WorkShops/Masonary/LW in view(3,src)) del(LW)
mob/proc/DestroyPotion() for(var/mob/WorkShops/PotionStation/CF in view(3,src)) del(CF)
mob/proc/DestroyMelter() for(var/mob/WorkShops/Melter/CF in view(3,src)) del(CF)
turf
	name = ""
obj

	DigAt
		icon = 'Cave.dmi'
		icon_state = "Dig"
		layer = 5
		Wagon = 1
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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					if(M.Infects == 1)
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyForge()
					if (Result == "Craft")
						var/list/menu2 = new()
						if(M.Race == "Orc")
							menu2 += "Metal OrcAxe"
							menu2 += "Metal OrcSword"
						if(M.Race == "Human" || M.Race == "Dwarf") menu2 += "Metal Drill"
						menu2 += "Metal Fence"
						menu2 += "Metal Cage"
						menu2 += "Full Metal Armor"
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
						menu2 += "Metal Flask"
						menu2 += "Metal Axe"
						menu2 += "Metal Bed"
						menu2 += "Metal Door"
						menu2 += "Metal Dagger"
						if(M.Race == "Dwarf")
							menu2 += "Adamantium ChestPlate"
							menu2 += "Adamantium Leggings"
							menu2 += "Adamantium Left Gauntlet"
							menu2 += "Adamantium Right Gauntlet"
							menu2 += "Adamantium Buckler"
							menu2 += "Adamantium Sword"
							menu2 += "Adamantium Axe"
							menu2 += "Adamantium Mace"
							menu2 += "Adamantium Spear"
							menu2 += "Adamantium Helmet"
						if(M.MetalCraftingSkill >= 100) menu2 += "Soul Blade"
						if(M.Race != "Orc")
							menu2 += "MetalStraightSword"
							menu2 += "MetalGladius"
						menu2 += "Metal Bow"
						menu2 += "Metal Arrows"
						if(M.Race != "Orc")
							menu2 += "Gold Cage"
							menu2 += "Gold Crown"
							menu2 += "Golden Throne"
							menu2 += "Silver Training Post"
							menu2 += "Silver Arrows"
						for(var/obj/Items/gems/Diamond/R in M)
							if(M.Race != "Kobold")
								menu2 += "Diamond Encrusted Metal ChestPlate"
								menu2 += "Diamond Encrusted Silver ChestPlate"
								menu2 += "Diamond Encrusted Metal Leggings"
								menu2 += "Diamond Encrusted Silver Leggings"
								menu2 += "Diamond Encrusted Metal Helmet"
								menu2 += "Diamond Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								menu2 += "Diamond Encrusted Gold ChestPlate"
								menu2 += "Diamond Encrusted Gold Leggings"
								menu2 += "Diamond Encrusted Gold Helmet"
						for(var/obj/Items/gems/Emerald/R in M)
							if(M.Race != "Kobold")
								menu2 += "Emerald Encrusted Metal ChestPlate"
								menu2 += "Emerald Encrusted Silver ChestPlate"
								menu2 += "Emerald Encrusted Metal Leggings"
								menu2 += "Emerald Encrusted Silver Leggings"
								menu2 += "Emerald Encrusted Metal Helmet"
								menu2 += "Emerald Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								menu2 += "Emerald Encrusted Gold ChestPlate"
								menu2 += "Emerald Encrusted Gold Leggings"
								menu2 += "Emerald Encrusted Gold Helmet"
						for(var/obj/Items/gems/Ruby/R in M)
							if(M.Race != "Kobold")
								menu2 += "Ruby Encrusted Metal ChestPlate"
								menu2 += "Ruby Encrusted Silver ChestPlate"
								menu2 += "Ruby Encrusted Metal Leggings"
								menu2 += "Ruby Encrusted Silver Leggings"
								menu2 += "Ruby Encrusted Metal Helmet"
								menu2 += "Ruby Encrusted Silver Helmet"
							if(M.Race == "Dwarf")
								menu2 += "Ruby Encrusted Gold ChestPlate"
								menu2 += "Ruby Encrusted Gold Leggings"
								menu2 += "Ruby Encrusted Gold Helmet"
						if(M.Race != "Goblin")
							if(M.Race != "Kobold")
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
								menu2 += "Silver Axe"
								menu2 += "Silver Mace"
								menu2 += "Silver Dagger"
								menu2 += "Silver Sword"
								menu2 += "Silver Left Gauntlet"
								menu2 += "Silver Right Gauntlet"
								menu2 += "SilverNeckGuard"
						if(M.Race != "Kobold")
							menu2 += "Metal Mace"
						menu2 += "Metal PickAxe"
						if(M.Race != "Goblin")
							menu2 += "Gold PickAxe"
						if(M.Race == "Goblin")
							menu2 += "Goblin Sword"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if(Result2 == "Soul Blade")
							if(M in range(1,src))
								for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Sword/S1 in M)
									if(S1.suffix == "(Carrying)")
										for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Mace/S2 in M)
											if(S2.suffix == "(Carrying)")
												for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Dagger/S3 in M)
													if(S3.suffix == "(Carrying)")
														for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Spear/S4 in M)
															if(S4.suffix == "(Carrying)")
																for(var/obj/Items/Equipment/Weapon/DemonicWeapons/Axe/S5 in M)
																	if(S5.suffix == "(Carrying)")
																		var/obj/Items/Equipment/Weapon/DemonicWeapons/SoulBlade/S6 = new
																		S6.loc = M.loc
																		for(var/turf/L in range(1,src))
																			if(L.icon_state == "Lava")
																				S6.WeaponDamageMin += 10
																				S6.WeaponDamageMax += 10
																				break
																		for(var/obj/Items/Equipment/E in list(S1,S2,S3,S4,S5)) if(M.DropItem(E)) del(E)
																		return

						if (Result2 == "MetalNeckGuard")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
										var/obj/Items/Equipment/Armour/NeckGuards/MetalNeckGuard/LB = new
										LB.loc = M.loc
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
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
										var/obj/Items/Equipment/Armour/NeckGuards/SilverNeckGuard/LB = new
										LB.loc = M.loc
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
										var/obj/Items/Equipment/Armour/NeckGuards/GoldNeckGuard/LB = new
										LB.loc = M.loc
										M.weight -= S.weight
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									if(M in range(1,src))
										var/obj/Items/Furniture/Pillars/GoldPillar/LB = new
										LB.loc = M.loc

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
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Ingots/SilverIngot/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.MetalCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack)
												for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
													if(L.suffix == "(Equipped)")
														if(L.Content <= 250)
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
															var/obj/Items/Arrows/SilverArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/SilverArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/SilverArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/SilverArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/SilverArrow/LB10 = new
															LB10.loc = L
															M.MetalCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "The quiver has too many arrows in it."
															return
											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Metal Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Ingots/IronIngot/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/Ingots/IronIngot/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.MetalCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack)
												for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
													if(L.suffix == "(Equipped)")
														if(L.Content <= 250)
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
															var/obj/Items/Arrows/MetalArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/MetalArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/MetalArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/MetalArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/MetalArrow/LB10 = new
															LB10.loc = L
															M.MetalCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "The quiver has too many arrows in it."
															return

											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Metal Flask")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Chests/Drill/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Gold Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Chests/GoldChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Silver Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Chests/SilverChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Metal Chest")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/mob/Monsters/Chests/MetalChest/LB = new
									LB.loc = M.loc
									M.MetalCraftingSkill += 1
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "MetalSpade")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
						if (Result2 == "Gold Door")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
									LB.DoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
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
									LB.TrainCraft()
									LB.Content3 += 0.1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Door")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
									LB.DoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Fence")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Fences/MetalFence/LB = new
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
									LB.DoorCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Golden Throne")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
						if (Result2 == "Metal Cage")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Crown/Gold/LB = new
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf") LB.Defence += 1
									del(S)
									break
									return
						if(Result2 == "Diamond Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/DiamondMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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

										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Diamond Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/DiamondSilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Emerald Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldSilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubyMetalHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if(Result2 == "Ruby Encrusted Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubySilverHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubyGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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

										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/DiamondMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubyMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldMetalChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
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
										var/obj/Items/Equipment/Armour/Helmet/DiamondGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/RubyGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Helmet/EmeraldGoldHelmet/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldGoldChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/EmeraldSilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Chestplate/RubySilverChestPlate/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										break
										return
						if (Result2 == "Metal Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Adamantium Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/AdamantiumRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Metal Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if(Result2 == "Adamantium Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/AdamantiumLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Silver ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/SilverChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Adamantium ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/AdamantiumChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "GoldRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/GoldRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "GoldLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/GoldLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Gold ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/GoldChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Diamond Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
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
										var/obj/Items/Equipment/Armour/Leggings/DiamondGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/DiamondSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Diamond Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/DiamondMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubyMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubyGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/IronIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= R.weight
											M.MetalCraftingSkill += 1
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/EmeraldMetalLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.MetalArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/GoldIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/EmeraldGoldLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Emerald Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
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
										var/obj/Items/Equipment/Armour/Leggings/EmeraldSilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Ruby Encrusted Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/R in M)
									for(var/obj/Items/Ingots/SilverIngot/S in M)
										var/fail
										fail = prob(M.MetalCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.MetalCraftingSkill += 1
											M.weight -= R.weight
											del(S)
											del(R)
											return
										var/obj/Items/Equipment/Armour/Leggings/RubySilverLeggings/LB = new
										if(M.MetalCraftingSkill >= 299)
											LB.CraftRank = "Supernatural Quality"
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
										LB.BoneArmourCraft()
										M.MetalCraftingSkill += 0.5
										M.weight -= S.weight
										LB.loc = M.loc
										if(M.Race == "Dwarf")
											LB.Defence += 1
										del(S)
										del(R)
										return
						if (Result2 == "Silver Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/SilverLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/AdamantiumLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									return
						if (Result2 == "Gold Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/GoldLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/SilverHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/AdamantiumHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									return
						if (Result2 == "Gold Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/GoldHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Right Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/SilverRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Left Gauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/SilverLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Silver Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Shield/SilverBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Gold Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.MetalCraftingSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Shield/GoldBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Metal Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Adamantium Buckler")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.MetalCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Shield/AdamantiumBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									return
						if (Result2 == "Metal Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									return
						if (Result2 == "Metal Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									if(M.Race == "Dwarf")
										LB.Defence += 1
									del(S)
									break
									return
						if (Result2 == "Metal ChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Gold Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/GoldMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Full Metal Armor")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
									var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Ingots/IronIngot/S2 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.MetalCraftingSkill += 1
										del(S2)
										break
									var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Ingots/IronIngot/S3 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.MetalCraftingSkill += 1
										del(S3)
										break
									var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Ingots/IronIngot/S4 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.MetalCraftingSkill += 1
										del(S4)
										break
									var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Ingots/IronIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
								for(var/obj/Items/Ingots/IronIngot/S5 in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.MetalCraftingSkill += 1
										del(S5)
										break
									var/obj/Items/Equipment/Armour/Shield/MetalBuckler/LB = new
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalArmourCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "Gold Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/GoldMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold PickAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Picks/GoldPickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Axes/GoldAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									if(M.Race == "Dwarf")
										LB.WeaponDamageMin += 1
										LB.WeaponDamageMax += 1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Daggers/GoldDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Spears/SilverSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Daggers/SilverDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if(Result2 == "Silver Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/SilverSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/SilverMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Silver Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/SilverIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Axes/SilverAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Gold Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Spears/GoldSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Bow")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Bows/MetalBow/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Spears/MetalSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/MetalMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldGladius")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/GoldGladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalGladius")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/Gladius/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "GoldStraightSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/GoldIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/GoldStraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.BoneWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "MetalStraightSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/StraightSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/AdamantiumSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumWeaponCraft()
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Daggers/AdamantiumDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumWeaponCraft()
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Axes/AdamantiumAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumWeaponCraft()
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Mace")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/AdamantiumMace/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumWeaponCraft()
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if(Result2 == "Adamantium Spear")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/AdamantiumIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 4
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Spears/AdamantiumSpear/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.AdamantiumWeaponCraft()
									M.MetalCraftingSkill += 4
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcSword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									LB.name = "MetalOrcSword"
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Goblin Sword")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Swords/GoblinSword/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal PickAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Picks/PickAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Dagger")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Daggers/MetalDagger/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal OrcAxe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Metal Axe")
							if(M in range(1,src))
								for(var/obj/Items/Ingots/IronIngot/S in M)
									var/fail
									fail = prob(M.MetalCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.MetalCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Axes/MetalAxe/LB = new
									LB.loc = M.loc
									if(M.MetalCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
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
									LB.MetalWeaponCraft()
									if(M.Race == "Dwarf")
										LB.WeaponDamageMin += 1
										LB.WeaponDamageMax += 1
									M.MetalCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
		PotionStation
			name = "AlchemyStation"
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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					if(M)
						var/list/menu = new()
						menu += "Craft"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Destroy")
							if(M in range(1,src))
								M.DestroyPotion()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Potion of Devourer Immunity"
							menu2 += "Potion of Poison Immunity"
							menu2 += "Potion of Restoration"
							menu2 += "Potion of Internal Restoration"
							menu2 += "Potion of LongLife"
							menu2 += "Cure Vampirism"
							menu2 += "Potion of Vampirism"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Cure Vampirism")
								if(M in range(1,src))
									src.Content = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Seeds/Garlic/F in M)
										if(src.Content)
											var/fail
											fail = prob(M.PotionSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= F.weight
												del(F)
												M.PotionSkill += 0.5
												src.Content = null
												break
												return
											var/obj/P = src.Content
											P.IsPotion = 1
											P.IsEmpty = 0
											P.icon_state = "BluePotion"
											M.PotionSkill += 1
											P.name = "Vampirism Cure"
											M.weight -= F.weight
											src.Content = null
											del(F)
											break
											return
									usr << "You need a piece of garlic and an empty bottle"
							if (Result2 == "Potion of Poison Immunity")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/gems/Emerald/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/PoisonSporeSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "GreenPotion"
												M.PotionSkill += 1
												P.name = "Potion of Poison Immunity"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You a cut emerald, a poison spore plant seed, and an empty bottle"
							if (Result2 == "Potion of Vampirism")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty) src.Content = S
									for(var/obj/Items/Shafts/WoodenBucket/F in M)
										if(F.HasWater == "Blood")
											if(src.Content)
												src.Content2 = F
									for(var/obj/Items/Food/Meat/T in M)
										if(src.Content)
											if(src.Content2)
												if(T.Race == "Demon")
													src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BloodPotion"
												M.PotionSkill += 1
												P.name = "Potion of Vampirism"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break

							if (Result2 == "Potion of LongLife")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/gems/Diamond/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Silks/SpiderSilk/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "RedPotion"
												M.PotionSkill += 1
												P.name = "Potion of LongLife"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a cut diamond, a clump of spider silk, and an empty bottle"

							if (Result2 == "Potion of Internal Restoration")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungus/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/TomatoSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BluePotion"
												M.PotionSkill += 1
												P.name = "Potion of Internal Restoration"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a piece of fungus, a tomato seed, and an empty bottle"
							if (Result2 == "Potion of Restoration")
								if(M in range(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungus/F in M)
										if(src.Content)
											src.Content2 = F
									for(var/obj/Items/Seeds/TreeSeed/T in M)
										if(src.Content)
											if(src.Content2)
												src.Content3 = T
									if(src.Content)
										if(src.Content2)
											if(src.Content3)
												var/fail
												fail = prob(M.PotionSkill*4)
												if(fail == 0)
													var/obj/Q1 = src.Content2
													var/obj/Q2 = src.Content3
													usr<< "Failed!"
													M.weight -= Q1.weight
													del(Q1)
													M.PotionSkill += 0.5
													M.weight -= Q2.weight
													src.Content = null
													src.Content2 = null
													src.Content3 = null
													del(Q2)
													break

												var/obj/P = src.Content
												var/obj/Q1 = src.Content2
												var/obj/Q2 = src.Content3
												P.IsPotion = 1
												P.IsEmpty = 0
												P.icon_state = "BluePotion"
												M.PotionSkill += 1
												P.name = "Potion of Restoration"
												M.weight -= Q1.weight
												M.weight -= Q2.weight
												src.Content = null
												src.Content2 = null
												src.Content3 = null
												del(Q1)
												del(Q2)
												break
									usr << "You need a piece of fungus, a tree seed, and an empty bottle"

		PoisonStation
			name = "PoisonStation"
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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					if(M.UsesPoison)
						var/list/menu = new()
						menu += "Craft"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Destroy")
							if(M in range(1,src))
								M.DestroyPoison()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Extract Poison"
							menu2 += "Extract Toxic"
							if(M.Race == "Orc")
								menu2 += "Extract Strong Poison"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Extract Toxic")
								if(M in range(1,src))
									for(var/obj/Items/Glands/ToxicGland/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.PoisonSkill += 1
											break
											return
										var/obj/Items/Poisons/Toxic/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill *2
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
							if (Result2 == "Extract Strong Poison")
								if(M in range(1,src))
									for(var/obj/Items/Glands/PoisonRoots/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill*3
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									M.Owner << "You need poison spore plant roots to make this."
							if (Result2 == "Extract Poison")
								if(M in range(1,src))
									for(var/obj/Items/Glands/PoisonRoots/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									for(var/obj/Items/Glands/PoisonGland/S in M)
										var/fail
										fail = prob(M.PoisonSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PoisonSkill += 1
											del(S)
											break
											return
										var/obj/Items/Poisons/Poison/LB = new
										LB.loc = M.loc
										LB.PoisonContent = M.PoisonSkill
										M.PoisonSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
		GemCutter
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
					if(M.Race == "Spider")
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
						if(M in range(1,src))
							M.DestroyGem()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "CutEmerald"
						menu2 += "CutRuby"
						menu2 += "CutDiamond"
						menu2 += "FlawlessCutEmerald"
						menu2 += "FlawlessCutRuby"
						menu2 += "FlawlessCutDiamond"
						menu2 += "Silver Ruby Ring"
						menu2 += "Silver Diamond Ring"
						menu2 += "Silver Emerald Ring"
						menu2 += "Gold Ruby Ring"
						menu2 += "Gold Diamond Ring"
						menu2 += "Gold Emerald Ring"
						menu2 += "Plant Fibre Ring"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "CutEmerald")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutEmerald/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Emerald/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutEmerald")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutEmerald/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Emerald/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Emerald"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "CutRuby")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutRuby/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Ruby/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutRuby")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutRuby/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Ruby/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Ruby"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "FlawlessCutDiamond")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutDiamond/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill/2)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.JewlCraftingSkill+=2
										break
										return
									var/obj/Items/gems/Diamond/LB = new
									LB.loc = M.loc
									LB.Content = "Flawless"
									LB.name = "Flawless Diamond"
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "CutDiamond")
							if(M in range(1,src))
								for(var/obj/Items/gems/UnCutDiamond/S in M)
									var/fail
									fail = prob(M.JewlCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.JewlCraftingSkill+=2
										return
									var/obj/Items/gems/Diamond/LB = new
									LB.loc = M.loc
									M.JewlCraftingSkill += 1
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Silver Ruby Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/S in M)
									for(var/obj/Items/Ingots/SilverIngot/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/RubyRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Ruby Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Silver Diamond Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/S in M)
									for(var/obj/Items/Ingots/SilverIngot/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/DiamondRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Diamond Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Silver Emerald Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/S in M)
									for(var/obj/Items/Ingots/SilverIngot/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/EmeraldRing/LB = new
										LB.loc = M.loc
										LB.icon_state = "Silver Emerald Ring"
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
										return
						if (Result2 == "Gold Ruby Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Ruby/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldIngot/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/RubyRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Gold Diamond Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Diamond/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldIngot/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/DiamondRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Gold Emerald Ring")
							if(M in range(1,src))
								for(var/obj/Items/gems/Emerald/S in M)
									if(S.Content == "Flawless")
										for(var/obj/Items/Ingots/GoldIngot/S2 in M)
											var/fail
											fail = prob(M.JewlCraftingSkill)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.weight -= S2.weight
												del(S)
												del(S2)
												break
												M.JewlCraftingSkill+=2
												return
											var/obj/Items/gems/EmeraldRing/LB = new
											LB.loc = M.loc
											M.JewlCraftingSkill += 1
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Plant Fibre Ring")
							if(M in range(1,src))
								for(var/obj/Items/Glands/PoisonRoots/S in M)
									for(var/obj/Items/Ingots/GoldIngot/S2 in M)
										var/fail
										fail = prob(M.JewlCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											M.JewlCraftingSkill+=2
											return
										var/obj/Items/gems/PlantFibreRing/LB = new
										LB.loc = M.loc
										M.JewlCraftingSkill += 1
										M.weight -= S.weight
										M.weight -= S2.weight
										del(S)
										del(S2)
										break
									return
		Smelters
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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Smelt Ores and Sand"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroySmelterStation()
					if (Result == "Smelt Ores and Sand")
						for(var/obj/Items/ores/S in M) if(S.icon_state!="Stone")
							var/CHANCE
							var/TYPE
							switch(S.icon_state)
								if("Iron")
									TYPE = /obj/Items/Ingots/IronIngot/
									CHANCE=5
									M.MetalCraftingSkill+=0.25
								if("Silver")
									TYPE = /obj/Items/Ingots/SilverIngot/
									CHANCE=4
									M.MetalCraftingSkill+=0.5
								if("Gold")
									TYPE = /obj/Items/Ingots/GoldIngot/
									CHANCE=3
									M.MetalCraftingSkill+=0.75
								if("Adamantium")
									TYPE = /obj/Items/Ingots/AdamantiumIngot/
									CHANCE=1
									M.MetalCraftingSkill+=10
								if("Sand")
									TYPE = /obj/Items/Potions/EmptyBottle/
									CHANCE=5
									M.MetalCraftingSkill+=0.25
							if(prob(M.MetalCraftingSkill*CHANCE))
								if(M.DropItem(S)) del(S)
								var/obj/Items/NEWITEM = new TYPE(M.loc)
								M.PickUpItem(NEWITEM)
							else
								if(M.DropItem(S)) del(S)
								M.Owner << "[M] failed working working with the [S.name]"
		CampFires
			GoodAltar
				icon = 'Cave.dmi'
				icon_state = "GoodAltar"
				weight = 100
				suffix = null
				HP = 200
				DblClick() for(var/mob/Monsters/M in usr.Selected) if(M in view(1,src))
					var/list/menu = new()
					menu += "Pray"
					if(src.Content2 >= 150)
						menu += "Holy Shield"
					for(var/obj/Items/Shafts/MetalFlask/F in M)
						if(F.HasWater == "Water")
							menu += "Bless Flask of Water"
					for(var/obj/Items/Shafts/LeatherFlask/F in M)
						if(F.HasWater == "Water")
							menu += "Bless Flask of Water"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if(Result == "Cancel")
						return
					if(Result == "Holy Shield")
						if(src.Content2 >= 150 && M.Shielded == 0 && M.Undead == 0 && M.Infects == 0 && M.Unholy == 0)
							src.Content2 -= 150
							M.Defence += 10
							M.Shielded = 1
							M.ImmuneToMagic = 1
							M.RebuildOverlays()
							view(usr) << "[src] covers [M] in a holy shield of light!"
							return
						else
							usr << "[src] either doesn't have 150 prayer points OR you are trying to cast on an unholy/shielded creature."
							return
					if(Result == "Bless Flask of Water")
						for(var/obj/Items/Shafts/LeatherFlask/F in M)
							if(F.HasWater == "Water")
								view(M) << "[M] blesses the flask of water with the power of the lords of light!"
								F.HasWater = "Holy"
								return
						for(var/obj/Items/Shafts/MetalFlask/F in M)
							if(F.HasWater == "Water")
								view(M) << "[M] blesses the flask of water with the power of the lords of light!"
								F.HasWater = "Holy"
								return
					if(Result == "Destroy")
						del(src)
						return
					if(Result == "Pray")
						if(M.Undead == 0 && M.Infects == 0 && M.Hunger >= 70)
							view(M) << "[M] prays to the [src]"
							src.Content2 += 15
							M.Hunger -= 70
							M.Tiredness -= 70
						else
							usr << "Undead CANNOT pray to a good god!! Or you are too hungry."
						return
			EvilAltar
				icon = 'Cave.dmi'
				icon_state = "EvilAltar"
				weight = 100
				HP = 200
				DblClick() for(var/mob/Monsters/M in usr.Selected) if(M in view(1,src))
					var/list/menu = new()
					menu += "Sacrifice"
					if(src.Content2 >= 150)
						menu += "Unholy Vigor"
					for(var/obj/Items/Shafts/MetalFlask/F in M)
						if(F.HasWater == "Blood")
							menu += "Bless Flask of Blood"
					for(var/obj/Items/Shafts/LeatherFlask/F in M)
						if(F.HasWater == "Blood")
							menu += "Bless Flask of Blood"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if(Result == "Cancel")
						return
					if(Result == "Destroy")
						del(src)
						return
					if(Result == "Bless Flask of Blood")
						for(var/obj/Items/Shafts/LeatherFlask/F in M)
							if(F.HasWater == "Blood")
								view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
								F.HasWater = "Unholy"
								return
						for(var/obj/Items/Shafts/MetalFlask/F in M)
							if(F.HasWater == "Blood")
								view(M) << "[M] blesses the flask of blood with the power of the unholy gods!"
								F.HasWater = "Unholy"
								return
					if(Result == "Unholy Vigor")
						if(src.Content2 >= 150 && M.Shielded == 0 && M.Unholy == 0)
							view(usr) << "[usr] fills [M] with unholy strength making their attacks much more damaging!"
							M.WeaponDamageMin += 5
							M.WeaponDamageMax += 5
							M.Unholy = 1
							M.ImmuneToTemperature = 1
							src.Content2 -= 150
						else
							usr << "[src] either doesn't have 150 worship points or that creature has been blessed by a good god, or you have already given it unholy vigor."
					if(Result == "Sacrifice")
						if(M in view(2,src))
							usr << "[M] leaps into the flames of the dispicable altar and allows the dark tendrils to consume it."
							src.Content2 += M.Level*2
							src.Content2 += M.Strength + M.Agility / 2
							M.DeathType = "Sacrificed To Death"
							M.GoingToDie = 1
							M.Death()
							return
			Fire
				density = 1
				luminosity = 6
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "Fire"
				New() Heat()
			DblClick() for(var/mob/Monsters/M in usr.Selected)
				if(M.Race == "Spider")
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
					if(M in range(1,src))
						del(src)
				if(Result == "Tear all Meat from Corpses") for(var/mob/Body/m in M) M.TearMeat(m)
				if (Result == "Cook")
					for(var/obj/Items/Food/Meat/B in M) if(B.icon_state=="RawMeat")
						if(!prob(M.CookingSkill*4))
							usr<< "Failed!"
							M.weight -= B.weight
							del(B)
							M.CookingSkill+=2
							break
							return
						else
							B.name = "Cooked [B.name]"
							B.icon_state="CookedMeat"
							M.CookingSkill+=1
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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					var/list/menu = new()
					menu += "Cook"
					menu += "Tear all Meat from Corpses"
					menu += "Make Cheese"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result == "Cancel") return
					if(M in range(1,src))
						if (Result == "Destroy")
							if(M in range(1,src))
								M.DestroyKit()
						if(Result == "Tear all Meat from Corpses") for(var/mob/Body/m in M) M.TearMeat(m)
						if(Result == "Make Cheese")
							for(var/obj/Items/Shafts/WoodenBucket/B in M)
								if(B in M)
									if(M in range(1,src))
										if(B.HasWater == "Milk")
											var/obj/Items/Food/Cheese/CB = new
											CB.loc = M.loc
											M.CookingSkill+=2
											CB.name = "[B.Content3] Cheese"
											B.HasWater = null
											B.Content3 = 0

						if(Result == "Cook")
							for(var/obj/Items/Food/Meat/B in M) if(B.icon_state == "RawMeat")
								if(!prob(M.CookingSkill*4))
									usr<< "Failed!"
									M.weight -= B.weight
									del(B)
									M.CookingSkill+=2
									break
									return
								else
									B.name = "Cooked [B.name]"
									B.icon_state="CookedMeat"
									M.CookingSkill+=1
		Melter
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
					if(M.Race == "Spider")
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
						if(M in range(1,src))
							M.DestroyMelter()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Melt All Weapons On Unit"
						menu2 += "Melt All Armours On Unit"
						menu2 += "Melt All Items Near By"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Melt All Weapons On Unit")
							var/choice = alert(usr, "This will destroy all NON-EQUIPED weapons on your unit, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								var/EX = 0
								for(var/obj/Items/Equipment/Weapon/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										EX+=0.5
										del(W)
								usr << "Done, [M] gains [EX] exp!"
								M.GainEXP(EX)
						if (Result2 == "Melt All Armours On Unit")
							var/choice = alert(usr, "This will destroy all NON-EQUIPED armours on your unit, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								var/EX = 0
								for(var/obj/Items/Equipment/Armour/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										EX+=0.5
										del(W)
								usr << "Done, [M] gains [EX] exp!"
								M.GainEXP(EX)
						if (Result2 == "Melt All Items Near By")
							var/choice = alert(usr, "This will destroy all near by items on the ground, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								var/EX = 0
								for(var/obj/Items/W in view(1,src))
									if(W.suffix == null)
										if(W.Content3 == "Cage") continue
										if(W.Body == 0)
											del(W)
											EX += 0.5
								usr << "Done, [M] gains [EX] exp!"
								M.GainEXP(EX)
		Masonary
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
					if(M.Race == "Spider") return
					if(M.Wagon == 1) return
					var/list/menu = new()
					menu += "Craft"
					menu += "Destroy"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Destroy")
						if(M in range(1,src))
							M.DestroyMason()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Stone Pillar"
						menu2 += "Stone Door"
						menu2 += "Anti-Portal Stone"
						menu2 += "Stone Fence"
						menu2 += "Stone Statue"
						menu2 += "Tomb Stone"
						if(M.StoneCraftingSkill>=100) menu2 += "Form Gargoyle"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel") ..()
						if (Result2 == "Form Gargoyle") if(M.StoneCraftingSkill>=100)
							var/obj/Items/ores/stone/S
							var/obj/Items/Traps/Cages/C
							var/obj/Items/gems/Diamond/D
							var/obj/Items/gems/Diamond/DD
							var/mob/Monsters/MS
							for(S in M) break
							for(D in M) break
							for(DD in M)
								if(DD!=D) break
								else DD=null
							for(C in M)
								for(MS in C) break
								if(!MS) C=null
								else break
							if(S&&D&&DD&&C&&MS)
								M.StoneCraftingSkill-=100
								var/mob/Monsters/Gargoyle/G=new(M.loc)
								G.ChangeOwnership(M.Owner)
								G.PillarPowerup()
								G.name="{[usr]} Gargoyle"
								MS.loc = M.loc
								G.Strength+=MS.Strength/12
								G.Agility+=MS.Agility/12
								G.weightmax+=MS.weightmax
								G.Defence+=MS.Strength/12+Agility/12
								G.MagicalAptitude=MS.MagicalAptitude
								view(M) << "<b><font color=red>[M] uses [MS]'s soul to create a gargoyle!"
								C.underlays = null
								C.overlays = null
								C.HasPersonIn = 0
								MS.loc=M.loc
								MS.InHole = 0
								MS.Caged = 0
								MS.GoingToDie = 1
								MS.Killer = M
								MS.Death()
								M.weight -= S.weight + D.weight + DD.weight
								del(S)
								del(D)
								del(DD)
								return
							usr<<"You need 100 Stonecrafting, 1 Stone, 2 Cut Diamonds, and a Caged Prisioner to use the soul of to make a Gargoyle."
						if (Result2 == "Anti-Portal Stone")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									for(var/obj/Items/gems/Diamond/S2 in M)
										for(var/obj/Items/gems/Ruby/S3 in M)
											var/fail
											fail = prob(M.StoneCraftingSkill*3)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												del(S)
												M.StoneCraftingSkill += 1
												break
												return
											var/obj/Items/Furniture/Pillars/PortalStone/T = new
											T.loc = M.loc
											M.weight -= S.weight
											M.weight -= S2.weight
											M.weight -= S3.weight
											M.StoneCraftingSkill += 1
											del(S)
											del(S2)
											del(S3)
											return
										break
									break
								usr << "You need a cut diamond, a cut ruby, and a stone to make this."
						if (Result2 == "Stone Statue")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									var/obj/Items/Furniture/Pillars/Statue/T = new
									T.icon = M.icon
									T.icon_state = M.icon_state
									T.overlays += M.overlays
									T.loc = M.loc
									T.icon += rgb(150,150,150)
									T.dir = M.dir
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									T.desc = "This is a statue of [M] it is made from [S]."
									T.name = T.desc
									for(var/obj/F in T.overlays) F.icon += rgb(150,150,150)
									del(S)
									break
									return
						if (Result2 == "Stone Fence")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Fences/StoneFence/LB = new
									if(M.StoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.StoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.StoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.StoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.StoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.StoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.StoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.DoorCraft()
									M.StoneCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Stone Door")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.StoneCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Furniture/Doors/StoneDoor/LB = new
									if(M.StoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.StoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.StoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.StoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.StoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.StoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.StoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.StoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.DoorCraft()
									M.StoneCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Tomb Stone")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									var/obj/Items/Graves/TombStone/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									del(S)
									break
									return
						if (Result2 == "Stone Pillar")
							if(M in range(1,src))
								for(var/obj/Items/ores/stone/S in M)
									var/fail
									fail = prob(M.StoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.StoneCraftingSkill += 1
										break
										return
									if(M)
										var/obj/Items/Furniture/Pillars/DwarfPillar/LB = new
										LB.loc = M.loc
										M.weight -= S.weight
										if(M.StoneCraftingSkill >= 90)
											LB.CraftRank = "Epic Quality"
										if(M.StoneCraftingSkill >= 100)
											LB.CraftRank = "Legendary Quality"
										if(M.StoneCraftingSkill <= 90)
											LB.CraftRank = "Epic Quality"
										if(M.StoneCraftingSkill <= 75)
											LB.CraftRank = "Masterful Quality"
										if(M.StoneCraftingSkill <= 60)
											LB.CraftRank = "Grand Quality"
										if(M.StoneCraftingSkill <= 50)
											LB.CraftRank = "Impressive Quality"
										if(M.StoneCraftingSkill <= 40)
											LB.CraftRank = "Quality"
										if(M.StoneCraftingSkill <= 30)
											LB.CraftRank = "Average Quality"
										if(M.StoneCraftingSkill <= 20)
											LB.CraftRank = "Poor Quality"
										M.StoneCraftingSkill += 1
										LB.FurnitureCraft()
										M.StoneCraftingSkill += 1
										del(S)
										break
										return


		BoneCraft
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
					if(M.Race == "Spider")
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
						if(M in range(1,src))
							M.DestroyBone()
					if (Result == "Craft")
						var/list/menu2 = new()
						if(M.UsesPoison)
							menu2 += "Full Bone Armor"
							menu2 += "BoneSpear"
							menu2 += "BoneAxe"
							menu2 += "BoneDagger"
							menu2 += "BoneHelmet"
							menu2 += "BoneChestPlate"
							menu2 += "BoneLeggings"
							menu2 += "BoneLeftGauntlet"
							menu2 += "BoneRightGauntlet"
							menu2 += "BoneCage"
							menu2 += "Bone Door"
							menu2 += "BoneBuckler"
							menu2 += "Bone Training Post"
							menu2 += "BoneCrown"
							menu2 += "Bone Throne"
							menu2 += "Bone Sword"
							menu2 += "Skull Mace"
							menu2 += "Bone Bow"
							menu2 += "Bone Arrows"
							if(Race != "Orc")
								menu2 += "LockPick"
								menu2 += "Full Chitin Armor"
								menu2 += "ChitinHelmet"
								menu2 += "ChitinChestPlate"
								menu2 += "ChitinLeggings"
								menu2 += "ChitinBuckler"
								menu2 += "ChitinLeftGauntlet"
								menu2 += "ChitinRightGauntlet"
								menu2 += "ChitinSpear"
								menu2 += "ChitinSword"
								menu2 += "ChitinAxe"
								menu2 += "ChitinDagger"
								menu2 += "ChitinMace"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Bone Throne")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
										return
									var/obj/Items/Furniture/Chairs/BoneThrone/LB = new
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Training Post")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
										return
									var/obj/Items/Furniture/Posts/BoneTrainingPost/LB = new
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.TrainCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "LockPick")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in view(1,M))
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Shafts/LockPick/LB = new
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "BoneBuckler")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/Bones/Bones/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
								for(var/obj/Items/Bones/Bones/S in M)
									if(M.CraftCount >= 1)
										var/fail
										fail = prob(M.BoneCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.BoneCraftingSkill += 0.25
											return
										if(M.WearingBack)
											for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
												if(L.suffix == "(Equipped)")
													if(L.Content <= 250)
														var/obj/Items/Arrows/BoneArrow/LB = new
														LB.loc = L
														var/obj/Items/Arrows/BoneArrow/LB2 = new
														LB2.loc = L
														var/obj/Items/Arrows/BoneArrow/LB3 = new
														LB3.loc = L
														var/obj/Items/Arrows/BoneArrow/LB4 = new
														LB4.loc = L
														var/obj/Items/Arrows/BoneArrow/LB5 = new
														LB5.loc = L
														var/obj/Items/Arrows/BoneArrow/LB6 = new
														LB6.loc = L
														var/obj/Items/Arrows/BoneArrow/LB7 = new
														LB7.loc = L
														var/obj/Items/Arrows/BoneArrow/LB8 = new
														LB8.loc = L
														var/obj/Items/Arrows/BoneArrow/LB9 = new
														LB9.loc = L
														var/obj/Items/Arrows/BoneArrow/LB10 = new
														LB10.loc = L
														M.BoneCraftingSkill += 1.5
														M.weight -= S.weight
														LB.Owner = M.Owner
														LB2.Owner = M.Owner
														LB3.Owner = M.Owner
														LB4.Owner = M.Owner
														LB5.Owner = M.Owner
														LB6.Owner = M.Owner
														LB7.Owner = M.Owner
														LB8.Owner = M.Owner
														LB9.Owner = M.Owner
														LB10.Owner = M.Owner
														L.Content += 10
														M.Owner << "Arrows placed in quiver!"
														M.CraftCount -= 1
														del(S)
													else
														M.Owner << "This quiver has too many arrows in it!"
														return
										else
											M.Owner << "[M] - I,ve got no quiver to put arrows in!"
											return
									else
										M.CraftCount = 0
										return

						if (Result2 == "BoneCage")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Traps/Cages/BoneCage/LB = new
									LB.desc = "This is a bone cage, it can be used to capture creatures in"
									LB.FurnitureCraft()
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Bone Bow")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Bows/BoneBow/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneDagger")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Daggers/BoneDagger/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "BoneAxe")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Axes/BoneAxe/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "ChitinAxe")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Axes/ChitinAxe/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "ChitinMace")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Maces/ChitinMace/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									LB.WeaponDamageMin = LB.WeaponDamageMin/2
									LB.WeaponDamageMax = LB.WeaponDamageMax/2
									del(S)
									break
									return
						if (Result2 == "ChitinDagger")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Daggers/ChitinDagger/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Skull Mace")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Skull/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Maces/SkullMace/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Sword")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Swords/BoneSword/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneSpear")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Spears/BoneSpear/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinSpear")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Spears/ChitinSpear/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.75
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinSword")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Weapon/Swords/ChitinSword/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.BoneCraftingSkill += 0.75
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Leggings/SupernaturalBoneLeggings/LB = new
									LB.Defence = 40
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Chestplate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Chestplate/SupernaturalBoneChestPlate/LB = new
									LB.Defence = 40
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Helmet/SupernaturalBoneHelmet/LB = new
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone LeftArm")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/LeftArm/SupernaturalBoneLeftGauntlet/LB = new
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Supernatural Bone RightArm")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/RightArm/SupernaturalBoneRightGauntlet/LB = new
									LB.Defence = 20
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinBuckler")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinLeggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneRightGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneLeftGauntlet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneLeggings")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Full Chitin Armor")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
									var/obj/Items/Equipment/Armour/Chestplate/ChitinChestPlate/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Bones/Shell/S2 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.BoneCraftingSkill += 0.25
										del(S2)
										break
									var/obj/Items/Equipment/Armour/Leggings/ChitinLeggings/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Bones/Shell/S3 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.BoneCraftingSkill += 0.25
										del(S3)
										break
									var/obj/Items/Equipment/Armour/LeftArm/ChitinLeftGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Bones/Shell/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Equipment/Armour/RightArm/ChitinRightGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Shell/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
								for(var/obj/Items/Bones/Shell/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Equipment/Armour/Shield/ChitinBuckler/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "Full Bone Armor")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.BoneCraftingSkill += 0.25
										del(S)
										break
									var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/Bones/Bones/S2 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S2.weight
										M.BoneCraftingSkill += 0.25
										del(S2)
										break
									var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S2.weight
									LB.loc = M.loc
									del(S2)
									break
								for(var/obj/Items/Bones/Bones/S3 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S3.weight
										M.BoneCraftingSkill += 0.25
										del(S3)
										break
									var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S3.weight
									LB.loc = M.loc
									del(S3)
									break
								for(var/obj/Items/Bones/Bones/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Bones/S4 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S4.weight
										M.BoneCraftingSkill += 0.25
										del(S4)
										break
									var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S4.weight
									LB.loc = M.loc
									del(S4)
									break
								for(var/obj/Items/Bones/Skull/S5 in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S5.weight
										M.BoneCraftingSkill += 0.25
										del(S5)
										break
									var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S5.weight
									LB.loc = M.loc
									del(S5)
									break
						if (Result2 == "BoneChestPlate")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Door")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Furniture/Doors/BoneDoor/LB = new
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.DoorCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinHelmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Shell/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Helmet/ChitinHelmet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneCrown")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Bones/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Crown/Bone/LB = new
									M.BoneCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "BoneHelmet")
							if(M in range(1,src))
								for(var/obj/Items/Bones/Skull/S in M)
									var/fail
									fail = prob(M.BoneCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.BoneCraftingSkill += 0.25
										return
									var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
									if(M.BoneCraftingSkill >= 299)
										LB.CraftRank = "Supernatural Quality"
									if(M.BoneCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.BoneCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.BoneCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.BoneCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.BoneCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.BoneCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.BoneCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.BoneCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									LB.WeaponDamageMin = rand(1,3)
									LB.WeaponDamageMax = rand(3,6)
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
		Carpentry
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
					if(M.Race == "Spider")
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
						if(M in range(1,src))
							M.DestroyCarpentryStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Wooden Spike"
						menu2 += "Necromancer's Staff"
						menu2 += "Staff"
						menu2 += "Wooden Cage"
						menu2 += "Wooden Door"
						menu2 += "Wooden Fence"
						menu2 += "Wooden Spear"
						menu2 += "Wooden Chair"
						menu2 += "Wooden Bucket"
						if(M.Race != "Lizardman")
							menu2 += "Wooden Spade"
						if(M.Race == "Elf")
							menu2 += "Full Wooden Armor"
							menu2 += "Wooden Pickaxe"
							menu2 += "Wooden Sword"
							menu2 += "Wooden Mace"
							menu2 += "Wooden Elf Spear"
							menu2 += "Wooden Elf Bow"
							menu2 += "Wooden Axe"
							menu2 += "Wooden Helmet"
							menu2 += "Wooden Chestplate"
							menu2 += "Wooden LeftArm"
							menu2 += "Wooden RightArm"
							menu2 += "Wooden Leggings"
						if(M.Race == "Svartalfar" || M.Intelligence >= 10)
							menu2 += "Paper"
						menu2 += "Wooden Wagon"
						menu2 += "Wooden Sign"
						menu2 += "Wooden Chest"
						menu2 += "Wooden Table"
						menu2 += "Wooden Training Post"
						menu2 += "Wooden Bow"
						menu2 += "Wooden Arrows"
						if(M.Race != "Goblin")
							if(M.Race != "Kobold")
								if(M.Race != "Vampire")
									if(M.Race != "Lizardman")
										menu2 += "Wooden Bed"
						if(M.Race != "Kobold")
							menu2 += "WoodenBuckler"
						if(M.Race == "Lizardman")
							menu2 += "Lizardman Shield"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Paper")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									for(var/obj/Items/Shafts/WoodenBucket/S2 in M)
										if(S2.HasWater == "Water")
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												del(S)
												break
												M.WoodCraftingSkill += 0.5
												return
											var/obj/Items/Shafts/MagicScroll/LB = new

											M.WoodCraftingSkill += 0.5
											M.weight -= S.weight
											LB.loc = M.loc
											del(S)
											S2.HasWater = null
											return
								usr << "You need one piece of wood and one wooden bucket full of water to make this."
						if (Result2 == "Wooden Spear")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Spears/WoodenSpear/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Sword")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Swords/WoodenSword/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Pickaxe")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Picks/WoodenPickAxe/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Mace")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Maces/WoodenMace/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Axe")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Axes/WoodenAxe/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Elf Spear")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Spears/ElfSpear/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Elf Bow")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Bows/ElfBow/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									LB.WeaponDamageMin += 10
									LB.WeaponDamageMax += 15
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Chair")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Furniture/Chairs/WoodenChair/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Staff")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.WoodCraftingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Equipment/Weapon/Maces/Staff/LB = new
									LB.loc = M.loc
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Necromancer's Staff")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									if(M in range(1,src))
										for(var/obj/Items/Bones/Skull/S2 in M)
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.WoodCraftingSkill += 1
												del(S)
												del(S2)
												break
												return
											var/obj/Items/Equipment/Weapon/Maces/NecroStaff/LB = new
											LB.loc = M.loc
											if(M.WoodCraftingSkill >= 90)
												LB.CraftRank = "Epic Quality"
											if(M.WoodCraftingSkill >= 100)
												LB.CraftRank = "Legendary Quality"
											if(M.WoodCraftingSkill <= 90)
												LB.CraftRank = "Epic Quality"
											if(M.WoodCraftingSkill <= 75)
												LB.CraftRank = "Masterful Quality"
											if(M.WoodCraftingSkill <= 60)
												LB.CraftRank = "Grand Quality"
											if(M.WoodCraftingSkill <= 50)
												LB.CraftRank = "Impressive Quality"
											if(M.WoodCraftingSkill <= 40)
												LB.CraftRank = "Quality"
											if(M.WoodCraftingSkill <= 30)
												LB.CraftRank = "Average Quality"
											if(M.WoodCraftingSkill <= 20)
												LB.CraftRank = "Poor Quality"

											LB.BoneWeaponCraft()
											M.WoodCraftingSkill += 1.5
											M.weight -= S.weight
											M.weight -= S2.weight
											del(S)
											del(S2)
											break
											return
						if (Result2 == "Wooden Bow")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill += 0.5
										return
									var/obj/Items/Equipment/Weapon/Bows/WoodenBow/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneWeaponCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Bucket")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill += 0.5
										break
										return
									var/obj/Items/Shafts/WoodenBucket/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Spade")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill += 0.5
										break
										return
									var/obj/Items/Shafts/WoodenSpade/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Table")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill+=1
										return
									var/obj/Items/Furniture/Tables/Table/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Arrows")
							if(M in range(1,src))
								var/XK = 0
								var/T = input("Amount?")as null|num
								if(!T)
									return
								else
									for(var/obj/Items/woods/wood/G in M)
										if(G in M)
											if(G.suffix == "(Carrying)")
												XK += 1
									if(XK <= T)
										M.CraftCount = XK
									else
										M.CraftCount = T
									for(var/obj/Items/woods/wood/S in M)
										if(M.CraftCount >= 1)
											var/fail
											fail = prob(M.WoodCraftingSkill*4)
											if(fail == 0)
												usr<< "Failed!"
												M.weight -= S.weight
												M.MetalCraftingSkill += 1
												T -= 1
												del(S)
											else if(M.WearingBack)
												for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
													if(L.suffix == "(Equipped)")
														if(L.Content <= 250)
															var/obj/Items/Arrows/WoodenArrow/LB = new
															LB.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB2 = new
															LB2.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB3 = new
															LB3.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB4 = new
															LB4.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB5 = new
															LB5.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB6 = new
															LB6.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB7 = new
															LB7.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB8 = new
															LB8.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB9 = new
															LB9.loc = L
															var/obj/Items/Arrows/WoodenArrow/LB10 = new
															LB10.loc = L
															M.WoodCraftingSkill += 1.5
															M.weight -= S.weight
															LB.Owner = M.Owner
															LB2.Owner = M.Owner
															LB3.Owner = M.Owner
															LB4.Owner = M.Owner
															LB5.Owner = M.Owner
															LB6.Owner = M.Owner
															LB7.Owner = M.Owner
															LB8.Owner = M.Owner
															LB9.Owner = M.Owner
															LB10.Owner = M.Owner
															L.Content += 10
															M.Owner << "Arrows placed in quiver!"
															M.CraftCount -= 1
															del(S)
														else
															M.Owner << "This quiver has too many arrows in it!"
															return
											else
												M.Owner << "[M] - I've got no quiver to put arrows in!"
												return
										else
											M.CraftCount = 0
											return
						if (Result2 == "Wooden Training Post")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Posts/WoodTrainingPost/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.TrainCraft()
									del(S)
									break
									return
						if (Result2 == "Wooden Chest")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/mob/Monsters/Chests/WoodenChest/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Wooden Spike")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.WoodCraftingSkill+=1
										return
									var/obj/Items/Traps/Spikes/WoodenSpike/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Sign")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Shafts/Sign/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Wagon")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/mob/Monsters/Chests/Wagon/LB = new
									LB.loc = M.loc
									LB.Owner = M.Owner
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Cage")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Traps/Cages/WoodenCage/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Door")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Doors/WoodenDoor/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.DoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Fence")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Fences/WoodenFence/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.DoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Bed")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Furniture/Beds/WoodenBed/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.FurnitureCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "WoodenBuckler")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Chestplate")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Full Wooden Armor")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/WoodenChestplate/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Shield/WoodenBuckler/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
						if (Result2 == "Wooden RightArm")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/WoodenRightGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden LeftArm")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/WoodenLeftGauntlet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Leggings")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Leggings/WoodenLeggings/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Helmet")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/WoodenHelmet/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.BoneArmourCraft()
									LB.Defence += 4
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Lizardman Shield")
							if(M in range(1,src))
								for(var/obj/Items/woods/wood/S in M)
									var/fail
									fail = prob(M.WoodCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.WoodCraftingSkill+=1
										break
										return
									var/obj/Items/Equipment/Armour/Shield/LizardShield/LB = new
									if(M.WoodCraftingSkill >= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill >= 100)
										LB.CraftRank = "Legendary Quality"
									if(M.WoodCraftingSkill <= 90)
										LB.CraftRank = "Epic Quality"
									if(M.WoodCraftingSkill <= 75)
										LB.CraftRank = "Masterful Quality"
									if(M.WoodCraftingSkill <= 60)
										LB.CraftRank = "Grand Quality"
									if(M.WoodCraftingSkill <= 50)
										LB.CraftRank = "Impressive Quality"
									if(M.WoodCraftingSkill <= 40)
										LB.CraftRank = "Quality"
									if(M.WoodCraftingSkill <= 30)
										LB.CraftRank = "Average Quality"
									if(M.WoodCraftingSkill <= 20)
										LB.CraftRank = "Poor Quality"
									LB.MetalArmourCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return

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
					if(M.Race == "Spider")
						return
					if(M.Wagon == 1)
						return
					if(M.Race == "Spider")
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
						if(M in range(1,src))
							M.DestroyLeatherStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Strip all Skin from Corpses"
						menu2 += "Black Robe"
						menu2 += "Red Robe"
						menu2 += "White Robe"
						menu2 += "Black Hood"
						menu2 += "White Hood"
						menu2 += "Red Hat"
						menu2 += "Red Cape"
						menu2 += "Black Cape"
						menu2 += "White Cape"
						menu2 += "Leather Quiver"
						menu2 += "Leather Bed"
						menu2 += "Leather Leggings"
						menu2 += "Leather Left Glove"
						menu2 += "Leather Right Glove"
						menu2 += "Leather Top"
						menu2 += "Leather Helmet"
						menu2 += "Leather Flask"
						menu2 += "Demon Leather Top"
						menu2 += "Demon Leather Leggings"
						menu2 += "Demon Leather Helmet"
						menu2 += "Demon Leather Right Glove"
						menu2 += "Demon Leather Left Glove"
						menu2 += "Demon Leather Shield"
						menu2 += "Leather Sleeping Bag"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if(Result2 == "Strip all Skin from Corpses") for(var/mob/Body/m in M) if(M && m) M.TearSkin(m)
						if (Result2 == "Leather Quiver")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/LB = new
									LB.loc = M.loc
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.dir = NORTH
									del(S)
									break
									return
						if (Result2 == "Leather Flask")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
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
									M.LeatherCraftingSkill += 0.5
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "Leather Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/LeatherHelmet/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if(Result2 == "Demon Leather Helmet")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Equipment/Armour/Helmet/DemonLeatherHelmet/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if(Result2 == "Demon Leather Shield")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Equipment/Armour/Shield/DemonLeatherShield/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Black Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/BlackRobe/LB = new
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
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/RedRobe/LB = new
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
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Robe")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/WhiteRobe/LB = new
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
									LB.MetalArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Black Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Capes/BlackCape/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Capes/RedCape/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Cape")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Capes/WhiteCape/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Red Hat")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/RedHat/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Black Hood")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/BlackHood/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "White Hood")
							if(M in range(1,src))
								for(var/obj/Items/Silks/SpiderSilk/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Helmet/WhiteHood/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Leather Right Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/RightArm/LeatherRightGauntlet/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Right Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Equipment/Armour/RightArm/DemonLeatherRightGauntlet/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Left Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/LeftArm/LeatherLeftGauntlet/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Left Glove")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Equipment/Armour/LeftArm/DemonLeatherLeftGauntlet/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Top")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.LeatherCraftingSkill += 1
										break
										return
									var/obj/Items/Equipment/Armour/Chestplate/LeatherChestPlate/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Top")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.LeatherCraftingSkill += 1
											break
											return
										var/obj/Items/Equipment/Armour/Chestplate/DemonLeatherChestPlate/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									var/fail
									fail = prob(M.LeatherCraftingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										break
										M.LeatherCraftingSkill += 1
										return
									var/obj/Items/Equipment/Armour/Leggings/LeatherLeggings/LB = new
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
									LB.BoneArmourCraft()
									M.LeatherCraftingSkill += 1
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Demon Leather Leggings")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
									if(S.Race == "Demon")
										var/fail
										fail = prob(M.LeatherCraftingSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											break
											M.LeatherCraftingSkill += 1
											return
										var/obj/Items/Equipment/Armour/Leggings/DemonLeatherLeggings/LB = new
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
										LB.MetalArmourCraft()
										M.LeatherCraftingSkill += 1
										M.weight -= S.weight
										LB.loc = M.loc
										del(S)
										break
										return
						if (Result2 == "Leather Sleeping Bag")
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
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
							if(M in range(1,src))
								for(var/obj/Items/Skin/S in M)
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