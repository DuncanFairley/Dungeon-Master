mob
	WorkShops
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