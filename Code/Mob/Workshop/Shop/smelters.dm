mob
	WorkShops
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