mob
	WorkShops
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
							M.DestroyCarpentryStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Spear Shaft"
						menu2 += "Wooden Spike"
						menu2 += "Wooden Cage"
						menu2 += "Wooden Door"
						menu2 += "Wooden Spear"
						menu2 += "Wooden Bucket"
						if(M.LizardMan == 0)
							menu2 += "Wooden Spade"
						menu2 += "Wooden Wagon"
						menu2 += "Wooden Sign"
						menu2 += "Wooden Chest"
						menu2 += "Wooden Table"
						menu2 += "Wooden Training Post"
						menu2 += "Wooden Bow"
						menu2 += "Wooden Arrows"
						if(M.Goblin == 0)
							if(M.Kobold == 0)
								if(M.Vampire == 0)
									if(M.LizardMan == 0)
										menu2 += "Wooden Bed"
						if(M.Kobold == 0)
							menu2 += "WoodenBuckler"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Wooden Spear")
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Spears/WoodenSpear/LB = new
									LB.M = "Wood"
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
						if (Result2 == "Wooden Bow")
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Bows/WoodenBow/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
							if(M in view(1,src))
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
							if(M in view(1,src))
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
							if(M in view(1,src))
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
									if(M.WearingBack == 1)
										for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
											if(L.suffix == "(Equiped)")
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
												M.WoodCraftingSkill += 1
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
						if (Result2 == "Spear Shaft")
							if(M in view(1,src))
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
									var/obj/Items/Shafts/SpearShaft/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Training Post")
							if(M in view(1,src))
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
									LB.M = S
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
							if(M in view(1,src))
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
									var/mob/Monsters/WoodenChest/LB = new
									LB.loc = M.loc
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.Owner = M.Owner
									del(S)
									break
									return
						if (Result2 == "Wooden Spike")
							if(M in view(1,src))
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
							if(M in view(1,src))
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
							if(M in view(1,src))
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
									var/mob/Monsters/Wagon/LB = new
									LB.loc = M.loc
									LB.Owner = M.Owner
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Wooden Cage")
							if(M in view(1,src))
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
							if(M in view(1,src))
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
									LB.M = "Wood"
									LB.WoodDoorCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Wooden Bed")
							if(M in view(1,src))
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
									LB.M = S.name
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/Shields/WoodenBuckler/LB = new
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
									LB.M = "Wood"
									LB.WoodArmourCraft()
									M.WoodCraftingSkill += 0.5
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return