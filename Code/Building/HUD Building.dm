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
		Middle2
			icon_state = "M2"
		Text
			icon = 'txt.dmi'
		ClickDetail
			name = "DetailedWall"
			icon_state = "DetailedWall"
			text = "S"
			DblClick()
				usr.Detail()
				usr.Up = 0
				usr.Close()

		ClickDestroy
			name = "Destroy"
			icon='Cave.dmi'
			icon_state = "CaveFloor"
			text = "D"
			DblClick()
				usr.Function = "DestroyFloor"
				usr << "Click and drag to destroy floors and stairs.<br>"
				usr.Close()

		Dec
			name = "Decoration"
			icon_state = "Dec"
			text = "W"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/turf/W in view(0,M))
						if(W.density == 0)
							if(M.Race == "Spider")
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
		SilkBridge
			name = "SilkBridge"
			icon_state = "B"
			text = "B"
			DblClick()
				usr.Function = "PlaceSilkBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		Cacoon
			name = "Cacoon"
			icon_state = "Cacoon"
			text = "C"
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
			name = "Post"
			icon_state = "Post"
			text = "P"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					for(var/obj/Items/woods/wood/W in M)
						if(M.Race == "Spider")
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
			name = "SilkWall"
			icon_state = "SilkWall"
			text = "W"
			DblClick()
				usr.Function = "PlaceSilkWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		Forcefield
			name = "Forcefield"
			icon_state = "ForcefieldP"
			text = "F"
			DblClick()
				usr.Function = "Forcefield"
				usr << "Click and drag to place forcefield<br>"
				usr.Close()
		Pyrokinesis
			name = "Pyrokinesis"
			icon_state = "PyrokinesisP"
			text = "P"
			DblClick()
				usr.Function = "Pyrokinesis"
				usr << "Click and drag to set fires<br>"
				usr.Close()
		Telekinesis
			name = "Telekinesis"
			icon_state = "TelekinesisP"
			text = "T"
			DblClick()
				usr.Function = "Telekinesis"
				usr << "Click and drag to use telekinesis<br>"
				usr.Close()
		Mindcontrol
			name = "Mindcontrol"
			icon_state = "MindcontrolP"
			text = "M"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.SubRace == "Illithid")
						for(var/mob/Monsters/F in range(8,M))
							if(F == M.MagicTarget && F.Owner != M.Owner) if(!F.Critter)
								if(F.Undead == 0 && F.Race != "Vampire" && F.Infects == 0 && F.SubRace != "Illithid" && F.Race != "Gargoyle" && F.Race != "Demon" && F.Race != "Bat")
									if(M.Tiredness >= 0)
										if(M.invisibility >= 1)
											M.invisibility = 0
											view(M) << "[M] becomes visible!"
										var/MindDominate = prob(M.Intelligence * 3 - F.Intelligence * 4)
										if(F.CanBeSlaved == 1) MindDominate = 1
										if(F.Level >= 10 ) MindDominate = 0
										if(MindDominate == 1 && F.Race != "Gargoyle")
											M.Tiredness -= 50
											F.ChangeOwnership(M.Owner)
											view(M) << "[M] uses their mental powers to completely dominate [F]'s mind!"
											usr.Close()
											return
										else
											view(M) << "[M] attempts to use their mental powers to dominate [F] but fails."
											M.Tiredness -= 25
											usr.Close()
											return
									else
										M.Owner << "[M] is too tired to do this."
								else
									M.Owner << "You cannot use this power on that creature"
				usr.Close()
		ReadMind
			name = "ReadMind"
			icon_state = "ReadMindP"
			text = "R"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.SubRace == "Illithid")
						for(var/mob/Monsters/F in view(8,M))
							if(F == M.MagicTarget)
								if(F.Undead == 0)
									if(F.icon_state != "TowerCap")
										var/list/menu2 = new()
										menu2 += "Read Speech Records"
										menu2 += "Read Action Records"
										menu2 += "View Inventory"
										menu2 += "View Statistics"
										menu2 += "View Skills"
										menu2 += "Mind Map"
										menu2 += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
										if(Result != "Cancel")
											F.Owner << "[F] can feel something probing at it's mind... looking for information."
											M.Owner << "[M] probes [F]'s mind, searching for information."
											..()
										if(Result == "Mind Map")
											M.TemporaryUnitTarget = F
											M.Owner << "[M] has memorized the structure of [F]'s mind and will be able to find them from any reasonable distance in the future."
										if(Result == "Read Speech Records")
											for(var/mob/O in world)
												if(O == F.Owner)
													var/html_doc="<head><title>Unit Chat</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Chat Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.ChatLog]"
													usr<<browse(html_doc,"window=ChatLog")
										if(Result == "Read Action Records")
											for(var/mob/O in world)
												if(O == F.Owner)
													var/html_doc="<head><title>Unit Emote</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Emote Log</U>From:<br> [O]</font><font face=Verdana><font color=COCOCO><br><br>[O.EmoteLog]"
													usr<<browse(html_doc,"window=EmoteLog")
										if(Result == "View Inventory")
											for(var/obj/O in F)
												usr << "--<font color = silver>[O]"
										if(Result == "View Statistics")
											usr << "--<font color = silver><font size=4>{---[F.name]---}"
											usr << "--<font color = silver>[F.Strength] - Strength"
											usr << "--<font color = silver>[F.Agility] - Agility"
											usr << "--<font color = silver>[F.Intelligence] - Intelligence"
											usr << "--<font color = silver>[F.Defence] - Defence"
											usr << "--<font color = silver>[F.Age] - Age"
											usr << "--<font color = silver>[F.weight] - Weight"
											usr << "--<font color = silver>[F.weightmax] - Max Weight"
											usr << "--<font color = silver>[F.Tiredness] - Tiredness"
											usr << "--<font color = silver>[F.Hunger] - Hunger"
										if(Result == "View Skills")
											usr << "--<font color = silver><font size=4>{---[F.name]---}"
											usr << "--<font color = silver>[F.UnArmedSkill] - Unarmed Skill"
											usr << "--<font color = silver>[F.ClawSkill] - Claws Skill"
											usr << "--<font color = silver>[F.SwordSkill] - Sword Skill"
											usr << "--<font color = silver>[F.AxeSkill] - Axe Skill"
											usr << "--<font color = silver>[F.MaceSkill] - Mace Skill"
											usr << "--<font color = silver>[F.SpearSkill] - Spear Skill"
											usr << "--<font color = silver>[F.BowSkill] - Bow Skill"
											usr << "--<font color = silver>[F.ShieldSkill] - Shield Skill"
											usr << "--<font color = silver>[F.ArmourSkill] - ArmourSkill"
											usr << "--<font color = silver>[F.MetalCraftingSkill] - Metal Crafting Skill"
											usr << "--<font color = silver>[F.WoodCraftingSkill] - Wood Crafting Skill"
											usr << "--<font color = silver>[F.BoneCraftingSkill] - Bone Crafting Skill"
											usr << "--<font color = silver>[F.LeatherCraftingSkill] - Leather Crafting Skill"
											usr << "--<font color = silver>[F.StoneCraftingSkill] - Stone Crafting Skill"
											usr << "--<font color = silver>[F.JewlCraftingSkill] - Gem Crafting Skill"
											usr << "--<font color = silver>[F.PotionSkill] - Potion Crafting Skill"
											usr << "--<font color = silver>[F.FishingSkill] - Fishing Skill"
											usr << "--<font color = silver>[F.MineingSkill] - Mining Skill"
									else
										M.Owner << "You read the mind of the fungi and it's brainwaves are oddly humanoid, almost as if it's pondering it's existance as it grows in the cavern."
								else
									M.Owner << "You cannot use this power on that creature"
				usr.Close()
		Scrying
			name = "Scrying"
			icon_state = "ScryingP"
			text = "S"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.SubRace == "Illithid" && M.Race == "Illithid")
						var/list/menu2 = new()
						menu2 += "Locate Active Minds"
						menu2 += "Locate Memorized Mind"
						menu2 += "Locate Living Creatures"
						menu2 += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
						if(Result != "Cancel")
							if(Result == "Locate Active Minds")
								M.Owner << "[M] is locating all non-illithid creatures with psychic abilities"
								for(var/mob/Monsters/K in world)
									if(K.SubRace == "Illithid" && K.Race != "Illithid")
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
							if(Result == "Locate Memorized Mind")
								for(var/mob/Monsters/K in world)
									if(K == M.TemporaryUnitTarget)
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
							if(Result == "Locate Living Creatures")
								for(var/mob/Monsters/K in range(40,M))
									if(K.Undead == 0 && K.Race != "Gargoyle" && K.Race != "Illithid" && K.icon != 'Cave.dmi') if(!K.Critter)
										M.Owner << "<font color=silver><b>[K.name] - </b> [K.x],[K.y],[K.z]"
					else
						M.Owner << "Only full illithids can do this"
				usr.Close()
		CreateOrgan
			name = "CreateOrgan"
			icon_state = "DevourerOrgan"
			text = "O"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Devourer")
						if(M.EggContent >= 1)
							var/list/menu2 = new()
							menu2 += "Reinforced Flesh"
							menu2 += "Enhanced Muscle Structure"
							menu2 += "Efficient Nerve Centre"
							menu2 += "Expanded Skull"
							menu2 += "Symbiotic Cancerous Cells"
							menu2 += "Organic Climbing Hooks"
							menu2 += "Sharpened Finger Bones"
							menu2 += "Toxic Marrow"
							menu2 += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
							if(Result != "Cancel" && M.EggContent >= 2)
								var/obj/Items/Shafts/EngineeredOrgan/E = new()
								E.loc = M
								E.suffix = "(Carrying)"
								M.EggContent -= 1
								if(Result == "Reinforced Flesh") E.Content2 = "Toughness"
								if(Result == "Enhanced Muscle Structure") E.Content2 = "Strength"
								if(Result == "Efficient Nerve Centre") E.Content2 = "Agility"
								if(Result == "Expanded Skull") E.Content2 = "Intelligence"
								if(Result == "Symbiotic Cancerous Cells") E.Content2 = "Resistance"
								if(Result == "Organic Climbing Hooks") E.Content2 = "Climbing"
								if(Result == "Sharpened Finger Bones") E.Content2 = "Claws"
								if(Result == "Toxic Marrow") E.Content2 = "Acid"
								E.name = "Organ - [Result]"
							usr.Close()
						else
							usr << "Your devourer does not have enough bodies stored, you require 1 body for this."
					else
						usr << "One or more of the units you have selected is not a devourer"
						return
		ImproveDevourer
			name = "ImproveDevourer"
			icon_state = "Devourer"
			text = "I"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected) if(M.Race == "Devourer")
					if(M.EggContent >= 5)
						var/list/menu2 = new()
						if(M.SavedDefence<100) menu2 += "Hardened Casing"
						if(M.Delay >= 4) menu2 += "Enhanced Motile Tendrils"
						if(M.HoldingWeapon == "Mace") menu2 += "Sharpened Tool Stalks"
						if(!M.CliffClimber) menu2 += "Adhesive Slime Glands"
						menu2 += "Concentration Enhancing Hormonal Gland"
						menu2 += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
						if(Result != "Cancel" && M.EggContent >= 5)
							if(Result == "Hardened Casing") if(M.SavedDefence<100)
								M.EggContent -= 5
								M.Defence += 5
								M.SavedDefence += 5
								usr<<"[M]'s defence has increesed by 5 points. (So far [M.SavedDefence])"
							if(Result == "Enhanced Motile Tendrils") if(M.Delay == 4)
								M.Delay = 3
								M.EggContent -= 5
								usr<<"[M] will now move and attack 25% faster."
							if(Result ==  "Sharpened Tool Stalks") if(M.HoldingWeapon == "Mace")
								M.HoldingWeapon = "Sword"
								M.WeaponDamageMin += 10
								M.WeaponDamageMax += 12
								M.EggContent -= 5
								usr<<"[M]'s damage has been improved by 10 to 12 points. [M] will also now deal slashing damage."
							if(Result == "Adhesive Slime Glands") if(!M.CliffClimber)
								M.CliffClimber = 1
								M.EggContent -= 5
								usr<<"[M] has gained the ability to climb cliffs. To do so simply click on a tile in the sky and you will automatically climb over any walls in the way, if possible."
							if(Result == "Concentration Enhancing Hormonal Gland")
								M.Intelligence += 1
								M.EXP += 250
								M.EggContent -= 5
								usr<<"[M]'s intelligence has been enhanced by 1 point."
						else usr << "You need 5 bodies stored to do this."
						usr.Close()
					else usr << "Your devourer does not have any bodies stored. You need 5."
		BuiltInBonecraft
			name = "Bonecraft"
			icon_state = "DevourerBonecraft"
			text = "B"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race != "Devourer")
						return
					var/list/menu = new()
					menu += "Craft"
					menu += "Cancel"
					var/Result = input("What Action Will You Choose?", "Choose", null) in menu
					if (Result != "Cancel")
						..()
					if (Result == "Craft")
						var/list/menu2 = new()
						menu2 += "BoneSpear"
						menu2 += "Full Bone Armor"
						menu2 += "BoneAxe"
						menu2 += "BoneDagger"
						menu2 += "BoneHelmet"
						menu2 += "BoneChestPlate"
						menu2 += "BoneLeggings"
						menu2 += "BoneLeftGauntlet"
						menu2 += "BoneRightGauntlet"
						menu2 += "Bone Door"
						menu2 += "BoneBuckler"
						menu2 += "Bone Training Post"
						menu2 += "Bone Throne"
						menu2 += "Bone Sword"
						menu2 += "Skull Mace"
						menu2 += "Cancel"
						var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
						if (Result2 != "Cancel")
							..()
						if (Result2 == "Bone Throne")
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
								LB.TrainCraft()
								M.BoneCraftingSkill += 0.25
								M.weight -= S.weight
								LB.loc = M.loc
								del(S)
								break
								return
						if (Result2 == "LockPick")
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
								M.BoneCraftingSkill += 0.25
								M.weight -= S.weight
								LB.FurnitureCraft()
								del(S)
								break
								return
						if (Result2 == "BoneBuckler")
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
								var/obj/Items/Equipment/Armour/Shield/BoneBuckler/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								M.weight -= S.weight
								LB.loc = M.loc
								del(S)
								break
								return
						if (Result2 == "BoneDagger")
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
								var/obj/Items/Equipment/Weapon/Daggers/BoneDagger/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								LB.WeaponDamageMin = LB.WeaponDamageMin/2
								LB.WeaponDamageMax = LB.WeaponDamageMax/2
								del(S)
								break
								return
						if (Result2 == "BoneAxe")
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
								var/obj/Items/Equipment/Weapon/Axes/BoneAxe/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								var/obj/Items/Equipment/Weapon/Maces/SkullMace/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								var/obj/Items/Equipment/Weapon/Swords/BoneSword/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								var/obj/Items/Equipment/Weapon/Spears/BoneSpear/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
						if (Result2 == "BoneRightGauntlet")
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
								var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
						if (Result2 == "Full Bone Armor")
							for(var/obj/Items/Bones/Bones/S in M)
								var/fail
								fail = prob(M.BoneCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S.weight
									M.BoneCraftingSkill += 0.25
									del(S)
									break
								var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
							for(var/obj/Items/Bones/Bones/S2 in M)
								var/fail
								fail = prob(M.BoneCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S2.weight
									M.BoneCraftingSkill += 0.25
									del(S2)
									break
								var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								M.weight -= S2.weight
								LB.loc = M.loc
								del(S2)
								break
							for(var/obj/Items/Bones/Bones/S3 in M)
								var/fail
								fail = prob(M.BoneCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S3.weight
									M.BoneCraftingSkill += 0.25
									del(S3)
									break
								var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								M.weight -= S3.weight
								LB.loc = M.loc
								del(S3)
								break
							for(var/obj/Items/Bones/Bones/S4 in M)
								var/fail
								fail = prob(M.BoneCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S4.weight
									M.BoneCraftingSkill += 0.25
									del(S4)
									break
								var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								M.weight -= S4.weight
								LB.loc = M.loc
								del(S4)
								break
							for(var/obj/Items/Bones/Skull/S5 in M)
								var/fail
								fail = prob(M.BoneCraftingSkill*4)
								if(fail == 0)
									usr<< "Failed!"
									M.weight -= S5.weight
									M.BoneCraftingSkill += 0.25
									del(S5)
									break
								var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								M.weight -= S5.weight
								LB.loc = M.loc
								del(S5)
								break
						if (Result2 == "BoneChestPlate")
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
								var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
								LB.DoorCraft()
								M.BoneCraftingSkill += 0.25
								M.weight -= S.weight
								LB.loc = M.loc
								del(S)
								break
								return
						if (Result2 == "BoneHelmet")
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
								var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/LB = new
								if(M.BoneCraftingSkill >= 299)
									LB.CraftRank = "Supernatural Quality"
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
		CreateZombieCacoon
			name = "CreateZombieCacoon"
			icon_state = "DevourerZombie"
			text = "Z"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Race == "Devourer")
						if(M.EggContent >= 1)
							M.EggContent -= 1
							var/obj/Items/Shafts/PortableDevourerCacoon/C = new
							C.loc = M
							C.suffix = "(Carrying)"
							usr.Close()
						else
							usr << "Your devourer does not have enough bodies stored."
		Warp
			name = "Warp"
			icon_state = "WarpP"
			text = "W"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.SubRace == "Illithid")
						var/list/menu2 = new()
						menu2 += "Self"
						menu2 += "Other"
						menu2 += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu2
						if(Result == "Cancel")
							..()
						if(Result == "Self")
							var/X = rand(-10,10)
							var/Y = rand(-10,10)
							var/minus = prob(50)
							if(minus == 1)
								X -= M.Intelligence
								Y -= M.Intelligence
							if(minus == 0)
								X += M.Intelligence
								Y += M.Intelligence
							view(M) << "[M] uses their powers of the mind to fold space and create a interdimensional portal!"
							M.x += X
							M.y += Y
							for(var/turf/T in range(0,M))
								if(T.density == 1)
									M.Owner << "[M] slams into [T]!"
									M.BloodContent -= 25
									M.BloodLoss()
						if(Result == "Other")
							for(var/mob/Monsters/K in view(8,M))
								if(K == M.MagicTarget)
									if(M.Level >= 30)
										if(K.Mutated == 0)
											if(K.Wagon == 0 && K.Race != "Gargoyle")
												view(M) << "[M] begins to shape [K]'s very being with the powers of their mind..."
												var/list/menu3 = new()
												menu3 += "Create Mutation - Claws"
												menu3 += "Create Mutation - Thick Skin"
												menu3 += "Create Mutation - Weak Bones"
												menu3 += "Create Mutation - Strong Bones"
												menu3 += "Create Mutation - Unlock Mind"
												menu3 += "Create Mutation - Solar Powered"
												menu3 += "Create Mutation - Acidic Blood"
												menu3 += "Cancel"
												var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu3
												if(Result2 == "Cancel")
													..()
												if(Result2 == "Create Mutation - Claws")
													if(!K.HoldingWeapon)
														K.HoldingWeapon = "Claws"
														K.WeaponDamageMin += 35
														K.WeaponDamageMax += 40
														K.ClawSkill += 100
														K.Mutated = 1
												if(Result2 == "Create Mutation - Thick Skin")
													K.Defence += 15
													K.Mutated = 1
												if(Result2 == "Create Mutation - Weak Bones")
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.OrganMaxHP -= 10
													K.Intelligence += 1
													K.Mutated = 1
												if(Result2 == "Create Mutation - Strong Bones")
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.OrganMaxHP += 10
													K.Mutated = 1
												if(Result2 == "Create Mutation - Unlock Mind")
													if(!K.SubRace)
														K.SubRace = "Illithid"
														K.Intelligence += (K.Intelligence/10)
														K.Mutated = 1
													else return
												if(Result2 == "Create Mutation - Solar Powered")
													K.SolarPowered()
													K.Mutated = 1
												if(Result2 == "Create Mutation - Acidic Blood")
													K.Mutated = 1
													K.BloodAcidity = 25
												if(Result2 != "Cancel")
													view(M) << "[M] has changed [K] with [Result2]"
											else
												M.Owner << "This creature cannot be mutated."
										else
											M.Owner << "[K] is already mutated."
									else
										M.Owner << "[M] isn't level 30 yet"
				usr.Close()

		Lair
			name = "Lair"
			icon_state = "Silk"
			text = "L"
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.CanBreed)
						if(M.Race != "Spider")
							usr.Up = 0
							usr.Close()
							return
						if(M.WebContent >= 200)
							M.WebContent -= 200
							for(var/turf/T in view(2,M))
								if(T.density == 0)
									T.icon = 'Cave.dmi'
									T.icon_state = "SilkWall"
									T.Detailed = 1
					usr.Up = 0
					usr.Close()
		Walls
			name = "Walls"
			icon='Cave.dmi'
			icon_state = "WoodWall"
			text = "W"
			DblClick()
				usr.Walls()
		Floors
			name = "Floors"
			icon = 'Cave.dmi'
			icon_state = "WoodFloor"
			text = "F"
			DblClick()
				usr.Floors()
		Bridges
			name = "Bridges"
			icon='Cave.dmi'
			icon_state = "Bridge"
			text = "B"
			DblClick()
				usr.Bridge()
		SpiderTrap
			name = "Pit"
			icon_state = "Trap"
			text = "P"
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
							usr.Up = 0
							usr.Close()

		Traps
			name = "Traps"
			icon_state = "Trap"
			text = "T"
			DblClick()
				usr.Traps()
		ClickCacoonTrap
			name = "CacoonTrap"
			icon_state = "DevourerCacoonTrap"
			text = "C"
			DblClick()
				var/list/menu10 = new()
				menu10 += "Create"
				menu10 += "Disarm"
				menu10 += "Info"
				menu10 += "Cancel"
				var/Result10 = input("What Action Will You Choose?", "Choose", null) in menu10
				if (Result10 != "Cancel")
					..()
				if (Result10 == "Info")
					alert("This is a cacoon trap, it will release monsters to attack anyone who walks near it.")
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
					for(var/mob/Monsters/M in usr.Selected) if(M.Race == "Devourer")
						for(var/obj/Items/Traps/LW in oview(0,M))
							usr << "Too close to other trap!"
							usr.Up = 0
							usr.Close()
							return
						for(var/mob/Monsters/MM in oview(1,M))
							usr << "Cannot place so close to another unit."
							usr.Up = 0
							usr.Close()
							return
						if(M.EggContent >= 1)
							M.CreateCacoonTrap()
							M.EggContent -= 1
							usr.Close()
							break
					usr.Up = 0
					usr.Close()
		ClickBSTTrap
			name = "Bonespikes"
			icon_state = "BST"
			text = "B"
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
						if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
							for(var/obj/Items/Bones/Bones/W in M)
								usr.Function = "PlaceBoneSpikes"
								usr << "Click and drag to place bonespikes"
								usr.Up = 0
								usr.Close()
								return
							usr << "You need bones to place bonespikes."
					usr.Up = 0
					usr.Close()
		ClickRibTrap
			name = "Ribtrap"
			icon_state = "RibTrap"
			text = "R"
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
						if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
							for(var/obj/Items/Bones/Bones/W in M)
								usr.Function = "PlaceRibcage"
								usr << "Click and drag to place ribcages"
								usr.Up = 0
								usr.Close()
								return
							usr << "You need bones to place bonespikes."
					usr.Up = 0
					usr.Close()
		ClickStoneFall
			name = "Stonefall"
			icon_state = "StoneFall"
			text = "S"
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
						for(var/obj/Items/ores/stone/W in M)
							usr.Function = "PlaceStoneFall"
							usr << "Click and drag to place stonefalls"
							usr.Up = 0
							usr.Close()
							return
					usr.Up = 0
					usr.Close()
		ClickTraps
			name = "Pit"
			icon_state = "Trap"
			text = "P"
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
					for(var/mob/Monsters/M in usr.Selected) for(var/obj/Items/Traps/PitTrap/T in view(0,M))
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
						if(M.Race != "Lizardman")
							for(var/obj/Items/ores/stone/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
						if(M.Race == "Lizardman")
							for(var/obj/Items/woods/wood/W in M)
								M.CreatePit()
								M.weight -= W.weight
								del(W)
								break
					usr.Up = 0
					usr.Close()
		Stations
			name = "Stations"
			icon_state = "Station"
			text = "C"
			DblClick()
				usr.Stations()
		ClickFarm
			name = "Farming"
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
			name = "Farming"
			icon_state = "Farming"
			DblClick()
				usr.FarmLand()
		ClickTribalBridge
			name = "Tribal Bridge"
			icon='Cave.dmi'
			icon_state = "TribalBridge"
			DblClick()
				usr.Function = "PlaceTribalBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickBoneBridge
			name = "Bone Bridge"
			icon = 'Cave.dmi'
			icon_state = "BoneBridge"
			DblClick()
				usr.Function = "PlaceBoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickWoodBridge
			name = "Wooden Bridge"
			icon='Cave.dmi'
			icon_state = "WoodBridge"
			DblClick()
				usr.Function = "PlaceWoodenBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickStoneBridge
			name = "Stone Bridge"
			icon='Cave.dmi'
			icon_state = "Bridge"
			DblClick()
				usr.Function = "PlaceStoneBridge"
				usr << "Click and drag to place bridge<br>"
				usr.Close()
		ClickSecretWall
			name = "Secret Wall"
			icon='Cave.dmi'
			icon_state = "CaveWall"
			DblClick()
				usr.Function = "PlaceSecretWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickTribalWall
			name = "Tribal Wall"
			icon='Cave.dmi'
			icon_state = "TribalWall"
			DblClick()
				usr.Function = "PlaceTribalWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickElfWall
			name = "Elf Wall"
			icon = 'Cave.dmi'
			icon_state = "Elf Wall"
			DblClick()
				usr.Function = "PlaceElfWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickArrowSlit
			icon = 'Cave.dmi'
			name = "Arrow Slit"
			icon_state = "ArrowSlit"
			DblClick()
				usr.Function = "PlaceArrowSlit"
				usr << "Click to place arrow slits<br>"
				usr.Close()
		ClickDevourerWall
			name = "DevourerWall"
			icon = 'Cave.dmi'
			icon_state = "DevourerWall2"
			DblClick()
				usr.Function = "PlaceDevourerWall"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickWoodWall
			name = "Wooden Wall"
			icon='Cave.dmi'
			icon_state = "WoodWall"
			DblClick()
				usr.Function = "PlaceWoodenWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickStoneWall
			name = "Stone Wall"
			icon='Cave.dmi'
			icon_state = "DetailedWall"
			DblClick()
				usr.Function = "PlaceStoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickBoneWall
			name = "Bone Wall"
			icon='Cave.dmi'
			icon_state = "Bone Wall"
			DblClick()
				usr.Function = "PlaceBoneWall"
				usr << "Click and drag to place wall<br>"
				usr.Close()
		ClickWoodFloor
			icon='Cave.dmi'
			name = "Wood Floor"
			icon_state = "WoodFloor"
			DblClick()
				usr.Function = "PlaceWoodenFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()

		ClickFire
			name = "Campfire"
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
			name = "Gem Station"
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
						if(M.Race != "Kobold")
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
			name = "Melter Station"
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
			name = "Masonry Station"
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
			name = "Leather Station"
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
			name = "Kitchen"
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
			name = "Bonecrafting Station"
			icon_state = "Bone"
			DblClick()
				for(var/mob/Monsters/M2 in usr.Selected)
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
		ClickSmelt
			name = "Smelter Station"
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
					alert("This is a smelter  station, it can be used to create Ingots for armour and weapon creation or to create glass bottles out of sand.")
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
			name = "Metalcrafting Station"
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
			name = "Carpentry Station"
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
			name = "Meth Lab"
			icon_state = "Potion"
			DblClick()
				for(var/mob/Monsters/S in usr.Selected)
					var/list/menu3 = new()
					if(S.Race == "Human")
						menu3 += "Create"
					if(S.Race == "Goblin")
						menu3 += "Create"
					if(S.Race == "Svartalfar")
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
			name = "Poison Station"
			icon_state = "Pos"
			DblClick()
				var/list/menu8 = new()
				menu8 += "Create"
				menu8 += "Info"
				menu8 += "Cancel"
				var/Result8= input("What Action Will You Choose?", "Choose", null) in menu8
				if (Result8 != "Cancel")
					..()
				if (Result8 == "Info")
					alert("This is a posion extraction station, it can be used to extract posion from glands")
					return
				if (Result8 == "Create")
					for(var/mob/Monsters/M in usr.Selected)
						for(var/mob/WorkShops/LW in view(1,M))
							usr.Close()
							return
						for(var/obj/Items/woods/wood/W in M)
							M.CreatePoison()
							M.weight -= W.weight
							del(W)
							break
					usr.Close()
		ClickStoneFloor
			name = "Stone Floor"
			icon='Cave.dmi'
			icon_state = "DetailedFloor"
			DblClick()
				usr.Function = "PlaceStoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickTribalFloor
			name = "Tribal Floor"
			icon_state = "Tribal"
			icon='Cave.dmi'
			DblClick()
				usr.Function = "PlaceTribalFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickDevourerFloor
			name = "Devourer Floor"
			icon_state = "DevourerFloor"
			DblClick()
				usr.Function = "PlaceDevourerFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickBoneFloor
			name = "Bone Floor"
			icon='Cave.dmi'
			icon_state = "BoneFloor"
			DblClick()
				usr.Function = "PlaceBoneFloor"
				usr << "Click and drag to place floor<br>"
				usr.Close()
		ClickDigChannel
			name = "Dig Channel"
			icon_state = "Channel"
			DblClick()
				usr.Function = "DigChannel"
				usr << "Click and drag to dig channels for liquids<br>"
				usr.Close()