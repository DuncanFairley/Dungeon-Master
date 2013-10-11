mob
	WorkShops
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
							M.DestroyBone()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "BoneSpear"
						if(M.Vampire == 1)
							menu2 += "BoneAxe"
							menu2 += "BoneHelmet"
							menu2 += "BoneChestPlate"
							menu2 += "BoneLeggings"
							menu2 += "BoneLeftGauntlet"
							menu2 += "BoneRightGauntlet"
							menu2 += "BoneCage"
							menu2 += "BoneDoor"
							menu2 += "BoneBuckler"
							menu2 += "Bone Throne"
							menu2 += "Bone Sword"
							menu2 += "Skull Mace"
							menu2 += "Bone Bow"
							menu2 += "Bone Arrows"
						if(M.UsesPosion == 1)
							menu2 += "BoneAxe"
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
							if(Race != "Orc")
								menu2 += "Bone Bow"
								menu2 += "Bone Arrows"
								menu2 += "LockPick"
								menu2 += "ChitinHelmet"
								menu2 += "ChitinChestPlate"
								menu2 += "ChitinLeggings"
								menu2 += "ChitinBuckler"
								menu2 += "ChitinLeftGauntlet"
								menu2 += "ChitinRightGauntlet"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Bone Throne")
							if(M in view(1,src))
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
									LB.M = S.name
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
							if(M in view(1,src))
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
									LB.M = LB
									LB.TrainCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "LockPick")
							if(M in view(1,src))
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
									LB.M = S
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.FurnitureCraft()
									del(S)
									break
									return
						if (Result2 == "BoneBuckler")
							if(M in view(1,src))
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
									var/obj/Items/Armours/Shields/BoneBuckler/LB = new
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
									LB.M = S
									LB.BoneArmourCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "Bone Arrows")
							if(M in view(1,src))
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
									if(M.WearingBack == 1)
										for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
											if(L.suffix == "(Equiped)")
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
												M.BoneCraftingSkill += 1
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

						if (Result2 == "BoneCage")
							if(M in view(1,src))
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
									LB.M = S
									LB.desc = "This is a bone cage,it is made out of [LB.M], it can be used to capture creatures in"
									LB.FurnitureCraft()
									LB.loc = M.loc
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									del(S)
									break
									return
						if (Result2 == "Bone Bow")
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Bows/BoneBow/LB = new
									LB.M = S
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
						if (Result2 == "BoneAxe")
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Axes/BoneAxe/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Maces/SkullMace/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Swords/BoneSword/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Weapons/Spears/BoneSpear/LB = new
									LB.M = S
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
						if (Result2 == "ChitinLeftGauntlet")
							if(M in view(1,src))
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
									var/obj/Items/Armours/LeftArms/ChitinLeftGauntlet/LB = new
									LB.M = S
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
						if (Result2 == "ChitinRightGauntlet")
							if(M in view(1,src))
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
									var/obj/Items/Armours/RightArms/ChitinRightGauntlet/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/Shields/ChitinBuckler/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/Legs/ChitinLeggings/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/RightArms/BoneRightGauntlet/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/LeftArms/BoneLeftGauntlet/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/Legs/BoneLeggings/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/ChestPlates/ChitinChestPlate/LB = new
									LB.M = S
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
						if (Result2 == "BoneChestPlate")
							if(M in view(1,src))
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
									var/obj/Items/Armours/ChestPlates/BoneChestPlate/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									LB.M = "Wood"
									LB.MetalDoorCraft()
									M.BoneCraftingSkill += 0.25
									M.weight -= S.weight
									LB.loc = M.loc
									del(S)
									break
									return
						if (Result2 == "ChitinHelmet")
							if(M in view(1,src))
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
									var/obj/Items/Armours/Helmets/ChitinHelmet/LB = new
									LB.M = S
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
							if(M in view(1,src))
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
									var/obj/Items/Armours/Helmets/BoneCrown/LB = new
									LB.M = S
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
						if (Result2 == "BoneHelmet")
							if(M in view(1,src))
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
									var/obj/Items/Armours/Helmets/BoneHelmet/LB = new
									LB.M = S
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