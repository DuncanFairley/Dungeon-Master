mob
	WorkShops
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
