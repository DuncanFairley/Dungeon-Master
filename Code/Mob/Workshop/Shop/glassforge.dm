mob
	WorkShops
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