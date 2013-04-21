mob
	WorkShops
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