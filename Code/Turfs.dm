/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/

turf
	MouseDrag(src)
		var/turf/S = src
		if(isturf(src))
			if(usr.Function == "PlaceWoodenOrcBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodOrcBridge"
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "PlaceStoneBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/ores/stone/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									S.density = 0
									S.CanFish = 0
									S.isbridge = 1
									S.name = null
									S.Detailed = 1
									S.Cant = 1
									if(S.CaveWater == 1)
										S.CaveWater = 0
									S.icon = 'Cave.dmi'
									S.icon_state = "Bridge"
									M.weight -= W.weight
									del(W)
									break
							if(S.Content3 == "Lava")
								if(S.isbridge == 0)
									S.density = 0
									S.isbridge = 1
									S.Cant = 1
									S.name = null
									S.icon = 'Cave.dmi'
									S.icon_state = "LavaBridge"
									M.weight -= W.weight
									del(W)
									break
			if(usr.Function == "PlaceSilkBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Content3 == "Liquid")
							if(S.isbridge == 0)
								if(M.WebContent >= 25)
									if(M.Spider == 1)
										if(S.isbridge == 0)
											S.density = 0
											S.CanFish = 0
											S.name = null
											S.isbridge = 1
											S.icon = 'Spiders.dmi'
											S.icon_state = "Silk Bride"
											M.WebContent -= 25
			if(usr.Function == "PlaceBoneBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/Bones/Bones/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Goblin == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.Detailed = 1
										S.name = null
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "BoneBridge"
										M.weight -= W.weight
										del(W)
										break
									if(M.Kobold == 1)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "BoneBridge"
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "PlaceTribalBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.LizardMan == 1)
										S.density = 0
										S.CanFish = 0
										S.isbridge = 1
										S.name = null
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "TribalBridge"
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "PlaceWoodenBridge")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						for(var/obj/Items/woods/wood/W in M)
							if(S.Content3 == "Liquid")
								if(S.isbridge == 0)
									if(M.Kobold == 0)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.Detailed = 1
										S.Cant = 1
										if(S.CaveWater == 1)
											S.CaveWater = 0
										S.icon = 'Cave.dmi'
										S.icon_state = "WoodBridge"
										M.weight -= W.weight
										del(W)
										break
			if(usr.Function == "DestroyFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(S.Detailed == 1)
								if(S.isbridge == 1)
									if(S.GoesTo)
										usr << "No floor to destroy"
										return
									else
										S.CanFish = 1
										S.density = 1
										S.Detailed = 0
										S.isbridge = 0
										S.name = null
										S.IsWood = 0
										if(S.Content == "Swamp")
											S.icon = 'Swamp.dmi'
											S.icon_state = "water"
											S.name = "Swamp"
										if(S.icon_state == "LavaBridge")
											S.icon_state = "Lava"
											S.name = "Magma"
											S.CanFish = 0
										if(S.Content == "Water")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
										if(S.Content == "CaveWater")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.name = "Water"
											S.CaveWater = 1
										return
								if(S.isbridge == 0)
									S.icon_state = "DFloor"
									S.name = "Floor"
									S.density = 0
									S.name = null
									S.Detailed = 0
									S.IsWood = 0
									if(S.Content3 == "Peak")
										S.icon = 'Cave.dmi'
										S.icon_state = "Peak"
										S.name = "MountainPeak"
										S.density = 0
										S.Detailed = 0
									if(S.Content == "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = "Sky"
										S.name = "Sky"
										S.density = 0
										S.Detailed = 0
									if(S.z == 1)
										var/obj/Support/Q = new
										Q.loc = locate(S.x,S.y,3)
										for(var/turf/T in view(0,Q))
											if(T.Supported == 1)
												T.Supported = 0
												M.Owner << "Not Supported"
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
									return
			if(usr.Function == "PlaceOrcFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.Race == "Orc")
												S.icon_state = "OrcFloor"
												S.name = "OrcFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 1
												S.name = null
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "OrcFloor"
													S.name = "OrcFloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
										M.weight -= W.weight
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										del(W)
										break
			if(usr.Function == "PlaceStoneFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								for(var/obj/Items/ores/stone/St in M)
									if(S.icon_state != "Sky")
										if(S.density == 0)
											S.icon_state = "DetailedFloor"
											S.name = "DetailedFloor"
											S.density = 0
											S.Detailed = 1
											S.name = null
											if(S.z == 1)
												var/obj/Support/Q = new
												Q.loc = locate(S.x,S.y,3)
												for(var/turf/T in view(0,Q))
													if(T.Supported == 0)
														T.Supported = 1

												del(Q)
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon_state = "DetailedFloor"
												S.name = "DetailedFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
									M.weight -= St.weight
									M.StoneCraftingSkill += 0.5
									M.BuildingSkill += 0.5
									del(St)
									break
			if(usr.Function == "PlaceTribalFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.LizardMan == 1)
												S.icon_state = "Tribal"
												S.name = "WoodenFloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "Tribal"
													S.name = "WoodenFloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
										M.weight -= W.weight
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										del(W)
										break
			if(usr.Function == "PlaceBoneFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/Bones/Bones/B in M)
										if(S.icon_state != "Sky")
											if(M.Goblin == 1)
												S.icon_state = "BoneFloor"
												S.name = "BoneFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Kobold == 1)
												S.icon_state = "BoneFloor"
												S.name = "BoneFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Vampire == 1)
												S.icon_state = "BoneFloor"
												S.name = "BoneFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "BoneFloor"
													S.name = "BoneFloor"
													S.density = 0
													S.name = null
													S.Detailed = 1
										M.weight -= B.weight
										M.BoneCraftingSkill += 0.5
										M.BuildingSkill += 0.5
										del(B)
										break
			if(usr.Function == "PlaceWoodenFloor")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.Detailed == 0)
							if(S.isbridge == 0)
								if(S.density == 0)
									for(var/obj/Items/woods/wood/W in M)
										if(S.icon_state != "Sky")
											if(M.Human == 1)
												S.icon_state = "WoodFloor"
												S.name = "WoodFloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.IsWood = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
											if(M.Dwarf == 1)
												S.icon_state = "WoodFloor"
												S.name = "WoodFloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												if(S.z == 1)
													var/obj/Support/Q = new
													Q.loc = locate(S.x,S.y,3)
													for(var/turf/T in view(0,Q))
														if(T.Supported == 0)
															T.Supported = 1

													del(Q)
										if(S.icon_state == "Sky")
											if(S.density == 0)
												if(S.Supported == 1)
													S.icon_state = "WoodFloor"
													S.name = "WoodFloor"
													S.density = 0
													S.Detailed = 1
													S.name = null
													S.IsWood = 1
										M.weight -= W.weight
										M.Carpentry += 0.5
										M.BuildingSkill += 0.5
										del(W)
										break
			if(usr.Function == "PlaceBoneWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Bones/Bones/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Kobold == 1)
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.name = null
										S.opacity = 1
										S.IsWall = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Goblin == 1)
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.name = null
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.opacity = 1
										S.IsWall = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Vampire == 1)
										S.icon_state = "Bone Wall"
										S.name = "Bone Wall"
										S.HP += 1500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.name = null
										S.CanDigAt = 1
										M.BoneCraftingSkill += 0.3
										S.density = 1
										S.opacity = 1
										S.IsWall = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "Bone Wall"
											S.name = "Bone Wall"
											S.HP += 1500
											S.name = null
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.BoneCraftingSkill += 0.3
											S.density = 1
											S.opacity = 1
											S.IsWall = 1
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceSilkWall")
				for(var/mob/Monsters/M in usr.Selected)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									if(S.icon_state != "Sky")
										S.icon = 'Cave.dmi'
										S.icon_state = "SilkWall"
										S.name = "SilkWall"
										S.density = 1
										S.HP = 1000
										S.HP += M.BuildingSkill
										S.name = null
										M.BuildingSkill += 1
										S.IsWall = 1
										S.IsWood = 1
										M.WebContent -= 25
										S.CanDigAt = 1
										S.opacity = 1
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
									if(S.icon_state == "Sky")
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon = 'Cave.dmi'
												S.icon_state = "SilkWall"
												S.name = "SilkWall"
												S.density = 1
												S.HP = 1000
												S.name = null
												S.IsWood = 1
												S.HP += M.BuildingSkill
												M.BuildingSkill += 1
												S.IsWall = 1
												M.WebContent -= 25
												S.CanDigAt = 1
												S.opacity = 1

			if(usr.Function == "PlaceOrcWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Race == "Orc")
										S.icon_state = "OrcWall"
										S.name = "OrcWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.name = null
										M.weight -= S.weight
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "OrcWall"
											S.name = "OrcWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.name = null
											S.CanDigAt = 1
											M.weight -= S.weight
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWood = 1
											S.IsWall = 1
											S.opacity = 1
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceTribalWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.LizardMan == 1)
										S.icon_state = "TribalWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.name = null
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										S.Detailed = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "TribalWall"
											S.name = "WoodWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											S.name = null
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.IsWood = 1
											S.opacity = 1
											S.Detailed = 1
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceSecretWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									S.icon_state = "CaveWall"
									S.name = "SecretWall"
									S.HP += 1000
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.CanDigAt = 1
									M.StoneCraftingSkill += 1
									S.density = 1
									S.IsWall = 1
									S.opacity = 1
									S.name = null
									S.Detailed = 1
									M.weight -= W.weight
									if(S.z == 1)
										var/obj/Support/Q = new
										Q.loc = locate(S.x,S.y,3)
										for(var/turf/T in view(0,Q))
											if(T.Supported == 0)
												T.Supported = 1

										del(Q)
									del(W)
									break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "CaveWall"
											S.name = "SecretWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.Detailed = 1
											S.name = null
											M.weight -= W.weight
											del(W)
											break
			if(usr.Function == "PlaceStoneWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/ores/stone/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1)
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.name = null
										S.IsWall = 1
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Dwarf == 1)
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.name = null
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Goblin == 1)
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.name = null
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Vampire == 1)
										S.icon_state = "DetailedWall"
										S.name = "DetailedWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.name = null
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "DetailedWall"
											S.name = "DetailedWall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.name = null
											S.opacity = 1
											M.weight -= W.weight
											del(W)
											break

			if(usr.Function == "PlaceWoodenWall")
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						M.destination = null
						if(M in range(1,S))
							if(S.density == 0)
								if(S.icon_state != "Sky")
									if(M.Human == 1)
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.name = null
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWood = 1
										S.IsWall = 1
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break
									if(M.Dwarf == 1)
										S.icon_state = "WoodWall"
										S.name = "WoodWall"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.IsWood = 1
										S.name = null
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										M.weight -= W.weight
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1

											del(Q)
										del(W)
										break

								if(S.icon_state == "Sky")
									if(S.density == 0)
										if(S.Supported == 1)
											S.icon_state = "WoodWall"
											S.name = "WoodWall"
											S.HP += 1000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											S.name = null
											S.IsWood = 1
											M.WoodCraftingSkill += 0.3
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											M.weight -= W.weight
											del(W)
											break
									else
										usr << "Your race can not build this!"




obj
	HUD
		icon = 'HUD2.dmi'
		layer = MOB_LAYER+10
		name = ""
		New(client/C)
			C.screen += src
			..()

		BottomRight
			icon_state = "BR"
		BottomLeft
			icon_state = "BL"
		TopRight
			icon_state = "TR"
		TopLeft
			icon_state = "TL"
		TopMiddle
			icon_state = "TM"
		BottomMiddle
			icon_state = "BM"
		LeftMiddle
			icon_state = "LM"
		RightMiddle
			icon_state = "RM"
		Middle
			icon_state = "M"
		Middle2
			icon_state = "M2"
		Text
			icon = 'txt.dmi'
		ClickDetail
			icon_state = "DetailedWall"
			DblClick()
				usr.Detail()
				usr.Up = 0
				usr.Close()

		ClickDestroy
			icon_state = "Dest"
			DblClick()
				usr.Function = "DestroyFloor"
				usr << "Click and drag to destroy floor<br>"
				usr.Close()

		Dec
			icon_state = "Dec"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/W in view(0,M))
						if(W.density == 0)
							if(M.Spider == 1)
								if(M.WebContent >= 25)
									var/D
									D = prob(50)
									if(D == 1)
										W.overlays += 'Decoration1.dmi'
									else
										W.overlays += 'Decoration2.dmi'
									M.WebContent -= 25
									break
									usr.Up = 0
									usr.Close()
									return
					usr.Up = 0
					usr.Close()
		B
			icon_state = "B"
			DblClick()
				usr.Function = "PlaceSilkBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		Cacoon
			icon_state = "Cacoon"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.WebContent >= 50)
						var/obj/Items/Traps/Cages/Cacoon/C = new
						C.loc = M.loc
						C.desc = "This is a cacoon, it is used by spiders to in-trap victims."
						M.WebContent -= 50
						usr.Up = 0
						usr.Close()
						return
					usr.Up = 0
					usr.Close()
		Post
			icon_state = "Post"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						if(M.Spider == 1)
							if(M.WebContent >= 75)
								var/obj/Items/Furniture/Posts/SilkTrainingPost/P = new
								P.loc = M.loc
								M.WebContent -= 75
								M.weight -= W.weight
								if(M.WoodCraftingSkill >= 90)
									P.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill >= 100)
									P.CraftRank = "Legendary Quality"
								if(M.WoodCraftingSkill <= 90)
									P.CraftRank = "Epic Quality"
								if(M.WoodCraftingSkill <= 75)
									P.CraftRank = "Masterful Quality"
								if(M.WoodCraftingSkill <= 60)
									P.CraftRank = "Grand Quality"
								if(M.WoodCraftingSkill <= 50)
									P.CraftRank = "Impressive Quality"
								if(M.WoodCraftingSkill <= 40)
									P.CraftRank = "Quality"
								if(M.WoodCraftingSkill <= 30)
									P.CraftRank = "Average Quality"
								if(M.WoodCraftingSkill <= 20)
									P.CraftRank = "Poor Quality"
								P.HP = 999999999999999999999
								M.WoodCraftingSkill += 2
								P.TrainCraft()
								del(W)
								usr.Up = 0
								usr.Close()
								break
								return
					usr.Up = 0
					usr.Close()
		SilkWall
			icon_state = "Silk"
			DblClick()
				usr.Function = "PlaceSilkWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		Lair
			icon_state = "Silk"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.CanBreed == 1)
						if(M.Spider == 0)
							usr.Up = 0
							usr.Close()
							return
						if(M.WebContent >= 200)
							M.WebContent -= 200
							M.LaysAdvancedEggs = 1
							for(var/turf/T in view(2,M))
								if(T.density == 0)
									T.icon = 'Cave.dmi'
									T.icon_state = "SilkWall"
									T.Detailed = 1
					usr.Up = 0
					usr.Close()
		Walls
			icon_state = "Walls"
			DblClick()
				usr.Walls()
		Floors
			icon_state = "Floors"
			DblClick()
				usr.Floors()
		Bridges
			icon_state = "Bridge"
			DblClick()
				usr.Bridge()
		SpiderTrap
			icon_state = "Trap"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
						usr.Up = 0
						usr.Close()
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
							usr.Up = 0
							usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							return
						if(M.WebContent >= 50)
							M.CreatePit()
							M.WebContent -= 50
							break
							usr.Up = 0
							usr.Close()

		Traps
			icon_state = "Trap"
			DblClick()
				usr.Traps()
		ClickBoneAlarm
			icon_state = "BoneAlarm"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a bone alarm trap, when an ememy walks over it, you will be alerted their position.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 1)
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							for(var/obj/Items/Bones/Bones/W in M)
								M.CreateBoneAlarm()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		ClickBSTTrap
			icon_state = "BST"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a rib spike trap, it will hurt anyone who walks over it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 1)
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							for(var/obj/Items/Bones/Bones/W in M)
								M.CreateBST()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		ClickRibTrap
			icon_state = "RibTrap"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a rib trap, it will crush anyone who walks into it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 1)
							for(var/obj/Items/Traps/LW in view(0,M))
								usr << "Too close to other trap!"
								usr.Up = 0
								usr.Close()
								return
							for(var/obj/Items/Bones/Bones/W in M)
								M.CreateRib()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		ClickStoneFall
			icon_state = "StoneFall"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a stone fall trap, it will fall on anyone who nears it.")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							view() << "[M] Dis-armed trap"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/StoneTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							usr.Up = 0
							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateStone()
							M.weight -= W.weight
							del(W)
							break
					usr.Up = 0
					usr.Close()
		ClickTraps
			icon_state = "Trap"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "CoverPit"
				menu10 += "Disarm Trap"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a pit trap, nothing can fall into it until  it is covered, pit traps capture live creatures, you can combine a wooden spike with it to make the trap less friendly, or even add some posion to it")
					usr.Up = 0
					usr.Close()
					return
				if (Result10 == "CoverPit")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/T in view(0,M))
							T.icon = null
							T.Hole = 1
					usr.Up = 0
					usr.Close()
				if (Result10 == "Disarm Trap")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/T in view(0,M))
							del(T)
							usr << "Dis-armed"
					usr.Up = 0
					usr.Close()
				if (Result10 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/Items/Traps/PitTrap/LW in view(0,M))
							usr << "Too close to other trap!"
							usr.Up = 0
							usr.Close()
							return
						if(M.LizardMan == 0)
							for(var/obj/Items/ores/stone/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
						if(M.LizardMan == 1)
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		Stairs
			icon_state = "Stairs"
			DblClick()
				usr.Stairs()
		ClickStair2
			icon_state = "BambooStairs"
			DblClick()
				for(var/mob/Monsters/A in usr.Selected)
					var/list/menu13 = new()
					for(var/obj/Items/woods/wood/s in A)
						menu13 += "Down"
						menu13 += "Up"
					menu13 += "Cancel"
					var/Result13 = input("What Action Will You Choose?", "Choose", null) in menu13
					if (Result13 != "Cancel")
						..()
					if (Result13 == "Up")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/woods/wood/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Sky == 1)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs2"
													W.Detailed = 1
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,3)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,1)
															usr.loc = M.loc
															return
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,1)

												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 1)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs2"
													W.Detailed = 1
													W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,W.z-1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,M.z+1)
															usr.loc = M.loc
															return
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z+1)

												M.weight -= S.weight
												del(S)
						usr.Close()
					if (Result13 == "Down")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/woods/wood/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Content3 == "Peak")
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs"
												W.GoesTo = locate(W.x,W.y,1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs2"
															W2.Detailed = 1
															W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,3)
												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 0)
											if(W.GoesTo == null)
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "BambooStairs"
												W.GoesTo = locate(W.x,W.y,W.z+1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "BambooStairs2"
															W2.Detailed = 1
															W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
												M.weight -= S.weight
												del(S)
						usr.Close()
		ClickStair
			icon_state = "Stairs"
			DblClick()
				for(var/mob/Monsters/A in usr.Selected)
					var/list/menu13 = new()
					for(var/obj/Items/ores/stone/s in A)
						menu13 += "Down"
						menu13 += "Up"
					menu13 += "Cancel"
					var/Result13 = input("What Action Will You Choose?", "Choose", null) in menu13
					if (Result13 != "Cancel")
						..()
					if (Result13 == "Up")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/ores/stone/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Sky == 1)
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.Race == "Orc")
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Race != "Orc")
															W.icon = 'Cave.dmi'
															W.icon_state = "Up"
															W.Detailed = 1
															W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,3)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,1)
															usr.loc = M.loc
															return
														if(M.Kobold == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Stairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,1)

												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 1)
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.Race == "Orc")
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "KoboldUp"
													W.Detailed = 1
													W.isbridge = 1
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Race != "Orc")
															W.icon = 'Cave.dmi'
															W.icon_state = "Up"
															W.Detailed = 1
															W.isbridge = 1
												W.GoesTo = locate(W.x,W.y,W.z-1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(W2.Detailed == 1)
															M.Owner << "You cant make stairs through a solid floor!"
															W.GoesTo = null
															M.loc = locate(M.x,M.y,M.z+1)
															usr.loc = M.loc
															return
														if(M.Kobold == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 1)
															W2.overlays += /obj/Hole/
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Stairs"
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.Detailed = 1
														W2.isbridge = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z+1)

												M.weight -= S.weight
												del(S)
						usr.Close()
					if (Result13 == "Down")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/obj/Items/ores/stone/S in M)
								for(var/turf/W in view(0,M))
									if(W.density == 0)
										if(W.Content3 == "Peak")
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.overlays += /obj/Hole/
												if(M.LizardMan == 1)
													W.overlays += /obj/Hole/
												if(M.Vampire == 1)
													if(night == 0)
													else
														W.icon = 'Cave.dmi'
														W.icon_state = "Stairs"
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Vampire == 0)
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
												W.GoesTo = locate(W.x,W.y,1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.Kobold == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Up"
																W2.Detailed = 1
																W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,3)
												M.weight -= S.weight
												del(S)
									if(W.density == 0)
										if(W.Cant == 0)
											if(W.GoesTo == null)
												if(M.Kobold == 1)
													W.overlays += /obj/Hole/
												if(M.LizardMan == 1)
													W.overlays += /obj/Hole/
												if(M.Vampire == 1)
													W.icon = 'Cave.dmi'
													W.icon_state = "Stairs"
												if(M.LizardMan == 0)
													if(M.Kobold == 0)
														if(M.Vampire == 0)
															W.icon = 'Cave.dmi'
															W.icon_state = "Stairs"
												W.GoesTo = locate(W.x,W.y,W.z+1)
												for(var/mob/Monsters/Wagon/E in view(1,M))
													E.loc = W.GoesTo
												M.loc = W.GoesTo
												usr.loc = M.loc
												for(var/turf/grounds/W2 in view(0,M))
													if(W2.GoesTo == null)
														if(M.Kobold == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 1)
															W2.icon = 'Cave.dmi'
															W2.icon_state = "KoboldUp"
															W2.Detailed = 1
															W2.isbridge = 1
														if(M.LizardMan == 0)
															if(M.Kobold == 0)
																W2.icon = 'Cave.dmi'
																W2.icon_state = "Up"
																W2.Detailed = 1
																W2.isbridge = 1
														W2.density = 0
														W2.CanDigAt = 0
														W2.opacity = 0
														W2.isbridge = 1
														W2.Detailed = 1
														W2.Cant = 1
														W2.GoesTo = locate(W2.x,W2.y,W2.z-1)
												M.weight -= S.weight
												del(S)
						usr.Close()
		Stations
			icon_state = "Station"
			DblClick()
				usr.Stations()
		ClickFarm
			icon_state = "Farming"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/Shafts/Spade/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.icon_state == "Grass")
								W.icon = 'Cave.dmi'
								W.icon_state = "FarmLand"
								W.name = "FarmLand"
								W.Detailed = 1
					for(var/obj/Items/Shafts/WoodenSpade/S in M)
						for(var/turf/grounds/W in view(1,M))
							if(W.icon_state == "Grass")
								W.icon = 'Cave.dmi'
								W.icon_state = "FarmLand"
								W.name = "FarmLand"
								W.Detailed = 1
					usr.Close()
		Farming
			icon_state = "Farming"
			DblClick()
				usr.FarmLand()
		ClickTribalBridge
			icon_state = "TribalBridge"
			DblClick()
				usr.Function = "PlaceTribalBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickBoneBridge
			icon_state = "BoneBridge"
			DblClick()
				usr.Function = "PlaceBoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodBridge
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodOrcBridge
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenOrcBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickStoneBridge
			icon_state = "Bridge"
			DblClick()
				usr.Function = "PlaceStoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickSecretWall
			icon_state = "Secret"
			DblClick()
				usr.Function = "PlaceSecretWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickTribalWall
			icon_state = "TribalWall"
			DblClick()
				usr.Function = "PlaceTribalWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickOrcWall
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceOrcWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickWoodWall
			icon_state = "Walls"
			DblClick()
				usr.Function = "PlaceWoodenWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickStoneWall
			icon_state = "StoneWalls"
			DblClick()
				usr.Function = "PlaceStoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickBoneWall
			icon_state = "BoneWall"
			DblClick()
				usr.Function = "PlaceBoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()

		ClickOrcFloor
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceOrcFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickWoodFloor
			icon_state = "Floors"
			DblClick()
				usr.Function = "PlaceWoodenFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()

		ClickFire
			icon_state = "Fire"
			DblClick()
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a camp fire, it can be used to cook with, it will also provide heat during winter.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							var/mob/WorkShops/CampFires/Fire/F = new
							F.loc = M.loc
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickGem
			icon_state = "Gem"
			DblClick()
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a gem crafting station, it can be used to craft un-cut gems into something more intresting")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Kobold == 0)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/ores/stone/W in M)
								M.CreateGem()
								M.weight -= W.weight
								del(W)
								break
					usr.Close()
		ClickMelt
			icon_state = "Melt"
			DblClick()
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a melter station, it can be used to destroy un-used items.")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMelter()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickMas
			icon_state = "Mas"
			DblClick()
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a masonary station, it can be used to make stone items and statues")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateMasonary()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickLet
			icon_state = "Let"
			DblClick()
				var/list/menu3 = new()
				menu3 += "Create"
				menu3 += "Info"
				menu3 += "Cancel"
				var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
				if (Result3 != "Cancel")
					..()
				if (Result3 == "Info")
					alert("This is a leather crafting station, it can be used to make leather armour, sheets and clothes")
					return
				if (Result3 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateWorkShopLeather()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickKit
			icon_state = "Kit"
			DblClick()
				var/list/menu11 = new()
				menu11 += "Create"
				menu11 += "Info"
				menu11 += "Cancel"
				var/Result11 = input("What Action Will You Choose?", "Choose", null) in menu11
				if (Result11 != "Cancel")
					..()
				if (Result11 == "Info")
					alert("This is a kitchen, take un-cooked meat here to cook it.")
					return
				if (Result11 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.Carn == 0)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/woods/wood/W in M)
								M.CreateKit()
								M.weight -= W.weight
								del(W)
								break
						else
							usr << "That race does not need to cook food!"
					usr.Close()
		ClickBone
			icon_state = "Bone"
			DblClick()
				for(var/mob/Monsters/M2 in usr.Selected)
					if(M2.MakesBoneCraft == 1)
						var/list/menu7 = new()
						menu7 += "Create"
						menu7+= "Info"
						menu7 += "Cancel"
						var/Result7 = input("What Action Will You Choose?", "Choose", null) in menu7
						if (Result7 != "Cancel")
							..()
						if (Result7 == "Info")
							alert("This is a Bone crafting station, it can be used to create bone crafts, weapons and armours")
							usr.Close()
							return
						if (Result7 == "Create")
							for(var/mob/Monsters/M in usr.Selected)
								for(var/mob/WorkShops/LW in view(1,M))

									return
								for(var/obj/Items/woods/wood/W in M)
									M.CreateBone()
									M.weight -= W.weight
									del(W)
									break
							usr.Close()
		ClickGlass
			icon_state = "Glass"
			DblClick()
				for(var/mob/Monsters/S in usr.Selected)
					var/list/menu3 = new()
					if(S.Goblin == 1)
						menu3 += "Create"
					if(S.Human == 1)
						menu3 += "Create"
					menu3 += "Info"
					menu3 += "Cancel"
					var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
					if (Result3 != "Cancel")
						..()
					if (Result3 == "Info")
						alert("This is a glass forge, it can be used to create items from glass.")
						return
					if (Result3 == "Create")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/ores/stone/W in M)
								M.CreateGlass()
								M.weight -= W.weight
								del(W)
								break
						usr.Close()
		ClickSmelt
			icon_state = "Smelt"
			DblClick()
				var/list/menu5 = new()
				menu5 += "Create"
				menu5 += "Info"
				menu5 += "Cancel"
				var/Result5 = input("What Action Will You Choose?", "Choose", null) in menu5
				if (Result5 != "Cancel")
					..()
				if (Result5 == "Info")
					alert("This is a smelter  station, it can be used to create Ingots for armour and weapon creation")
					return
				if (Result5 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateSmelter()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickForge
			icon_state = "Forge"
			DblClick()
				var/list/menu6 = new()
				menu6 += "Create"
				menu6+= "Info"
				menu6 += "Cancel"
				var/Result6 = input("What Action Will You Choose?", "Choose", null) in menu6
				if (Result6 != "Cancel")
					..()
				if (Result6 == "Info")
					alert("This is a forge  station, it can be used to create armour and weapons")
					return
				if (Result6 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/ores/stone/W in M)
							M.CreateForge()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickCarp
			icon_state = "Carp"
			DblClick()
				var/list/menu4 = new()
				menu4 += "Create"
				menu4 += "Info"
				menu4 += "Cancel"
				var/Result4 = input("What Action Will You Choose?", "Choose", null) in menu4
				if (Result4 != "Cancel")
					..()
				if (Result4 == "Info")
					alert("This is a carpentry crafting station, it can be used to make lots of items from wood")
					return
				if (Result4 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))

							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreateCarpentry()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickPotion
			icon_state = "Potion"
			DblClick()
				for(var/mob/Monsters/S in usr.Selected)
					var/list/menu3 = new()
					if(S.Human == 1)
						menu3 += "Create"
					if(S.Goblin == 1)
						menu3 += "Create"
					menu3 += "Info"
					menu3 += "Cancel"
					var/Result3 = input("What Action Will You Choose?", "Choose", null) in menu3
					if (Result3 != "Cancel")
						..()
					if (Result3 == "Info")
						alert("This is a potion station, it can be used to make various potions.")
						return
					if (Result3 == "Create")
						for(var/mob/Monsters/M in usr.Selected)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePotion()
								M.weight -= W.weight
								del(W)
								break
						usr.Close()
		ClickPos
			icon_state = "Pos"
			DblClick()
				var/list/menu8 = new()
				menu8 += "Create"
				menu8+= "Info"
				menu8 += "Cancel"
				var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
				if (Result8 != "Cancel")
					..()
				if (Result8 == "Info")
					alert("This is a posion extraction station, it can be used to extract posion from glands")
					return
				if (Result8 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						if(M.UsesPosion == 1)
							for(var/mob/WorkShops/LW in view(1,M))

								usr.Close()
								return
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePosion()
								M.weight -= W.weight
								del(W)
								break
					usr.Close()
		ClickStoneFloor
			icon_state = "StoneFloor"
			DblClick()
				usr.Function = "PlaceStoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickTribalFloor
			icon_state = "Tribal"
			DblClick()
				usr.Function = "PlaceTribalFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickBoneFloor
			icon_state = "BoneFloor"
			DblClick()
				usr.Function = "PlaceBoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()





turf
	grounds


		Entered()
			if(usr)
				if(src.Content3 == "Liquid")
					usr.OnFire = 0
					usr.IsWood = 0
					usr.Fuel = 100
					usr.Safe()
				if(src.icon_state == "water")
					if(src.CaveWater == 0)
						if(src.Detailed == 0)
							if(usr.Vampire == 1)
								if(night == 0)
									if(usr.DayWalker == 0)
										usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
										usr.HP -= 50
										usr.SunLight()
										if(usr)
											if(usr.HP <= 0)
												usr.Freeze = 1
												spawn(2)
													usr.GoingToDie = 1
													usr.Killer = "The Sun"
													usr.DeathType = "Burned To Death"
													usr.Death()
												return
				if(src.icon_state == "Peak")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
				if(src.icon_state == "Sky")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
				if(src.icon_state == "Grass")
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
				if(src.icon_state == "Marsh")
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 0.5
								if(usr.LizardMan == 1)
									usr.Coldness -= 0
								else
									usr.Coldness -= 0.3
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
					if(usr.Coldness <= -100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "The heat damages [usr]"
								usr.HP -= 50
								if(usr.Race == "Demon")
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										usr.GoingToDie = 1
										usr.Killer = "The Sun"
										usr.DeathType = "Heat Stroke"
										usr.Death()
									return
				if(src.icon_state == "HellFloor")
					if(usr.Undead == 0)
						if(usr.Vampire == 0)
							if(usr.Kobold == 1)
								usr.Coldness -= 1.5
							if(usr.LizardMan == 1)
								usr.Coldness -= 0.6
							if(usr.Race == "Orc")
								usr.Coldness -= 1
							if(usr.LizardMan == 0)
								if(usr.Kobold == 0)
									if(usr.Race != "Orc")
										usr.Coldness -= 1
				if(src.icon_state == "Desert")
					if(night == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.Kobold == 1)
									usr.Coldness -= 1
								if(usr.LizardMan == 1)
									usr.Coldness -= 0.3
								if(usr.Race == "Orc")
									usr.Coldness -= 0.8
								if(usr.LizardMan == 0)
									if(usr.Kobold == 0)
										if(usr.Race != "Orc")
											usr.Coldness -= 0.5
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
					if(usr.Coldness <= -100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "The heat damages [usr]"
								usr.HP -= 50
								if(usr.Race == "Demon")
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										usr.GoingToDie = 1
										usr.Killer = "The Sun"
										usr.DeathType = "Heat Stroke"
										usr.Death()
									return

				if(src.icon_state == "Snow")
					if(usr.OnFire == 0)
						if(usr.Undead == 0)
							if(usr.Vampire == 0)
								if(usr.WearingChest == 1)
									usr.Coldness += 0.1
								if(usr.WearingChest == 0)
									if(usr.Kobold == 1)
										usr.Coldness += 0.1
									if(usr.LizardMan == 1)
										usr.Coldness += 0.8
									if(usr.Dwarf == 1)
										usr.Coldness += 0.1
									if(usr.Race == "Orc")
										usr.Coldness += 0.1
									if(usr.Wolf == 1)
										usr.Coldness += 0.1
									if(usr.NPC == 1)
										usr.Coldness += 0.1
									if(usr.Kobold == 0)
										if(usr.Dwarf == 0)
											if(usr.Race != "Orc")
												usr.Coldness += 0.5
					if(usr.Coldness >= 100)
						if(usr.User == 0)
							if(usr.Wagon == 0)
								usr.destination = null
								usr.Owner << "[usr] starts to get frost bite!"
								usr.HP -=50
								if(usr.Race == "Demon")
									..()
								if(usr.HP <= 0)
									usr.Freeze = 1
									spawn(2)
										if(usr)
											usr.GoingToDie = 1
											usr.Killer = "The Cold"
											usr.DeathType = "Froze To Death"
											usr.Death()
									return
					if(src.Detailed == 0)
						if(usr.Vampire == 1)
							if(night == 0)
								if(usr.DayWalker == 0)
									usr.Owner << "<b><font color=red> [usr] walks into the light and is burned badly!!"
									usr.HP -= 50
									usr.SunLight()
									if(usr)
										if(usr.HP <= 0)
											usr.Freeze = 1
											spawn(2)
												usr.GoingToDie = 1
												usr.Killer = "The Sun"
												usr.DeathType = "Burned To Death"
												usr.Death()
											return
				if(src.icon_state == "Bridge")
					if(usr.Vampire == 1)
						if(usr.density == 1)
							usr.Owner << "<b><font color=red> [usr] walks near some water and takes damage!!"
							usr.HP -= 50
							usr.destination = null
							if(usr.HP <= 0)
								usr.Freeze = 1
								spawn(2)
									usr.GoingToDie = 1
									usr.Killer = "Water"
									usr.DeathType = "Melting Into Goo"
									usr.Death()
								return
				if(src.icon_state == "BoneFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "Tribal")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "WoodFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "DetailedFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.icon_state == "DFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.CanDigAt == 0)
					usr.Underground = 1
				if(src.icon_state == "CaveFloor")
					usr.SunSafe = 1
					usr.Coldness -= 1
					if(usr.Coldness <= 0)
						usr.Coldness = 0
				if(src.CanDigAt == 0)
					usr.Underground = 1
				if(src.icon_state == "water")
					if(src.CaveWater == 0)
						if(src.IsCave == 1)
							usr.Underground = 0
							usr.SunSafe = 0
				if(src.icon_state == "Desert")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
				if(src.icon_state == "Snow")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
				if(src.icon_state == "Grass")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
						usr.Coldness -= 1
						if(usr.Coldness <= 0)
							usr.Coldness = 0
				if(src.icon_state == "Marsh")
					if(src.IsCave == 1)
						usr.Underground = 0
						usr.SunSafe = 0
						usr.Coldness -= 1
						if(usr.Coldness <= 0)
							usr.Coldness = 0
				if(src.Cant == 1)
					..()
				if(src.GoesTo)
					usr.loc = src.GoesTo
					for(var/mob/M in view(1,src))
						if(M.Using == usr)
							M.loc = usr.loc

					for(var/mob/Monsters/Wagon/M in view(1,src))
						M.loc = src.GoesTo
					for(var/mob/Monsters/M in view(1,src))
						if(M.Tame == 1)
							M.loc = src.GoesTo
					usr.destination = null




		desert
			icon = 'Cave.dmi'
			icon_state = "Desert"
			PermSnow = 1
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Desert"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner




			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)

		snow
			icon = 'Cave.dmi'
			icon_state = "Snow"
			PermSnow = 1
			Content3 = "CanClimb"
			OIcon = "Snow"
			Sky = 1
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)

							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner


			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)



		marsh
			icon = 'Cave.dmi'
			icon_state = "Marsh"
			Sky = 1
			Content = "Marsh"
			Content3 = "CanClimb"
			OIcon = "Marsh"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			New()
				var/P = rand(1,16)
				if(P == 1)
					src.icon_state = "Marsh"
				if(P == 2)
					src.icon_state = "Tropical1"
				if(P == 3)
					src.icon_state = "Tropical2"
				if(P == 4)
					src.icon_state = "Tropical3"
				if(P == 5)
					src.icon_state = "Marsh"
				if(P == 6)
					src.icon_state = "Tropical4"
				if(P == 7)
					src.icon_state = "Marsh"
				if(P == 8)
					src.icon_state = "Marsh"
				if(P == 9)
					src.icon_state = "Marsh"
				if(P == 10)
					src.icon_state = "Marsh"
				if(P == 11)
					src.icon_state = "Marsh"
				if(P == 12)
					src.icon_state = "Marsh"
				if(P == 13)
					src.icon_state = "Marsh"
				if(P == 14)
					src.icon_state = "Marsh"
				if(P == 15)
					src.icon_state = "Marsh"
				if(P == 16)
					src.icon_state = "Tropical5"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)
		grass
			icon = 'Cave.dmi'
			icon_state = "Grass"
			Sky = 1
			Content3 = "CanClimb"
			OIcon = "Grass"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)




		cavefloor2
			icon = 'Cave.dmi'
			icon_state = "CaveFloor"
			CanDigAt = 0
			Sky = 1
			Entered()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 1
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
		NPCWindows
			icon = 'Cave.dmi'
			icon_state = "NPCWindow"
			density = 1
			CanDigAt = 1
			HP = 400
		NPCWindows2
			icon = 'Cave.dmi'
			icon_state = "NPCWindow2"
			density = 1
			CanDigAt = 1
			HP = 400
		WoodWall
			icon = 'Cave.dmi'
			icon_state = "WoodWall"
			density = 1
			IsWood = 1
			CanDigAt = 1
			IsWall = 1
			HP = 8000
			OIcon = "Grass"
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)
		DetailedFloor
			icon = 'Cave.dmi'
			icon_state = "DetailedFloor"
			CanDigAt = 0
		Stairs
			Down
				TombStairsDown
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(805,790,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsDown2
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(904,787,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsDown3
					icon = 'Cave.dmi'
					icon_state = "Dark"
					CanDigAt = 0
					Detailed = 1
					layer = 0
					Entered(mob/m)
						m.loc = locate(979,788,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				JailStairsDown
					icon = 'Cave.dmi'
					icon_state = "Stairs"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						for(var/mob/M in world)
							if(M == m.Owner)
								if(M.GM == 1)
									m.loc = locate(459,813,2)
									m.destination = null
									for(var/mob/D in view(1,src))
										if(m.Owner == D)
											D.loc = m.loc
				GoblinStairsDown
					icon = 'Cave.dmi'
					icon_state = "Stairs"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(832,221,2)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc

			Up
				TombStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(805,789,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsUp2
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(904,787,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				TombStairsUp3
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(979,788,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				GoblinStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						m.loc = locate(832,221,1)
						m.destination = null
						for(var/mob/D in view(1,src))
							if(m.Owner == D)
								D.loc = m.loc
				JailStairsUp
					icon = 'Cave.dmi'
					icon_state = "Up"
					CanDigAt = 0
					Detailed = 1
					Entered(mob/m)
						for(var/mob/M in world)
							if(M == m.Owner)
								if(M.GM == 1)
									m.loc = locate(459,813,1)
									m.destination = null
									for(var/mob/D in view(1,src))
										if(m.Owner == D)
											D.loc = m.loc
		cellarfloor
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			IsCave = 1
			Cant = 1
			OIcon = "CaveFloor"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							M.DigTarget = null
							del(D)

							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M


			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)

		NoDig
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			HP = 1000000
			opacity = 1
			Cant = 0
			Sky = 1
		hellfloor
			icon = 'Cave.dmi'
			icon_state = "HellFloor"
			Cant = 1
			OIcon = "HellFloor"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in src)
						if(D.Owner == M.Owner)
							M.destination = null
							M.DigTarget = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M.Owner

			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return

				return(1)
		hellcliff
			icon = 'Cave.dmi'
			icon_state = "HellCliff"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			Cant = 1
			IsCave = 1
			OIcon = "CaveFloor"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M

			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0

		cavefloor
			icon = 'Cave.dmi'
			icon_state = "CaveWall"
			density = 1
			CanDigAt = 1
			HP = 100
			opacity = 1
			Cant = 0
			Sky = 1
			IsCave = 1
			OIcon = "CaveFloor"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/DigAt/D in view(0,src))
						if(D.Owner == M)
							M.destination = null
							del(D)
							return

					if(src.density == 1)
						if(M.Dig == 1)
							M.destination = null
							var/obj/DigAt/D2 = new
							D2.loc = locate(src.x,src.y,src.z)
							D2.Owner = M

			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)
			Exited()
				if(usr)
					if(usr.IsBodyPart == 0)
						usr.Underground = 0



		DetailedWall2
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			HP = 300000
			IsWall = 1
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)


		Tomb
			icon = 'Tomb.png'
			density = 1
			opacity = 0
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)

		OrcWall
			icon = 'Cave.dmi'
			icon_state = "OrcWall"
			density = 1
			CanDigAt = 1
			IsWall = 1
			HP = 3000000
			OIcon = "Snow"
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)
		DetailedWall
			icon = 'Cave.dmi'
			icon_state = "DetailedWall"
			density = 1
			CanDigAt = 1
			IsWall = 1
			HP = 3000000
			opacity = 1
			Enter(atom/m)
				if(m.AMMode == 0)
					if(m.User == 1)
						return(1)
				if(m.IsMist == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							if(m.density == 1)
								return
				else
					return
				return(1)
		WoodFloor
			icon = 'Cave.dmi'
			IsWood = 1
			icon_state = "WoodFloor"
			OIcon = "Grass"
		Chasm
			name = "Chasm"
			icon = 'Cave.dmi'
			icon_state = "Chasm"
			Content = "Chasm"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				else
					if(m.density == 0)
						return(1)
					else
						var/F = prob(33)
						if(F)
							m.Owner << "[m] falls down a large chasm!<br>"
							view() << "[m] falls down a large chasm!<br>"
							del(m)
						else
							m.Owner << "[m] almost falls down a chasm!<br>"
							view() << "[m] almost falls down a chasm!<br>"
						return
		Sky
			icon = 'Cave.dmi'
			icon_state = "Sky"
			Content3 = "Peak"
			Content = "Sky"
			OIcon = "Sky"
			Enter(atom/m)
				if(m.User == 1)
					return(1)
				if(src.density == 0)
					for(var/atom/M in src)
						if(M.density == 1)
							return
					if(src.Detailed)
						return(1)
					if(ismob(m))
						var/mob/A = m
						if(A.density == 1)
							var/LL = prob(50)
							if(LL == 1)
								if(A.HasLeftLeg == 1)
									A.LeftLegHP = 10
									A.LeftLeg  = "Mangled"
									A.BloodContent -= 25
									A.BloodLoss()
									view(A) << "<b><font color=red>[A] falls and mangles their left leg!<br>"
									if(A.RightLegHP <= 10)
										A.CanWalk = 0
							var/RL = prob(50)
							if(RL == 1)
								if(A.HasRightLeg == 1)
									A.RightLegHP = 10
									A.RightLeg  = "Mangled"
									A.BloodContent -= 25
									A.BloodLoss()
									view(A) << "<b><font color=red>[A] falls and mangles their right leg!<br>"
									if(A.LeftLegHP <= 10)
										A.CanWalk = 0
							A.loc = locate(src.x,src.y,1)
							if(RL == 1)
								view(A) << "<b><font color=red>[A] falls and mangles their right leg!<br>"
							if(LL == 1)
								view(A) << "<b><font color=red>[A] falls and mangles their left leg!<br>"

						else
							return(1)
					if(isobj(m))
						var/obj/O = m
						if(O.density == 1)
							O.loc = locate(src.x,src.y,1)
						else
							return(1)
		MountainPeak
			icon = 'Cave.dmi'
			icon_state = "Peak"
			Content3 = "Peak"
			OIcon = "Peak"
		OrcFloor
			icon = 'Cave.dmi'
			icon_state = "OrcFloor"
			OIcon = "Snow"
		lavas
			Content3 = "Lava"
			lava
				name = "Magma"
				icon = 'Lava.dmi'
				icon_state = "Lava"
				density = 1
				Cant = 1
				Content = "Lava"

		Trees
			density = 1
			layer = 4
			opacity = 1
			HP = 250
			Sky = 1
			name = "Tree"

			Tree1
				icon = 'plants.dmi'
				icon_state = "tree 2x1"
				Tree = 1
				IsWood = 1
				OIcon = "Grass"
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
					src.overlays += /obj/Trees/leaves3x2
					src.overlays += /obj/Trees/leaves2x2
					src.overlays += /obj/Trees/leaves1x2
					src.overlays += /obj/Trees/leaves1x1
					src.overlays += /obj/Trees/leaves2x1
					src.overlays += /obj/Trees/leaves3x1
					src.density = 1
					src.icon = 'plants.dmi'
					src.icon_state = "tree 2x1"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			TundraTree
				icon = 'plants.dmi'
				icon_state = "PermSnow"
				Tree = 1
				Content3 = "PermTree"
				OIcon = "Snow"
				IsWood = 1
				New()
					src.overlays += /obj/Trees/tree2x2
					src.overlays += /obj/Trees/tree1x2
					src.overlays += /obj/Trees/tree3x2
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Bamboo
				icon = 'Cave.dmi'
				icon_state = "Bamboo"
				Tree = 1
				Bamboo = 1
				name = "Bamboo"
				Content = "Marsh"
				IsWood = 1
				OIcon = "Marsh"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Cactus
				icon = 'Cave.dmi'
				icon_state = "Cactus"
				Tree = 1
				Cactus = 1
				name = "Cactus"
				OIcon = "Desert"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						for(var/obj/DigAt/D in view(0,src))
							if(D.Owner == M)
								M.destination = null
								del(D)
								return

						if(src.density == 1)
							if(M.Dig == 1)
								M.destination = null
								var/obj/DigAt/D2 = new
								D2.loc = locate(src.x,src.y,src.z)
								D2.Owner = M
			Tree2
				icon = 'Trees.dmi'
				icon_state = "1"
			Tree3
				icon = 'Trees.dmi'
				icon_state = "1"
		DesertWater
			Content3 = "Liquid"
			icon = 'water.dmi'
			icon_state = "water"
			density = 1
			CanFish = 1
			Detailed = 1
			OIcon = "water"

		waters
			Content3 = "Liquid"
			swamp
				name = "Swamp"
				icon = 'Swamp.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				Detailed = 1
				Content = "Swamp"
				OIcon = "Swamp"


			water
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				Detailed = 1
				Content = "Water"
				OIcon = "water"

			underwater
				icon = 'water.dmi'
				icon_state = "water"
				density = 1
				CanFish = 1
				CaveWater = 1
				Detailed = 1
				Content = "CaveWater"
				OIcon = "water"


obj/proc/Delete()
	spawn(750)
	del(src)
obj
	Support

	night
		icon = 'Night.dmi'
		layer = 5



	Hole
		icon = 'Cave.dmi'
		icon_state = "Hole2"
	preg
		icon = 'Cave.dmi'
		icon_state = "preg"
	SkornBase
	Portal
		layer = 5
		Content = 4
		icon = 'Cave.dmi'
		icon_state = "Portal"
	PermPortal1
		name = "Portal"
		layer = 5
		Content = 4
		icon = 'Cave.dmi'
		icon_state = "Portal"
		New()
			Portal()
	PermPortal2
		name = "Portal"
		layer = 5
		Content = 1
		icon = 'Cave.dmi'
		icon_state = "Portal"
		New()
			Portal()
	Crown
		icon = 'Cave.dmi'
		icon_state = "Crown"
	Crypt
		icon = 'Cave.dmi'
		icon_state = "Tomb"
		density = 1
	Deadness
		icon = 'Cave.dmi'
		icon_state = "Deadness"
		name = "Human Corpse"

	Deadness2
		icon = 'Cave.dmi'
		icon_state = "Deadness2"
		name = "Human Corpse"
	WingsVampire
		icon = 'Wings.dmi'
		icon_state = "Wings"
	WSoverlays
		Forge
			icon = 'buildings.dmi'
			icon_state = "Forge"
			layer = 5
		Smelter
			icon = 'buildings.dmi'
			icon_state = "Smelter"
			layer = 5
		Carpentry
			icon = 'buildings.dmi'
			icon_state = "Carpenters"
			layer = 5
		Masonary
			icon = 'buildings.dmi'
			icon_state = "Masonry"
			layer = 5
		Posion
			icon = 'buildings.dmi'
			icon_state = "Poison"
			layer = 5
		Bone
			icon = 'buildings.dmi'
			icon_state = "Bonecraft"
			layer = 5
		Leather
			icon = 'buildings.dmi'
			icon_state = "Leather"
			layer = 5
		Kitchen
			icon = 'buildings.dmi'
			icon_state = "Kitchen"
			layer = 5
		Gem
			icon = 'buildings.dmi'
			icon_state = "Gem"
			layer = 5
	PermBloods
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"

		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"

		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"

		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"

		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"

	Bloods

		DevourerRight
			icon = 'Devourer.dmi'
			icon_state = "Right"
		DevourerRightTop
			icon = 'Devourer.dmi'
			icon_state = "RightTop"
		DevourerLeftTop
			icon = 'Devourer.dmi'
			icon_state = "LeftTop"
		Zombie
			icon = 'Blood.dmi'
			icon_state = "Zombie"
			layer = 5
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			New()
				Delete()
		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			New()
				Delete()
		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			New()
				Delete()
		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			New()
				Delete()
		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			New()
				Delete()
		Blood5
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "5"
			New()
				Delete()

	Attacks
		Spears
			MetalSpear
				icon = 'Spear.dmi'
				icon_state = "Attack"
	Items
		layer = 4

		Skins
			New()
				ItemDecay()
			IsSkin = 1
			FrogManSkin
				icon = 'Cave.dmi'
				icon_state = "FrogSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of frog man skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			HumanSkinBlack
				icon = 'Cave.dmi'
				icon_state = "SkinBlack"
				weight = 10
				name = "Human Skin"
				suffix = null
				desc = "This is a peice of human skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			HumanSkin
				icon = 'Cave.dmi'
				icon_state = "HumanSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of human skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DwarfSkin
				icon = 'Cave.dmi'
				icon_state = "HumanSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of dwarf skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GoblinSkin
				icon = 'Cave.dmi'
				icon_state = "GoblinSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of goblin skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			VampireSkin
				icon = 'Cave.dmi'
				icon_state = "VampireSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of vampire skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			WolfFur
				icon = 'Cave.dmi'
				icon_state = "WolfSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of wolf fur, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			KoboldSkin
				icon = 'Cave.dmi'
				icon_state = "KoboldSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of kobold skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			SpiderSkin
				icon = 'Cave.dmi'
				icon_state = "WolfSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of spider skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			MoleSkin
				icon = 'Cave.dmi'
				icon_state = "DeerSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of mole skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			LizardSkin
				icon = 'Cave.dmi'
				icon_state = "LizardSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of lizard skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DemonSkin
				icon = 'Cave.dmi'
				icon_state = "DemonSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of demon skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GremlinSkin
				icon = 'Cave.dmi'
				icon_state = "GremlinSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of gremlin skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			OrcSkin
				icon = 'Cave.dmi'
				icon_state = "OrcSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of orc skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DeerSkin
				icon = 'Cave.dmi'
				icon_state = "DeerSkin"
				weight = 10
				suffix = null
				desc = "This is a peice of deer skin, it can be used for creating leather armour and clothes"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return


		Bridge
			icon = 'Cave.dmi'
			icon_state = "Bridge"
			weight = 0
			suffix = null
			layer = 4
		GemOverlays
			Ruby
				RubyChest
					icon = 'GemItems.dmi'
					icon_state = "RubyChest"

		Silks
			SpiderSilk

				icon = 'Spiders.dmi'
				icon_state = "Silk"
				weight = 10
				suffix = null
				desc = "This is spider silk, it is supprisingly strong and very rare."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Armours
			Shields
				SilverBuckler
					icon = 'SilverItems.dmi'
					icon_state = "Silver Buckler"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/SilverBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				GoldBuckler
					icon = 'GoldItems.dmi'
					icon_state = "Gold Buckler"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/GoldBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				MetalBuckler
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Buckler"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/MetalBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				ChitinBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Buckler"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/ChitinBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				BoneBuckler
					icon = 'BoneItems.dmi'
					icon_state = "Bone Buckler"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/BoneBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
				WoodenBuckler
					icon = 'GoblinBuckler.dmi'
					icon_state = "poor"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.WearingShield = 0
										M.overlays -= /obj/Items/Armours/Shields/WoodenBuckler/
										src.suffix = null
										M.weight -= src.weight
										M.Defence -= src.Defence
										return
			Legs


				LeatherLeggings
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeggings"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/LeatherLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/LeatherLeggings/

											else
												usr << "Not enough skill to use!"
				SilverLeggings
					icon = 'SilverItems.dmi'
					icon_state = "Silver Leggings"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SilverLeggings/

											else
												usr << "Not enough skill to use!"
				RubyMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalRubyLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/RubyMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubyMetalLeggings/

											else
												usr << "Not enough skill to use!"
				RubySilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverRubyLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/RubySilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubySilverLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldMetalLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldSilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldSilverLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondMetalLeggings
					icon = 'GemItems.dmi'
					icon_state = "MetalDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondMetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondMetalLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondSilverLeggings
					icon = 'GemItems.dmi'
					icon_state = "SilverDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondSilverLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondSilverLeggings/

											else
												usr << "Not enough skill to use!"
				DiamondGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldDiamondLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/DiamondGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/DiamondGoldLeggings/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldEmeraldLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/EmeraldGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/EmeraldGoldLeggings/

											else
												usr << "Not enough skill to use!"
				RubyGoldLeggings
					icon = 'GemItems.dmi'
					icon_state = "GoldRubyLeggings"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/RubyGoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/RubyGoldLeggings/

											else
												usr << "Not enough skill to use!"
				GoldLeggings
					icon = 'GoldItems.dmi'
					icon_state = "Gold Leggings"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/GoldLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/GoldLeggings/

											else
												usr << "Not enough skill to use!"
				MetalLeggings
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Leggings"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/MetalLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/MetalLeggings/

											else
												usr << "Not enough skill to use!"
				ChitinLeggings
					icon = 'BoneItems.dmi'
					icon_state = "ChitinLeggings"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)
								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/ChitinLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/ChitinLeggings/

											else
												usr << "Not enough skill to use!"
				SkornLeggings
					icon = 'SkornArmour.dmi'
					icon_state = "SLegs"
					weight = 10
					suffix = null
					name = "Skorn Leggings - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of hundreds, its defence is godly, its craftmanship un-holy, it is made from an unknown material and was forged by demons."
					New()
						Defence = rand(15,20)
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/SkornLeggings/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/SkornLeggings/

											else
												usr << "Not enough skill to use!"
				BoneLeggings
					icon = 'BoneItems.dmi'
					icon_state = "BoneLeggings"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)
								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLegs = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Legs/BoneLeggings/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingLegs == 0)
													if(M.CanWalk == 1)
														var/obj/A = src
														M.WearingLegs = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/Legs/BoneLeggings/
														M.WeaponDamageMin += src.WeaponDamageMin
														M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
			RightArms


				GoldRightGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GRightArm"
					weight = 7
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/GoldRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/GoldRightGauntlet/

												else
													usr << "Not enough skill to use!"
				ChitinRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CRightArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/ChitinRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/ChitinRightGauntlet/

												else
													usr << "Not enough skill to use!"

				LeatherRightGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherRight"
					weight = 2
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/LeatherRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/LeatherRightGauntlet/

												else
													usr << "Not enough skill to use!"
				BoneRightGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BRightArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/BoneRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/BoneRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SilverRightGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverRight"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SilverRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SilverRightGauntlet/

												else
													usr << "Not enough skill to use!"
				MetalRightGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MRightArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/MetalRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/MetalRightGauntlet/

												else
													usr << "Not enough skill to use!"
				SkornRightGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SRightArm"
					name = "Skorn Gauntlet - UnHoly"
					weight = 5
					suffix = null
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(10,15)
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingRightArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/RightArms/SkornRightGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasRightArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingRightArm == 0)
														if(M.HasRightArm == 1)
															var/obj/A = src
															M.WearingRightArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/RightArms/SkornRightGauntlet/

												else
													usr << "Not enough skill to use!"
			LeftArms


				GoldLeftGauntlet
					icon = 'GoldItems.dmi'
					icon_state = "GLeftArm"
					weight = 7
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/GoldLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/GoldLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				ChitinLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "CLeftArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/ChitinLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/ChitinLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				BoneLeftGauntlet
					icon = 'BoneItems.dmi'
					icon_state = "BLeftArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/BoneLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/BoneLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				LeatherLeftGauntlet
					icon = 'LeatherItems.dmi'
					icon_state = "LeatherLeft"
					weight = 2
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/LeatherLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/LeatherLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SilverLeftGauntlet
					icon = 'SilverItems.dmi'
					icon_state = "SilverLeft"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SilverLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SilverLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				MetalLeftGauntlet
					icon = 'MetalObjects.dmi'
					icon_state = "MLeftArm"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/MetalLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/MetalLeftGauntlet/

												else
													usr << "Not enough skill to use!"
				SkornLeftGauntlet
					icon = 'SkornArmour.dmi'
					icon_state = "SLeftArm"
					weight = 5
					suffix = null
					name = "Skorn Gauntlet - UnHoly"
					layer = 4
					desc = "This armour was soaked in the blood of many, its craftmanship is un-holy and its defence godly, it is made out of an unknown material and was forged by demons."
					New()
						Defence = rand(10,15)
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingLeftArm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/LeftArms/SkornLeftGauntlet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.HasLeftArm == 1)
												if(M.ArmourSkill >= src.Skill)
													if(M.WearingLeftArm == 0)
														if(M.HasLeftArm == 1)
															var/obj/A = src
															M.WearingLeftArm = 1
															A.loc = M
															A.suffix = "(Equiped)"
															M.Defence += A.Defence
															M.overlays += /obj/Items/Armours/LeftArms/SkornLeftGauntlet/

												else
													usr << "Not enough skill to use!"
			Back


				LeatherQuiver
					icon = 'Quiver.dmi'
					name = "Leather Quiver"
					weight = 5
					dir = SOUTH
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							if(src)
								M.destination = null
								if(src in M)

									if(M.Wagon == 0)


										var/obj/A15= src
										A15.loc = M
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "CheckContents"
										menu += "DropContents"
										menu += "Equip"
										menu += "Un-Equip"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result != "Cancel")
											..()
										if (Result == "Inspect")
											usr << src.desc
										if (Result == "CheckContents")
											usr << "This quiver has [src.Content] Arrows in it<br>"
										if (Result == "Drop")
											if(src.suffix == "(Carrying)")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = null
												M.weight -= A1.weight
												if(A1.Content3 == 0)
													A1.DeleteItem()
												return
										if (Result == "DropContents")
											for(var/obj/Items/Arrows/A in src)
												A.loc = M.loc
												src.Content -= 1
										if (Result == "Un-Equip")
											if(src.suffix == "(Equiped)")
												var/obj/A2 = src
												M.WearingBack = 0
												A2.loc = M
												A2.dir = NORTH
												A2.suffix = "(Carrying)"
												M.overlays -= /obj/Items/Armours/Back/LeatherQuiver/
										if (Result == "Equip")
											if(src in M)
												if(M.ShieldSkill >= src.Skill)
													if(M.Crippled == 0)
														if(M.WearingBack == 0)
															var/obj/A = src
															M.WearingBack = 1
															A.dir = null
															A.loc = M
															A.suffix = "(Equiped)"
															M.overlays += /obj/Items/Armours/Back/LeatherQuiver/

													else
														usr << "[M] has crippled arms!"
												else
													usr << "Not enough skill to use!"
			ChestPlates


				LeatherChestPlate
					icon = 'LeatherItems.dmi'
					icon_state = "Leather ChestPlate"
					name = "Leather Top"
					weight = 5
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/LeatherChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/LeatherChestPlate/

											else
												usr << "Not enough skill to use!"

				SilverChestPlate
					icon = 'SilverItems.dmi'
					icon_state = "Silver ChestPlate"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SilverChestPlate/

											else
												usr << "Not enough skill to use!"
				GoldChestPlate
					icon = 'GoldItems.dmi'
					icon_state = "Gold ChestPlate"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/GoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/GoldChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestEmerald"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/EmeraldMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestEmerald"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/EmeraldSilverChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestDiamond"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondSilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestDiamond"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondSilverChestPlate/

											else
												usr << "Not enough skill to use!"
				DiamondGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestDiamond"
					weight = 30
					suffix = null
					layer = 4

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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(M.LeftArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(M.RightArmHP <= 40)
								M.Owner << "[M] cant interact with anything due to a damaged arm!!"
								return
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in view(1,M))
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													if(M.Wagon == 0)
														var/obj/A = src
														M.WearingChest = 1
														A.loc = M
														A.suffix = "(Equiped)"
														M.Defence += A.Defence
														M.overlays += /obj/Items/Armours/ChestPlates/DiamondGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestEmerald"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							src.destination = null
							if(src in M)

								if(src.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = src.loc
											A1.suffix = null
											src.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											src.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											src.overlays -= /obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/
											src.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(src.ArmourSkill >= src.Skill)
												if(src.WearingChest == 0)
													var/obj/A = src
													src.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													src.Defence += A.Defence
													src.overlays += /obj/Items/Armours/ChestPlates/EmeraldGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				RubyGoldChestPlate
					icon = 'GemItems.dmi'
					icon_state = "GoldChestRuby"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubyGoldChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubyGoldChestPlate/

											else
												usr << "Not enough skill to use!"
				RubySilverChestPlate
					icon = 'GemItems.dmi'
					icon_state = "SilverChestRuby"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubySilverChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubySilverChestPlate/

											else
												usr << "Not enough skill to use!"
												return
				RubyMetalChestPlate
					icon = 'GemItems.dmi'
					icon_state = "MetalChestRuby"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/RubyMetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/RubyMetalChestPlate/

											else
												usr << "Not enough skill to use!"
				MetalChestPlate
					icon = 'MetalObjects.dmi'
					icon_state = "Metal ChestPlate"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/MetalChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/



											else
												usr << "Not enough skill to use!"
				ChitinChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "ChitinChestPlate"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)


								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/ChitinChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/ChitinChestPlate/

											else
												usr << "Not enough skill to use!"
				SkornChestPlate
					icon = 'SkornArmour.dmi'
					icon_state = "SChest"
					weight = 10
					suffix = null
					name = "Skorn ChestPlate - UnHoly"
					layer = 4
					desc = "This armour is tainted with the blood of many, it is made from an unknown material, its defence is godly, its craftmanship is un-holy, it was forged by demons"
					New()
						Defence = rand(15,20)
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/SkornChestPlate/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/SkornChestPlate/

											else
												usr << "Not enough skill to use!"
				BoneChestPlate
					icon = 'BoneItems.dmi'
					icon_state = "Bone ChestPlate"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)


								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingChest = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/ChestPlates/BoneChestPlate/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingChest == 0)
													var/obj/A = src
													M.WearingChest = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/ChestPlates/BoneChestPlate/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
			NeckGuards
				GoldNeckGuard
					icon = 'GoldItems.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"
											else
												usr << "Not enough skill to use!"
				SilverNeckGuard
					icon = 'SilverItems.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"

											else
												usr << "Not enough skill to use!"
				MetalNeckGuard
					icon = 'MetalObjects.dmi'
					icon_state = "Guard"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"

									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingFullPlateHelm == 0)
													var/obj/A = src
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"


											else
												usr << "Not enough skill to use!"
			Helmets



				BoneCrown
					icon = 'RoyalItems.dmi'
					icon_state = "BoneCrown"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M)



									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

				Crown
					icon = 'GoldItems.dmi'
					icon_state = "Crown"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"

									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

				LeatherHelmet
					icon = 'LeatherItems.dmi'
					icon_state = "Leather Helmet"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/LeatherHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/LeatherHelmet/

											else
												usr << "Not enough skill to use!"
				SilverHelmet
					icon = 'SilverItems.dmi'
					icon_state = "Silver Helmet"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/SilverHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/SilverHelmet/

											else
												usr << "Not enough skill to use!"
				GoldHelmet
					icon = 'GoldItems.dmi'
					icon_state = "Gold Helmet"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/GoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/GoldHelmet/

											else
												usr << "Not enough skill to use!"
				DiamondMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Metal Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DiamondMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DiamondMetalHelmet/

											else
												usr << "Not enough skill to use!"
				EmeraldGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Gold Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/EmeraldGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/EmeraldGoldHelmet/

											else
												usr << "Not enough skill to use!"
				DiamondGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Diamond Gold Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)
								if(M.Wagon == 0)
									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/DiamondGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/DiamondGoldHelmet/

											else
										usr << "Not enough skill to use!"
				RubyGoldHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Gold Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/RubyGoldHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/RubyGoldHelmet/

											else
												usr << "Not enough skill to use!"
				EmeraldMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Emerald Metal Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/EmeraldMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/EmeraldMetalHelmet/

											else
												usr << "Not enough skill to use!"
				RubyMetalHelmet
					icon = 'GemItems.dmi'
					icon_state = "Ruby Metal Helmet"
					weight = 35
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/RubyMetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/RubyMetalHelmet/

											else
										usr << "Not enough skill to use!"
				MetalHelmet
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Helmet"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/MetalHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/MetalHelmet/

											else
												usr << "Not enough skill to use!"
				ChitinHelmet
					icon = 'BoneItems.dmi'
					icon_state = "ChitinHelmet"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/ChitinHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/ChitinHelmet/

											else
										usr << "Not enough skill to use!"
				SkornPlateHelmet
					icon = 'SkornArmour.dmi'
					icon_state = "SHelmet"
					weight = 10
					suffix = null
					name = "Skorn Plate Helmet - UnHoly"
					layer = 4
					desc = "This helmet is tainted with the death of hundreds, it is made out of an unknown material, its craftmanship is un-holy, its defence is godly. It was forged by demons."
					New()
						Defence = rand(15,20)
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											M.WearingFullPlateHelm = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/SkornPlateHelmet/
											M.Defence -= A2.Defence
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													M.WearingFullPlateHelm = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/SkornPlateHelmet/

											else
												usr << "Not enough skill to use!"
				BoneHelmet
					icon = 'Cave.dmi'
					icon_state = "Bone Helmet"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A16 = src
									A16.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Equip"
									menu += "Un-Equip"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											if(A1.Content3 == 0)
												A1.DeleteItem()
											return

									if (Result == "Un-Equip")
										if(src.suffix == "(Equiped)")
											var/obj/A2 = src
											M.WearingHelmet = 0
											A2.loc = M
											A2.suffix = "(Carrying)"
											M.overlays -= /obj/Items/Armours/Helmets/BoneHelmet/
											M.Defence -= A2.Defence
											M.WeaponDamageMin -= src.WeaponDamageMin
											M.WeaponDamageMax -= src.WeaponDamageMax
									if (Result == "Equip")
										if(src in M)
											if(M.ArmourSkill >= src.Skill)
												if(M.WearingHelmet == 0)
													var/obj/A = src
													M.WearingHelmet = 1
													A.loc = M
													A.suffix = "(Equiped)"
													M.Defence += A.Defence
													M.overlays += /obj/Items/Armours/Helmets/BoneHelmet/
													M.WeaponDamageMin += src.WeaponDamageMin
													M.WeaponDamageMax += src.WeaponDamageMax
											else
												usr << "Not enough skill to use!"
		Weapons


			Swords
				GoldGladius
					icon = 'GoldItems.dmi'
					icon_state = "Gold Gladius"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoldGladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Gladius
					icon = 'MetalObjects.dmi'
					icon_state = "Gladius"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/Gladius/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoldStraightSword
					icon = 'GoldItems.dmi'
					icon_state = "Gold Sword"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoldStraightSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				HellForgedSword
					icon = 'DemonicItems.dmi'
					icon_state = "HellSword"
					weight = 50
					suffix = null
					layer = 4
					New()
						CursedItem()
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/HellForgedSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				StraightSword
					icon = 'MetalObjects.dmi'
					icon_state = "Sword"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/StraightSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneSword
					icon = 'BoneItems.dmi'
					icon_state = "BoneSword"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/BoneSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoblinSword
					icon = 'GoblinSword.dmi'
					icon_state = "Swords"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Swords/GoblinSword/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Daggers
				GoldDagger
					icon = 'GoldItems.dmi'
					icon_state = "Gold Dagger"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Daggers/GoldDagger/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalDagger
					icon = 'Cave.dmi'
					icon_state = "Metal Dagger"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Daggers/MetalDagger/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Maces
				GoldMace
					icon = 'GoldItems.dmi'
					icon_state = "GoldMace"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/GoldMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				SkullMace
					icon = 'BoneItems.dmi'
					icon_state = "Bone Mace"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/SkullMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalMace
					icon = 'MetalObjects.dmi'
					icon_state = "Mace"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Maces/MetalMace/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Bows
				WoodenBow
					icon = 'WoodItems.dmi'
					icon_state = "WoodBow"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/WoodenBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalBow
					icon = 'MetalObjects.dmi'
					icon_state = "MetalBow"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/MetalBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneBow
					icon = 'BoneItems.dmi'
					icon_state = "BoneBow"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Bows/BoneBow/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Axes
				GoldAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Axe"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/GoldAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneAxe
					icon = 'BoneItems.dmi'
					icon_state = "BoneAxe"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/BoneAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalOrcAxe
					icon = 'MetalObjects.dmi'
					icon_state = "MetalOrcAxe"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/MetalOrcAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				MetalAxe
					icon = 'Cave.dmi'
					icon_state = "Axe"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Axes/MetalAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Picks
				GoldPickAxe
					icon = 'GoldItems.dmi'
					icon_state = "Gold Pick"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Picks/GoldPickAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				PickAxe
					icon = 'Cave.dmi'
					icon_state = "Metal Pick"
					weight = 25
					suffix = null
					layer = 4
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
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										M.HasPick = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Picks/PickAxe/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
			Spears
				SilverSpear
					icon = 'SilverItems.dmi'
					icon_state = "Silver Spear"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/SilverSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				GoldSpear
					icon = 'GoldItems.dmi'
					icon_state = "Gold Spear"
					weight = 30
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/GoldSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return

				MetalSpear
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Spear"
					weight = 25
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/MetalSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				ChitinSpear
					icon = 'BoneItems.dmi'
					icon_state = "Chitin Spear"
					weight = 10
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/ChitinSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				WoodenSpear
					icon = 'WoodItems.dmi'
					icon_state = "Wood Spear"
					weight = 15
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/WoodenSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				BoneSpear
					icon = 'BoneSpear.dmi'
					icon_state = "Poor"
					weight = 15
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.overlays -= /obj/Items/Weapons/Spears/BoneSpear/
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										return
				Spear
					icon = 'Spear.dmi'
					icon_state = "Poor"
					weight = 20
					suffix = null
					layer = 4
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
									if(src.suffix == "(Equiped)")
										src.loc = M.loc
										M.HoldingWeapon = 0
										src.suffix = null
										M.weight -= src.weight
										M.WeaponDamageMin -= src.WeaponDamageMin
										M.WeaponDamageMax -= src.WeaponDamageMax
										M.overlays -= /obj/Items/Weapons/Spears/Spear/
										return
		Traps
			IsTrap = 1
			Cages
				Content3 = "Cage"
				GoldCage
					icon = 'GoldItems.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a gold cage, it can be used to capture creatures in"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				MetalCage
					icon = 'MetalObjects.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a metal cage, it can be used to capture creatures in"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				Cacoon
					icon = 'Spiders.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				BoneCage
					icon = 'BoneItems.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				WoodenCage
					icon = 'Cave.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a wooden cage, it can be used to capture creatures in"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			PitTrap
				icon = 'Cave.dmi'
				icon_state = "Hole"
				CantKill = 1
				New()
					PitTrap()
			BST
				icon = 'Cave.dmi'
				icon_state = "BST"
				New()
					BSTTrap()
			BoneAlarm
				icon = 'Cave.dmi'
				icon_state = "BoneAlarm"
				New()
					AlarmTrap()
			RibTrap
				icon = 'Cave.dmi'
				icon_state = "RibTrap"
				New()
					RibTrap()
			StoneTrap
				icon = 'Cave.dmi'
				icon_state = "FallTrap"
				New()
					StoneTrap()
			Spikes
				WoodenSpike
					icon = 'Cave.dmi'
					icon_state = "Spike"
					weight = 5
					suffix = null
					desc = "This is a wooden spike, it can be combined with a pit to create a spike pit"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
		Shafts
			Twigs
				icon = 'Cave.dmi'
				icon_state = "Twigs"
				weight = 2
				suffix = null
				desc = "These are twigs, they can be used to create paper and other items."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										A1.dir = M.dir
										return
			Sign
				icon = 'Cave.dmi'
				icon_state = "sign"
				weight = 5
				suffix = null
				desc = "This is a sign post, use it to put warnings and other messages on."
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src.Placed == 0)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			MetalFlask
				icon = 'LeatherItems.dmi'
				icon_state = "Flask"
				weight = 5
				suffix = null
				desc = "This is a metal flask, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/waters/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										menu += "Drink"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 10
										V.BloodLoss()
										return
									src.Coldness = 0
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			WoodenBucket
				icon = 'WoodItems.dmi'
				icon_state = "Bucket"
				weight = 7
				suffix = null
				desc = "This is a wooden bucket, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/waters/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										menu += "Drink"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 20
										V.BloodLoss()
										V.Death()
										return
									src.Coldness = 0
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			LeatherFlask
				icon = 'LeatherItems.dmi'
				icon_state = "Flask"
				weight = 5
				suffix = null
				desc = "This is a leather flask, it can be useful in hot areas, be sure to fill it up with liquid though"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/atom/A in view(2,M))
									if(src.HasWater == "Water")
										if(A.OnFire == 1)
											menu += "Put Fire Out"
								for(var/obj/Bloods/B in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src] with blood"
								for(var/turf/grounds/waters/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Vampire == 1)
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										menu += "Drink"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Spray")
									for(var/mob/Monsters/Vampire/V in oview(1,M))
										src.HasWater = null
										view() << "[M] sprays [V] with water"
										V.BloodContent -= 20
										V.BloodLoss()
										V.Death()
										return
									src.Coldness = 0
								if (Result == "Put Fire Out")
									if(src.HasWater == "Water")
										for(var/atom/A2 in view(2,M))
											if(A2.OnFire == 1)
												A2.OnFire = 0
												A2.overlays -= 'Fire.dmi'
												A2.Fuel = 100
												A2.IsWood = 0
												A2.Safe()
								if (Result == "Drink")
									if(src.HasWater == "Water")
										src.HasWater = null
										M.Owner << "[M] drinks water from [src]"
										M.Coldness = 0
									if(M.Vampire == 1)
										if(src.HasWater == "Blood")
											src.HasWater = null
											M.Owner << "[M] drinks blood from [src]"
											if(M.Hunger >= 100)
												return
											M.Hunger += 20
								if (Result == "Empty [src]")
									src.HasWater = null
									M.Owner << "[M] empties [src]"
								if (Result == "Fill [src] with water")
									src.HasWater = "Water"
									M.Owner << "[M] fills [src] with water!"
								if (Result == "Fill [src] with blood")
									src.HasWater = "Blood"
									M.Owner << "[M] fills [src] with blood!"
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			LockPick
				icon = 'Cave.dmi'
				icon_state = "LockPick"
				weight = 5
				suffix = null
				desc = "This is a lockpick, it can be used to open locked doors and chests, it will break if you fail to lockpick an item"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			SpearHead
				icon = 'Cave.dmi'
				icon_state = "SpearHead"
				weight = 5
				suffix = null
				desc = "This is a spear head, it can be combined with a spear shaft to create a spear"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			WoodenSpade
				icon = 'Cave.dmi'
				icon_state = "Spade"
				weight = 5
				suffix = null
				desc = "This is a spade, it can be used to bury the dead or make farm land"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/obj/Items/Shafts/WoodenSpade/SP in M)
									for(var/turf/grounds/desert/D in view(0,M))
										menu += "Dig Up Sand"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Dig Up Sand")
									if(M.weight <= M.weightmax)
										var/obj/Items/ores/Sand/S = new
										S.loc = M
										S.suffix = "(Carrying)"
										M.weight += S.weight
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Spade
				icon = 'MetalObjects.dmi'
				icon_state = "Spade"
				weight = 7
				suffix = null
				desc = "This is a spade, it can be used to bury the dead or make farm land"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								for(var/obj/Items/Shafts/Spade/SP in M)
									for(var/turf/grounds/desert/D in view(0,M))
										menu += "Dig Up Sand"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Dig Up Sand")
									if(M.weight <= M.weightmax)
										var/obj/Items/ores/Sand/S = new
										S.loc = M
										S.suffix = "(Carrying)"
										M.weight += S.weight
										return
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			SpearShaft
				icon = 'Cave.dmi'
				icon_state = "Shaft"
				weight = 5
				suffix = null
				desc = "This is a spear shaft, it can be combined with a spear head to create a spear"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Ingots
			New()
				ItemDecay()
			SilverBar
				icon = 'Cave.dmi'
				icon_state = "SilverBar"
				weight = 20
				suffix = null
				desc = "This is a silver bar, it can be used to create armour and weapons as well as other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			GoldBar
				icon = 'Cave.dmi'
				icon_state = "GoldBar"
				weight = 20
				suffix = null
				desc = "This is a gold bar, it can be used to create armour and weapons as well as other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			MetalIngot
				icon = 'Cave.dmi'
				icon_state = "MetalIngot"
				weight = 20
				suffix = null
				desc = "This is a metal ingot, it can be used to create armour and weapons and other metal objects"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)

							if(M.Wagon == 0)


								var/obj/A5 = src
								A5.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
		Posions
			Toxic
				icon = 'Cave.dmi'
				icon_state = "Toxic"
				weight = 10
				suffix = null
				desc = "This is toxic, it can be used to add posion to weapons, traps and food, it can be used to even posion units in their sleep. It is more deadly than normal posion."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Posion
				icon = 'Cave.dmi'
				icon_state = "Posion"
				weight = 10
				suffix = null
				desc = "This is posion, it can be used to add posion to weapons, traps and food, it can be used to even posion unitd in their sleep."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Potions
			EmptyBottle
				IsEmpty = 1
				icon = 'Farm Items.dmi'
				icon_state = "Empty"
				name = "Empty Bottle"
				weight = 10
				suffix = null
				desc = "This is an empty bottle, it can be used for potion creation."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			LifePotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "RedPotion"
				name = "Potion of LongLife"
				weight = 10
				suffix = null
				desc = "This is a potion of long life, it will extend a units life time."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			VampirismCure
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "BluePotion"
				name = "Vampirism Cure"
				weight = 10
				suffix = null
				desc = "This is a potion of Cure, it will prevent a newly bitten victim form turning into a vampire."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			HealPotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "BluePotion"
				name = "Potion of Restoration"
				weight = 10
				suffix = null
				desc = "This is a potion of limb restoration, it will heal any lost limbs."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
		Arrows
			WoodenArrow
				//sticks in or caught in mid air
				icon = 'WoodItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a wooden arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(50)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePosion == 0)
										DMG += src.PosionContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											src.loc = L
											L.Content += 1
											return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			MetalArrow
				//sticks in or caught in mid air
				icon = 'MetalObjects.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a metal arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(50)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePosion == 0)
										DMG += src.PosionContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											src.loc = L
											L.Content += 1
											return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			SilverArrow
				//sticks in or caught in mid air
				icon = 'SilverItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a silver arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(50)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.Vampire == 1)
										DMG += rand(10,15)
									if(M.ImmunePosion == 0)
										DMG += src.PosionContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return

					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)


				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											src.loc = L
											L.Content += 1
											return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


			BoneArrow
				//sticks in or caught in mid air
				icon = 'BoneItems.dmi'
				icon_state = "Arrow"
				weight = 3
				suffix = null
				desc = "This is a bone arrow, its very sharp"
				Bump(atom/m)

					if(isobj(m))
						var/obj/O = m
						var/Break = prob(50)
						if(Break == 1)
							view(O) << "<b><font color=red>[src] breaks on [O]<br>"
							del(src)
							return
					if(ismob(m))
						var/mob/M = m
						if(M.Owner != src.Owner)
							if(M.WS == 0)
								var/Hit = 1
								var/Dodge = prob(m.Agility - src.BowSkill)
								var/Deflect
								if(M.HoldingWeapon == "Sword")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(M.HoldingWeapon == "Spear")
									var/D
									D += m.SwordSkill / 4
									D -= src.BowSkill / 2
									Deflect = prob(D)
								if(Deflect == 1)
									view(M) << "<b><font color=red>[M] deflects [src]!<br>"
									Hit = 0
								if(Dodge == 1)
									view(M) << "<b><font color=red>[M] Dodges [src]<br>"
									Hit = 0
									var/catch = prob(30)
									if(M.Crippled == 0)
										if(catch == 1)
											view(M) << "<b><font color=red>[M] catches [src] as it flies towards them<br>"
											src.loc = M
											M.weight += src.weight
											src.suffix = "(Carrying)"
								if(Hit == 1)
									view(M) << "<b><font color=red>[src] Hits [M]<br>"
									var/DMG = rand(15,20) +  src.BowSkill / 4
									if(M.ImmunePosion == 0)
										DMG += src.PosionContent / 5
									DMG -= M.Defence / 3
									if(DMG >= 50)
										DMG = 50
									if(DMG >= 0)
										M.BloodContent -= DMG
										M.BloodLoss()
										if(M.CanKill == 1)
											M.HP = 0
											M.GoingToDie = 1
											M.Death()
										if(M)
											var/Stick = prob(3)
											if(Stick == 1)
												view(M) << "<b><font color=red>[src] lodges itself into [M]<br>"
												src.loc = M
												M.weight += src.weight
												src.suffix = "(Stuck In)"
											else
												if(M)
													src.loc = m.loc
						else
							src.loc = M.loc
							return
					if(isturf(m))
						var/turf/T = m
						if(T.CanFish)
							src.loc = locate(T.x,T.y,T.z)
							return
						if(T.Content == "Lava")
							src.loc = locate(T.x,T.y,T.z)
							return
					src.BowSkill = 0
					src.density = 0
					src.Target = null
					walk(src,0)

				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Armours/Back/LeatherQuiver/L in M)
										if(L.suffix == "(Equiped)")
											src.loc = L
											L.Content += 1
											return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return


		Coins
			SilverCoin
				icon = 'SilverItems.dmi'
				icon_state = "Coin"
				weight = 10
				suffix = null
				Silver = 1
				desc = "This is a Silver Coin, it can be used for trade."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight

									return
			GoldCoin
				icon = 'GoldItems.dmi'
				icon_state = "Coin"
				weight = 10
				Gold = 1
				suffix = null
				desc = "This is a Gold Coin, it can be used for trade."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Plants
			suffix = "Stuck"
			New()
				TomatoDecay()
			GrapeVine
				icon = 'Cave.dmi'
				icon_state = "PPlant1"
				weight = 10
				Content = 5
				desc = "This is a grape vine plant."
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Food/CookedMeats/Grape/T = new
										T.loc = M.loc
										if(src.Content >= 1)
											src.icon_state = "PPlant5"

										if(src.Content >= 2)
											src.icon_state = "PPlant4"

										if(src.Content >= 3)
											src.icon_state = "PPlant3"
										if(src.Content >= 4)
											src.icon_state = "PPlant2"
										if(src.Content <= 0)
											for(var/turf/e in view(0,src))
												e.HasPlantIn = 0
											del(src)
											return
			GarlicPlant
				icon = 'Cave.dmi'
				icon_state = "Garlic Plant"
				weight = 10
				Content = 0
				desc = "This is a garlic plant."
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Seeds/Garlic/G = new
										G.loc = M.loc
									else
										var/obj/Items/Seeds/Garlic/G = new
										G.loc = M.loc
										del(src)



			TomatoPlant
				icon = 'Cave.dmi'
				icon_state = "Plant1"
				weight = 10
				Content = 5
				desc = "This is a tomato plant."
				DblClick()



					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in view(1,M))
							if(M)



								var/list/menu = new()
								menu += "Inspect"
								menu += "Pick"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc

								if (Result == "Pick")
									if(src.Content >= 0)
										src.Content -= 1
										var/obj/Items/Food/CookedMeats/Tomato/T = new
										T.loc = M.loc
										if(src.Content >= 1)
											src.icon_state = "Plant5"

										if(src.Content >= 2)
											src.icon_state = "Plant4"

										if(src.Content >= 3)
											src.icon_state = "Plant3"
										if(src.Content >= 4)
											src.icon_state = "Plant2"
										if(src.Content <= 0)
											for(var/turf/e in view(0,src))
												e.HasPlantIn = 0
											del(src)
											return



		Seeds
			New()
				ItemDecay()
			Garlic
				CanEat = 1
				icon = 'Farm Items.dmi'
				icon_state = "Garlic"
				weight = 2
				suffix = null
				desc = "This is garlic, it can be used for alchemy or eaten as food"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Eat"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Eat")
									if(src in view(1,M))
										view() << "<b><font color=blue>[M] eats [src]"
										if(M.Vampire == 1)
											M.GoingToDie = 1
											M.DeathType = "Garlic"
											view() << "<b><font color=red>[M] was killed by garlic!"
											M.Death()
											del(src)
											return
										if(src.Posioned == 1)
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[src]"
											M.DeathType = "Posion"
											M.Death()
											return
										M.Hunger += 100
										M.said = 0
										if(M.Hunger >= 100)
											M.Hunger = 100
										M.weight -= src.weight
										del(src)
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.icon_state == "FarmLand")
												if(T.HasPlantIn == 0)
													for(var/obj/Items/Seeds/S in M.loc)
														if(S != src)
															usr << "Cant plant too many seeds in one area!"
															return
													var/obj/A1 = src
													A1.loc = M.loc
													A1.suffix = "(Planted)"
													M.weight -= A1.weight
													A1.icon_state = ""
													A1.GarlicGrow()
													return
			PosionSporeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a posion plant seed, it can be planted in swamps only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.PosionSporeGrow()
												return
			CarnivorousPlantSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a Carnivorous plant seed, it can be planted in swamps only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/obj/Items/Seeds/S in M.loc)
											if(S != src)
												usr << "Cant plant too many seeds in one area!"
												return
										for(var/turf/T in view(0,M))
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.CarnGrow()
												return
			TreeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tree seed, it can be planted out side only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											for(var/obj/Items/Seeds/S in M.loc)
												if(S != src)
													usr << "Cant plant too many seeds in one area!"
													return
											if(T.icon_state == "Grass")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
											if(T.icon_state == "Desert")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
											if(T.Content == "Marsh")
												var/obj/A1 = src
												A1.loc = M.loc
												A1.suffix = "(Planted)"
												M.weight -= A1.weight
												A1.icon_state = ""
												A1.TreeGrow()
												return
			GrapeSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a grape seed, it can be planted anywhere."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/obj/Items/Seeds/S in M.loc)
											if(S != src)
												usr << "Cant plant too many seeds in one area!"
												return
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = "(Planted)"
										M.weight -= A1.weight
										A1.icon_state = ""
										A1.GrapeGrow()
										break
										return
			TomatoSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tomato seed, it can be planted in farm land only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											if(T.icon_state == "FarmLand")
												if(T.HasPlantIn == 0)
													for(var/obj/Items/Seeds/S in M.loc)
														if(S != src)
															usr << "Cant plant too many seeds in one area!"
															return
													var/obj/A1 = src
													A1.loc = M.loc
													A1.suffix = "(Planted)"
													M.weight -= A1.weight
													A1.icon_state = ""
													T.HasPlantIn = 1
													A1.TomatoGrow()
													break
													return



			TowerCapSeed
				icon = 'Cave.dmi'
				icon_state = "TowerCapSeed"
				weight = 2
				suffix = null
				desc = "This is a tower cap seed, it can be planted in a cave only."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M)


								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								menu += "Plant"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
								if (Result == "Plant")
									if(src.suffix == "(Carrying)")
										for(var/turf/T in view(0,M))
											for(var/obj/Items/Seeds/TowerCapSeed/S in view(0,M))
												if(S in M.loc)
													return
												else
													if(T.icon_state == "CaveFloor")
														for(var/obj/Items/Seeds/Z in M.loc)
															if(Z != src)
																usr << "Cant plant too many seeds in one area!"
																return
														var/obj/A1 = src
														A1.loc = M.loc
														A1.suffix = "(Planted)"
														M.weight -= A1.weight
														A1.icon_state = ""
														A1.TowerCapGrow()
														return


		Glands
			New()
				ItemDecay()
			PosionRoots
				icon = 'Animal.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion root, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			ToxicGland
				icon = 'Cave.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			PosionGland
				name = "PoisonGland"
				icon = 'Cave.dmi'
				icon_state = "Gland"
				weight = 10
				suffix = null
				desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Graves

			TombStone

				icon = 'StoneItems.dmi'
				icon_state = "TombStone1"
				weight = 30
				suffix = null
				TS = 1
				desc = "This a tomb stone, it can be placed over a grave."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Grave

				icon = 'Cave.dmi'
				icon_state = "Grave"
				weight = 10
				suffix = null
				desc = "Grave"
		Bones
			New()
				ItemDecay()

			SkullPile

				icon = 'Cave.dmi'
				icon_state = "SkullPile"
				weight = 10
				suffix = null
				desc = "This is a skull pile, it looks scary."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Skull

				icon = 'Cave.dmi'
				icon_state = "Skull"
				weight = 10
				suffix = null
				desc = "This is a skull, it can be used for bone crafting or burial"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Shell

				icon = 'Cave.dmi'
				icon_state = "Shell"
				weight = 10
				suffix = null
				desc = "This is a hard shell, it can be used for crafting or burial."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			BloodyLeg

				icon = 'Blood.dmi'
				icon_state = "Arm"
				weight = 5
				suffix = null
				IsBodyPart = 1
				desc = "This is a leg, it is covered in blood and pretty useless"
				New()
					DeleteLimbs()
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			BloodyArm

				icon = 'Blood.dmi'
				icon_state = "Arm"
				weight = 5
				suffix = null
				IsBodyPart = 1
				desc = "This is an arm, it is covered in blood and pretty useless"
				New()
					DeleteLimbs()
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			FrogManHead

				icon = 'Heads.dmi'
				icon_state = "FrogManHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a frog mans head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DwarfHead

				icon = 'Heads.dmi'
				icon_state = "HumanHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a dwarf head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GremlinHead

				icon = 'Heads.dmi'
				icon_state = "GremlinHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a gremlins head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			LizardHead

				icon = 'Heads.dmi'
				icon_state = "LizardHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a lizards head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			OrcHead

				icon = 'Heads.dmi'
				icon_state = "OrcHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a orcs head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GargoyleHead

				icon = 'Heads.dmi'
				icon_state = "GargoyleHead"
				weight = 25
				suffix = null
				IsHead = 1
				desc = "This is a Gargoyles head."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			DemonHead

				icon = 'Heads.dmi'
				icon_state = "DemonHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a demons head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			HumanHeadBlack

				icon = 'Heads.dmi'
				icon_state = "HumanHeadBlack"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a human head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			HumanHead

				icon = 'Heads.dmi'
				icon_state = "HumanHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a human head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			VampireHead

				icon = 'Heads.dmi'
				icon_state = "VampireHead"
				weight = 10
				suffix = null
				IsHead = 1
				desc = "This is a vampire head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			KoboldHead

				icon = 'Heads.dmi'
				icon_state = "KoboldHead"
				weight = 10
				IsHead = 1
				suffix = null
				desc = "This is a kobold head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GoblinHead

				icon = 'Heads.dmi'
				icon_state = "GoblinHead"
				weight = 10
				IsHead = 1
				suffix = null
				desc = "This is a goblin head, it can be stuck on a spike to warn invaders!"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Bones

				icon = 'Cave.dmi'
				icon_state = "Bone"
				weight = 10
				suffix = null
				desc = "These are bones, they can be used for bone crafting or burial"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		Furniture
			Doors
				Door = 1
				GMDoor
					icon = 'MetalObjects.dmi'
					icon_state = "MetalDoor"
					weight = 100
					suffix = null
					density = 1
					opacity = 1
					suffix = "Stuck"
					HumanParts = 0
					HP = 1000000000
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(M in view(1,src))
								if(usr.GM == 1)
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "MetalDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return


				BoneDoor
					icon = 'Cave.dmi'
					icon_state = "BoneDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
													for(var/obj/Items/Shafts/LockPick/P in M)
														var/a
														a = prob(M.LockPickingSkill)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															del(P)
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "BoneDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "BoneDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "BoneDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				GoldDoor
					icon = 'GoldItems.dmi'
					icon_state = "GoldDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
													for(var/obj/Items/Shafts/LockPick/P in M)
														var/a
														a = prob(M.LockPickingSkill)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															del(P)
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "GoldDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "GoldDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "GoldDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				MetalDoor
					icon = 'MetalObjects.dmi'
					icon_state = "MetalDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
													for(var/obj/Items/Shafts/LockPick/P in M)
														var/a
														a = prob(M.LockPickingSkill)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															del(P)
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "MetalDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "MetalDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "MetalDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return
				WoodenDoor
					icon = 'Cave.dmi'
					icon_state = "WoodenDoor"
					weight = 100
					suffix = null
					HumanParts = 0
					IsWood = 1
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								if(src.Locked == 1)
									if(M.Owner == src.Owner)
										var/list/menu = new()
										menu += "Lock"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.density == 1)
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.density == 1)
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													return
												if (Result == "PickLock")
													for(var/obj/Items/Shafts/LockPick/P in M)
														var/a
														a = prob(M.LockPickingSkill)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															del(P)
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "WoodenDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													del(src)
													return
												if (Result == "Lock")
													if(src.Locked == 0)
														if(src.density == 1)
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.density == 1)
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
									else
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "WoodenDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "Open"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "WoodenDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "Open"
										return

							if(src in view(1,M))
								M.destination = null
								if(src.Placed == 0)
									if(src.suffix == null)
										if(M.weight <= M.weightmax)
											src.loc = M
											src.suffix = "(Carrying)"
											M.weight += src.weight
											src.Owner = M.Owner
											return
										else
											usr << "[M] : I Cant Carry Too Much!"
											return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										src.Owner = null
										src.Locked = 0
										return

			Pillars
				GoblinPillar
					icon = 'StoneItems.dmi'
					icon_state = "Pillar"
					weight = 50
					suffix = null
					density = 0
					name = "Pillar"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GoldPillar
					icon = 'GoldItems.dmi'
					icon_state = "Pillar"
					name = "Golden Pillar"
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				Statue
					icon = 'Statue.dmi'
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				DwarfPillar
					icon = 'StoneItems.dmi'
					icon_state = "Pillar"
					name = "Pillar"
					weight = 50
					suffix = null
					density = 1
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A14 = src
									A14.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
			Posts
				BoneTrainingPost
					icon = 'Cave.dmi'
					icon_state = "BonePost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return
						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				SilkTrainingPost
					icon = 'Cave.dmi'
					icon_state = "SilkPost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return
						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				WoodTrainingPost
					icon = 'Cave.dmi'
					icon_state = "Wood Post"
					weight = 50
					Content3 = 1
					suffix = null
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				GoldTrainingPost
					icon = 'GoldItems.dmi'
					icon_state = "Gold Training Post"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				SilverTrainingPost
					icon = 'SilverItems.dmi'
					icon_state = "Silver Training Post"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				MetalTrainingPost
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Training Post"
					weight = 50
					suffix = null
					HP = 100
					Content3 = 1
					TP = 1
					density = 1

					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										M.Target = null
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			Tables
				Table
					icon = 'Cave.dmi'
					icon_state = "Table"
					weight = 30
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return
			Chairs
				BoneThrone
					icon = 'BoneItems.dmi'
					icon_state = "Throne"
					weight = 50
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return
				GoldenThrone
					icon = 'RoyalItems.dmi'
					icon_state = "Throne"
					weight = 50
					suffix = null
					DblClick()

						for(var/mob/Monsters/M in usr.Selected)
							if(src in view(1,M))
								M.destination = null
								if(src.suffix == null)
									if(M.weight <= M.weightmax)
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										src.layer = M.layer
										return
									else
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										if(M.dir == NORTH)
											src.dir = NORTH
											src.layer = 5
										else
											src.dir = M.dir
										return

			Beds
				CR = 40
				GoldBed
					icon = 'GoldItems.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				MetalBed
					icon = 'MetalObjects.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				WoodenBed
					icon = 'Cave.dmi'
					icon_state = "Bed"
					weight = 50
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M.Wagon == 0)


									var/obj/A10 = src
									A10.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return
				SleepingBag
					icon = 'Cave.dmi'
					icon_state = "SleepingBag"
					weight = 5
					suffix = null
					New()
						ItemDecay()
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				LeatherBed
					icon = 'Cave.dmi'
					icon_state = "LeatherBed"
					weight = 25
					suffix = null
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return

		Food
			CanEat = 1
			New()
				ItemDecay()
			CookedMeats
				CookedGoblinMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked goblin meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedVampireMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked vampire meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedWolfMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked wolf meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedKoboldMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked kobold meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedDwarfMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked dwarf meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked fish meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				Grape
					icon = 'Cave.dmi'
					icon_state = "Grape"
					weight = 10
					suffix = null
					desc = "This is a grape, once eaten it will provide a seed, it can also be used to create wines."
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M)


									var/obj/A = src
									A.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									if(M.Carn == 0)
										menu += "Eat"
									if(M.Vampire == 0)
										menu += "Eat"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

									if (Result == "Eat")
										if(src in view(1,M))
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Posioned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Posion"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												var/obj/Items/Seeds/GrapeSeed/S = new
												S.loc = M.loc
												var/obj/Items/Seeds/GrapeSeed/S2 = new
												S2.loc = M.loc
												del(src)
												return
				Tomato
					icon = 'Cave.dmi'
					icon_state = "Tomato"
					weight = 10
					suffix = null
					desc = "This is a tomato, it can be used as food and will provide seeds as well."
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M)


									var/obj/A = src
									A.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									if(M.Carn == 0)
										menu += "Eat"
									if(M.Vampire == 0)
										menu += "Eat"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

									if (Result == "Eat")
										if(src in view(1,M))
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Posioned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Posion"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												var/obj/Items/Seeds/TomatoSeed/S = new
												S.loc = M.loc
												var/obj/Items/Seeds/TomatoSeed/S2 = new
												S2.loc = M.loc
												del(src)
												return
				CookedDemonMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of demon meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedLizardMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked lizard meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedGremlinMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked gremlin meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedTropicalFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked tropical fish meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedOrcMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked orc meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedBlowFishMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked blow fish meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedBugMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked bug meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedHumanMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked human meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedMoleMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked mole meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)

								if(M)


									var/obj/A = src
									A.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									if(M.Vampire == 0)
										menu += "Eat"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

									if (Result == "Eat")
										if(src in view(1,M))
											if(M.Wagon == 0)
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Posioned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Posion"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												del(src)
												return
				CookedFrogManMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked frog man meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				CookedDeerMeat
					icon = 'Cave.dmi'
					icon_state = "Cooked"
					weight = 10
					suffix = null
					desc = "This is a chunk of cooked deer meat, it can be eaten"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			Fungases
				Fungas
					icon = 'Cave.dmi'
					icon_state = "Fungas"
					weight = 10
					name = "Fungus"
					suffix = null
					desc = "This is a chunk of fungas, it can be eaten by some creatures such as Kobolds and Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
			Meats
				UnCookedGoblinMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked goblin meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedVampireMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked vampire meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedDemonMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked demon meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedWolfMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked wolf meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedKoboldMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked kobold meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedFrogManMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked frog man meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedGremlinMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked gremlin meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedDwarfMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked dwarf meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedOrcMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked orc meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedBlowFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked blow fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedTropicalFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked Tropical fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedCaveFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked cave fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedFishMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked fish meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedMoleMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked mole meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							M.destination = null
							if(src in M)
								if(M)


									var/obj/A = src
									A.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Inspect"
									if(M.Vampire == 0)
										if(M.Wagon == 0)
											menu += "Eat"
									menu += "Cancel"
									var/Result = input("What Action Will You Choose?", "Choose", null) in menu
									if (Result != "Cancel")
										..()
									if (Result == "Inspect")
										usr << src.desc
									if (Result == "Drop")
										if(src.suffix == "(Carrying)")
											var/obj/A1 = src
											A1.loc = M.loc
											A1.suffix = null
											M.weight -= A1.weight
											return

									if (Result == "Eat")
										if(src in view(1,M))
											if(M.Carn == 0)
												var/die = prob(33)
												if(die == 1)
													view() << "<b><font color=red>[M] tryed to eat meat raw but it killed [M]"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Food Posioning"
													M.Death()
													return
												else
													view() << "<b><font color=blue>[M] eats [src]"
													if(src.Posioned == 1)
														view() << "<b><font color=red>[M] was posioned!"
														M.HP = 0
														M.GoingToDie = 1
														M.Killer = "[M]"
														M.DeathType = "Posion"
														M.Death()
														return
													M.Hunger += 100
													if(M.Spider == 1)
														M.WebContent += 25
														if(M.WebContent >= M.MaxWebContent)
															M.WebContent = M.MaxWebContent
													M.said = 0
													if(M.Hunger >= 100)
														M.Hunger = 100
													M.weight -= src.weight
													del(src)
													return
											else
												view() << "<b><font color=blue>[M] eats [src]"
												if(src.Posioned == 1)
													view() << "<b><font color=red>[M] was posioned!"
													M.HP = 0
													M.GoingToDie = 1
													M.Killer = "[M]"
													M.DeathType = "Posion"
													M.Death()
													return
												M.Hunger += 100
												M.said = 0
												if(M.Hunger >= 100)
													M.Hunger = 100
												M.weight -= src.weight
												del(src)
												return

				UnCookedLizardMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked lizard meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedBugMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked bug meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedHumanMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked human meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
				UnCookedDeerMeat
					icon = 'Cave.dmi'
					icon_state = "Meat"
					weight = 10
					suffix = null
					desc = "This is a chunk of un-cooked deer meat, it can be eaten raw by some creatures such as Kobolds or Goblins"
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
										usr << "[M] : I Cant Carry Too Much!"
										return

						for(var/mob/Monsters/M in usr.Selected)
							for(src in M)
								if(src.loc == M)
									if(src.suffix == "(Carrying)")
										src.loc = M.loc
										src.suffix = null
										M.weight -= src.weight
										return
		woods
			New()
				ItemDecay()
			wood
				icon = 'Cave.dmi'
				icon_state = "Wood"
				weight = 20
				suffix = null
				desc = "This is a wooden log, it can be used to create furtniture, buildings and pretty much anything else"


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
								usr << "[M] : I Cant Carry Too Much!"
								return

				for(var/mob/Monsters/M in usr.Selected)
					for(src in M)
						if(src.loc == M)
							if(src.suffix == "(Carrying)")
								src.loc = M.loc
								src.suffix = null
								M.weight -= src.weight
								return
		gems
			New()
				ItemDecay()
			Gems = 1
			Emerald
				icon = 'Cave.dmi'
				icon_state = "Emerald"
				weight = 10
				desc = "This is an Emerald, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Ruby
				icon = 'Cave.dmi'
				icon_state = "Ruby"
				weight = 10
				desc = "This is an Ruby, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Diamond
				icon = 'Cave.dmi'
				icon_state = "Diamond"
				weight = 10
				desc = "This is an Diamond, it can be used for decoration or trade and encrusting armour."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			UnCutDiamond
				icon = 'Cave.dmi'
				icon_state = "Un-CutDiamond"
				weight = 10
				desc = "This is an Un-Cut Diamond, it can be used by a Jewl Crafter to create a Diamond"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			UnCutRuby
				icon = 'Cave.dmi'
				icon_state = "Un-CutRuby"
				weight = 10
				desc = "This is an Un-Cut Ruby, it can be used by a Jewl Crafter to create a Ruby"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			UnCutEmerald
				icon = 'Cave.dmi'
				icon_state = "Un-CutEmerald"
				desc = "This is an Un-Cut Emerald, it can be used by a Jewl Crafter to create a Emerald"
				weight = 10
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
		ores
			New()
				ItemDecay()
			metal
				name = "Iron"
				icon = 'Cave.dmi'
				icon_state = "Metal"
				weight = 20
				desc = "This is a chunk of Metal, it can be used to create Ingots for armour and weapon creation"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			Sand
				icon = 'Farm Items.dmi'
				icon_state = "Sand"
				weight = 30
				desc = "This is sand, it can be used to create glass objects."
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			GoldNugget
				icon = 'Cave.dmi'
				icon_state = "Nugget"
				weight = 30
				desc = "This is a golden nugget, it can be used to create Ingots for armour and weapon creation or used to create royal items as well as other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			silver
				icon = 'Cave.dmi'
				icon_state = "Silver"
				weight = 20
				desc = "This is a lump of silver, it can be used to create coins, weapons, armour, and other fanciful things"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return
			stone
				icon = 'Cave.dmi'
				icon_state = "Stone"
				weight = 20
				desc = "This is a lump of stone, it can be used to detail walls and floors, it can also be used for statue creation"
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
									usr << "[M] : I Cant Carry Too Much!"
									return

					for(var/mob/Monsters/M in usr.Selected)
						for(src in M)
							if(src.loc == M)
								if(src.suffix == "(Carrying)")
									src.loc = M.loc
									src.suffix = null
									M.weight -= src.weight
									return



