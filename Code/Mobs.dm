/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
mob
	IsWood = 1

mob/proc/DestroyLeatherStation()
	for(var/mob/WorkShops/LeatherWorks/LW in view(3,src))
		if(LW.WorkShop == 1)
			del(LW)
mob/proc/DestroyCarpentryStation()
	for(var/mob/WorkShops/Carpentry/LW in view(3,src))
		if(LW.Carpentry == 1)
			del(LW)
mob/proc/DestroySmelterStation()
	for(var/mob/WorkShops/Smelters/LW in view(3,src))
		if(LW.Smelter == 1)
			del(LW)
mob/proc/DestroyForge()
	for(var/mob/WorkShops/Forge/LW in view(3,src))
		if(LW.Forge == 1)
			del(LW)
mob/proc/DestroyBone()
	for(var/mob/WorkShops/BoneCraft/LW in view(3,src))
		if(LW.BoneCraft == 1)
			del(LW)
mob/proc/DestroyPosion()
	for(var/mob/WorkShops/PosionStation/LW in view(3,src))
		if(LW.Posion == 1)
			del(LW)
mob/proc/DestroyKit()
	for(var/mob/WorkShops/Kitchen/LW in view(3,src))
		if(LW.Kit == 1)
			del(LW)
mob/proc/DestroyGem()
	for(var/mob/WorkShops/GemCutter/LW in view(3,src))
		if(LW.IsGem == 1)
			del(LW)
mob/proc/DestroyMason()
	for(var/mob/WorkShops/Masonary/LW in view(3,src))
		if(LW.Mason == 1)
			del(LW)
mob/proc/DestroyGlass()
	for(var/mob/WorkShops/GlassForge/CF in view(3,src))
		if(CF.IsGlass == 1)
			del(CF)
mob/proc/DestroyPotion()
	for(var/mob/WorkShops/PotionStation/CF in view(3,src))
		if(CF.IsPW == 1)
			del(CF)
