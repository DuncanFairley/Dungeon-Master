mob
	WorkShops
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