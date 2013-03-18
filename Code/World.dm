/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/

#define VERSION "1.0.3"
world
	name = "Dungeon Master"
	view = 9
	hub = "Ginseng.DungeonMaster"
	loop_checks  = 0

	New()
		status = "Version [VERSION]"
		log = file("ErrorLog.txt")
		LoadBans()
		Name()
		Date()
		Age()
		Aging()
		History()
		SeasonChange()
		RandomAttack()
		while(1)
			sleep(5000)
			Repop()
			Night()
			world << "<font color = red size = 3> .:Help:.Please visit the <a href=\"http://dungeonmaster.murrawhip.net/forum/index.php?topic=241.0  \">NewbieGuide</a>"
			for(var/mob/Monsters/m in world)

				if(m)
					m.Days += 1


					if(m.Underground == 0)
						if(m.SunSafe == 0)
							if(night == 0)
								if(m.Vampire == 1)
									if(m.DayWalker == 0)
										m.Owner << "<b><font color=red> [m] walks into the light and is burned badly!!"
										m.HP -= 25
										m.SunLight()
										m.destination = null
										if(m.HP <= 0)
											m.Freeze = 1
											sleep(2)
											m.GoingToDie = 1
											m.Killer = "The Sun"
											m.DeathType = "Being Burned"
											m.Death()


				if(m)
					if(m.Age >= m.DieAge)
						if(m.InHole == 0)
							m.HP = 0
							m.Owner << "[m] has died of old age!"
							if(ismob(m.Owner))
								var/mob/A = m.Owner
								A.UnitList -= m
							m.GoingToDie = 1
							m.Killer = "Old Age"
							m.DeathType = "Old Age"
							m.Death()

				if(m)
					if(m.Egg == 0)
						if(m.LizardMan)
							m.Preg = 0
					var/mis
					mis = prob(3)
					if(m.Preg == 1)
						if(mis == 1)
							m.Owner << "[m] has had a mis-carriage!"
							m.Preg = 0
							if(m.Spider == 1)
								m.Owner << "[m] did not mature correctly and died!"
								if(ismob(m.Owner))
									var/mob/A = m.Owner
									A.UnitList -= m
								del(m)
							if(m)
								if(m.LizardMan == 1)
									m.Owner << "[m] did not mature correctly and died!"
									if(ismob(m.Owner))
										var/mob/A = m.Owner
										A.UnitList -= m
									del(m)

						if(m)
							if(mis == 0)
								if(m.LizardMan == 1)
									if(m.Days >= 2)
										if(m)
											var/mob/E = m.Owner
											E.Owner << "[m] has hatched!"
											var/mob/Monsters/LizardMan/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m.Mum
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
											del(m)

								if(m)
									if(m.Spider == 1)
										if(m.Days >= 2)
											if(m.IsWorker == 1)
												var/mob/A = m.Owner
												var/CanHatch = 1
												var/Num = 0
												for(var/mob/M in A.UnitList)
													if(M.Spider == 1)
														Num += 1
												if(Num >= 25)
													CanHatch = 0
												if(CanHatch)
													var/mob/Monsters/WorkerSpider/G = new
													G.Dad = m.TheDad
													m.TheDad = null
													G.Mum = m
													G.loc = m.loc
													G.Owner = m.Owner
													G.IsWorker = 1
													G.Age = 1
													m.Owner << "Egg hatched!"
													G.Birth()
													G.name = "{[G.Owner]}"
													A.UnitList += G
												else
													m.Owner << "Egg died!"
												del(m)

									if(m)
										if(m.IsWarrior == 1)
											var/mob/A = m.Owner
											var/CanHatch = 1
											var/Num = 0
											for(var/mob/M in A.UnitList)
												if(M.Spider == 1)
													Num += 1
											if(Num >= 25)
												CanHatch = 0
											if(CanHatch)
												var/mob/Monsters/Spider/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.IsWarrior = 1
												G.Age = 1
												m.Owner << "Egg hatched!"
												G.Birth()
												G.name = "{[G.Owner]}"
												A.UnitList += G
											else
												m.Owner << "Egg died!"
											del(m)
									if(m)
										if(m.IsHunter == 1)
											var/mob/A = m.Owner
											var/CanHatch = 1
											var/Num = 0
											for(var/mob/M in A.UnitList)
												if(M.Spider == 1)
													Num += 1
											if(Num >= 25)
												CanHatch = 0
											if(CanHatch)
												var/mob/Monsters/HunterSpider/G = new
												G.Dad = m.TheDad
												m.TheDad = null
												G.Mum = m
												G.loc = m.loc
												G.Owner = m.Owner
												G.IsHunter = 1
												G.Age = 1
												m.Owner << "Egg hatched!"
												G.Birth()
												G.name = "{[G.Owner]}"
												A.UnitList += G
											else
												m.Owner << "Egg died!"
											del(m)


							if(m)
								if(mis == 0)
									if(m.Vampire == 1)
										var/mob/Monsters/Vampire/G = new
										var/mob/O = m.Owner
										G.Dad = m.TheDad
										m.TheDad = null
										G.Mum = m
										G.loc = m.loc
										G.Owner = m.Owner
										G.Age = 1
										if(O.DayWalker <= 2)
											G.DayWalker = prob(4)
										m.Owner << "[m] has given birth!"
										G.icon_state = "NoWings"
										G.Birth()
										G.name = "{[G.Owner]}"
										G.DieAge = rand(400,500)
										if(G.DayWalker == 1)
											m.Owner << "[G] has been born half a vampire and can walk in day!"

										if(ismob(m.Owner))
											var/mob/A = m.Owner
											A.UnitList += G
											A.DayWalker += 1
									if(m.Kobold == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Kobold/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BuildingSkill += m.BuildingSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											var/mob/Monsters/Kobold/G2 = new
											G2.Dad = m.TheDad
											m.TheDad = null
											G2.Mum = m
											G2.loc = m.loc
											G2.Owner = m.Owner
											G2.Age = 1
											G2.SpearSkill += m.SpearSkill/3
											G2.BowSkill += m.BowSkill/3
											G2.SwordSkill += m.SwordSkill/3
											G2.AxeSkill += m.AxeSkill/3
											G2.MaceSkill += m.MaceSkill/3
											G2.UnArmedSkill += m.UnArmedSkill/3
											G2.ShieldSkill += m.ShieldSkill/3
											G2.ArmourSkill += m.ArmourSkill/3
											G2.ForgingSkill += m.ForgingSkill/3
											G2.BuildingSkill += m.BuildingSkill /3
											G2.WoodCraftingSkill += m.WoodCraftingSkill/3
											G2.MetalCraftingSkill += m.MetalCraftingSkill/3
											G2.SkinningSkill += m.SkinningSkill/3
											G2.SmeltingSkill += m.SmeltingSkill/3
											G2.JewlCraftingSkill += m.JewlCraftingSkill/3
											G2.ButcherySkill += m.ButcherySkill/3
											G2.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G2.PosionSkill += m.PosionSkill /3
											G2.BoneCraftingSkill += m.BoneCraftingSkill/3
											G2.StoneCraftingSkill += m.StoneCraftingSkill/3
											G2.SneakingSkill += m.SneakingSkill/3
											G2.LockPickingSkill += m.LockPickingSkill/3
											G2.CookingSkill += m.CookingSkill /3
											G2.FishingSkill += m.FishingSkill /3
											G2.PotionSkill += m.PotionSkill /3
											G2.Birth()
											G2.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												if(m.Content3 == "Tamed")
													G.CanBeSlaved = 1
													G2.CanBeSlaved = 1
													G.CanBeCaged = 1
													G2.CanBeCaged = 1
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G
												A.UnitList += G2

									if(m.Race == "Orc")
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Orc/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G


									if(m.Goblin == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Goblin/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G

									if(m.Dwarf == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Dwarf/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G


									if(m.Human == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/Human/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(m.Black == 1)
												G.Black = 1
												if(G.Gender == "Male")
													G.icon = 'HumanBlack.dmi'
													G.icon_state = "Normal"
												if(G.Gender == "Female")
													G.icon = 'FemaleHumanBlack.dmi'
													G.icon_state = "Normal"
											if(m.Black == 0)
												G.Black = 0
												if(G.Gender == "Male")
													G.icon = 'Human.dmi'
													G.icon_state = "Normal"
												if(G.Gender == "Female")
													G.icon = 'FemaleHuman.dmi'
													G.icon_state = "Normal"
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G


									if(m.FrogMan == 1)
										if(m)
											m.Owner << "[m] has given birth!"
											var/mob/Monsters/FrogMan/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.SpearSkill += m.SpearSkill/3
											G.BowSkill += m.BowSkill/3
											G.SwordSkill += m.SwordSkill/3
											G.AxeSkill += m.AxeSkill/3
											G.MaceSkill += m.MaceSkill/3
											G.UnArmedSkill += m.UnArmedSkill/3
											G.ShieldSkill += m.ShieldSkill/3
											G.ArmourSkill += m.ArmourSkill/3
											G.BuildingSkill += m.BuildingSkill /3
											G.ForgingSkill += m.ForgingSkill/3
											G.WoodCraftingSkill += m.WoodCraftingSkill/3
											G.MetalCraftingSkill += m.MetalCraftingSkill/3
											G.SkinningSkill += m.SkinningSkill/3
											G.SmeltingSkill += m.SmeltingSkill/3
											G.JewlCraftingSkill += m.JewlCraftingSkill/3
											G.ButcherySkill += m.ButcherySkill/3
											G.LeatherCraftingSkill += m.LeatherCraftingSkill/3
											G.PosionSkill += m.PosionSkill /3
											G.BoneCraftingSkill += m.BoneCraftingSkill/3
											G.StoneCraftingSkill += m.StoneCraftingSkill/3
											G.SneakingSkill += m.SneakingSkill/3
											G.LockPickingSkill += m.LockPickingSkill/3
											G.CookingSkill += m.CookingSkill /3
											G.FishingSkill += m.FishingSkill /3
											G.PotionSkill += m.PotionSkill /3
											G.Birth()
											G.name = "{[G.Owner]}"
											if(ismob(m.Owner))
												if(m.Content3 == "Tamed")
													G.CanBeSlaved = 1
													G.CanBeCaged = 1
											if(ismob(m.Owner))
												var/mob/A = m.Owner
												A.UnitList += G

									if(m.Deer == 1)
										view() << "[m] has given birth!"
										var/mob/Monsters/Deer/G = new
										G.Dad = m.TheDad
										m.TheDad = null
										G.Mum = m
										G.loc = m.loc
										G.Owner = m.Owner
										G.Age = 1
										if(m.Tame == 1)
											G.Tame = 1


									if(m.Spider == 0)
										if(m.Beatle == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/DeathBeatle/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Mole == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/Mole/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Bug == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/CaveSpider/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											if(m.Tame == 1)
												G.Tame = 1
										if(m.Wolf == 1)
											view() << "[m] has given birth!"
											var/mob/Monsters/Wolf/G = new
											G.Dad = m.TheDad
											m.TheDad = null
											G.Mum = m
											G.loc = m.loc
											G.Owner = m.Owner
											G.Age = 1
											G.Birth()
											G.name = "{[G.Owner]}"
											if(m.Tame == 1)
												G.Tame = 1


						if(m)
							m.overlays -= /obj/preg/
							if(m.Egg == 0)
								m.Preg = 0


mob/Stat()
	statpanel("Units")
	for(var/mob/Monsters/M in usr.UnitList)
		stat("[M]", M)
	for(var/mob/Monsters/M in usr.Selected)
		if(M.Spider == 1)
			statpanel("Unit Stats")
			stat("Level", "[M.Level]")
			stat("EXP", "[M.EXP]/[M.EXPNeeded]")
			stat("Stomach Fullness", "[M.Hunger] / [M.MaxHunger]")
			stat("Tiredness", "[M.Tiredness]")
			stat("Cold Level", "[M.Coldness]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Strength", "[M.Strength]")
			stat("Agility", "[M.Agility]")
			stat("Defence", "[M.Defence]")
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
			stat("Web Content", "[M.WebContent] / [M.MaxWebContent]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("WoodCuttingSkill", "[M.WoodCuttingSkill]")
			stat("MineingSkill", "[M.MineingSkill]")
			stat("PosionSkill", "[M.PosionSkill]")
			stat("SneakingSkill", "[M.SneakingSkill]")
			stat("BuildingSkill", "[M.BuildingSkill]")
			stat("Posion Damage", "[M.PosionDMG]")
			stat("FishingSkill", "[M.FishingSkill]")
			stat("WoodCraftingSkill", "[M.WoodCraftingSkill]")
			statpanel("Inventory",M.contents)
			statpanel("Unit Information")
			stat("Name", "[M.name]")
			stat("Gender", "[M.Gender]")
			stat("Age", "[M.Age]")
			stat("Mother", "[M.Mum]")
			stat("Father", "[M.Dad]")
			stat("Date Of Birth", "[M.Born]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Head Condition","[M.Head]")
			stat("RightEye Condition","[M.RightEye]")
			stat("LeftEye Condition","[M.LeftEye]")
			stat("Teeth Condition","[M.Teeth]")
			stat("Brain Condition","[M.Brain]")
			stat("Throat Condition","[M.Throat]")
			stat("LeftLegs Condition","[M.LeftLeg]")
			stat("RightLegs Condition","[M.RightLeg]")
			stat("Heart Condition","[M.Heart]")
			stat("LeftLung Condition","[M.LeftLung]")
			stat("RightLung Condition","[M.RightLung]")
			stat("Spleen Condition","[M.Spleen]")
			stat("Gut Condition","[M.Guts]")
			stat("Stomach Condition","[M.Stomach]")
			stat("Liver Condition","[M.Liver]")
			stat("LeftKidney Condition","[M.LeftKidney]")
			stat("RightKidney Condition","[M.RightKidney]")
			stat("Bleeding Condition","[M.BleedType]")
		if(M.Wolf == 1)
			statpanel("Unit Stats")
			stat("Health", "[M.HP] / [M.MAXHP]")
			stat("Level", "[M.Level]")
			stat("EXP", "[M.EXP]/[M.EXPNeeded]")
			stat("Cold Level", "[M.Coldness]")
			stat("Strength", "[M.Strength]")
			stat("Agility", "[M.Agility]")
			stat("Defence", "[M.Defence]")
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
			statpanel("Unit Information")
			stat("Name", "[M.name]")
			stat("Gender", "[M.Gender]")
			stat("Age", "[M.Age]")
			stat("Mother", "[M.Mum]")
			stat("Father", "[M.Dad]")
			stat("Date Of Birth", "[M.Born]")
			stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
			stat("Head Condition","[M.Head]")
			stat("RightEye Condition","[M.RightEye]")
			stat("LeftEye Condition","[M.LeftEye]")
			stat("Teeth Condition","[M.Teeth]")
			stat("Nose Condition","[M.Nose]")
			stat("LeftEar Condition","[M.LeftEar]")
			stat("RightEar Condition","[M.RightEar]")
			stat("Brain Condition","[M.Brain]")
			stat("Throat Condition","[M.Throat]")
			stat("BackLeftLeg Condition","[M.LeftLeg]")
			stat("BackRightLeg Condition","[M.RightLeg]")
			stat("FrontRightLeg Condition","[M.RightArm]")
			stat("FrontLeftLeg Condition","[M.LeftArm]")
			stat("Heart Condition","[M.Heart]")
			stat("LeftLung Condition","[M.LeftLung]")
			stat("RightLung Condition","[M.RightLung]")
			stat("Spleen Condition","[M.Spleen]")
			stat("Gut Condition","[M.Guts]")
			stat("Stomach Condition","[M.Stomach]")
			stat("Liver Condition","[M.Liver]")
			stat("LeftKidney Condition","[M.LeftKidney]")
			stat("RightKidney Condition","[M.RightKidney]")
			stat("Bleeding Condition","[M.BleedType]")
			statpanel("Inventory",M.contents)
		if(M.Wagon == 0)
			if(M.Wolf == 0)
				if(M.Spider == 0)
					statpanel("Unit Stats")
					stat("Level", "[M.Level]")
					stat("EXP", "[M.EXP]/[M.EXPNeeded]")
					stat("Stomach Fullness", "[M.Hunger] / [M.MaxHunger]")
					stat("Cold Level", "[M.Coldness]")
					stat("Tiredness", "[M.Tiredness]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("Strength", "[M.Strength]")
					stat("Agility", "[M.Agility]")
					stat("Defence", "[M.Defence]")
					stat("Carry Weight", "[M.weight] / [M.weightmax]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("SpearSkill", "[M.SpearSkill]")
					stat("SwordSkill", "[M.SwordSkill]")
					stat("BowSkill", "[M.BowSkill]")
					stat("AxeSkill", "[M.AxeSkill]")
					stat("MaceSkill", "[M.MaceSkill]")
					stat("Un-Armed Skill", "[M.UnArmedSkill]")
					stat("ShieldSkill", "[M.ShieldSkill]")
					stat("ArmourSkill", "[M.ArmourSkill]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("WoodCuttingSkill", "[M.WoodCuttingSkill]")
					stat("MineingSkill", "[M.MineingSkill]")
					stat("WoodCraftingSkill", "[M.WoodCraftingSkill]")
					stat("MetalCraftingSkill", "[M.MetalCraftingSkill]")
					stat("SmeltingSkill", "[M.SmeltingSkill]")
					stat("JewlCraftingSkill", "[M.JewlCraftingSkill]")
					stat("LeatherCraftingSkill", "[M.LeatherCraftingSkill]")
					stat("PosionSkill", "[M.PosionSkill]")
					stat("BoneCraftingSkill", "[M.BoneCraftingSkill]")
					stat("StoneCraftingSkill", "[M.StoneCraftingSkill]")
					stat("SneakingSkill", "[M.SneakingSkill]")
					stat("LockPickingSkill", "[M.LockPickingSkill]")
					stat("CookingSkill", "[M.CookingSkill]")
					stat("PotionSkill", "[M.PotionSkill]")
					stat("FishingSkill", "[M.FishingSkill]")
					stat("BuildingSkill", "[M.BuildingSkill]")
					statpanel("Inventory",M.contents)
					statpanel("Unit Information")
					stat("Name", "[M.name]")
					stat("Gender", "[M.Gender]")
					stat("Age", "[M.Age]")
					stat("Mother", "[M.Mum]")
					stat("Father", "[M.Dad]")
					stat("Date Of Birth", "[M.Born]")
					stat("--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---")
					stat("Head Condition","[M.Head]")
					stat("Nose Condition","[M.Nose]")
					stat("LeftEar Condition","[M.LeftEar]")
					stat("RightEar Condition","[M.RightEar]")
					stat("RightEye Condition","[M.RightEye]")
					stat("LeftEye Condition","[M.LeftEye]")
					stat("Teeth Condition","[M.Teeth]")
					stat("Brain Condition","[M.Brain]")
					stat("Throat Condition","[M.Throat]")
					stat("LeftArm Condition","[M.LeftArm]")
					stat("RightArm Condition","[M.RightArm]")
					stat("LeftLeg Condition","[M.LeftLeg]")
					stat("RightLeg Condition","[M.RightLeg]")
					stat("Heart Condition","[M.Heart]")
					stat("LeftLung Condition","[M.LeftLung]")
					stat("RightLung Condition","[M.RightLung]")
					stat("Spleen Condition","[M.Spleen]")
					stat("Gut Condition","[M.Guts]")
					stat("Stomach Condition","[M.Stomach]")
					stat("Liver Condition","[M.Liver]")
					stat("LeftKidney Condition","[M.LeftKidney]")
					stat("RightKidney Condition","[M.RightKidney]")
					if(M.Vampire == 1)
						if(M.HasWings == 1)
							stat("Wings Condition","[M.Wings]")
					stat("Bleeding Condition","[M.BleedType]")



		else
			statpanel("Inventory",M.contents)
			stat("Carry Weight", "[M.weight] / [M.weightmax]")
	statpanel("Your Information")
	stat("Your Queen", "[usr.QueenLeader]")
	stat("Your King", "[usr.KingLeader]")
	stat("Land Name", "[WorldName]")
	stat("Date", "[Date] - [Ages]")
	stat("History", "[History]")
	stat("Kills", "[usr.Kills]")
	stat("Points", "[usr.Points]")



var/Winter = 0
var/Summer = 1
var/Spring = 0
var/Autumm = 0
var/WorldName
var/Date
var/History
var/Legends
var/Ages
var/night = 1

var/PlayerList = list()









/proc/SeasonChange()
	Seasons()
	spawn(10000) SeasonChange()
/proc/Seasons()
	Date += 1
	if(Summer == 1)
		if(Autumm == 0)
			if(Winter == 0)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Autumm!"
					Autumm = 1
					Summer = 0
					return
	if(Summer == 0)
		if(Autumm == 1)
			if(Winter == 0)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Winter!"
					for(var/turf/grounds/waters/water/W in block(locate(225,200,1),locate(954,789,1)))
						if(W.density == 1)
							if(W.Detailed == 0)
								if(W.CanFish == 1)
									W.overlays += 'Ice.dmi'
									W.density = 0
					for(var/turf/grounds/grass/G in world)
						if(G.density == 1)
							if(G.IsWall == 0)
								if(G.Detailed == 0)
									if(G.Tree == 1)
										G.overlays -= /obj/Trees/leaves3x2
										G.overlays -= /obj/Trees/leaves2x2
										G.overlays -= /obj/Trees/leaves1x2
										G.overlays -= /obj/Trees/leaves1x1
										G.overlays -= /obj/Trees/leaves2x1
										G.overlays -= /obj/Trees/leaves3x1
					for(var/turf/grounds/Trees/Tree1/T in block(locate(225,200,1),locate(860,789,1)))
						if(T.density == 1)
							if(T.IsWall == 0)
								if(T.Detailed == 0)
									if(T.Tree == 1)
										T.overlays -= /obj/Trees/leaves3x2
										T.overlays -= /obj/Trees/leaves2x2
										T.overlays -= /obj/Trees/leaves1x2
										T.overlays -= /obj/Trees/leaves1x1
										T.overlays -= /obj/Trees/leaves2x1
										T.overlays -= /obj/Trees/leaves3x1
					Winter = 1
					Autumm = 0
					return
	if(Summer == 0)
		if(Autumm == 0)
			if(Winter == 1)
				if(Spring == 0)
					world << "<b><font color=blue>It Is Now Spring!"
					for(var/turf/grounds/waters/water/W in block(locate(225,200,1),locate(954,789,1)))
						if(W.density == 0)
							if(W.CanFish == 1)
								W.overlays -= 'Ice.dmi'
								W.density = 1
					for(var/turf/grounds/grass/G in block(locate(225,200,1),locate(860,789,1)))
						if(G.density == 1)
							if(G.IsWall == 0)
								if(G.Detailed == 0)
									if(G.Tree == 1)
										G.overlays += /obj/Trees/leaves3x2
										G.overlays += /obj/Trees/leaves2x2
										G.overlays += /obj/Trees/leaves1x2
										G.overlays += /obj/Trees/leaves1x1
										G.overlays += /obj/Trees/leaves2x1
										G.overlays += /obj/Trees/leaves3x1
					for(var/turf/grounds/Trees/Tree1/T in block(locate(225,200,1),locate(860,789,1)))
						if(T.density == 1)
							if(T.IsWall == 0)
								if(T.Detailed == 0)
									if(T.Tree == 1)
										T.overlays += /obj/Trees/leaves3x2
										T.overlays += /obj/Trees/leaves2x2
										T.overlays += /obj/Trees/leaves1x2
										T.overlays += /obj/Trees/leaves1x1
										T.overlays += /obj/Trees/leaves2x1
										T.overlays += /obj/Trees/leaves3x1
					Spring = 1
					Winter = 0
					return
	if(Summer == 0)
		if(Autumm == 0)
			if(Winter == 0)
				if(Spring == 1)
					world << "<b><font color=blue>It Is Now Summer!"
					Summer = 1
					Spring = 0
					return

/proc/Night()
	if(night == 0)
		world << "<b><font color=blue>It Starts To Get Darker"
		spawn(500)
			night = 1
			world << "<b><font color=blue>Night Falls"
			for(var/mob/m in Players)
				for(var/obj/Hud/Day/D in m.client.screen)
					D.icon_state = "Moon"
		return


	if(night == 1)
		world << "<b><font color=blue>It Starts To Get Lighter"
		spawn(500)
			night = 0
			world << "<b><font color=blue>Day Rises"
			for(var/mob/m in Players)
				for(var/obj/Hud/Day/D in m.client.screen)
					D.icon_state = "Sun"
		return


obj/proc/AlarmTrap()
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.Owner == src.Owner)
				..()
			else
				if(src.HasPersonIn == 0)
					var/avoid = prob(M.SneakingSkill / 2)
					if(avoid == 0)
						src.Hole = 0
						src.IsSpiked = 0
						src.Owner << "<b><font color=red>Intruder! [M], [M.x],[M.y],[M.z]"
						del(src)
					else
						M.SneakingSkill += 0.1
	spawn(5) AlarmTrap()
obj/proc/BSTTrap()
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1)
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						var/avoid = prob(M.SneakingSkill)
						if(avoid == 0)
							M.LeftLegHP -= 3
							M.RightLegHP -= 3
							M.BloodContent -= 3
							M.BloodLoss()
							M.SneakingSkill += 1
							var/Break = prob(5)
							if(Break == 1)
								del(src)
								return
							var/Stun = prob(5)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!<br>"
						else
							M.SneakingSkill += 0.1
	spawn(5) BSTTrap()
obj/proc/RibTrap()
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1)
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						var/avoid = prob(M.SneakingSkill)
						if(avoid == 0)
							src.Hole = 0
							src.IsSpiked = 0
							view() << "<b><font color=red>[M] walks over a trap and their legs are crushed!"
							M.LeftLegHP -= 25
							M.RightLegHP -= 25
							M.BloodContent -= 20
							M.BloodLoss()
							M.SneakingSkill += 1
							var/Stun = prob(5)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!<br>"
							del(src)
						else
							M.SneakingSkill += 0.1
	spawn(5) RibTrap()
obj/proc/StoneTrap()
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.Owner == src.Owner)
				..()
			else
				if(M.Wagon == 0)
					if(src.HasPersonIn == 0)
						var/avoid = prob(M.SneakingSkill)
						if(avoid == 0)
							src.Hole = 0
							src.IsSpiked = 0
							view() << "<b><font color=red>A large stone falls on [M]'s head"
							M.HeadHP -= 50
							M.BloodContent -= 35
							M.BloodLoss()
							M.SneakingSkill += 1
							var/Stun = prob(50)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!<br>"
							del(src)
						else
							M.SneakingSkill += 0.1
	spawn(5) StoneTrap()
obj/proc/PitTrap()
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1)
				if(M.Owner == src.Owner)
					..()
				else
					if(M.Wagon == 0)
						if(src.HasPersonIn == 0)
							var/avoid = prob(M.SneakingSkill)
							if(src.IsSpiked == 0)
								if(avoid == 0)
									M.destination = null
									for(var/mob/A in world)
										if(A == M.Owner)
											A.Selected.Remove(M)
											A.client.images -= M.Star
									src.HasPersonIn = 1
									M.InHole = 1
									src.Hole = 0
									src.icon = 'Cave.dmi'
									src.icon_state = "Hole"
									view() << "<b><font color=red>[M] falls into a pit"
									M.Struggle()



							if(src.Posioned == 1)
								if(avoid == 0)
									if(src.IsSpiked == 1)
										M.HP  -= src.PosionContent
										M.LeftLegHP -= 70
										M.RightLegHP -= 70
										M.BloodContent -= 40
										M.BloodLoss()
										src.Hole = 0
										src.icon = 'Cave.dmi'
										src.icon_state = "Hole"
										src.IsSpiked = 0
										src.Posioned = 0
										src.PosionContent = 0
										view() << "<b><font color=red>[M] falls into a posionious spiked trap"
										var/Stun = prob(50)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
								else
									M.SneakingSkill += 0.1
							if(src.IsSpiked == 1)
								if(avoid == 0)
									M.LeftLegHP -= 50
									M.RightLegHP -= 50
									M.BloodContent -= 40
									M.BloodLoss()
									src.Hole = 0
									src.icon = 'Cave.dmi'
									src.icon_state = "Hole"
									src.IsSpiked = 0
									view() << "<b><font color=red>[M] falls into a spiked trap"
									var/Stun = prob(50)
									if(Stun == 1)
										M.Stunned = 1
										view(src) << "<b><font color=red>[M] is stunned!<br>"
								else
									M.SneakingSkill += 0.1
	spawn(5) PitTrap()


mob/proc/Level()
	if(src.Level >= 100)
		return
	if(src.EXP >= EXPNeeded)
		if(src.HasLeftArm == 1)
			if(src.FrogMan)
				src.LeftArmMaxHP += rand(1,2)
			if(src.Vampire)
				src.LeftArmMaxHP += rand(2,3)
			if(src.Kobold)
				src.LeftArmMaxHP += rand(0.75,1)
			if(src.Goblin)
				src.LeftArmMaxHP += rand(1,1.5)
			if(src.LizardMan == 1)
				src.LeftArmMaxHP += rand(2,3)
			if(src.Race == "Demon")
				src.LeftArmMaxHP += rand(2,3)
			if(src.Race == "Orc")
				src.LeftArmMaxHP += rand(2,3)
			if(src.Dwarf)
				src.LeftArmMaxHP += rand(2,3)
			if(src.Human)
				src.LeftArmMaxHP += rand(1,2)
			if(src.Wolf)
				src.LeftArmMaxHP += rand(1,2)
			if(src.Spider)
				src.LeftArmMaxHP += rand(0.50,0.75)
			if(src.LeftArmMaxHP >= 300)
				src.LeftArmMaxHP = 300
		if(src.HasRightArm == 1)
			if(src.Vampire)
				src.RightArmMaxHP += rand(2,3)
			if(src.FrogMan)
				src.RightArmMaxHP += rand(1,2)
			if(src.Kobold)
				src.RightArmMaxHP += rand(0.75,1)
			if(src.Race == "Demon")
				src.RightArmMaxHP += rand(2,3)
			if(src.Goblin)
				src.RightArmMaxHP += rand(1,1.5)
			if(src.LizardMan == 1)
				src.RightArmMaxHP += rand(2,3)
			if(src.Race == "Orc")
				src.RightArmMaxHP += rand(2,3)
			if(src.Dwarf)
				src.RightArmMaxHP += rand(2,3)
			if(src.Human)
				src.RightArmMaxHP += rand(1,2)
			if(src.Wolf)
				src.RightArmMaxHP += rand(1,2)
			if(src.Spider)
				src.RightArmMaxHP += rand(0.50,0.75)
			if(src.RightArmMaxHP >= 300)
				src.RightArmMaxHP = 300
		if(src.HasLeftLeg == 1)
			if(src.Vampire)
				src.LeftLegMaxHP += rand(2,3)
			if(src.FrogMan)
				src.LeftLegMaxHP += rand(1,2)
			if(src.Kobold)
				src.LeftLegMaxHP += rand(0.75,1)
			if(src.Goblin)
				src.LeftLegMaxHP += rand(1,1.5)
			if(src.Race == "Demon")
				src.LeftLegMaxHP += rand(2,3)
			if(src.LizardMan == 1)
				src.LeftLegMaxHP += rand(2,3)
			if(src.Race == "Orc")
				src.LeftLegMaxHP += rand(2,3)
			if(src.Dwarf)
				src.LeftLegMaxHP += rand(2,3)
			if(src.Human)
				src.LeftLegMaxHP += rand(1,2)
			if(src.Wolf)
				src.LeftLegMaxHP += rand(1,2)
			if(src.Spider)
				src.LeftLegMaxHP += rand(0.50,0.75)
			if(src.LeftLegMaxHP >= 300)
				src.LeftLegMaxHP = 300
		if(src.HasRightLeg == 1)
			if(src.Vampire)
				src.RightLegMaxHP += rand(2,3)
			if(src.FrogMan)
				src.RightLegMaxHP += rand(1,2)
			if(src.Kobold)
				src.RightLegMaxHP += rand(0.75,1)
			if(src.Race == "Demon")
				src.RightLegMaxHP += rand(2,3)
			if(src.Goblin)
				src.RightLegMaxHP += rand(1,1.5)
			if(src.LizardMan == 1)
				src.RightLegMaxHP += rand(2,3)
			if(src.Race == "Orc")
				src.RightLegMaxHP += rand(2,3)
			if(src.Dwarf)
				src.RightLegMaxHP += rand(2,3)
			if(src.Human)
				src.RightLegMaxHP += rand(1,2)
			if(src.Wolf)
				src.RightLegMaxHP += rand(1,2)
			if(src.Spider)
				src.RightLegMaxHP += rand(0.50,0.75)
			if(src.RightLegMaxHP >= 300)
				src.RightLegMaxHP = 300
		src.EXP = 0
		src.EXPNeeded += 50
		src.EXPNeeded += src.Level / 3
		src.Level += 1
		if(src.Race == "Devourer")
			src.Strength += rand(2,3)
			src.Agility += rand(0.5,1)
			src.weightmax += rand(20,30)
		if(src.Race == "Zombie")
			src.Strength += rand(0.5,1)
			src.Agility += rand(0.5,1)
			src.weightmax += rand(5,10)
		if(src.FrogMan == 1)
			src.Strength += rand(1,1)
			src.Agility += rand(1,3)
			src.weightmax += rand(10,20)
		if(src.Kobold == 1)
			src.Strength += rand(0.75,1)
			src.Agility += rand(2,3)
			src.weightmax += rand(10,20)
		if(src.Goblin == 1)
			src.Strength += rand(1,1.5)
			src.Agility += rand(1,2)
			src.weightmax += rand(15,25)
		if(src.LizardMan == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(1,2)
			src.weightmax += rand(26,36)
		if(src.Race == "Orc")
			src.Strength += rand(2,3)
			src.Agility += rand(1,1.5)
			src.weightmax += rand(27,37)
		if(src.Race == "Gargoyle")
			src.Strength += rand(2,3)
			src.Agility += rand(0.5,1)
			src.weightmax += rand(30,40)
		if(src.Dwarf == 1)
			src.Strength += rand(2,3)
			src.Agility += rand(0.75,1)
			src.weightmax += rand(30,40)
		if(src.Human == 1)
			src.Strength += rand(1,2)
			src.Agility += rand(1,2)
			src.weightmax += rand(20,30)
		if(src.Race == "Demon")
			src.Strength += rand(2,3)
			src.Agility += rand(2,3)
			src.weightmax += rand(30,40)
		if(src.Wolf == 1)
			src.Strength += rand(1,2)
			src.Agility += rand(1,2)
		if(src.Spider == 1)
			if(src.Queen)
				src.Strength += rand(3,4)
				src.Agility += rand(3,4)
				src.weightmax += rand(10,15)
				src.MaxWebContent += rand(15,20)
				if(src.PosionDMG <= 55)
					src.PosionDMG += rand(2,3)
			if(src.IsWarrior)
				src.Strength += rand(2,3)
				src.Agility += rand(2,3)
				src.weightmax += rand(10,15)
				if(src.PosionDMG <= 55)
					src.PosionDMG += rand(0.75,1)
			if(src.IsWorker)
				src.Strength += rand(0.5,1)
				src.Agility += rand(2,3)
				src.weightmax += rand(30,50)
				if(src.PosionDMG <= 55)
					src.PosionDMG += rand(0.30,0.50)
			if(src.IsHunter)
				src.Strength += rand(1,1.5)
				src.Agility += rand(2,3)
				src.weightmax += rand(10,15)
				if(src.PosionDMG <= 55)
					src.PosionDMG += rand(0.5,0.75)
		if(src.Vampire == 1)
			src.Strength += rand(3,4)
			src.Agility += rand(3,4)
			if(src.Old2)
				src.Old2 += rand(30,35)
			if(src.Old)
				src.Old += rand(30,35)
			if(src.Old == null && src.Old2 == null)
				src.weightmax += rand(30,35)
			if(src.E == 1)
				if(src.HasWings == 0)
					src.Owner << "[src] grows wings!"
					src.icon = 'Vampire.dmi'
					src.overlays += 'Wings.dmi'
					src.WingsOut = 1
					src.HasWings = 1
					src.Strength += rand(3,4)
					src.Agility += rand(3,4)
					src.weightmax += rand(25,50)
			if(src.E == 0)
				src.Owner << "[src] has evolved into a full vampire!"
				src.icon = 'Vampire.dmi'
				src.E = 1
				src.Strength += rand(3,4)
				src.Agility += rand(3,4)
				src.weightmax += rand(25,50)
		src.Owner << "[src] : I feel stronger!"
	if(src.Agility >= 100)
		src.Agility = 100
	if(src.Strength >= 100)
		src.Strength = 100
	spawn(50) Level()
mob/proc/AMBed()
	if(src.weight <= 0)
		src.weight = 0

	if(src.Sleeping == 0)
		src.Tiredness = 100
		src.Sleeping = 1
		if(src.HasWings == 1)
			src.icon_state = "Sleep"
		if(src.HasWings == 0)
			src.icon_state = "WSleep"
		if(src.E == 0)
			src.icon_state = "Sleep"
		src.destination = null
		if(ismob(src.Owner))
			var/mob/A = src.Owner
			if(A.User == 1)
				A.Selected.Remove(src)
				A.client.images -= src.Star
		spawn(300)
			if(src)
				src.Sleeping = 0
				if(src.HasWings == 1)
					src.icon_state = "Normal"
				if(src.HasWings == 0)
					src.icon_state = "NoWings"
				if(src.E == 0)
					src.icon_state = "Normal"
				src.Tiredness = 100
				src.said2 = 0
mob/proc/Bed()
	if(src.InfectedBy)
		return
	if(src.weight <= 0)
		src.weight = 0
	for(var/obj/Items/Furniture/Beds/B in view(0,src))
		if(src.Tiredness <= 20)
			var/CanSleep = 1
			for(var/mob/Monsters/J in oview(1,src))
				if(J.destination == src)
					CanSleep = 0
			if(CanSleep && src.Sleeping == 0)
				src.Tiredness += B.CR
				src.Sleeping = 1
				src.overlays += 'Sleep.dmi'
				src.destination = null
				if(ismob(src.Owner))
					var/mob/A = src.Owner
					if(A.User == 1)
						A.Selected.Remove(src)
						A.client.images -= src.Star
				spawn(300)
					if(src)
						src.overlays -= 'Sleep.dmi'
						src.Sleeping = 0
						src.Tiredness = 100
						src.said2 = 0
	spawn(5) Bed()



mob/proc/RunAway()
	if(src.Tame == 0)
		for(var/mob/Monsters/M in view(2,src))
			if (get_dist(src,src.RunAwayFrom) > 2)
				src.RunAwayFrom = null
			if(src.RunAwayFrom == null)
				src.RunAwayFrom = M
			if(M == src)
				..()
			else
				if(src.RunAwayFrom)
					step_away(src,src.RunAwayFrom)
	else
		return
	spawn(10) RunAway()










mob/proc/Hunger()


	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			if(src.HP >= 0)
				if(src.Spider == 1)
					if(src.WebContent <= src.MaxWebContent)
						src.WebContent += 25
						if(src.WebContent >= src.MaxWebContent)
							src.WebContent = src.MaxWebContent
						if(src.WebContent <= 0)
							src.WebContent = 0
				if(src.HP <= src.MAXHP)
					src.HP += 10
					if(src.HP >= src.MAXHP)
						src.HP = src.MAXHP
				if(src.Hunger <= 20)
					src.Owner << "<b><font color=red>[src] : I'm Hungry!"
					if(src.Carn == 1)
						if(src.Vampire == 0)
							for(var/obj/Items/M in src)
								if(M.CanEat == 1)
									if(M.Posioned == 0)
										src.weight -= M.weight
										src.Hunger = 100
										src.Owner << "<b><font color=red>[src] eats [M]"
										src.said = 0
										del(M)
										break
									if(M.Posioned == 1)
										src.HP = 0
										src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
										src.said = 0
										src.GoingToDie = 1
										src.Killer = "[M]"
										src.DeathType = "Posion"
										src.Death()
										del(M)
										break


					else
						for(var/obj/Items/Food/CookedMeats/M in src)
							if(M.CanEat == 1)
								if(M.Posioned == 0)
									src.weight -= M.weight
									src.Hunger = 100
									src.Owner << "<b><font color=red>[src] eats [M]"
									src.said = 0
									if(M.icon_state == "Tomato")
										var/obj/Items/Seeds/TomatoSeed/S = new
										S.loc = src.loc
										var/obj/Items/Seeds/TomatoSeed/S2 = new
										S2.loc = src.loc

									del(M)
									break
								if(M.Posioned == 1)
									src.HP = 0
									src.Owner << "<b><font color=red>[src] eats [M]......[src] was posioned by [M]"
									src.said = 0
									src.GoingToDie = 1
									src.Killer = "[M]"
									src.DeathType = "Posion"
									src.Death()
									del(M)
									break
			if(src.Hunger <= -10)
				src.HP -= 25
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Food"
					src.DeathType = "Starvation"
				src.Death()
			else
				if(src.InHole == 0)
					src.Hunger -= 1

	spawn(350) Hunger()
mob/proc/Gotoo()
	for(var/obj/Items/Furniture/Beds/B in orange(100,src))
		if(src.Goblin == 1)
			if(B.BelongsToGoblin == 1)
				src.destination = B
				return
		if(src.Dwarf == 1)
			if(B.BelongsToDwarf == 1)
				src.destination = B
				return
		if(src.Kobold == 1)
			if(B.BelongsToKobold == 1)
				src.destination = B
				return
mob/proc/NPCTiredness()
	if(src.NPC == 0)
		return
	if(src.Tiredness <= 20)
		src.Owner << "<b><font color=red>[src] : I'm Tired!"
		src.Gotoo()

	if(src.Tiredness <= -10)
		src.HP -= 25
		if(src.HP <= 0)
			src.GoingToDie = 1
			src.Killer = "Lack Of Sleep"
			src.DeathType = "Tiredness"
		src.Death()
	else
		if(src.InHole == 0)
			src.Tiredness -= 1
	spawn(300) NPCTiredness()
mob/proc/STiredness()
	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			if(src.Tiredness <= 20)
				src.Owner << "<b><font color=red>[src] : I'm Tired!"

			if(src.Tiredness <= -10)
				src.HP -= 25
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Sleep"
					src.DeathType = "Tiredness"
				src.Death()
			else
				if(src.InHole == 0)
					src.Tiredness -= 1

	spawn(350) Tiredness()
mob/proc/Tiredness()
	if(src.LoggedOut == 0)
		if(src.InHole == 0)
			if(src.Tiredness <= 20)
				src.Owner << "<b><font color=red>[src] : I'm Tired!"

			if(src.Tiredness <= -10)
				src.HP -= 10
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "Lack Of Sleep"
					src.DeathType = "Tiredness"
				src.Death()
			else
				if(src.InHole == 0)
					src.Tiredness -= 1

	spawn(300) Tiredness()

mob/verb/Update()
	usr.Updates()
mob/proc/Updates()
	html = {"
		<style>
		body{background:#000000}
		</style>
		<b><font color=red>Update Log</b><p>
		15th September 2007 - Made it so you can only get a max of 2 vampire day walkers per server session.
		<p>
		13th September 2007 - Made it so Fish always rot even when in wagons, to prevent too many being created.
		<p>
		11th September 2007 - Added flooding. Made it so water floods upper and lower stairs.
		<p>
		10th September 2007 - Made gremlims move slower. Made demon portals lead to hell.
		<p>
		8th September 2007 - Made skeleton warriors weaker. Made lizards lay eggs. Made arrows pass over water. Made arrows only hit their target and not any friendly units.Made it so flying vampires are un-able to feed.Fixed a bug that prevented anyone from walking on bridges.
		<p>
		7th September 2007 - Fixed a bug that allowed units to fire bows at the players avatar which resulted in the player being booted.Added a ClimbDownCliff option when using interract on top of a mountain.Made it so vampires must be stronger than their victims in order to suceed in biting them, if they are weaker they have a much lower chance.Made fire take twice as long to burn objects to ash.
		Made sure that no one cant be killed by making sure that at least 2 damage is dealt no matter how weak the attacker is.Fixed a bug that made wagons appear under tree tiles.Added female lizard icons. Added tails to lizardmen.
		<p>
		13th June 2007 - Made it so spiders no longer drop silk while bleeding before they grow a silk gland, NPC training posts now give exp, fixed a bug where you could build walls on water during winter causing them to show perm ice icon, Made aging slower, made it so units below the age of 5 grow up twice as fast. Demons can now fly once enslaved.
		<p>
		11th June 2007 - Made it so all RTS Mode races start with resources in their wagons.
		<p>
		5th May 2007 - Removed vote kick player due to abuse.
		<p>
		27th April 2007 - Added a vote kick player verb accessed by pressing / Added an ignore players whispers command accessed by pressing F.Allowed players to create 2 extra waypoints.
		<p>
		23rd April 2007 - Added a new spam filter to stop all spamming. Fixed mute so it now mutes the right person. Fixed ban so it now saves who has been ban from a server.Fixed boot so it works better.Fixed the chat logs so they are saved.
		<p>
		18th April 2007 - Made it so after a few years un-used items delete.
		<p>
		17th April 2007 - Made it so plants cant be caged. Made it so spiders cant get more than 50 defence.
		<p>
		15th April 2007 - Made it so spiders grow chitin armour over time, giving them more defence. Made falling from cliffs hurt.
		<p>
		14th April 2007 - Fixed a bug that did not allow you to create a wall where one had already been before. Added Mountain Peaks.
		<p>
		13th April 2007 - Made it so cave ins happen less.
		<p>
		12th April 2007 - Fixed a bug with unit count and enslaved units. Fixed a bug with tower cap seeds being planted.Changed vampire and spider starting skills and stats.Made it so frogmen can tear and skin bodies. Added trees to the outskirts of the ice lands.Edited some of the map.
		<p>
		11th April 2007 - Fixed a bug that did not allow orcs to use bone crafting.Made it so all races can create pillars.Fixed a bug that made guarding units attack wagons.Made it so lizardmen grow limbs back over time.Re-Vamped all races stats.
		<p>
		10th April 2007 - Added Orcs. Made orcs get cave fatigue. Added orcs floors and wall icons. Made orcs need tools to dig and chop trees with.Fixed a hunger bug.Lowered chance for vampire daywalker alot.Made it so arrows can be pulled out using i when lodged in a unit.Made seasons last alot longer.Made it so stunned units can no longer attack or move for a short time.
		<p>
		8th April 2007 - Fixed bug with spiders posion. Made it so certain skills have limits to prevent skill abusing.Greatly lowered the ammount of sneaking skill gained from avoiding traps.Made training posts take away tiredness but they will never be destroyed when trained on. Fixed a bug that did not make spider players unit count go up. Fixed a bug with spiders training posts.Added potion of internal healing for organs.Fixed a bug with ranged attacks.Fixed a bug with leather gloves.Fixed a bug that made stairs dis-appear.
		<p>
		7th April 2007 - Made it so skeletons cant be enslaved. Fixed a bug where wood from silk training posts would not delete correctly. Made it so cages can no longer be melted down.Fixed a bug that allowed people to cage enslaved pets.Made it so gremlins dont get stuck so often.Made it so gremlins wont eat traps.Made it so restarting does not delete cages.Made it so gremlin dont eat cages.Fixed a bug with cages and defence.Added silver gauntlets.Made it so you cant place more than one plant seed down in one area.Added leather gloves.Added leather helmets.
		Made the playing screen bigger.Reduced lag caused by procs.Moved the magma on the second map further away from the cliffs so people no longer get stuck on it as much.
		<p>
		5th April 2007 - Made it so bodies cant be destroyed using a melter workshop. Lowered the ammount of exp gained from melting items.
		<p>
		11th March 2007 - Fixed a bug involving arrows that cant be posion tipped.Adjusted deflection of arrows so that a highly skilled bowmen has more chance to hit a highly skilled swordsman, this is all now based on the swordsmans skills and also the bowmens skills.Fixed a bug that allowed swamp plants to attack even though they were dead.Made it so whisper and other verbs are no longer case sensitive.Updated spider help guide on browser upon login.
		<p>
		10th March 2007 - Fixed a bug with posion spore plants not dropping seeds. Made it so a vampire can no longer create stairs during the day outside.Greatly lowered the ammount of time a queen spider must wait before she can grow a silk and posion gland, as well as egg sack. Made skeletons die alot easier due to being frail. Added a mertialize button, this button will make you take physical form, it is currently only used to help you enter and exit stairs. Added an anti-multi keying code.Added a melter station that can be used to destroy useless items, exp will be given for each item.
		<p>
		9th March 2007 - Fixed a bug that made it so vampire could not be selected when in mist form.Made it so theres a 50% chance for arrows to break on training posts.Changed the movment system code. Made it so you can use (i) to make your unit run for a short while.
		<p>
		8th March 2007 - Made it so the build menu displays what materials are needed to build a certain station. Fixed a bug with bone gauntlets. Fixed a bug with vampires rest ability. Made vampire die less quickly while in the sun.Made it so units wont auto sleep during fights. Fixed a bug that did not allow AM units to wear crowns and become a king/queen. Fixed a bug with training posts that made your unit shoot its self with a bow. Fixed a bug where turning to mist as a vampire with a quiver equiped bugged your unit.Made it so gremlins cant be caged.Made it so gremlins can dig. Made it so gremlin cant be infected, this is so the gremlin can do its job correctly and clean up useless items.
		Lowered the ammount of building skill gained per wall created.
		<p>
		7th March 2007 - Fixed an overlay bug for bows when a units arm is missing.Fixed a bug with chitin gauntlets being mixed around.Made it so you cant use a bow if you are missing your right arm. Adjusted weapon skill gain rates again. Fixed a bug where metal training posts would not show up while attacking them. Made it so swamp plants can no longer grow through floors. Made it so units can plant swamp plant seeds in swamps. Fixed various bugs with the destroy floor option. Made ranged attacks give EXP. Fixed a bug that did not allow units to train bow skill from a training post. Fixed a bug where posion tipped arrows would not be posionious after being fired. Made ranged attacks stronger.
		Made it so bow skill adds to ranged damage.Added wooden spears. Added gremlin skin & meat.Made it so wagons are deleted when a player restarts, this is to stop un-wanted items lagging the server up.Made it so goblins can create bone walls, floors and bridges.
		<p>
		6th March 2007 -  Added posion roots from swamp plants. Made it so posion glands can be extracted from dead lizardmen.Made water in the tundras freeze correctly during winter. Added bamboo stairs for lizardmen. Changed icons on Metal,Silver & Gold armour.Added gremlins that go around eating useless items.
		<p>
		5th March 2007 -  Made weapon skills do a touch more damage. Slowed the gain speed on weapon skills a little.Made it so arrows have a chance to be deflected by swords or spears depending on skill.Updated all starting items for all races in adventure mode.Fixed a bug where shooting animals did not kill them.Fixed a bug involving tribal floors.
		<p>
		4th March 2007 - Added cave fatigue for lizards. Lowered chance for lizard to posion with fangs. Made frogmen immune to posion.Added builing skill, helps improve wall health. Fixed a bug with spades.Made lizardmans pit traps be created using wood.Made it so all races can plant tree seeds.Fixed a bug with skinning lizardman bodies. Fixed a bug with flasks not working.Increased range on pillars to 6 tiles.Slightly increased the damage done by arrows.Made it so you can posion tip arrows.Fixed a bug with posion weights.Made it so enslaved monsters can level up.
		Added different kinds of fish for the swamps. Made it so fishing no longer auto puts fish in a near by wagon, to avoid abuse and lag.Upgraded detail walls code.Made it so you cant have stairs leading up going through solid floors.Added chitin gauntlets.Fixed a bug involving glance chances when wearing armour.Made it so units no longer age when your offline.Made it so enslaved units need sleep and food.Fixed a bug that prevented people from becoming a special race.
		Added dangerous swamp plants.Fixed all bugs with potion crafting.Fixed a bug that did not allow units to gain sword skill.
		<p>
		3rd March 2007 - Added a new race called LizardMen. Added a new area to the map, the Swamps. Made LizardMen have posion fangs. Added LizardMan walls and floors. Added quivers and changed how arrows are stored and picked up.Fixed a bug with coin weight.Made it so spiders posion damage can no longer go above 60.Fixed a bug on age limits with breeding.Made bamboo plantable.
		<p>
		2nd March 2007 - Organised the build menu options on some of the workshops so they are less confusing.Cleaned the Death() proc up so its less laggy when used.Made it so the GUI icons on the work shop menu only show the things your race can build. Changed the in-game music. Fixed a bug with capturing your self in your own cage. Made it so the smelter smelts all ores in your inventory instead of one at a time. Made Skeletons stronger in order to prevent people abusing them.Fixed a bug where Kobolds could no longer destroy floors.
		Fixed a bug that let you abuse the Emote command. Fixed a bug involving the abuse of the weight system. Had to remove a bug that made the skills from a father not goto the child correctly, only the mother passes on skills now.Fixed a bug with the breed commands.Fixed a bug involving hunger and tiredness not stopping when a unit is in a cage.Fixed a bug where arrows would follow wagons around.Fixed a bug with cages involving units being selected.Fixed a bug that allowed you to create water using a stairs bug.Fixed a bug that let tamed creatures build.
		<p>
		3rd January 2006 - Fixed a bug with enslaved skeletons.
		<p>
		2nd January 2006 - Fixed a massive bug with blood content. Fixed a bug that made detail wall only detail already created walls and not cave walls.Made it so you can only fly as vampire so long as you have all your limbs, to prevent cheap fighting tactics.Added NPC Demons.Fixed a bug where making floor covered bridges.Fixed a bug where creating stairs would make a weight bug.
		<p>
		1st January 2006 - Fixed a bug that made bridges break during winter.Feeding for vampires now works regardless of hunger.Added bone gauntlets. Added gold gauntlets.Added Bows and arrows, to target click anyone, to stop targetting someone press P.Fixed a bug that did not allow you to drop potions.Fixed alot of bugs involved with potions.
		<p>
		31st December 2006 - Added skull maces. Added bone swords. Added bone bridges. Made armour skill work correctly. Changed throne icons.Adjusted goblins starting stats.Made it so the father and mother both give 1/4 of their skills to their young.
		<p>
		30th December 2006 - Fixed a bug that made silver training posts not show, fixed a bug that made encrusted helmets impossible to wear.Made it so you gain a little weapon skills from training posts. Made it so you can use flasks as a vampire to gather blood.Fixed a bug involving fish.Lowered chance for drills to break.
		Fixed a bug that made cactus turn to grass turfs.Added a alchemy list to the start up browser. Added garlic. Added garlic plants. Added garlic potion.
		<p>
		29th December 2006 - Fixed a problem that would not allow you to place walls over already destroyed walls.Made it so vampires can morph to human form at level 10, made it so vampire can no longer build floors to avoid the sun.Fixed a bug that allowed your units to breed with the escorts and get a strong baby.
		Fixed a bug that made any flooring that got caved in on useless.Adjusted the way bone spike traps do damage, they now do damage to a units legs and make them bleed very mildly.Adjusted rib cage traps.Fixed a bug involving gauntlets.Added wooden spades.Fixed a bug that made fishing break.Made it so there is a 20% chance for drills to break, this is to avoid mass usage of drills.Added silver training posts.Made the "Check Contents" option on cages display gender of unit inside.
		<p>
		28th December 2006 - Fixed a server crash bug, fixed a bug with frogs and cages, fixed a bug with frogs and children.Greatly adjusted weapons and armours stats.Made it so vampires can no longer steal items while flying.Added an all stop command, used by press P.Stopped breeding in AM to avoid bugs.Fixed a bug involving tower caps.Added a turn music off verb, used by pressing O.
		Fixed a bug that made chance for spider at 0%.Fixed a bug with traps.
		<p>
		26th December 2006 - Changed the ammount of blood that needed to be lost before dieing.Fixed a bug where destroying bridges would create walkable turfs and not water.Lowered the ammount of defence given from armours.Trippled the cool down time on vampires bite attack.Allowed wolves to carry items. Made the owners name appear with the wolves name.
		Fixed a bug with DeathBeatles. Wagons can no longer be trapped.Fixed a bug that allowed players to drill while not near a drilling item.Added split coins.Added wood bridges.Fixed a bug with NPC traders.
		<p>
		19th Novemeber 2006 - Fixed a slight bug with digging, where if you found a critter you could not kill it.Made it so you can now breed pets underground, added grape vine, you can plant grape vines underground.Finished spider build menu. Added rib cage traps for kobolds.Fixed a bug where stunned units would be stunned forever.
		<p>
		18th Novemeber 2006 - Added skeleton warriors, added skeleton tomb,
		<p>
		14th Novemeber 2006 - Fixed a bug with cages, fixed a problem with the path finder.Made it so full plate helmets protect the neck from vampire bites.Made it so if a vampire bites somone with a plate helmet on, the vampires teeth shatter.Made it so vampire needs teeth to bite or feed.Lowered the chance for attacks to glance off armour.Added un-holy plate armour, found in skorns temple.Made it so you can put slaves in cages.
		Made furniture impressiveness on beds effect how well your units sleep.Removed option to kill contents in cages.Fixed a bug involving the number of units owned and an escort.
		<p>
		12th Novemeber 2006 - Added frog men, made it so you can enslave them using cages.Added statues. Made it so cave spider has a slight chance to drop slik when its meat is torn for food.Fixed enslave frog man, fixed a bug with die ages.
		<p>
		11th Novemeber 2006 - Added escorts.Lowered chance for day walker from 35% to 15%.
		<p>
		10th Novemeber 2006 - Fixed a bug where vampires could fly over water during day time.Lowered the ammount of blood lost when hit by a mace.Changed the way crippled arms work, before having a crippled arm would not let you pick things up, now you must have both arms crippled before this happens.
		Fixed a few problems with the NPC AI.Added potions of long life, you will need a cut diamond and spider silk in order to create one, spider silk can be gained from tearing meat from spiders, there is only a 20% chance to find silk.Fixed a bug with wolves level up.Updated the rules a little.Made it so the anti spam does not limit the ammount of text you type as much.
		Made silver spears hurt vampires for an extra 10-20 damage on top of normal weapon damage.
		<p>
		8th Novemeber 2006 - Fixed a bug where NPC would not fight back.Fixed a bug where making stairs on lava or bridges would bug the stairs.Lowered chance for infect on vampires from 25% to 15% to avoid mass infection.Fixed auto dig, it does not allow you to auto dig at stone or anything but cave walls.Made it so vampires dont die so fast from water or light damage.Made water attacks burn the skin of a vampire making them loose blood instead of a near instant kill.
		Made it so when you log off your units dont age.Fixed a bug where you can no longer get a king/queen after they die.Upped the chance to stun a target or make them faint.Fixed a bug where doors could not be attacked.Fixed lock picking.
		<p>
		6th Novemeber 2006 - Fixed the dreaded "Info Bar Bug" this was done by replacing the AI path finding with something a little bit different.Made it so Kobold NPC can no longer walk while blind or with no legs.Made it so NPC and wolves have a resistance to cold.Fixed a bug where NPC Kobold had no blood.Lowered the time it takes for bodies and semi useless items to decay.Made it so AM players can now use world chat.Added anti spam to all forms of talk.
		<p>
		4th Novemeber 2006 - Added anti-spam.Made it so you can not mass fish, this should reduce the ammount of lag caused in game.Fixed a bug with the reboot verb for admins.Added IP ban.
		<p>
		30th October 2006 - Changed some of the laggy procs, they should not work smoothly. Added potion creation for Human and Goblins, added glass forge for Humans and Goblins, Humans and Goblins can now create Potions of Restoration using fungus and tree seeds.
		<p>
		29th October 2006 - GREATLY reduced lag and number of mobs that use lists.Fixed a problem with stairs and AM.Cleaned up building, made it so you can only access certain menus when you have the right materials.Fixed a bug that would delete units.Made it so AM females may start a family.Fixed a bug where you built over silk bridges and it would destroy them.Removed spiders from beta.
		Added an evil goblin fortress. Added NPC Kobolds who travel around stealing items. Made it so there is a chance based upon your sneaking skill to steal somthing and not get cought.
		<p>
		28th October 2006 - Fixed a bug with wooden walls, fixed a bug that made stairs not show during season change.Lowered hard silk walls HP a little.Changed how many spider minions a player can have from 20 to 17 due to balance issues.Fixed a bug where auto dig would create non-dense walls.Fixed a problem with minion count not going down.Made followers of skorn stronger.Made Human guards immune to posion, this is to avoid item snatchers.Increased spider fishing skill and humans jewl crafting skill to 10.
		Started work on adventure mode.Fixed a bug where all units started at level 5.Fixed a bug where all units would start with 50 weight.Fixed a bug that made tomatos not give seeds all the time.
		<p>
		27th October 2006 - Added worker spiders.Lowered chance for mis-carridge down to 3%.Fixed Info bar bug hopefully.Shortened spider alert messages. Added a message to indicate if a unit has a crippled arm.Lowered posion damage for spiders a little to balance them better.Gave NPC Humans random names.Made it so weapon skill gaining works with the new combat system.Removed some useless un-used skills.
		<p>
		26th October 2006 - Fixed a bug where spider eggs would be the only things that would mis-carridge. Added gender for Warrior spiders and Queen.Fixed a bug where NPC would make a units movement crash.Fixed a bug where spiders could never bleed.Added spider breeding between mature queen and warrior.Fixed a bug that allowed vampire to sit in snow during day.Made it so vampire can walk around on stone tiles during day and not get burned.Made it so vampire cant make floors, this is to avoid vampire from making floors just before the sun comes up and being safe.Fixed a bug with damage from sun not kicking in correctly casuing errors.
		Had to remove pick up unit feature to avoid bugs.Switched wooden wall and wooden floor icons over with each other.Changed the way coins work.Added a potion NPC to the map, he/she will sell potions that heal limbs, but will ask for coins in return.Fixed a problem where auto heal over time would not restore limb HP to its max.Made it so if a unit steals from an NPC they will always be attacked by that race on sight.Made it so you can now combine coins.Made it so you can combine coins together.Added human NPC town.Added create lair for spider queen.Added Human keep in NPC town.Made it so pillars are none dense.
		<p>
		24th October 2006 - Made it so you can see your spiders posion damage.Fixed a bug where you could press cancel while re-nameing a unit and get a unit with no name.Added warrior spiders.Raised spider limit from 15 to 20.Made it so spiders are immune to posion.Changed spiders chance to posion per hit from 1% to 3%.
		<p>
		23rd October 2006 - Spiders and Vampire can now sleep out side if they want to. Changed spiders sneaking skill from 45 to 60.Changed Spider Queens die age to 450-500 years. Changed spider queens starting stats.Spider queen is now slower at digging and chopping.Added new spider queen icons.Increased chance for spider by 10% it is now 20% like vampire.Made it so limbs get tougher as you level resulting in more HP and less limb loss chance.Made posion tipped weapons work with the new combat system correctly.Made it so spiders spawn randomly like vampies.made it so Spider queens posion damage goes up by 10 each year.Added different stages to the spider queens life.
		<p>
		22nd October 2006 - Made it so you dont loose so much blood when bleeding.Made chopping trees work like the digging system.Improved icons some more.
		<p>
		21st October 2006 - Made it so you can pick up wounded units using "i", this will let you carry them to safty.Added a new combat system, it is currently in BETA and may contain alot of bugs.Fixed a bug where females would sleep and then their icon would no longer show.Fixed a bug where spiders could not move.Fixed a bug where stunned or fainted units could dodge.Fixed a bug where certain NPC had major defences that no weapon could get through.Fixed a bug where when a unit lost two limbs their icon would not show.
		<p>
		20th October 2006 - Added a major re-vamp to the digging system, it works the same as before but uses no List functions and is overall less buggy.Made Kobold stairs look different to other races stairs.Added extra information to the death log,accesed by pressing "K", Such as who killed who and the type of death.Added a evil cult known as "The Followers of Skorn".
		<p>
		9th October 2006 - Fixed a bug where human could not create stone pillars.Fixed a bug where certain items could not be seen.Updated grahpics.Re-Added report bug, press V to report and M to view bugs.
		<p>
		8th October 2006 - Made it so when a vampire flys their tiredness is halved.Fixed a bug with vampires minion count.Fixed a bug where you could not carry cacoons if you were not spider.Fixed a bug where death beatles would no longer attack.Fixed a bug where vampire could stand in sunlight for a long time.Made it so you can no longer instantly kill other peoples units when they are in cages but can still do so to pets.Added an admin vote system designed to give the player a yes/no repsonse on questions such as "Shall we reboot".
		Made it so there is a chance for you to escape pit traps every so often.Gave Kobolds a little less HP to balance their fast breeding.Added bone crowns.Added bone thrones.Added tower cap seeds.Added "Legends" you can access it by pressing K, it keeps track of all the units in the world that have died.Added tree seeds.Had to remove grouping because of an error with "Maxium Number Of Lists Exceeded"
		Added farming, you can now find tomato plants around the world, eat them and plant their seeds in farm land. To make farm land get a spade and press B.
		<p>
		7th October 2006 - Added a cooldown on vampires bite again.Added an anti-HTML code.Made it so vampire is immune to cold.Fixed a bug where vampire could walk in day time on a desert.Fixed a bug where you could build workshops as a spider.Fixed a bug where wolves could wear armour.
		Fixed a bug where vampire could equip armour when in mist form.Made it so vampires cant get double defence from a mist bug.Fixed a bug where daywalker would be invisible.Can build bridges over lava now.Made it so dwarfs have a resistence to cold.Fixed a bug where dwarf CookingSkill was at 0.Fixed a bug where random tiles would go during season changes.Fixed a bug where you could create cave flooring out side of a cave.
		Removed some useless vars.Added a world history. Added world date and Age name.Added date of birth for units.Fixed a problem with starting locations.Added bone training posts.Made it so you can see who minions belong to.
		<p>
		6th October 2006 - Fixed a bug with Cave Fatigue going into -'s.Removed a bug with Day/Night on login, still needs fixing a little but stable.Fixed a bug with Cactus.Made it so you only get warm in hot areas when its day time.Fixed a bug where you could use unit speak in the area you could see and not your unit.Fixed a bug with moles.Fixed a bug where you could restart for vampire and spider.Fixed a bug with cages.
		Fixed a bug where drills would go when drilling.Fixed a bug where you could not remove certain items from a chest or wagon.Gave each race that can craft 10 LeatherCraftingSkill.Added wooden training posts.Made it so you can place work shops closer together.
		<p>
		5th October 2006 - May have fixed a bug with max number of lists packing servers up.Fixed a bug where using E or A you could select a unit in a cage, this would cause a huge run time error.Fixed a bug where you could put more than one head on a spike.Fixed a bug where a gold training post would be made from metal.Fixed a bug with weight on fungus.
		May have fixed a bug related to the day/night HUD crashing.Added a message for when you leave world chat, so that new players know how to re-enter it.Made it so Kobolds have two children each year.Added a new admin system provided by Murrawhip.Made it so there are no longer any instant deaths unless your HP is lower than 100.Removed the coins that your first units start with.
		Removed flooding, caused to much lag and was a pain anyway.Made it so there are no instant deaths for units who do not sleep or eat, instead they loose HP.May have fixed a bug where spiders minions would brake.Made it so Kobolds can live longer in icy enviroments but not hot ones.Made it so wearing chest plates will reduce the speed your cold level goes up.Made it so camp fires warm units up.
		Added flasks, must be filled up at a water source, can be used to kill vampires with or lower chances of dieing in hot areas.Added Cactus.Fixed a bug where walking on snow/desert would not make cave fatigue go down.Fixed a bug where walking on stone flooring would not reduce cave fatigue.
		<p>
		4th October 2006 - Removed PayDay. Made chance for day walker to 35%.Added silk training posts.Fixed a bug where stats would freeze.Fixed a bug where trees would go un-dense.Fixed a bug where walls would go.Fixed a bug where weight from spiders silk posts would not go.Fixed a bug with restart.
		Fixed a bug where vampire would die from sun light while in caves.Fixed a bug where Toxic was not working.Fixed a bug with weight on wooden spikes.Fixed a bug where you can put more than one head on a spike.Fixed a bug where skulls were not named after the person who used to own them.Made maps alot bigger.Added desert, if you walk in the desert too much and your cold level reaches -100 you will faint and die.
		Added flooding, it is still in beta and may be removed if lag is caused.Increased chance to find silk from spiders.Made it so cave spiders and moles breed underground.Removed report bug, maybe causing a server crash.Added packs of wolves.Fixed a bug where info messages would not show.Fixed a bug where if someone died of old age in a cage you could not use that cage again.
		Made it so tearing meat from moles gives skin.Fixed a bug where detailed floors would not make cave fatigue go down.
		<p>
		3rd October 2006 - Fixed a bug where days would go too fast.Made the first minions you start with have coins.Fixed a bug where you could not equip silver,gold or metal diamond encrusted items.Made it so minions demand payment every 3 days and not 1.Made it so you gain skill at crafting even if you fail.
		Added snow.Added cold level, if you walk around in the snow too much your cold level will rise, if it goes above 100 you will freeze.Fixed it so humans have more than 10 wood crafting skill.
		<p>
		2nd October 2006 - Fixed a run time error that may have been crashing servers.Added new HUD graphics.Lowered chance of cave ins by a little.Greatly reduced the ammount of Cave Fatigue that Humans get.Made failing based on your skill, an example would be 10 wood craft = 40% chance to suceed.Fixed a bug with gold pillars.
		Made pillars stop cave ins in a wider area.Fixed a bug where if you clicked a wall with Dig on, that wall would turn back to a cave wall.Fixed a bug where taming creatures would make your unit count flux.Added drills for humans.Added a use for Diamonds.Added time of day to HUD.Added pay day, every day your minions will want a coin, if you do not pay them for a long time after they ask for one they will strike.
		<p>
		1st October 2006 - Had to remove cool down on vampires bite due to bugs.Added a drop all contents option to chests.Fixed a bug where you could craft epic quality items right away.
		Added chitin buckler and bone buckler.Added small pockets of water on map two.Fixed a bug with the weight on wagons and chests.Fixed a bug where humans would keep going to a location that had been set for digging even if it did not exsist anymore.Fixed a bug where you could not build
		where a tree used to be.Fixed a bug where you could not build walls using wagons.Made bug meat cookable again.Fixed a bug with weight.Fixed a bug where units would sleep and dig at the same time.Changed spiders sneaking skill from 50 to 45 so that they do not always avoid traps.
		Spider eggs now take 2 days to hatch.Fixed a bug where spiders avoid trap was at 100% chance.Added a destroy floor option.
		<p>
		30th September 2006 - Made it so attacking walls will not give exp.Added a "Dungeon Keeper" digging system.Updated help guide to include the new digging system.
		<p>
		29th September 2006 - Fixed a bug where if a unit had turned to a vampire and was still selected by its old owner, the old owner could control it.Made it so pit traps are deleted once someone has been rescued or captured from one.Made it so sneaking skill effects how well you avoid traps, 20 sneaking skill would mean a 20% chance.Made walls stronger.It is now level 15 for a vampire to turn into mist.Made it harder to find bugs.Can
		no longer cook bug meat because it is too stringy and falls apart when heated.Made bone armour add to your attack damage due to the spikes and random bone peices that stick out.Made metal type armour alot heavier.Made it so there is a small chance of failing at crafting.Made it so you dont need wood or stone to detail floors.Fixed a bug where you would only get a message for hunger once. Fixed a bug with the overlays on items.Made Cave Fish dangerous to Humans and Dwarfs.
		Made it so you cant breed deer undeground. Made it so death beatles are stronger.Made death beatles able to breed.Fixed a bug where you could hold two units in one cage.Fixed a bug where you could not attack doors, Made door control better, can lock doors, and only lock them when they are closed, you can only open doors if they are un-locked regardless of if the door belongs to you.Fixed a bug where vampire spider queens could lay eggs.Made guarded units attack things that are close to them instead of very far away.
		Made it so Pillars stop cave ins. Made it so attacking walls will not give exp.Added a "Dungeon Keeper" style digging style.
		<p>
		28th September 2006 - Removed breed from the interact menu for vampires as to remove bugs. Fixed a bug where combining posion would take away all posion in your inven.Fixed a bug where if you capture someone and they then restart the cage you used to capture that persons unit in would have no creature in it.
		Fixed a bug where you could not click on a tamed animal and get information about it.Fixed a bug where beatles would try to attack wagons.Fixed a bug where spiders minion numbers would be wrong somtimes.Added a report bug feature, you can report a bug by pressing V or view a bug by pressing M.Made it so you
		can take heads and put them on spikes.Made spiders posion damage go up a little each level.Made posion weapons do posion damage based off of the ammount of posion extracted from a gland. The ammount extracted is based off of the units Posion Skill.Added Toxic, a far more posionious subbstence than normal posion, found from death beatles.
		Added a guard verb, can be accessed by pressing J. Guard Will make it so if one of your units is attacked they will attack back.Made it so Humans get 3 logs per tree. Added cave ins.Added extra graphics to works shops to help dis-tinquish between them.Increased chance to find stone. Added weaknesses to races. Vampire and Dwarf have a weakness to Spear type weapons, Goblins and Kobolds have a weakness to slashing weapons..
		Humans have a weakness to blunt weapons.Added a drop all items in wagon feature.Made it so if humans spend too long underground their sanity fades and they kill them selves.
		Fixed a bug where wolves could talk.Fixed a bug where wolves could carry wagons.Made it so H shows a players Race.Fixed a bug where if you took items away from a caged unit they could never equip leggings again.
		<p>
		27th September 2006 - Kobold Breeding restored to normal rates as to avoid bugs. Made it so you can only stab vampires while they sleep. Made vampires mist last forever till canceled but also made it so vampires can not steal items in mist form.Fixed a few bugs related to vampire turning to mist.
		Changed spider eggs hatching speed to avoid bugs.Fixed a bug that made your units tirdness and hunger never go down once you logged in then out again.
		<p>
		26th September 2006 - Added a limit of 15 spiders at any given time per player.Made it a 15% chance to get spiders as a choice on log in. Fixed a bug where quite a few items were made from metal even though they were gold.Made it so spider can no longer wear shields.
		Fixed a bug where tamed wolves could be used by an enemy.Fixed a bug where you could declare a spider king or queen and give them a crown to wear.Added a cool down on stab vampire in heart.
		Fixed a possible bug where kobold breeding would set the game to freeze for 1 min while its proc was executed.Fixed a possible bug where spider eggs would set the game to freeze for 1 min while its proc was executed.Made it so the E and A keys do not select Wagons. Added Wooden Chests.
		<p>
		25th September 2006 - Fixed a bug where Training Posts would not die. Death Beatle now attacks back. Fixed a few run time errors that would cause NPC to stop fighting. Posion does not instant kill anymore, instead it critcally strikes an opponent for 100 damage.
		made gold and silver bars make 5 coins each. Made it so you can combine posion with spiked pit traps.Made it so you can place traps next to each other. A BAN verb as been added.Fixed a bug that showed Gold axes as Metal ones.Made it s 20% chance to kill a vampire with a spike while its NOT sleeping.
		Added lava to the basement map. Fixed a bug where a silver shields could not be equiped. Fixed a bug where you could not capture Beatles.Fixed a bug where turning to mist as a vampire would make you un-able to equip items. Made it so you have to be level 10 in order
		to use Mist Form as a vampire. Made it so Vampire cant bite while in mist form.Made it so Vampire cant stab them selves in the heart with a spike. Made it so Vampire cant feed from tower caps. Fixed a bug where tower caps would auto go inside a wagon.Made metal smithing harder to gain skill with.
		Removed spam message from when an animal is too old to breed. Added Spiders. Made spider HP a little lower.Fixed it so you dont get called a theif for clicking NPC items that are far away. Fixed a bug where spider queen had vampire abilites and vampire had none. Added rare Spider Silk.Made it so units wont age while
		user is offline.Made spider eggs take a little longer to hatch. Added a chance that spider eggs will not mature correctly.Changed spiders posion fang damage from 100 to 25.Spiders now level correctly.
		Made spider tiredness go down slower than other races.Made raw meats regenerate 25 web content for spiders.Added sticky pit trap for spiders.Added Cacoon cages for spiders.Fixed a bug where you would eat meat but the weight was not being taken away after.Removed captial letters from chat.
		<p>
		24th September 2006 - Made it so creatures age while their user is offline, this is to help prevent mass ammounts of units causing lag. Tryed reducing lag from a few procs. Made it so you can see your creatures levels. Upped
		the Vampires starting stats a tiny bit to avoid it getting killed when starting off. Made wolves level up correctly. Made
		it so Kobolds and Goblins are the only ones who can craft using bone. Added Death Beatles. Edited the Death Proc, before it would be assigned to every creature in the game and tick through an infinite loop every second, this has been changed to avoid huge lag, now it is only called upon when needed.
		Added a small chance for a mis-carriage. Added shells that can be gotton from Beatles. Added toxic glands. Made it so vampire cant walk across bridges due to waves that hit the bridge. Made stairs that go up. Added Fungas from Tower Caps.
		Added drink posion command, maybe useful if infected by vampire. Added unit grouping, accesed by selecting units and pressing Y key. Fixed a bug where bone chest plate would show as on when taken off. Added Chitin Armour made from shells. Made it so a level
		5 Vampire can turn into mist for a short time. Fixed a bug that would make wolves not able to die.Made Kobold breeding twice as fast as other races.
		<p>
		23rd September 2006 - Made it so items like ores and ingots, food and skins, will be deleted after 10 mins if not being carried. Fixed a bug that made vampires eat meat if they had it in their inventory and they were hungry.
		Made it so Vampires cant bite while flying. Greatly lowered chance to get fish at first due to the incomprehensible ammount of lag being caused. Fixed a bug that did not allow you to go down stairs that were built on grass. Fixed a bug where silver items
		were made from either gold or metal. Greatly increased doors and walls Health. Added secret walls. Added a new source of wood, it comes from a half tree
		half plant hybrid that grows underground. It is called a Tower Cap Plant. Added Seasons. Added a use for Rubies and Emeralds. Added a HUD. Fixed a bug where Vampires would get killed from water even though flying. Fixed a bug where Vampires could go invisible by sleeping.
		Fixed a bug where Vampires could bite and infect other Vampires. Fixed a bug that would not allow you to detail walls in a basement. Fixed a bug that allowed your minions to breed with Tower Caps.
		Fixed a bug where you could not skin or take meat from human bodies. Fixed a bug that would not let you create Bone Doors. Fixed a bug where you could control NPC. Fixed a bug where Tower Caps bodies would be bugged inside wagons.
		<p>
		22nd September 2006 - Fixed a bug that allowed Vampires to stand in daylight and not die. Fixed a bug related to the restart verb. Finished Vampire Race, 25% chance of being vampire on log in, wont work if you keep relogging.
		Made it so theres a chance to instantly kill with posioned weapons. Made it so when the Vampire that infects victims dies so do the victims. Made it so if a creature is a vampire and is due to have a baby that there is a 20% chance of the baby becoming a day walker.
		Made it so Vampires cant breed, this is to prevent breed spam in order to gain a day walker. Added a small cool down time on Vampires bite as to avoid spam infection. Added a remove king/queen function, just press D on a king/queen.
		<p>
		21st September 2006 - Fixed a bug where Tamed animals babies would not be tame like their mother. Made it so you cant make creatures who are too young or too old to breed. Made it so Hunger and Tiredness wont be in effect when you log out. Made it
		so the first three people you start with have sleeping bags already. Added Bone Walls for Kobolds. Add Silver armour and spear. Was unable to make it so children get a quarter of their parents skills, this is due to lag it created and other issues, it now
		remains and will remain the same as before, where the child gets half the females skills. Fixed a bug that did not allow wolfs to attack deer. Added Vampire, it is in its beta stage and there is only a 5% chance of getting the choice
		of being one on start up. Made it so your creatures do not age while your logged off. Made it so wolves can no longer equip or
		carry items. Added bone doors for goblins, kobolds and vampires. Fixed a bug that made hunger and tiredness crash.
		<p>
		20th September 2006 - Made wall and doors Healths alot higher as to make lock picking useful. Fixed a bug where gold armour was using metal ingots instead of gold bars in order to be created. Fixed a bug where
		stone floors were showing as blackness. Made it so bodies decay and dis-appear after a day if their not burried or in an iventory. Added wolf skin and meat. Changed Wolf AI so it chases only one target untill it gets killed or kills its target.
		Fixed a bug where making stairs would not take away stone. Updated help guide a little to include tiredness and fishing. Made a destroy door option. Made it so your King and Queen
		get a added stat bonus to their skills and HP.Fixed a bug that allowed you to make gold cages from metal. Upped EXP gained from fighting people and NPC. Adjusted the weight of ores and ingots. Made it a higher chance to find spiders, meatl and stone when mining. Made it so the King/Queen
		live longer than normal units. Added bone walls for Kobolds.
		<p>
		19th September 2006 - Added an un-equip option for items. Fixed stone fall traps. Fixed a bug where gold maces
		would show as metal ones. Added Gold Armour. Added Female icons. Had to remove creature lure due to the lag is was creating.
		Humans can now create Wooden Walls and Floors from logs. Added Bridges. Fixed a bug that allowed you to pick up a wagon even if its weight
		was massive. Made it so if there is Stone in your wagon and you have it selected you will be able to build stone walls from it by pressing B. Added Basements. Fixed a bug that did not allow
		humans to gain stats when they got stronger. Upped the EXP gained from traing posts. Made camp fires for cooking with. Made it so high Skinning and Butchery skills give more
		meat or skin per body. Fixed a bug that made golden pick axes show as metal ones. Made Humans have 10 skill in most areas. Fixed a bug that made gold daggers show as metal ones.
		<p>
		18th September 2006 - Added a verb that finds a certain unit, you type its name in and if it belongs to you, you teleport to its location.
		Accessed By Pressing N. Added Golden Training Post and made it so the better posts are crafted the longer they last. Added Deer breeding, you can now
		breed tamed deer in the same fasion as your own units. Added Golden Throne, can be created at the forge, currently has no other use than
		of being a chair. Upgraded door HP to double of what it was. Made it so you can breed bugs. Added auto breed for all tamed animals. Tweaked NPC's a little
		they no longer kill on sight, instead they are willing to let you come and visit them. Added it so you can combine meat with a cage, this will lure any animals to that cage,
		they will follow you around if you pick the cage up but wont be fully tamed until you capture and tame one. Added a waypoint verb, this will allow you to set a point at which you wish to goto,
		accessed by pressing Q. Changed the colour of skinned skins, their now the same colour as their owner was. Made it so half the skills the mother of a child has pass onto the sibbling. Added Father and Mother under personal Information.
		Made Goblins need to use pick axes. Added Humans. Added Emote, use X to use with unit selected.

		"}
	src << browse(html)
mob/proc/Intro()
	html = {"
		<style>
		body{background:#000000}
		</style>
		<b><font color=red>Dungeon Master Guide</b><p>
		Welcome to Dungeon Master, Dont let the graphics fool you it is actually a very
		addictive and fun game.<p>

		<p>Rules - There are only three very simple rule to follow, the first is do NOT raid players who have just started out, plain and simple no "He raided me last game".
		The second is no mass relogging, anyone caught doing this for no other reason than a laggy computer will be booted.And the third is dont multi key. By not following these rule you and your creatures will be booted from the game.
		<p>

		Commands - S for Speak, B to build(need stone or wood to build), C for your map location, G for goto map location, I for interact, Z for zoom to selected
		, Space for de-select all, A for select all in your view. D to declare a king/queen, need crown to declare, U to unit speak, will let you talk through your minion
		,E will select all units no matter how far away you are from them. Press W for Send Private MSG, Press L for leave/enter world
		chat. H will let you see how many players are online and who they are. Pressing N allows you to find a unit by you typing in their name. Press T for update log. Q for setting a waypoint
		for your self. X to emote with a unit.V to report bugs and M to view bugs that have been posted.J is for making units guard, they will attack anything that comes too close.
		Press K for a list of all creatures that have lived and died in the world. P to stop all units moving. O to stop music.
		<p>
		Control - To control your first creature you double click it , once clicked a red arrow will appear
		above its head, you now have your creature selected. You can select more than one creature by simply double clicking
		others in the same way as your frist. To move your creature simply  click anywhere, this will move it
		to that location, this works if you have more than one creature selected as well.<p>

		To select an area of creatures press the A key, this will select all the creatures in your view.
		To de-select a creature you can either press space bar, which de-selects everything, or double click the selected
		creature again.<p>

		Creature Inventory - The creature inventory will only pop up when you have a creature selected, along with other
		bits of information. The creature, depending on race, can carry alot of items, but does have a limit as to how much
		can be carried. In order to check how much can be carried look under the "Information" TAB.
		.
		To get an item into or out of the creatures inventory simply double click once on the item, this will drop that item
		down where your creature stands. in order to interact with an item you must  click it while its in the creatures inventory, this will open up a menu
		of options that your creature can do with that item. If you ever need help on an item simply select
		the "Inspect" option from the menu, this will give you the items details and its usage.<p>

		Creature Stats - Each creature has its own selection of skills, in order to view them you must have a creature selected.
		Each skill will go up once a job related to that skill is performed, an example would be if you told your creature to
		craft an item, after it has finished it would gain EXP in that skill area.<p>

		Combat - To make your creature attack anything simply get the creature and double click the target, this will
		send your creature charging towards the target. To make the creature stop fighting simply click away
		from the target. Skills like "SpearSkill" will go up as your creature fights as well as an overall EXP score.<p>

		EXP Score - Once this reaches full your creature will gain more health, strength, and agility.
		The stats it gains depends on the race of the creature, an example would be that Kobolds get more agility but less strength per level.Each
		creature will also gain HP to their limbs, making it harder to remove them.<p>

		Building - To build, select a creature and then press B and select the crafting station you wish to build from the options menu that pops up.
		Some stations require wood where as others require stone. You can double click the stations to interact with them, but make sure your creature is
		near by. To find out information on a station simply choose the "Info" option from the pop up menu, this will guide you
		in the right direction.<p>

		Digging - Digging is performed by clicking a cliff edge with a creature selected, if you are Kobolds, your minions will
		claw away at the cliff, but if you are Dwarfs you will need to equip your Pick Axe in order to dig.There is also another way of digging.
		by pressing i with a creature selected you will be able to set its auto dig on or off, once on you can double click seperate peices
		of cliff and create a room, alot like in the game Dungeon Keeper for PC.Your creature will start to auto dig the selected cliffs until they are dug out.
		You can make your creature stop digging at any time by pressing i and selecting "Dig On/Off".<p>

		Chopping - In order to chop click a tree with a creature selected, this will make the creature chop the tree.
		if you are Goblins or Kobolds your minions will rip branches off randomly, but if you use Dwarfs you will need to use an Axe to get wood.

		<p>Fishing - To fish simply move your creature to any water and click the water, this will make that creature fish, their fishing skill will go up everytime a fish is cought,
		the chance to capture a fish is 50% of your fishing skill, for example, 20 fishing skills gives a 10% chance to catch.

		<p> Wagon - To get options about a wagon select a near by unit who is near the wagon and single click the wagon, if you want to get things from the wagon de-select any units you have and make sure the wagon is out of your inven, next double click the wagon, this selects it, you can then see its inven, the wagons inven works like other units, to get stuff into the wagon move somthing near it then dbl clickk the item

		<p> Hunger/Tiredness - Just when you thought things could not get any more complicated one of your units keels over and dies. This can happen for two reasons.
		One you either need to create your units a bed or they will get too tired and die, to do this simply skin a body and use a leather station to
		make a leather bed or if you like you could make a metal  or wood bed. Another reason for the dieing is hunger, you will need to hunt animals and take their meat, if you are dwarfs or humans
		you will need to equip a knife and use that, but if your not humans or dwarfs you wont need to use a dagger. You will also need to cook your food at either a camp fire or kitchen, humans and dwarfs
		must eat cooked food, they may try to eat raw food but theres a 33% chance of food posioning. Other than animals you can also find fish is lakes, just move your unit near and double click the lake.

		<p>Bows - To use a bow make sure you have one equipped and that you have plenty of arrows, then simply click a target and you will begin firing, if you wish to stop press P.<p>

		<p>Spiders - Spiders can be a complicated race to play, there are a few things to remember about them, firsly they use somthing called web content to create all their walls and items, this can be gained by leveling up or simply resting.
		Your queen spider has to wait 3 years before she grows a silk gland, once this is done she will gain web content and can start creating things, once she grows a silk gland she will then grow a posion gland at age 24, to raise your posion you must level up.
		Each year your queens posion and web content will go up by a certain ammount by its self as each gland starts to produce more silk and posion. At age 25 your queen will grow an egg sack and can now produce eggs, at first you may only create warrior spiders, but once you get a lair you can create worker and hunter spiders also.
		Laying eggs, creating walls and making cacoons costs web content, once used it will slowly regenerate over time. At the age of 30 the queen is able to create a lair. but before she can she must breed with a warrior spider, and must be level 5 or higher.
		Once the lair is created your spider queen can now lay hunter and worker eggs, hunter spiders are able to create good traps where as worker spiders can dig.

		.:Alchemy List:.
		<p>
		Potion of Long Life = One diamond, One spider silk,One empty bottle
		<p>
		Potion of Restoration = One Fungus, One tree seed,One empty bottle
		<p>
		Potion of Internal Restoration = One Fungus, One tomato seed,One empty bottle
		<p>
		Cure Vampirism = One Garlic, One empty bottle

		"}

	src << browse(html)



world/proc/Aging()
	for(var/mob/Monsters/m in world)
		if(m.InHole == 0)
			if(m.LoggedOut == 0)
				m.Age += 1
				if(m.Age <= 5)
					m.Age += 1
		if(m.Queen)
			if(m.Egg == 0)
				m.CheckSpiderAge()
		if(m.IsWarrior)
			if(m.Egg == 0)
				m.CheckSpiderWarriorAge()
		if(m.IsWorker)
			if(m.Egg == 0)
				m.CheckSpiderWorkerAge()
		if(m.IsHunter)
			if(m.Egg == 0)
				m.CheckSpiderHunterAge()
	spawn(4500) Aging()

proc
	LoadBans()
		if(fexists("BackUp/char_backups.sav"))
			var/savefile/F=new("Maps/char_backups.sav")
			F["IP"] >> banlist


world/proc/RandomAttack()
	var/T = 0
	var/Type = rand(1,3)
	if(Type == 1)
		for(var/mob/M in Players)
			var/C = prob(25)
			if(C)
				if(M.z != 4)
					if(M.LoggedOut == 0)
						if(M.SunSafe == 0)
							for(var/mob/Monsters/M2 in orange(9,M))
								if(M2.Owner == M && M2.CantKill == 0)
									if(T == 0)
										M2.Owner << "You hear somthing near by..."
										T = 1
									spawn(100)
										if(M && M2)
											var/mob/Monsters/NPCKobold/K = new
											K.loc = locate(M2.x,M2.y-2,M2.z)
											M << "[M2] is ambushed by a kobold!!"
											Type = null
	if(Type == 2)
		for(var/mob/M in Players)
			var/C = prob(25)
			if(C)
				if(M.z != 4)
					if(M.LoggedOut == 0)
						if(M.SunSafe == 0)
							for(var/mob/Monsters/M2 in orange(9,M))
								if(M2.Owner == M && M2.CantKill == 0)
									if(M2.Owner == M)
										if(T == 0)
											M2.Owner << "You hear somthing near by..."
											T = 1
									spawn(100)
										if(M && M2)
											var/mob/Monsters/FrogMan/F = new
											F.loc = locate(M2.x,M2.y-2,M2.z)
											M << "[M2] is ambushed by a frogman!!"
											Type = null
	if(Type == 3)
		for(var/mob/M in Players)
			var/C = prob(25)
			if(C)
				if(M.z != 4)
					if(M.LoggedOut == 0)
						if(M.SunSafe == 0)
							for(var/mob/Monsters/M2 in orange(9,M))
								if(M2.Owner == M && M2.CantKill == 0)
									if(M2.Owner == M)
										if(T == 0)
											M2.Owner << "You hear somthing near by..."
											T = 1
									spawn(100)
										if(M && M2)
											var/mob/Monsters/StrayGoblin/F = new
											F.loc = locate(M2.x,M2.y-2,M2.z)
											M << "[M2] is ambushed by a goblin!!"
											Type = null
	spawn(50000) RandomAttack()