mob/proc/DestroyMelter()
	for(var/mob/WorkShops/Melter/CF in view(3,src))
		del(CF)
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
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
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
							if(M in view(1,src))
								M.DestroyPotion()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Potion of Restoration"
							menu2 += "Potion of Internal Restoration"
							menu2 += "Potion of LongLife"
							menu2 += "Cure Vampirism"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Cure Vampirism")
								if(M in view(1,src))
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



							if (Result2 == "Potion of LongLife")
								if(M in view(1,src))
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

							if (Result2 == "Potion of Internal Restoration")
								if(M in view(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungases/F in M)
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
							if (Result2 == "Potion of Restoration")
								if(M in view(1,src))
									src.Content = null
									src.Content2 = null
									src.Content3 = null
									for(var/obj/Items/Potions/S in M)
										if(S.IsEmpty == 0)
											..()
										if(S.IsEmpty)
											src.Content = null
											src.Content = S
									for(var/obj/Items/Food/Fungases/F in M)
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

		PosionStation
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
					if(M.Spider == 1)
						return
					if(M.Tame == 1)
						return
					if(M.Wagon == 1)
						return
					if(M.UsesPosion == 1)
						var/list/menu = new()
						menu += "Craft"
						menu += "Destroy"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Destroy")
							if(M in view(1,src))
								M.DestroyPosion()
						if (Result == "Craft")
							var/list/menu2 = new()
							menu2 += "Extract Posion"
							menu2 += "Extract Toxic"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Extract Toxic")
								if(M in view(1,src))
									for(var/obj/Items/Glands/ToxicGland/S in M)
										var/fail
										fail = prob(M.PosionSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											del(S)
											M.PosionSkill += 1
											break
											return
										var/obj/Items/Posions/Toxic/LB = new
										LB.loc = M.loc
										LB.PosionContent = M.PosionSkill *2
										M.PosionSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
							if (Result2 == "Extract Posion")
								if(M in view(1,src))
									for(var/obj/Items/Glands/PosionRoots/S in M)
										var/fail
										fail = prob(M.PosionSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PosionSkill += 1
											del(S)
											break
											return
										var/obj/Items/Posions/Posion/LB = new
										LB.loc = M.loc
										LB.PosionContent = M.PosionSkill
										M.PosionSkill += 1
										M.weight -= S.weight
										del(S)
										break
										return
									for(var/obj/Items/Glands/PosionGland/S in M)
										var/fail
										fail = prob(M.PosionSkill*4)
										if(fail == 0)
											usr<< "Failed!"
											M.weight -= S.weight
											M.PosionSkill += 1
											del(S)
											break
											return
										var/obj/Items/Posions/Posion/LB = new
										LB.loc = M.loc
										LB.PosionContent = M.PosionSkill
										M.PosionSkill += 1
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
							M.DestroyGem()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "CutEmerald"
						menu2 += "CutRuby"
						menu2 += "CutDiamond"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "CutEmerald")
							if(M in view(1,src))
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
						if (Result2 == "CutRuby")
							if(M in view(1,src))
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
						if (Result2 == "CutDiamond")
							if(M in view(1,src))
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
		GlassForge
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
							M.DestroyGlass()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Glass Bottle"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Glass Bottle")
							for(var/obj/Items/ores/Sand/S in M)
								var/fail
								fail = prob(M.SmeltingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									del(S)
									M.SmeltingSkill += 1
									break
									return
								var/obj/Items/Potions/EmptyBottle/E = new
								E.loc = M.loc
								M.weight -= S.weight
								del(S)
								M.SmeltingSkill += 1
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
							M.DestroySmelterStation()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "Metal Ingot"
						menu2 += "Gold Bar"
						menu2 += "Silver Bar"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Metal Ingot")
							if(M in view(1,src))
								for(var/obj/Items/ores/metal/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										M.SmeltingSkill += 1
										del(S)
										break
										return
									var/obj/Items/Ingots/MetalIngot/LB = new
									LB.loc = M.loc
									M.SmeltingSkill += 0.5
									M.weight -= S.weight
									del(S)
						if (Result2 == "Gold Bar")
							if(M in view(1,src))
								for(var/obj/Items/ores/GoldNugget/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.SmeltingSkill += 1
										break
										return
									var/obj/Items/Ingots/GoldBar/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.SmeltingSkill += 0.5
									del(S)
						if (Result2 == "Silver Bar")
							if(M in view(1,src))
								for(var/obj/Items/ores/silver/S in M)
									var/fail
									fail = prob(M.SmeltingSkill*4)
									if(fail == 0)
										usr<< "Failed!"
										M.weight -= S.weight
										del(S)
										M.SmeltingSkill += 1
										break
										return
									var/obj/Items/Ingots/SilverBar/LB = new
									LB.loc = M.loc
									M.weight -= S.weight
									M.SmeltingSkill += 0.5
									del(S)
		CampFires
			Fire
				density = 1
				layer = 4
				icon = 'Cave.dmi'
				icon_state = "Fire"
				New()
					Heat()
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
							del(src)
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
								for(var/obj/Items/Weapons/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										del(W)
										var/EX = 0.5
										usr << "Done, [M] gains [EX] exp!"
										M.EXP += EX
						if (Result2 == "Melt All Armours On Unit")
							var/choice = alert(usr, "This will destroy all NON-EQUIPED armours on your unit, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								for(var/obj/Items/Armours/W in M)
									if(W.suffix == "(Carrying)")
										M.weight -= W.weight
										del(W)
										var/EX = 0.5
										usr << "Done, [M] gains [EX] exp!"
										M.EXP += EX
						if (Result2 == "Melt All Items Near By")
							var/choice = alert(usr, "This will destroy all near by items on the ground, continue?", "Choose", "No", "Yes", null)
							if (choice == "No")
								return
							if (choice == "Yes")
								for(var/obj/Items/W in view(1,src))
									if(W.suffix == null)
										if(W.Content3 == "Cage")
											usr << "Cant destroy cages, please remove it!"
											return
										if(W.Body == 0)
											del(W)
											var/EX = 0.5
											usr << "Done, [M] gains [EX] exp!"
											M.EXP += EX
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
							M.DestroyMason()
					if (Result == "Craft")
						var/list/menu2 = new()
						if(M.Kobold == 0)
							menu2 += "Stone Pillar"
						menu2 += "Stone Statue"
						menu2 += "Tomb Stone"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Stone Statue")
							if(M in view(1,src))
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
									T.loc = M.loc
									T.M = S
									T.icon += rgb(150,150,150)
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									T.desc = "This is a statue of [M] it is made from [S]."
									T.name = T.desc
									del(S)
									break
									return
						if (Result2 == "Tomb Stone")
							if(M in view(1,src))
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
									LB.M = S
									M.weight -= S.weight
									M.StoneCraftingSkill += 1
									del(S)
									break
									return
						if (Result2 == "Stone Pillar")
							if(M in view(1,src))
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
										LB.M = S
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
										LB.M = "Stone"
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


	Test
	Body
		density = 0
		Body = 1
		layer = 4
		DieAge = 1
		IsWood = 0
		weight = 40
		density = 0
		desc = "This is a body, it can be used as food or burial, or will provide bones."
		New()
			BodyDecay()
		DblClick()

			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.destination = null
					if(src.suffix == null)
						if(M.weight <= M.weightmax)
							src.loc = M
							src.suffix = "(Carrying)"
							M.weight += src.weight
							return
						else
							if(M.Wagon == 0)
								usr << "[M] : I cant Carry Too Much!"
							return

			for(var/mob/Monsters/M in usr.Selected)
				for(var/mob/O in M)
					if(O.loc == M)
						if(O.suffix == "(Carrying)")
							O.loc = M.loc
							O.suffix = null
							M.weight -= O.weight
							return
	Monsters

		TowerCap
			icon = 'Cave.dmi'
			icon_state = "TowerCap"
			IsTree = 1
			density = 1
			Humanoid = 0
			Intelligent = 0
			weightmax = 10
			SpecialUnit = 1
			DieAge = 25
			HP = 10
			CanKill = 1

		LizardEgg
			icon = 'LizardEgg.dmi'
			density = 1
			DieAge = 3000000
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			LizardMan = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
		Devourer
			icon = 'Devourer.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 200
			Race = "Devourer"
			Gender = "None"
			HP = 300
			MAXHP = 300
			Humanoid = 1
			AM = 1
			Carn = 1
			Infects = 1
			HumanParts = 1
			BloodContent = 400
			MaxBloodContent = 400
			Intelligent = 1
			ArmourSkill = 20
			SwordSkill = 20
			SneakingSkill = 0
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 4
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			ImmunePosion = 1
			WearingBack = 1
			HoldingWeapon = 1
			WearingShield = 1
			ButcherySkill = 5
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

			HasRightEye = 1

			HasRightLung  = 1

			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 0

			HasRightLeg = 0

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

			LeftLeg = "N/A"

			RightLeg = "N/A"

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

			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			LeftArmMaxHP = 150

			RightArmMaxHP = 150

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
								var/E
								var/D
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
								var/BUG3
								BUG3 = prob(2)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
									return
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

									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)

									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)

									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc

								if(E == 1)

									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)

									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)

									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)

									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)

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
				Age = 2000
				WalkTo()
				Heal()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = 25
				Bleeding()
				Level()
				usr.DieAge = 5000
				Dig()
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
		DevourerCacoon
			icon = 'Devourer.dmi'
			icon_state = "Cacoon"
			density = 1
			DieAge = 10
			WearingFullPlateHelm = 1
			Race = "Devourer"
			Humanoid = 1
			Strength = 1
			Agility = 1
			Defence = 1
			MAXHP = 100
			HP = 100
			New()
				spawn(1250)
					if(src)
						range(8,src) << "[src] begins to stir with life.<br>"
						spawn(1250)
							if(src)
								range(8,src) << "[src] hatches.<br>"
								src.Owner << "[src] hatched.<br>"
								var/mob/Monsters/Devourer/D = new
								var/mob/O = src.Owner
								O.UnitList += D
								D.Owner = src.Owner
								D.loc = src.loc
								del(src)
		SpiderEgg
			icon = 'SpiderEgg.dmi'
			icon_state = "Egg"
			density = 1
			DieAge = 3
			WearingFullPlateHelm = 1
			Preg = 1
			Egg = 1
			Spider = 1
			Humanoid = 1
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(50,100)
				usr.HP = usr.MAXHP
		Mole
			icon = 'Mole.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			DieAge = 10
			Cantame = 1
			Humanoid = 1
			SpecialUnit = 1
			Mole = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP



		CaveSpider
			icon = 'Bugs.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			CanKill = 1
			Posionus = 1
			DieAge = 10
			Cantame = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			SpecialUnit = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP




		DeathBeatle
			icon = 'DeathBeatle.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 10
			SpecialUnit = 1
			CanKill = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = 1

			Posionus = 1
			Cantame = 1
			DieAge = 10
			Beatle = 1
			Humanoid = 0

			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(3,5)
				usr.Agility = rand(3,5)
				usr.Defence = rand(3,5)
				usr.MAXHP = rand(25,35)
				usr.HP = usr.MAXHP

		SilkWorm
			icon = 'Bugs.dmi'
			icon_state = "DoomWorm"
			density = 1
			weightmax = 10

			Bug = 1
			Posionus = 1
			Bug = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,2)
				usr.Agility = rand(1,2)
				usr.Defence = rand(1,2)
				usr.MAXHP = rand(10,20)
				usr.HP = usr.MAXHP

		Wolf
			icon = 'Wolf.dmi'
			density = 1
			Wolf = 1
			DieAge = 35
			BloodContent = 300
			MaxBloodContent = 300
			Age = 1
			Cantame = 1
			Humanoid = 0
			Tame = 0
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = "Sword"
			Owner = "Wolves"
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
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(10,20)
				usr.Agility = rand(5,10)
				Heal()
				usr.Defence = rand(5,10)
				usr.MAXHP = rand(50,150)
				usr.HP = usr.MAXHP
				WalkTo()
				Level()
				TurnOffAttack()
				Attacks()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			Bump(atom/m)
				if(m == src.destination)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()

					if(m)
						if(m.icon_state == "Lava")
							if(m.density == 1)
								if(src.IsWood)
									src.Owner << "[src] is Burning To Death!"

									src.Fire()

						if(m)
							if(m.CanDigAt == 1)
								if(src.HasPick == 1)

									m.HP -= src.MineingSkill / 4
									src.MineingSkill += 0.1
									flick("Dig",m)
									if(m.HP <= 0)

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
		GrownPosionSporePlant
			name = "PosionSporePlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SneakingSkill = 500
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant2()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP

		PosionSporePlant
			icon = 'Swamp.dmi'
			icon_state = "Plant2"
			density = 1
			weightmax = 100
			Race = "Plant2"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			SneakingSkill = 500
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant2()
		GrownCarnivorousPlant
			name = "CarnivorousPlant"
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			SneakingSkill = 500
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				Plant1()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP


		CarnivorousPlant
			icon = 'Swamp.dmi'
			icon_state = "Plant1"
			density = 1
			weightmax = 100
			Race = "Plant"
			SneakingSkill = 500
			DieAge = 10
			Age = 1
			Cantame = 0
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			HP = 5000
			New()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
				for(var/turf/grounds/G in view(0,usr))
					if(G.Detailed == 1)
						del(usr)
				Plant1()
		Gremlin
			icon = 'Dwarf.dmi'
			density = 1
			weightmax = 100
			Race = "Gremlin"
			DieAge = 100
			SneakingSkill = 200
			Age = 1
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			WearingFullPlateHelm = 1
			Content = "CantBeCaged"
			Bump(atom/m)
				if(m)
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
				usr.FindItems()
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP
		Deer
			icon = 'Animal.dmi'
			density = 1
			weightmax = 100
			Deer = 1
			DieAge = 10
			Age = 1
			Cantame = 1
			SpecialUnit = 1
			Humanoid = 0
			CanKill = 1
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(1,1)
				usr.Agility = rand(1,1)
				usr.Defence = rand(1,1)
				usr.MAXHP = rand(5,10)
				usr.HP = usr.MAXHP

		NPCHumanLord
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return

					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/GoldLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/GoldChestPlate/

				WalkTo()
				NPCHumanName()
				usr.name = "[usr.name] Human Noble"
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHumanVillager
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return

					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.MAXHP = 100
				usr.WillJoin = prob(33)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				NPCHumanName()
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHuman3
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			ImmunePosion = 1
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Humans}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
										return
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/


				NPCHumanName()
				usr.WillJoin = prob(33)
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblin2
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			ImmunePosion = 1
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			Age = 18
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,10)
				usr.Agility = rand(3,6)
				usr.Defence = rand(40,60)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/


				NPCGoblinName()
				usr.WillJoin = prob(33)
				Bleeding()
				WalkTo()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHuman2
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			SellsPotion = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Human}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCHumanName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				usr.IsTrader = prob(100)

				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblinTrader
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Age = 18
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			SellsPotion = 1
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCGoblinName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/LeatherLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

				usr.IsTrader = prob(100)
				Bleeding()
				ReturnHome()
				WalkTo()
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCGoblinKing
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Goblin = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			BloodContent = 300
			MaxBloodContent = 300
			Age = 18
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Goblin}"
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


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(100)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(50,75)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				NPCGoblinName()
				usr.HomeLoc = usr.loc

				usr.overlays += /obj/Items/Armours/Legs/SilverLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SilverChestPlate/
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.name = "[usr.name] Goblin King"
				usr.DieAge = rand(150,200)
				NPCAttack()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCHuman
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			SneakingSkill = 200
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 40
			ShieldSkill = 30
			SpearSkill = 55
			ButcherySkill = 10
			WearingFullPlateHelm = 1
			ArmourSkill = 30
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Demons}"
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
			LeftEyeHP = 200

			WingHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200

			LeftArmMaxHP = 200

			RightArmMaxHP = 200

			LeftLegMaxHP = 200

			RightLegMaxHP = 200


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,75)
				usr.MAXHP = 250
				usr.WeaponDamageMin = 35
				usr.WeaponDamageMax = 65
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.icon += rgb(125,0,0)
				usr.overlays += /obj/Items/Armours/Legs/SkornLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet
				usr.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/

				var/HasArmour = prob(20)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/SkornLeggings/L = new
					var/obj/Items/Armours/ChestPlates/SkornChestPlate/C = new
					var/obj/Items/Armours/Helmets/SkornPlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/SkornLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/SkornRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				NPCHumanName()
				usr.name = "[usr.name] Follower of Skorn"
				WalkTo()
				Bleeding()
				ReturnHome()
				usr.DieAge = rand(150,200)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCSkorn
			icon = 'Human.dmi'
			icon_state = "Normal"
			name = "{NPC} Skorn Lord of Pain"
			density = 1
			weightmax = 150
			Human = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			WearingFullPlateHelm = 1
			IsSkorn = 1
			NPC = 1
			HammerSkill = 30
			SneakingSkill = 200
			AxeSkill = 30
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 400
			MaxBloodContent = 400
			ArmourSkill = 45
			ShieldSkill = 45
			ButcherySkill = 30
			ArmourSkill = 40
			MaceSkill = 30
			SpearSkill = 60
			SkinningSkill = 30
			UnArmedSkill = 30
			StoneCraftingSkill = 40
			MetalCraftingSkill = 40
			SmeltingSkill = 40
			Owner = "{NPC Demons}"
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




			LeftEyeHP = 200

			RightEyeHP = 200

			RightLungHP = 200

			LeftLungHP = 200

			SpleenHP = 200

			TeethHP = 200

			LeftArmHP = 200

			RightArmHP = 200

			LeftLegHP = 200

			RightLegHP = 200

			HeadHP = 200

			LeftEarHP = 200

			RightEarHP = 200

			GutsHP = 200

			StomachHP = 200

			LeftKidneyHP = 200

			RightKidneyHP = 200

			LiverHP = 200

			BrainHP = 200

			HeartHP = 200

			ThroatHP = 200

			NoseHP = 200


			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(100)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				usr.Strength = rand(20,30)
				usr.Agility = rand(6,12)
				usr.Defence = rand(50,100)
				usr.MAXHP = 300
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.icon += rgb(200,0,0)
				usr.WeaponDamageMin = 50
				usr.WeaponDamageMax = 100
				usr.overlays += /obj/Items/Armours/Legs/SkornLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/
				usr.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/
				usr.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet
				usr.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				var/HasArmour = prob(20)
				if(HasArmour == 1)
					var/obj/Items/Armours/Legs/SkornLeggings/L = new
					var/obj/Items/Armours/ChestPlates/SkornChestPlate/C = new
					var/obj/Items/Armours/Helmets/SkornPlateHelmet/H = new
					var/obj/Items/Armours/LeftArms/SkornLeftGauntlet/LG = new
					var/obj/Items/Armours/RightArms/SkornRightGauntlet/RG = new
					L.loc = usr
					C.loc = usr
					H.loc = usr
					LG.loc = usr
					RG.loc = usr
				WalkTo()
				Bleeding()
				ReturnHome()
				Bleeding()
				usr.DieAge = rand(1500,2000)
				FOS()
				..()

				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = src
		NPCDwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			name = "{NPC} Dwarf"
			density = 1
			weightmax = 150
			Dwarf = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Dwarf}"
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


			Bump(atom/m)
				if(m == src.destination)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
								m.HP -= 10
								flick("Dig",m)
								if(m.HP <= 0)
									var/E
									E = prob(100)
									if(E == 1)
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
									m.icon = 'Cave.dmi'
									m.icon_state = "Grass"
									m.density = 0
									m.opacity = 0
								return
						if(m.CanDigAt == 1)
							if(src.HasPick == 1)

								m.HP -= src.MineingSkill / 4
								src.MineingSkill += 0.1
								flick("Dig",m)
								if(m.HP <= 0)
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/SIL
									SIL = prob(5)
									if(SIL == 1)
										var/obj/Items/ores/silver/SS = new
										SS.loc = src.loc
									if(BUG == 1)
										var/mob/Monsters/CaveSpider/CS = new
										CS.loc = src.loc
									if(G == 1)
										var/obj/Items/ores/GoldNugget/GN = new
										GN.loc = src.loc

									if(E == 1)
										var/obj/Items/ores/metal/MET = new
										MET.loc = src.loc
									if(S == 1)
										var/obj/Items/ores/stone/ST = new
										ST.loc = src.loc
									if(D == 1)
										var/obj/Items/gems/UnCutDiamond/DI = new
										DI.loc = src.loc
									if(EM == 1)
										var/obj/Items/gems/UnCutEmerald/UD = new
										UD.loc = src.loc
									if(R == 1)
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
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(100,150)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				NPCAttack()
				usr.IsTrader = prob(33)
				ReturnHome()
				usr.DieAge = rand(120,150)
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
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M in view(1,src))
						if(M.Human == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail human, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Size matters not!")
										return
									if(Taunt == 1)
										alert("[src] : Try not to bump your head hehehe!")
										return
						if(M.Dwarf == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail fellow dwarf, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Are you a male or female? I really cant tell!")
										return
									if(Taunt == 1)
										alert("[src] : You look shorter than the average dwarf, you need more ale my friend!")
										return
						if(M.Goblin == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Ah a Goblin, you better whatch your step, you Goblins are known to be tricksy")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : wow! You Goblins are smart, I even heard you can count to ten!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
						if(M.Kobold == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Heh a Kobold hey, you better whatch your self, if your thinking of stealing any of our goods then you better think again my pointy eared friend")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : What do ya get when you cross a Kobold with a LockPick? Kboldy Locks!!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
					else
						if(M.Wagon == 0)
							M.destination = src


		SilverChest
			icon = 'Cave.dmi'
			icon_state = "Silver Chest"
			density = 0
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			CantKill = 1
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a silver chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I


			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		Drill
			icon = 'MetalObjects.dmi'
			icon_state = "Drill"
			CantKill = 1
			density = 0
			Drill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a drill, it can be used to extract ore from the ground.This type of drill can be placed in the ground and twisted around to dig with."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		GoldChest
			icon = 'Cave.dmi'
			icon_state = "Gold Chest"
			CantKill = 1
			density = 0
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a gold chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		MetalChest
			icon = 'Cave.dmi'
			icon_state = "Metal Chest"
			density = 0
			weightmax = 500
			CantKill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a metal chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		WoodenChest
			icon = 'Cave.dmi'
			icon_state = "Wooden Chest"
			density = 0
			CantKill = 1
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a wooden chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Wagon
			icon = 'Cave.dmi'
			icon_state = "Wagon"
			density = 0
			weightmax = 1000
			Wagon = 1
			CantKill = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			HasLeftLeg = 1
			Delay = 4
			HasRightLeg = 1
			Fainted = 0
			CanWalk = 1
			New()
				WalkTo()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star


		Human
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 110
			MineingSkill = 10
			WoodCuttingSkill = 20
			Human = 1
			Humanoid = 1
			UsesPicks = 1
			Carn = 0
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 10
			SwordSkill = 20
			AxeSkill = 10
			MaceSkill = 10
			PotionSkill = 10
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 10
			ShieldSkill = 15
			JewlCraftingSkill = 15
			ArmourSkill = 15
			ForgingSkill = 15
			WoodCraftingSkill = 25
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 15
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 15
			PosionSkill = 10
			BoneCraftingSkill = 10
			StoneCraftingSkill = 15
			SneakingSkill = 10
			LockPickingSkill = 10
			CookingSkill = 20
			CanFarm = 1
			FishingSkill = 25
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

			LeftEyeHP = 110

			WingHP = 110

			RightEyeHP = 110

			RightLungHP = 110

			LeftLungHP = 110

			SpleenHP = 110

			TeethHP = 110

			LeftArmHP = 110

			RightArmHP = 110

			LeftLegHP = 110

			RightLegHP = 110

			HeadHP = 110

			LeftEarHP = 110

			RightEarHP = 110

			GutsHP = 110

			StomachHP = 110

			LeftKidneyHP = 110

			RightKidneyHP = 110

			LiverHP = 110

			BrainHP = 110

			HeartHP = 110

			ThroatHP = 110

			NoseHP = 110

			LeftArmMaxHP = 110

			RightArmMaxHP = 110

			LeftLegMaxHP = 110

			RightLegMaxHP = 110

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
						if(m.Tree == 1)
							if(src.HoldingWeapon == "Axe")
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
													var/obj/Items/woods/wood/MET4 = new
													MET4.loc = S
													MET4.suffix = "(Carrying)"
													S.weight += MET4.weight
													var/obj/Items/woods/wood/MET3 = new
													MET3.loc = S
													MET3.suffix = "(Carrying)"
													S.weight += MET3.weight
													var/obj/Items/woods/wood/MET2 = new
													MET2.loc = S
													MET2.suffix = "(Carrying)"
													S.weight += MET2.weight
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
										var/obj/Items/woods/wood/MET4 = new
										MET4.loc = src.loc
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
										var/obj/Items/woods/wood/MET2 = new
										MET2.loc = src.loc
										var/obj/Items/woods/wood/MET3 = new
										MET3.loc = src.loc
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
									src.EXP += 0.3
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
									CI = prob(5)

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
									var/BUG3
									BUG3 = prob(2)
									if(BUG3 == 1)
										var/mob/Monsters/Mole/Mole = new
										Mole.loc = src.loc
									E = prob(35)
									D = prob(1)
									EM = prob(0.5)
									R = prob(0.5)
									S = prob(70)
									var/G
									G = prob(5)
									var/BUG
									var/BUG2
									BUG2 = prob(2)
									if(BUG2 == 1)
										var/mob/Monsters/DeathBeatle/DB = new
										DB.loc = src.loc
									BUG = prob(2)
									var/CAP
									CAP = prob(3)
									if(CAP == 1)

										var/mob/Monsters/TowerCap/SS = new
										SS.loc = src.loc
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
				M = prob(50)
				usr.Black = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				if(M == 1)
					if(usr.Black == 1)
						usr.icon = 'HumanBlack.dmi'
						usr.icon_state = "Normal"
				else
					if(usr.Black == 1)
						usr.icon = 'FemaleHumanBlack.dmi'
						usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(5,10)
				usr.Agility = rand(7,11)
				usr.Defence = rand(4,9)
				Hunger()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(95,115)
				Tiredness()
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
		OrcEscort

			icon = 'OrcMale.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Orc"

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
			UsesPosion = 1
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
				NPCGoblinName()
				Leave()
				usr.name = "{Escort} Orc [usr.name]"
				usr.DieAge = rand(110,125)
				Escort()

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

		Orc
			icon = 'OrcMale.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 15
			WoodCuttingSkill = 15
			Race = "Orc"
			Humanoid = 1
			UsesPicks = 1
			Carn = 1
			CanDetail = 1
			Intelligent = 1
			SpearSkill = 15
			SwordSkill = 20
			AxeSkill = 30
			MaceSkill = 25
			PotionSkill = 0
			HP = 200
			MAXHP = 200
			HumanParts = 1
			BowSkill = 15
			BloodContent = 300
			MaxBloodContent = 300
			UnArmedSkill = 20
			ShieldSkill = 20
			JewlCraftingSkill = 0
			ArmourSkill = 20
			ForgingSkill = 15
			MakesBoneCraft = 1
			UsesPosion = 1
			WoodCraftingSkill = 20
			MetalCraftingSkill = 15
			User = 0
			SkinningSkill = 20
			SmeltingSkill = 15
			ButcherySkill = 15
			LeatherCraftingSkill = 20
			PosionSkill = 15
			BoneCraftingSkill = 15
			StoneCraftingSkill = 15
			SneakingSkill = 5
			LockPickingSkill = 10
			CookingSkill = 0
			FishingSkill = 15
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

			LeftEyeHP = 130

			WingHP = 130

			RightEyeHP = 130

			RightLungHP = 130

			LeftLungHP = 130

			SpleenHP = 130

			TeethHP = 130

			LeftArmHP = 130

			RightArmHP = 130

			LeftLegHP = 130

			RightLegHP = 130

			HeadHP = 130

			LeftEarHP = 130

			RightEarHP = 130

			GutsHP = 130

			StomachHP = 130

			LeftKidneyHP = 130

			RightKidneyHP = 130

			LiverHP = 130

			BrainHP = 130

			HeartHP = 130

			ThroatHP = 130

			NoseHP = 130

			LeftArmMaxHP = 130

			RightArmMaxHP = 130

			LeftLegMaxHP = 130

			RightLegMaxHP = 130

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
						if(m.Tree == 1)
							if(src.HoldingWeapon == "Axe")
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
													var/obj/Items/woods/wood/MET4 = new
													MET4.loc = S
													MET4.suffix = "(Carrying)"
													S.weight += MET4.weight
													var/obj/Items/woods/wood/MET3 = new
													MET3.loc = S
													MET3.suffix = "(Carrying)"
													S.weight += MET3.weight
													var/obj/Items/woods/wood/MET2 = new
													MET2.loc = S
													MET2.suffix = "(Carrying)"
													S.weight += MET2.weight
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
										var/obj/Items/woods/wood/MET4 = new
										MET4.loc = src.loc
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
										var/obj/Items/woods/wood/MET2 = new
										MET2.loc = src.loc
										var/obj/Items/woods/wood/MET3 = new
										MET3.loc = src.loc
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
									src.EXP += 0.3
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
									CI = prob(5)

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
									var/BUG3
									BUG3 = prob(2)
									if(BUG3 == 1)
										var/mob/Monsters/Mole/Mole = new
										Mole.loc = src.loc
									E = prob(35)
									D = prob(1)
									EM = prob(0.5)
									R = prob(0.5)
									S = prob(70)
									var/G
									G = prob(5)
									var/BUG
									var/BUG2
									BUG2 = prob(2)
									if(BUG2 == 1)
										var/mob/Monsters/DeathBeatle/DB = new
										DB.loc = src.loc
									BUG = prob(2)
									var/CAP
									CAP = prob(3)
									if(CAP == 1)

										var/mob/Monsters/TowerCap/SS = new
										SS.loc = src.loc
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
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.icon = 'OrcFemale.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				Bleeding()
				usr.Strength = rand(7,14)
				usr.Agility = rand(5,8)
				usr.Defence = rand(6,12)
				Hunger()
				Heal()
				Level()
				Dig()
				usr.DieAge = rand(110,125)
				Tiredness()
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

		Dwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 130
			MineingSkill = 20
			WoodCuttingSkill = 20
			HumanParts = 1
			Dwarf = 1
			Humanoid = 1
			UsesPicks = 1
			BloodContent = 300
			MaxBloodContent = 300
			Carn = 0
			CanDetail = 1
			HammerSkill = 10
			BowSkill = 15
			AxeSkill = 20
			Intelligent = 1
			ArmourSkill = 20
			SneakingSkill = 10
			WearingLegs = 0
			ShieldSkill = 20
			User = 0
			ButcherySkill = 10
			MaceSkill = 25
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 30
			MetalCraftingSkill = 25
			HP = 200
			JewlCraftingSkill = 20
			MAXHP = 200
			SmeltingSkill = 25
			FishingSkill = 15
			LeatherCraftingSkill = 15
			CookingSkill = 15
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

			LeftEyeHP = 125

			WingHP = 125

			RightEyeHP = 125

			RightLungHP = 125

			LeftLungHP = 125

			SpleenHP = 125

			TeethHP = 125

			LeftArmHP = 125

			RightArmHP = 125

			LeftLegHP = 125

			RightLegHP = 125

			HeadHP = 125

			LeftEarHP = 125

			RightEarHP = 125

			GutsHP = 125

			StomachHP = 125

			LeftKidneyHP = 125

			RightKidneyHP = 125

			LiverHP = 125

			BrainHP = 125

			HeartHP = 125

			ThroatHP = 125

			NoseHP = 125

			LeftArmMaxHP = 125

			RightArmMaxHP = 125

			LeftLegMaxHP = 125

			RightLegMaxHP = 125

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
						if(m.Tree == 1)
							if(src.HoldingWeapon == "Axe")
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
									src.EXP += 0.7

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
												CF.IsWood = 0
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
												CF.IsWood = 0
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
									var/G
									G = prob(5)
									var/BUG
									BUG = prob(2)
									var/CAP
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
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
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
				else
					usr.icon = 'FemaleHuman.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
					usr.G = 0
					usr.B = 0
					usr.BB = 0
				WalkTo()
				usr.Strength = rand(7,14)
				usr.Agility = rand(3,6)
				usr.Defence = rand(7,13)
				Hunger()
				Heal()
				Bleeding()
				Level()
				Dig()

				usr.DieAge = rand(120,150)
				Tiredness()
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

		LizardManEscort

			icon = 'LizardMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			LizardMan = 1

			Humanoid = 1
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 50
			MakesPosion = 1
			ImmunePosion = 1
			Alive =1
			HP = 300
			Escort = 1
			HasGland = 1
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
			PosionDMG = 5
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
				Age = rand(20,30)
				usr.WeaponDamageMin = 60
				usr.WeaponDamageMax = 120
				usr.Defence = 65
				WalkTo()
				usr.Strength = rand(20,30)
				usr.Agility = rand(20,30)
				usr.Defence = rand(20,30)
				usr.overlays += 'LizardTail.dmi'
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				Bleeding()
				Heal()
				Leave()
				usr.name = "{Escort} LizardMan"
				usr.DieAge = rand(70,100)
				Escort()

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

		LizardMan
			icon = 'LizardMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 125
			MineingSkill = 10
			WoodCuttingSkill = 10
			LizardMan = 1
			BowSkill = 25
			Humanoid = 1
			UsesPicks = 1
			CanDetail = 1
			Carn = 1
			SwordSkill = 20
			HP = 200
			MAXHP = 200
			HasGland = 1
			Intelligent = 1
			MakesPosion = 1
			ImmunePosion = 1
			User = 0
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			PotionSkill = 10
			ArmourSkill = 15
			ShieldSkill = 20
			PosionDMG = 5
			SpearSkill = 25
			PosionSkill = 25
			BoneCraftingSkill = 20
			ButcherySkill = 15
			SkinningSkill = 15
			UnArmedSkill = 20
			LockPickingSkill = 20
			MakesBoneCraft = 1
			SneakingSkill = 15
			MaceSkill = 10
			UsesPosion = 1
			FishingSkill = 20
			JewlCraftingSkill = 5
			MetalCraftingSkill = 10
			WoodCraftingSkill = 15
			SmeltingSkill = 10
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

			LeftEyeHP = 115

			WingHP = 115

			RightEyeHP = 115

			RightLungHP = 115

			LeftLungHP = 115

			SpleenHP = 115

			TeethHP = 115

			LeftArmHP = 115

			RightArmHP = 115

			LeftLegHP = 115

			RightLegHP = 115

			HeadHP = 115

			LeftEarHP = 115

			RightEarHP = 115

			GutsHP = 115

			StomachHP = 115

			LeftKidneyHP = 115

			RightKidneyHP = 115

			LiverHP = 115

			BrainHP = 115

			HeartHP = 115

			ThroatHP = 115

			NoseHP = 115

			LeftArmMaxHP = 115

			RightArmMaxHP = 115

			LeftLegMaxHP = 115

			RightLegMaxHP = 115

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
												var/obj/Items/woods/wood/MET4 = new
												MET4.loc = S
												MET4.suffix = "(Carrying)"
												S.weight += MET4.weight
												var/obj/Items/woods/wood/MET2 = new
												MET2.loc = S
												MET2.suffix = "(Carrying)"
												S.weight += MET2.weight
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
									var/obj/Items/woods/wood/MET4 = new
									MET4.loc = src.loc
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
									var/obj/Items/woods/wood/MET2 = new
									MET2.loc = src.loc

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
					usr.Gender = "Female"
					usr.icon = 'LizardWoman.dmi'
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(6,11)
				usr.Agility = rand(8,12)
				usr.Defence = rand(9,12)
				usr.overlays += 'LizardTail.dmi'

				Hunger()
				Heal()
				Bleeding()
				Dig()
				Regen()
				usr.DieAge = rand(110,115)
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
		Kobold

			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 85
			Kobold = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			BowSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			MakesBoneCraft = 1
			Carn = 1
			HumanParts = 1
			SpearSkill = 25
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 25
			User = 0
			SneakingSkill = 25
			UsesPosion = 1
			PosionSkill = 40
			SkinningSkill = 15
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 15
			FishingSkill = 20
			MetalCraftingSkill = 10
			WoodCraftingSkill = 10
			SmeltingSkill = 10
			StoneCraftingSkill = 10
			LeatherCraftingSkill = 20
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

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			LeftArmMaxHP = 85

			RightArmMaxHP = 85

			LeftLegMaxHP = 85

			RightLegMaxHP = 85

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
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				if(M == 0)
					usr.icon = 'FemaleKobold.dmi'
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(4,8)
				usr.Agility = rand(9,13)
				usr.Defence = rand(2,6)
				Hunger()
				Bleeding()
				Heal()

				Level()
				Dig()
				usr.DieAge = rand(95,110)
				Tiredness()
				Bed()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		Zombie
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Race = "Zombie"
			Humanoid = 1
			BowSkill = 0
			Infects = 1
			BloodContent = 250
			MaxBloodContent = 250
			MakesBoneCraft = 1
			Carn = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			HumanParts = 1
			SpearSkill = 0
			HP = 200
			MAXHP = 200
			Intelligent = 1
			ArmourSkill = 0
			User = 0
			UnArmedSkill = 15
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

			LeftEyeHP = 100

			WingHP = 100

			RightEyeHP = 100

			RightLungHP = 100

			LeftLungHP = 100

			SpleenHP = 100

			TeethHP = 100

			LeftArmHP = 100

			RightArmHP = 100

			LeftLegHP = 100

			RightLegHP = 100

			HeadHP = 100

			LeftEarHP = 100

			RightEarHP = 100

			GutsHP = 100

			StomachHP = 100

			LeftKidneyHP = 100

			RightKidneyHP = 100

			LiverHP = 100

			BrainHP = 100

			HeartHP = 100

			ThroatHP = 100

			NoseHP = 100

			LeftArmMaxHP = 100

			RightArmMaxHP = 100

			LeftLegMaxHP = 100

			RightLegMaxHP = 100

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
				Age = 0
				WalkTo()
				usr.Strength = rand(5,10)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				Bleeding()
				Heal()
				Level()
				Dig()
				usr.DieAge = 200
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(usr.User== 1)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star
		KoboldEscort

			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Kobold = 1

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
				NPCKoboldName()
				Leave()
				usr.name = "{Escort} Kobold [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

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

		HumanEscort

			icon = 'Human.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Human = 1

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
				usr.name = "{Escort} Human [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

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

		GoblinEscort

			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

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
				NPCGoblinName()
				Leave()
				usr.name = "{Escort} Goblin [usr.name]"
				usr.DieAge = rand(70,100)
				Escort()

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

		Spider
			icon = 'SpiderWarriorYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungHunter = 1
			Humanoid = 1
			AM = 1
			Carn = 1
			WoodCraftingSkill = 25
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			HumanParts = 1
			HoldingWeapon = 1
			WearingShield = 1
			ArmourSkill = 20
			Gender = "Male"
			FishingSkill = 25
			Delay = 3
			User = 0
			ImmunePosion = 1
			WearingBack = 1
			PosionSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
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

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			LeftArmMaxHP = 85

			RightArmMaxHP = 85

			LeftLegMaxHP = 85

			RightLegMaxHP = 85
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
					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(4,9)
				usr.Agility = rand(10,13)
				usr.Defence = rand(5,10)
				Hunger()
				Bleeding()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
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
		HunterSpider
			icon = 'SpiderHunterYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungWarrior = 1
			Humanoid = 1
			AM = 1
			Carn = 1
			WoodCraftingSkill = 25
			FishingSkill = 10
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			ArmourSkill = 20
			BloodContent = 300
			MaxBloodContent = 300
			WearingBack = 1
			WearingLegs = 1
			WearingHelmet = 1
			Delay = 3
			HumanParts = 1
			HoldingWeapon = 1
			WearingShield = 1
			Gender = "Male"
			User = 0
			ImmunePosion = 1
			PosionSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
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

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			LeftArmMaxHP = 85

			RightArmMaxHP = 85

			LeftLegMaxHP = 85

			RightLegMaxHP = 85
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
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)


			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(3,6)
				usr.Agility = rand(8,11)
				usr.Defence = rand(4,7)
				Hunger()
				Bleeding()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
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
		WorkerSpider
			icon = 'SpiderWorkerYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Spider = 1
			IsYoungWorker = 1
			Humanoid = 1
			AM = 1
			MineingSkill = 30
			WoodCuttingSkill = 30
			Carn = 1
			WoodCraftingSkill = 25
			Intelligent = 1
			HP = 200
			MAXHP = 200
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			WearingLeftArm = 1
			WearingRightArm = 1
			BloodContent = 300
			MaxBloodContent = 300
			WearingLegs = 1
			WearingHelmet = 1
			HumanParts = 1
			HoldingWeapon = 1
			FishingSkill = 30
			WearingShield = 1
			WearingBack = 1
			Gender = "Female"
			Delay = 3
			User = 0
			ImmunePosion = 1
			ArmourSkill = 20
			PosionSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
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

			LeftEyeHP = 85

			WingHP = 85

			RightEyeHP = 85

			RightLungHP = 85

			LeftLungHP = 85

			SpleenHP = 85

			TeethHP = 85

			LeftArmHP = 85

			RightArmHP = 85

			LeftLegHP = 85

			RightLegHP = 85

			HeadHP = 85

			LeftEarHP = 85

			RightEarHP = 85

			GutsHP = 85

			StomachHP = 85

			LeftKidneyHP = 85

			RightKidneyHP = 85

			LiverHP = 85

			BrainHP = 85

			HeartHP = 85

			ThroatHP = 85

			NoseHP = 85

			LeftArmMaxHP = 85

			RightArmMaxHP = 85

			LeftLegMaxHP = 85

			RightLegMaxHP = 85
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
								var/E
								var/D
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
								var/BUG3
								BUG3 = prob(2)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
									return
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

									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)

									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)

									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc

								if(E == 1)

									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)

									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)

									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)

									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)

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
					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)

			New()
				Age = rand(20,60)

				WalkTo()
				Heal()
				usr.Strength = rand(3,7)
				usr.Agility = rand(11,14)
				usr.Defence = rand(3,5)
				Hunger()
				Bleeding()
				Dig()
				Level()
				usr.DieAge = rand(100,120)
				STiredness()
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
		SpiderQueen
			icon = 'SpiderQueenYoung.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 145
			Spider = 1
			Gender = "Female"
			HP = 200
			MAXHP = 200
			WoodCraftingSkill = 25
			IsYoungQueen = 1
			Humanoid = 1
			AM = 1
			Queen = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Carn = 1
			HumanParts = 1
			BloodContent = 300
			MaxBloodContent = 300
			Intelligent = 1
			ArmourSkill = 20
			HoldingWeapon = "Sword"
			SneakingSkill = 60
			WearingChest = 1
			WearingLegs = 1
			User = 0
			Delay = 3
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingHelmet = 1
			ImmunePosion = 1
			WearingBack = 1
			HoldingWeapon = 1
			WearingShield = 1
			PosionSkill = 50
			ButcherySkill = 10
			WebContent = 0
			MaxWebContent = 0
			UnArmedSkill = 30
			HasLeftEye = 1
			FishingSkill = 25

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

			LeftEyeHP = 90

			WingHP = 90

			RightEyeHP = 90

			RightLungHP = 90

			LeftLungHP = 90

			SpleenHP = 90

			TeethHP = 90

			LeftArmHP = 90

			RightArmHP = 90

			LeftLegHP = 90

			RightLegHP = 90

			HeadHP = 90

			LeftEarHP = 90

			RightEarHP = 90

			GutsHP = 90

			StomachHP = 90

			LeftKidneyHP = 90

			RightKidneyHP = 90

			LiverHP = 90

			BrainHP = 90

			HeartHP = 90

			ThroatHP = 90

			NoseHP = 90

			LeftArmMaxHP = 90

			RightArmMaxHP = 90

			LeftLegMaxHP = 90

			RightLegMaxHP = 90

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
								var/E
								var/D
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
								var/BUG3
								BUG3 = prob(2)
								if(BUG3 == 1)
									var/mob/Monsters/Mole/Mole = new
									Mole.loc = src.loc
									return
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

									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)

									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)

									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc

								if(E == 1)

									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)

									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)

									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)

									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)

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
				Heal()
				usr.Strength = rand(8,14)
				usr.Agility = rand(10,18)
				usr.Defence = rand(10,20)
				Bleeding()
				Hunger()

				Level()
				usr.DieAge = rand(450,550)
				STiredness()
				Dig()
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
		DemonNPC
			icon = 'Demon.dmi'
			density = 1
			AM = 1
			Race = "Demon"
			IsWood = 0
			weightmax = 200
			CanDetail = 1
			HumanParts = 1
			User = 0
			Humanoid = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Carn = 1
			CanBeSlaved = 1
			E = 1
			Intelligent = 1
			SpearSkill = 20
			HasWings = 1
			MakesBoneCraft = 1
			HP = 300
			MAXHP = 300
			SwordSkill  = 60
			BloodContent = 400
			MaxBloodContent = 400
			HoldingWeapon = "Sword"
			AxeSkill  = 20
			MaceSkill  = 20
			UnArmedSkill  = 30
			NPC = 1
			BowSkill = 15
			ShieldSkill  = 20
			name = "{NPC} Demon"
			ArmourSkill  = 35
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
			SneakingSkill  = 35
			LockPickingSkill = 20
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
			LeftEyeHP = 250

			WingHP = 250

			RightEyeHP = 250

			RightLungHP = 250

			LeftLungHP = 250

			SpleenHP = 250

			TeethHP = 250

			LeftArmHP = 250

			RightArmHP = 250

			LeftLegHP = 250

			RightLegHP = 250

			HeadHP = 250

			LeftEarHP = 250

			RightEarHP = 250

			GutsHP = 250

			StomachHP = 250

			LeftKidneyHP = 250

			Owner = "{NPC Demons}"

			RightKidneyHP = 250

			LiverHP = 250

			BrainHP = 250

			HeartHP = 250

			ThroatHP = 250

			NoseHP = 250

			LeftArmMaxHP = 250

			RightArmMaxHP = 250

			LeftLegMaxHP = 250

			RightLegMaxHP = 250


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
				usr.overlays += 'DemonicItems.dmi'
				var/Bladed = prob(20)
				if(Bladed == 1)
					var/obj/Items/Weapons/Swords/HellForgedSword/S = new
					S.loc = usr
					S.suffix = "(Carrying)"
					S.WeaponDamageMin = 100
					S.WeaponDamageMax = 120
					S.name = "Hell Forged Sword - Supernatural Quality"
					S.desc = "This strange blade is harder than steel, it is made from an unknown material, it irradiates a dangerous aura."
				Age = rand(200,600)
				Gender = "None"
				usr.Strength = rand(50,60)
				usr.overlays += 'Wings2.dmi'
				usr.Agility = rand(50,60)
				usr.Defence = rand(60,65)
				Dig()
				RandomWalk()
				ResetTarget()
				Heal()
				FlameAttack()
				Bleeding()
				usr.WeaponDamageMin = 50
				usr.WeaponDamageMin = 70
				usr.DieAge = rand(10000,12500)
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
		DarkKnight
			icon = 'Skorn.dmi'
			density = 1
			weightmax = 500
			CanDetail = 1
			Human = 1
			HumanParts = 1
			Humanoid = 1
			Carn = 1
			E = 1

			Intelligent = 1
			SpearSkill = 80
			SwordSkill  = 80
			AxeSkill  = 80
			MaceSkill  = 80
			AxeSkill  = 80
			UnArmedSkill  = 80
			ShieldSkill  = 80
			ArmourSkill  = 80
			ForgingSkill  = 80
			WoodCraftingSkill  = 80
			MetalCraftingSkill  = 80
			SkinningSkill  = 80
			SmeltingSkill  = 80
			ButcherySkill  = 80
			LeatherCraftingSkill  = 80
			PosionSkill  = 80
			BoneCraftingSkill  = 80
			StoneCraftingSkill  = 80
			SneakingSkill  = 80
			LockPickingSkill = 80
			JewlCraftingSkill = 80
			CookingSkill  = 80
			FishingSkill  = 80
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
			LeftEyeHP = 150

			WingHP = 150

			RightEyeHP = 150

			RightLungHP = 150

			LeftLungHP = 150

			SpleenHP = 150

			TeethHP = 150

			LeftArmHP = 150

			RightArmHP = 150

			LeftLegHP = 150

			RightLegHP = 150

			HeadHP = 150

			LeftEarHP = 150

			RightEarHP = 150

			GutsHP = 150

			StomachHP = 150

			LeftKidneyHP = 150

			RightKidneyHP = 150

			LiverHP = 150

			BrainHP = 150

			HeartHP = 150

			ThroatHP = 150

			NoseHP = 150

			LeftArmMaxHP = 150

			RightArmMaxHP = 150

			LeftLegMaxHP = 150

			RightLegMaxHP = 150
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
						if(m.Tree == 1)
							if(src.HoldingWeapon == "Axe")
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
													var/obj/Items/woods/wood/MET4 = new
													MET4.loc = S
													MET4.suffix = "(Carrying)"
													S.weight += MET4.weight
													var/obj/Items/woods/wood/MET3 = new
													MET3.loc = S
													MET3.suffix = "(Carrying)"
													S.weight += MET3.weight
													var/obj/Items/woods/wood/MET2 = new
													MET2.loc = S
													MET2.suffix = "(Carrying)"
													S.weight += MET2.weight
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
										var/obj/Items/woods/wood/MET4 = new
										MET4.loc = src.loc
										var/obj/Items/woods/wood/MET = new
										MET.loc = src.loc
										var/obj/Items/woods/wood/MET2 = new
										MET2.loc = src.loc
										var/obj/Items/woods/wood/MET3 = new
										MET3.loc = src.loc
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
									src.EXP += 0.3
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
									CI = prob(5)

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
									var/BUG3
									BUG3 = prob(2)
									if(BUG3 == 1)
										var/mob/Monsters/Mole/Mole = new
										Mole.loc = src.loc
										return
									E = prob(35)
									D = prob(1)
									EM = prob(0.5)
									R = prob(0.5)
									S = prob(70)
									var/G
									G = prob(5)
									var/BUG
									var/BUG2
									BUG2 = prob(2)
									if(BUG2 == 1)
										var/mob/Monsters/DeathBeatle/DB = new
										DB.loc = src.loc
										return
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
				var/M
				M = prob(100)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(60,60)
				usr.Agility = rand(60,60)
				usr.Defence = rand(60,60)
				usr.MAXHP = rand(5000,10000)
				usr.HP = usr.MAXHP
				Level()
				usr.DieAge = rand(1000,12500)
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		NPCGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			name = "{NPC} Goblin"
			density = 1
			weightmax = 100
			Goblin = 1
			Age = 18
			Humanoid = 1
			Carn = 1
			SpearSkill = 20

			Intelligent = 1
			DieAge = 100000000
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			NPC = 1
			UsesPosion = 1
			PosionSkill = 10
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			Owner = "{NPC Goblin}"
			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)

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
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(12,14)
				usr.Agility = rand(12,15)
				usr.Defence = rand(6,7)
				usr.MAXHP = rand(75,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				WalkTo()
				ReturnHome()
				NPCAttack()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Wagon == 0)
						M.destination = src
		NPCKobold
			icon = 'Kobold.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Kobold = 1

			HoldingWeapon = "Spear"
			Humanoid = 1
			Carn = 1
			SpearSkill = 20
			Intelligent = 1
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			UsesPosion = 1
			PosionSkill = 10
			SkinningSkill = 10
			HumanParts = 1
			BoneCraftingSkill = 20
			ButcherySkill = 10
			CanBeSlaved = 1
			BloodContent = 200
			MaxBloodContent = 200
			UnArmedSkill = 10
			Owner = "{NPC Kobold}"
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

			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
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
			New()
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,7)
				usr.Defence = rand(5,7)
				usr.MAXHP = 100
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCKoboldName()
				usr.name = "{NPC} Kobold [usr.name]"
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		FrogMan
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			FrogMan = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			Carn = 1
			Intelligent = 1
			CanBeSlaved = 1
			ButcherySkill = 10
			SneakingSkill = 20
			SpecialUnit = 1
			SkinningSkill = 10
			UsesPosion = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			ImmunePosion = 1
			UnArmedSkill = 10
			Owner = "{NPC FrogMen}"
			FishingSkill= 50
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

			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
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
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
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
								var/G
								G = prob(5)
								var/BUG
								BUG = prob(2)
								var/SIL
								SIL = prob(5)
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
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
			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} FrogMan"
				WalkTo()
				Bleeding()
				FrogResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		FrogManChieftain
			icon = 'FrogMan.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			FrogMan = 1
			MineingSkill = 10
			WoodCuttingSkill = 10
			Humanoid = 1
			Carn = 1
			Intelligent = 1
			CanBeSlaved = 1
			SneakingSkill = 40
			SpecialUnit = 1
			UsesPosion = 1
			HumanParts = 1
			ButcherySkill = 10
			SkinningSkill = 10
			BloodContent = 200
			MaxBloodContent = 200
			ImmunePosion = 1
			UnArmedSkill = 10
			Owner = "{NPC FrogMen}"
			FishingSkill = 50
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

			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
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
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
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
								var/G
								G = prob(5)
								var/BUG
								BUG = prob(2)
								var/SIL
								SIL = prob(5)
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
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
			New()
				var/M
				M = prob(50)
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
				usr.Strength = rand(10,17)
				usr.Agility = rand(10,20)
				usr.Defence = rand(10,20)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(120,150)
				usr.name = "{NPC} FrogManChieftain"
				WalkTo()
				Bleeding()
				FrogResetTarget()
				RandomWalk()
				usr.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
				usr.overlays += /obj/Items/Armours/Legs/BoneLeggings/
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		SkeletonLord
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			ImmunePosion = 1
			Fling = 1
			HoldingWeapon = "Sword"
			Carn = 1
			HP = 400
			Race = "Skeleton"
			SpecialUnit = 1
			Intelligent = 1
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 10
			Owner = "{NPC Undead}"

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
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
								var/G
								G = prob(5)
								var/BUG
								BUG = prob(2)
								var/SIL
								SIL = prob(5)
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
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
			New()
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = rand(10,20)
				usr.WeaponDamageMin = 25
				usr.WeaponDamageMax = 35
				usr.MAXHP = 75
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} SkeletonLord"
				WalkTo()
				ResetTarget()
				RanWalk()
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		SkeletonWarrior
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			Fling = 1
			Carn = 1
			SpecialUnit = 1
			Intelligent = 1
			Race = "Skeleton"
			ImmunePosion = 1
			HP = 300
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 30
			Owner = "{NPC Undead}"

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)
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
								var/G
								G = prob(5)
								var/BUG
								BUG = prob(2)
								var/SIL
								SIL = prob(5)
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
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
			New()
				usr.Strength = rand(10,15)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.WeaponDamageMin = 15
				usr.WeaponDamageMax = 25
				usr.MAXHP = 75
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} SkeletonWarrior"
				WalkTo()
				ResetTarget()
				RanWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star
		StrayGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

			Humanoid = 1
			Carn = 1
			CanBeSlaved = 1
			Intelligent = 1
			SneakingSkill = 20
			UsesPosion = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			SpearSkill = 10
			HoldingWeapon = "Spear"
			Owner = "{NPC Goblin}"
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
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)

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
			New()
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon = 'FemaleGoblin.dmi'
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCGoblinName()
				WalkTo()
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star

