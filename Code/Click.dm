client/Click(atom/m)
	if(usr.Function == "Tapestry")
		for(var/mob/Monsters/M in usr.Selected)
			if(M in range(1,m))
				if(m.icon == 'Tapestries.dmi')
					M.Owner << "Removing Tapestry."
					del m
					return
				if(m.IsWall == 1)
					if(m.density == 1)
						for(var/obj/Tapestry/K in m)
							usr << "[m] already has a tapestry on it, removing tapestry."
							m.overlays -= K
							del K
							return
						if(usr.Faction != "Player" && usr.Faction != "Allure of the Pandora")
							var/obj/Tapestry/T = new()
							T.loc = m
							T.icon_state = usr.Faction
							T.name = "Tapestry of [usr.Faction]"
							M.Owner << "Tapestry Placed."
							usr.Function = "Tapestry"
							return
						if(usr.Faction == "Allure of the Pandora")
							var/obj/Tapestry/T = new()
							T.loc = m
							T.icon = 'Pandora Tapestry.dmi'
							T.name = "Tapestry of [usr.Faction]"
							M.Owner << "Tapestry Placed."
							usr.Function = "Tapestry"
							return
	if(usr.Function == "PlaceArrowSlit")
		for(var/mob/Monsters/M in usr.Selected)
			if(M in range(1,m))
				if(m.icon_state == "ArrowSlit")
					M.Owner << "Removing arrow slit."
					for(var/turf/T in range(0,m))
						if(T.density == 1)
							T.opacity = 1
					del m
					return
				if(m.IsWall == 1)
					if(m.density == 1)
						for(var/obj/ArrowSlit/K in m)
							usr << "[m] already has an arrow slit on it, removing."
							m.overlays -= K
							m.opacity = 1
							del K
							return
						if(M.Race == "Human")
							var/obj/ArrowSlit/T = new()
							T.loc = m
							m.opacity = 0
							M.Owner << "Arrow Slit Placed."
							usr.Function = "PlaceArrowSlit"
							return
	if(usr.Function == "Patrol") if(isturf(m))
		usr << "<b>Patrol Rule added to selected units. Your selected units will now patrol between the clicked location and the location they were at when you set this while on guard."
		for(var/mob/Monsters/M in usr.Selected) M.Patrol(M.loc,m)
		usr.Function=null
	if(ismob(m))
		var/mob/mb = m
		if(mb.client) return
	for(var/mob/Monsters/M in usr.Selected)
		if(M.CanSee == 0)
			M.Owner << "[M] cant see!!"
			continue
		if(M.Wagon == 0)
			M.destination = m
			if(isobj(m))
				M.destination = null
			if(m.Owner == M.Owner)
				M.destination = null
			if(M.HoldingWeapon == "Bow")
				if(M.Target == null)
					if(isobj(m))
						if(m.TP == 1)
							if(m == M)
								continue
							else
								M.Target = m
								M.destination = null
								usr << "[M] targets [m] - press P to stop targetting."
								if(M.BowOn == 0)
									M.BowOn = 1
									M.BowTarget()
					if(ismob(m))
						if(m.Wagon == 0)
							if(!istype(m,/mob/Body))
								if(m.WS == 0)
									if(m == M)
										continue
									if(m.Owner == M.Owner)
										continue
									else
										M.Target = m
										M.destination = null
										usr << "[M] targets [m] - press P to stop targetting."
										if(M.BowOn == 0)
											M.BowOn = 1
											M.BowTarget()
			switch(m.icon_state)
				if("Silver Chest","Gold Chest","Metal Chest","Wooden Chest","Drill") if(!M.Wagon)
					M.destination = null
					if(m in view(1,M))
						var/list/menu = new()
						if(!m.suffix) if(m.icon_state=="Drill") menu+="Drill"
						menu += "Drop"
						menu += "PickUp"
						menu += "Inspect"
						menu += "Take Contents"
						menu += "Cancel"
						switch(input("What Action Will You Choose?", "Choose", null) in menu)
							if("Inspect") usr << m.desc
							if("PickUp")
								if(M.weight <= M.weightmax) if(m.suffix == null)
									if(usr.Selected.Find(m))
										usr.Selected.Remove(m)
										usr.client.images -= m.Star
									var/mob/A1 = m
									A1.destination = null
									A1.loc = M
									M.weight += A1.weight
									A1.suffix = "(Carrying)"
									A1.Owner = M.Owner
							if("Take Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight
							if("Drop") if(m.suffix == "(Carrying)")
								var/mob/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
							if("Drill") if(!m.suffix) if(m in view(1,M)) for(var/turf/grounds/GB in oview(0,m))
								if(prob(5))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/ores/Silver/SS = new
												SS.loc = WA
												WA.weight += SS.weight
												SS.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/ores/Silver/SS = new
									SS.loc = M.loc
								if(prob(5))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/ores/Gold/GN = new
												GN.loc = WA
												WA.weight += GN.weight
												GN.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/ores/Gold/GN = new
									GN.loc = M.loc

								if(prob(35))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/ores/Iron/MET = new
												MET.loc = WA
												WA.weight += MET.weight
												MET.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/ores/Iron/MET = new
									MET.loc = M.loc
								if(prob(70))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/ores/stone/ST = new
												ST.loc = WA
												WA.weight += ST.weight
												ST.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/ores/stone/ST = new
									ST.loc = M.loc
								if(prob(1))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/gems/UnCutDiamond/DI = new
												DI.loc = WA
												WA.weight += DI.weight
												DI.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = M.loc
								if(prob(0.5))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/gems/UnCutEmerald/UD = new
												UD.loc = WA
												WA.weight += UD.weight
												UD.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = M.loc
								if(prob(0.5))
									for(var/mob/Monsters/Chests/Wagon/WA in view(1,m))
										if(WA.Owner == M.Owner)
											if(WA.weight <= WA.weightmax)
												var/obj/Items/gems/UnCutRuby/RE = new
												RE.loc = WA
												WA.weight += RE.weight
												RE.suffix = "(Carrying)"
												GB.opacity = 0
												GB.density = 0
												GB.CanDigAt = 0
												GB.icon_state = "CaveFloor"
												return
									var/obj/Items/gems/UnCutRuby/RE = new
									RE.loc = M.loc
				if("Wagon") if(!M.Wagon)
					M.destination = null
					if(m in view(1,M))
						var/list/menu = new()
						menu += "Drop Contents"
						menu += "Pull"
						menu += "Stop Pulling"
						menu += "Inspect"
						menu += "Cancel"
						switch(input("What Action Will You Choose?", "Choose", null) in menu)
							if("Inspect") usr << m.desc
							if("Pull") if(m.suffix == null)
								var/mob/A1 = m
								A1.destination = M
								A1.Owner = M.Owner
							if("Stop Pulling") if(m.suffix == null)
								var/mob/A1 = m
								A1.destination = null
							if("Drop Contents")
								for(var/obj/A1 in m)
									A1.loc = M.loc
									A1.suffix = null
									m.weight -= A1.weight
								for(var/mob/A2 in m)
									A2.loc = M.loc
									A2.suffix = null
									m.weight -= A2.weight

			if(m.icon_state == "GoldDoor")
				M.destination = null
				if(m in M)
					if(m.Owner == null)
						m.Owner = M.Owner
					if(m.Owner == M.Owner)
						var/obj/A3 = m
						if(m.Placed == 0)
							if(M.Wagon == 0)


								A3.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Place"
						menu += "Destroy"
						if(A3.Placed == 1)
							menu += "Lock"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Lock")
							A3.Locked = 1
							view() << "[M] locks [A3]"
						if (Result == "Destroy")
							if(m.Owner == M.Owner)
								if(m in M)
									M.weight -= m.weight
								del(m)
								return
						if (Result == "Place")
							if(A3.Placed == 0)
								A3.loc = M.loc
								A3.dir = M.dir
								A3.density = 1
								M.weight -= A3.weight
								A3.Placed = 1
								A3.opacity = 1
								A3.Door = 1
								A3.Locked = 0
								A3.LockVar = rand(1,10000)
								A3.Owner = M.Owner
								A3.Death()
								return
			if(m.icon_state == "MetalDoor")
				M.destination = null
				if(m in M)
					if(m.Owner == null)
						m.Owner = M.Owner
					if(m.Owner == M.Owner)
						var/obj/A3 = m
						if(m.Placed == 0)
							if(M.Wagon == 0)


								A3.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Place"
						menu += "Destroy"
						if(A3.Placed == 1)
							menu += "Lock"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Lock")
							A3.Locked = 1
							view() << "[M] locks [A3]"
						if (Result == "Destroy")
							if(m.Owner == M.Owner)
								del(m)
								return
						if (Result == "Place")
							if(A3.Placed == 0)
								A3.loc = M.loc
								A3.dir = M.dir
								A3.density = 1
								M.weight -= A3.weight
								A3.Placed = 1
								A3.opacity = 1
								A3.Door = 1
								A3.Locked = 0
								A3.LockVar = rand(1,10000)
								A3.Owner = M.Owner
								A3.Death()
								return
			if(m.icon_state == "StoneDoor")
				M.destination = null
				if(m in M)
					if(m.Owner == null)
						m.Owner = M.Owner
					if(m.Owner == M.Owner)
						var/obj/A3 = m
						if(m.Placed == 0)
							if(M.Wagon == 0)
								A3.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Place"
						menu += "Destroy"
						if(A3.Placed == 1)
							menu += "Lock"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Lock")
							A3.Locked = 1
							view() << "[M] locks [A3]"
						if (Result == "Destroy")
							if(m.Owner == M.Owner)
								del(m)
								return
						if (Result == "Place")
							if(A3.Placed == 0)
								A3.loc = M.loc
								A3.dir = M.dir
								A3.density = 1
								M.weight -= A3.weight
								A3.Placed = 1
								A3.opacity = 1
								A3.Door = 1
								A3.Locked = 0
								A3.LockVar = rand(1,10000)
								A3.Owner = M.Owner
								A3.Death()
								return
			if(m.icon_state == "BoneDoor")
				M.destination = null
				if(m in M)
					if(m.Owner == null)
						m.Owner = M.Owner
					if(m.Owner == M.Owner)
						var/obj/A3 = m
						if(m.Placed == 0)
							if(M.Wagon == 0)


								A3.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Place"
						menu += "Destroy"
						if(A3.Placed == 1)
							menu += "Lock"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Lock")
							A3.Locked = 1
							view() << "[M] locks [A3]"
						if (Result == "Destroy")
							if(m.Owner == M.Owner)
								del(m)
								return
						if (Result == "Place")
							if(A3.Placed == 0)
								A3.loc = M.loc
								A3.dir = M.dir
								A3.density = 1
								M.weight -= A3.weight
								A3.Placed = 1
								A3.opacity = 1
								A3.Door = 1
								A3.Locked = 0
								A3.LockVar = rand(1,10000)
								A3.Owner = M.Owner
								A3.Death()
								return
			if(m.icon_state == "WoodenDoor")
				M.destination = null
				if(m in M)
					if(m.Owner == null)
						m.Owner = M.Owner
					if(m.Owner == M.Owner)
						var/obj/A3 = m
						if(m.Placed == 0)
							if(M.Wagon == 0)


								A3.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Place"
						menu += "Destroy"
						if(A3.Placed == 1)
							menu += "Lock"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Lock")
							A3.Locked = 1
							view() << "[M] locks [A3]"
						if (Result == "Destroy")
							if(m.Owner == M.Owner)
								del(m)
								return
						if (Result == "Place")
							if(A3.Placed == 0)
								A3.loc = M.loc
								A3.dir = M.dir
								A3.density = 1
								M.weight -= A3.weight
								A3.Placed = 1
								A3.opacity = 1
								A3.Door = 1
								A3.Locked = 0
								A3.LockVar = rand(1,10000)
								A3.Owner = M.Owner
								A3.Death()
								return
			if(m.IsPotion == 1)
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A5 = m
						A5.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Drink"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drink")
							if(m.suffix == "(Carrying)")
								if(M.Race != "Spider")
									if(M.HasStomach == 1 && M.Undead == 0 && M.Infects == 0)
										if(m.name == "Vampirism Cure")
											usr << "[M] drinks [m]"
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
											var/Work = prob(60)
											if(Work == 1)
												if(M.InfectedBy)
													view() << "[M] is no longer sick!"
													M.InfectedBy = null
											else
												view() << "[src] didn't work! Try another!"
											return
										if(m.name == "Potion of Vampirism" && M.Race != "Dragon")
											usr << "[M] drinks [m]"
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
											var/Work = prob(60)
											if(M.MagicalAptitude == 1) Work = 1
											if(M.SubRace) Work = 0
											if(Work)
												view() << "[M] is struck with extreme chest pain as its heart fails...... after a few moments it rises up and views the world with the new eyes of an undead monster!"
												M.RaceChange("Vampire")
											else
												view() << "[M] is struck with extreme chest pain as its heart fails...!"
												M.DeathType = "Massive Heart Attack"
												M.GoingToDie = 1
												view() << "<b><font color=red>[src] has died!!"
												M.Death()
											return
										if(m.name == "Potion of Poison Immunity")
											usr << "[M] drinks [m]"
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
											var/work = prob(70)
											if(M.ImmunePoison == 0)
												if(work == 1)
													usr << "[M] becomes immune to poison!"
													M.ImmunePoison = 1
												else
													usr << "The potion has no effect, try another."
											else
												usr << "The potion has no affect! [M] is already immune to poison!"
											return
										if(m.name == "Potion of LongLife")
											usr << "[M] drinks [m]"
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
											var/A
											A = rand(10,15)
											M.Age -= A
											usr << "[M]'s life is extended for another [A] years!"
											switch(M.Pale)
												if(0)
													M.icon += rgb(25,25,25)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(1)
													M.icon += rgb(50,50,50)
													view()  << "[M]'s soul darkens!"
													M.Pale += 1
													return
												if(2)
													M.icon += rgb(75,75,75)
													view() << "[M]'s soul darkens!"
													M.Pale += 1
													return
										if(m.name == "Potion of Eternal Life")
											usr << "[M] drinks [m]"
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
											M.DieAge += 70000
											usr << "[M]'s life is extended forever!"
											M.icon += rgb(95,95,95)
											view() << "[M]'s soul darkens!"
											return
										if(m.name == "Immunity To Devourer Potion")
											if(M.ImmuneToDevourer == 0)
												usr << "[M] drinks [m]"
												m.icon_state = "Empty"
												m.IsEmpty = 1
												m.name = "Empty Bottle"
												M.ImmuneToDevourer = 1
												usr << "[M] becomes immune to the dread disease of the devourer!"
												M.icon -= rgb(25,25,25)
												view() << "[M]'s skin darkens a bit from the effects of the potion.!"
												return
										if(m.name == "Potion of Internal Restoration")
											usr << "[M] drinks [m]"
											M.HasNose = 1
											M.NoseHP = M.OrganMaxHP
											M.Nose = "Good"
											M.HasLeftEar = 1
											M.LeftEarHP = M.OrganMaxHP
											M.LeftEar = "Good"
											M.HasRightEar = 1
											M.RightEarHP = M.OrganMaxHP
											M.RightEar = "Good"
											M.HasTeeth = 1
											M.TeethHP = M.OrganMaxHP
											M.Teeth = "Good"
											M.HasRightEye = 1
											M.RightEyeHP = M.OrganMaxHP
											M.RightEye = "Good"
											M.HasLeftEye = 1
											M.LeftEyeHP = M.OrganMaxHP
											M.LeftEye = "Good"
											M.RightLungHP = M.OrganMaxHP
											M.RightLung = "Good"
											M.LeftLungHP = M.OrganMaxHP
											M.LeftLung = "Good"
											M.SpleenHP = M.OrganMaxHP
											M.Spleen = "Good"
											M.HeadHP = M.OrganMaxHP
											M.Head = "Good"
											M.GutsHP = M.OrganMaxHP
											M.Guts = "Good"
											M.StomachHP = M.OrganMaxHP
											M.Stomach = "Good"
											M.LeftKidneyHP = M.OrganMaxHP
											M.LeftKidney = "Good"
											M.RightKidneyHP = M.OrganMaxHP
											M.RightKidney = "Good"
											M.LiverHP = M.OrganMaxHP
											M.Liver = "Good"
											M.BrainHP = M.OrganMaxHP
											M.Brain = "Good"
											M.HeartHP = M.OrganMaxHP
											M.Heart = "Good"
											M.ThroatHP = M.OrganMaxHP
											M.Throat = "Good"
											M.WingsHP = M.OrganMaxHP
											M.Wings = "Good"
											M.CanSee = 1
											M.LimbLoss()
											m.icon_state = "Empty"
											m.IsEmpty = 1
											m.name = "Empty Bottle"
										if(m.name == "Potion of Restoration")
											usr << "[M] drinks [m]"
											M.HasLeftLeg = 1
											M.HasRightLeg = 1
											M.HasLeftArm = 1
											M.HasRightArm = 1
											M.HasTeeth = 1
											M.Teeth = "Good"
											M.TeethHP = M.TeethHPMax
											m.icon_state = "Empty"
											m.IsEmpty = 1
											M.LeftArm = "Good"
											M.RightArm = "Good"
											M.LeftLeg = "Good"
											M.RightLeg = "Good"
											M.RightLegHP = M.OrganMaxHP
											M.LeftLegHP = M.OrganMaxHP
											M.LeftArmHP = M.OrganMaxHP
											M.RightArmHP = M.OrganMaxHP
											M.CanUseRightArm = 1
											M.CanUseLeftArm = 1
											M.CanWalk = 1
											m.name = "Empty Bottle"
											M.LimbLoss()
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return
			if(m.icon_state == "Fungas")
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A = m
						A.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						if(M.Race != "Vampire")
							if(M.Race != "Gargoyle")
								menu += "Eat"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Eat")
							if(m in M)
								if(M.Carn == 0 && M.Race != "Dwarf")
									var/die = prob(33)
									if(die == 1)
										view() << "<b><font color=red>[M] tryed to eat fungas but it killed [M]"
										M.HP = 0
										M.GoingToDie = 1
										M.Killer = "[m]"
										M.DeathType = "Food Poisoning"
										M.Death()
										return
									else
										view() << "<b><font color=blue>[M] eats [m]"
										if(m.Poisoned == 1 && M.Race != "SandKing")
											view() << "<b><font color=red>[M] was posioned!"
											M.HP = 0
											M.GoingToDie = 1
											M.Killer = "[m]"
											M.DeathType = "Poison"
											M.Death()
											return
										M.Hunger += 100
										M.weight -= m.weight
										if(M.Hunger >= 100)
											M.Hunger = 100
										del(m)
										return
								else
									view() << "<b><font color=blue>[M] eats [m]"
									if(m.Poisoned == 1)
										view() << "<b><font color=red>[M] was posioned!"
										M.HP = 0
										M.GoingToDie = 1
										M.Killer = "[m]"
										M.DeathType = "Poison"
										M.Death()
										return
									M.Hunger += 100
									M.weight -= m.weight
									if(M.Hunger >= 100)
										M.Hunger = 100
									del(m)
									return
			if(m.icon_state == "Toxic")
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A11 = m
						A11.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Combine"
						menu += "Drink"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Drink")
							M.HP = 0
							M.GoingToDie = 1
							M.Killer = "[M]"
							M.DeathType = "Poison"
							M.Death()
							del(m)
							return
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return

						if (Result == "Combine")
							var/list/menu2 = new()
							menu2 += "Weapon"
							menu2 += "Trap"
							menu2 += "Arrows"
							for(var/mob/Monsters/S in view(1,M))
								if(S.Sleeping == 1)
									menu2 += "Poison In Sleep"

							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Arrows")
								for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/V in M)
									for(var/obj/Items/Arrows/A in V)
										if(A.Poisoned == 0)
											if(m.Content >= 10)
												M.weight -= m.weight
												del(m)
												break
												return
											A.Poisoned = 1
											A.name = "[A] - Toxic Tipped"
											if(m.PoisonContent >= 45)
												m.PoisonContent = 45
											A.PoisonContent = m.PoisonContent
											m.Content += 1
											M.Owner << "Arrow Poisoned!"
							if (Result2 == "Weapon")
								for(var/obj/Items/Poisons/Toxic/P in M)
									for(var/obj/Items/Equipment/Weapon/W in M)
										if(W.Poisoned == 0)
											W.Poisoned = 1
											var/Min = rand(2,4)
											var/Max = rand(2,4)
											W.WeaponDamageMin += Min
											W.WeaponDamageMax += Max
											W.name = "[W] - Toxic Tipped"
											if(m.PoisonContent >= 45)
												m.PoisonContent = 45
											W.PoisonContent = m.PoisonContent
											if(W.suffix == "(Equipped)")
												M.WeaponDamageMin += Min
												M.WeaponDamageMax += Max
											M.weight -= P.weight
											del(P)
											break
											return
							if (Result2 == "Trap")
								for(var/obj/Items/Poisons/Toxic/P in M)
									for(var/obj/Items/Traps/PitTrap/W in view(1,M))
										if(W.IsSpiked == 1)
											if(W.Poisoned == 0)
												usr << "[M] tips toxic over spiked pit trap"
												W.Poisoned = 1
												if(m.PoisonContent >= 45)
													m.PoisonContent = 45
												W.PoisonContent = m.PoisonContent
												M.weight -= P.weight
												del(P)
												break
												return
							if (Result2 == "Poison In Sleep")
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										for(var/obj/Items/Poisons/Toxic/P in M)
											if(S.Poisoned == 0)
												S.Poisoned = 1
												S.HP = 0
												S.Death()
												S.GoingToDie = 1
												S.Killer = "[M]"
												S.DeathType = "Poison"
												view() << "<b><font color=red>[S] is posioned!"
												S.Death()
												M.weight -= P.weight
												del(P)
												break
												return
							return
			if(m.icon_state == "StrongPoison")
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A11 = m
						A11.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Combine"
						menu += "Drink"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Drink")
							M.HP = 0
							M.GoingToDie = 1
							M.Killer = "[M]"
							M.DeathType = "Poison"
							M.Death()
							del(m)
							return
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return
						if (Result == "Combine")
							var/list/menu2 = new()
							menu2 += "Weapon"
							menu2 += "Trap"
							menu2 += "Arrows"
							for(var/mob/Monsters/S in view(1,M))
								if(S.Sleeping == 1)
									menu2 += "Poison In Sleep"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Arrows")
								for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/V in M)
									for(var/obj/Items/Arrows/A in V)
										if(A.Poisoned == 0)
											if(m.Content >= 10)
												M.weight -= m.weight
												del(m)
												break
												return
											A.Poisoned = 1
											A.name = "[A] - Poison++ Tipped"
											if(m.PoisonContent >= 65)
												m.PoisonContent = 65
											A.PoisonContent = m.PoisonContent
											m.Content += 1
											M.Owner << "Arrow Poisoned!"
							if (Result2 == "Weapon")
								for(var/obj/Items/Poisons/StrongPoison/P in M)
									for(var/obj/Items/Equipment/Weapon/W in M)
										if(W.Poisoned == 0)
											W.Poisoned = 1
											var/Min = rand(3,5)
											var/Max = rand(3,5)
											W.WeaponDamageMin += Min
											W.WeaponDamageMax += Max
											W.name = "[W] - Poison++ Tipped"
											if(m.PoisonContent >= 65)
												m.PoisonContent = 65
											W.PoisonContent = m.PoisonContent
											if(W.suffix == "(Equipped)")
												M.WeaponDamageMin += Min
												M.WeaponDamageMax += Max
											M.weight -= P.weight
											del(P)
											break
											return
							if (Result2 == "Trap")
								for(var/obj/Items/Poisons/StrongPoison/P in M)
									for(var/obj/Items/Traps/PitTrap/W in view(1,M))
										if(W.IsSpiked == 1)
											if(W.Poisoned == 0)
												usr << "[M] tips strong poison over spiked pit trap"
												W.Poisoned = 1
												if(m.PoisonContent >= 55)
													m.PoisonContent = 55
												W.PoisonContent = m.PoisonContent
												M.weight -= P.weight
												del(P)
												break
												return
							if (Result2 == "Poison In Sleep")
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										for(var/obj/Items/Poisons/StrongPoison/P in M)
											if(S.Poisoned == 0)
												S.Poisoned = 1
												S.HP = 0
												S.Death()
												S.GoingToDie = 1
												S.Killer = "[M]"
												S.DeathType = "Poison"
												view() << "<b><font color=red>[S] is poisoned!"
												S.Death()
												M.weight -= P.weight
												del(P)
												break
												return
							return
			if(m.icon_state == "Poison")
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A11 = m
						A11.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inspect"
						menu += "Combine"
						menu += "Drink"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Drink")
							M.HP = 0
							M.GoingToDie = 1
							M.Killer = "[M]"
							M.DeathType = "Poison"
							M.Death()
							del(m)
							return
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return
						if (Result == "Combine")
							var/list/menu2 = new()
							menu2 += "Weapon"
							menu2 += "Trap"
							menu2 += "Arrows"
							for(var/mob/Monsters/S in view(1,M))
								if(S.Sleeping == 1)
									menu2 += "Poison In Sleep"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Arrows")
								for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/V in M)
									for(var/obj/Items/Arrows/A in V)
										if(A.Poisoned == 0)
											if(m.Content >= 10)
												M.weight -= m.weight
												del(m)
												break
												return
											A.Poisoned = 1
											A.name = "[A] - Poison Tipped"
											if(m.PoisonContent >= 40)
												m.PoisonContent = 40
											A.PoisonContent = m.PoisonContent
											m.Content += 1
											M.Owner << "Arrow Poisoned!"
							if (Result2 == "Weapon")
								for(var/obj/Items/Poisons/Poison/P in M)
									for(var/obj/Items/Equipment/Weapon/W in M)
										if(W.Poisoned == 0)
											W.Poisoned = 1
											var/Min = rand(1,2)
											var/Max = rand(1,2)
											W.WeaponDamageMin += Min
											W.WeaponDamageMax += Max
											W.name = "[W] - Poison Tipped"
											if(m.PoisonContent >= 40)
												m.PoisonContent = 40
											W.PoisonContent = m.PoisonContent
											if(W.suffix == "(Equipped)")
												M.WeaponDamageMin += Min
												M.WeaponDamageMax += Max
											M.weight -= P.weight
											del(P)
											break
											return
							if (Result2 == "Trap")
								for(var/obj/Items/Poisons/Poison/P in M)
									for(var/obj/Items/Traps/PitTrap/W in view(1,M))
										if(W.IsSpiked == 1)
											if(W.Poisoned == 0)
												usr << "[M] tips posion over spiked pit trap"
												W.Poisoned = 1
												if(m.PoisonContent >= 40)
													m.PoisonContent = 40
												W.PoisonContent = m.PoisonContent
												M.weight -= P.weight
												del(P)
												break
												return
							if (Result2 == "Poison In Sleep")
								for(var/mob/Monsters/S in view(1,M))
									if(S.Sleeping == 1)
										for(var/obj/Items/Poisons/Poison/P in M)
											if(S.Poisoned == 0)
												S.Poisoned = 1
												S.HP = 0
												S.Death()
												S.GoingToDie = 1
												S.Killer = "[M]"
												S.DeathType = "Poison"
												view() << "<b><font color=red>[S] is posioned!"
												M.weight -= P.weight
												S.Death()
												del(P)
												break
												return
							return
			if(m.icon_state == "Spike")
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A13 = m
						A13.loc = M
						var/list/menu = new()
						menu += "Drop"
						for(var/mob/Monsters/Vampire/V in view(1,M)) menu += "Stab Heart"
						menu += "Inspect"
						menu += "Combine"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return
						if (Result == "Stab Heart")
							if(M.CoolDown == 0)
								for(var/mob/Monsters/Vampire/V in oview(1,M))
									if(V.Sleeping == 1)
										view() << "[M] stabs a Vampire in the heart killing it!"
										V.GoingToDie = 1
										V.Killer = "[M]"
										V.DeathType = "Punctured Heart"
										V.Death()

						if (Result == "Combine")
							var/list/menu2 = new()
							menu2 += "Trap"
							menu2 += "Cancel"
							var/Result2 = input("What Action Will You Choose?", "Choose", null) in menu2
							if (Result2 != "Cancel")
								..()
							if (Result2 == "Trap")
								for(var/obj/Items/Traps/Spikes/WoodenSpike/P in M)
									for(var/obj/Items/Traps/PitTrap/W in view(0,M))
										if(W.Hole == 0)
											if(W.IsSpiked == 0)
												W.IsSpiked = 1
												M.weight -= P.weight
												del(P)
												break
								return


			if(m.icon_state == "sign")
				M.destination = null
				if(m in M)

					if(M.Wagon == 0)
						var/list/menu = new()
						menu += "Drop"
						menu += "Write"
						menu += "Inspect"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Write")
							var/T = input("Write On Sign")as null|text
							if(!T)
								return
							else
								m.name = T
								return
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								A1.dir = M.dir
								return
			if(m.TS == 1)
				M.destination = null
				if(m in M)
					if(M.Wagon == 0)
						var/obj/A16 = m
						A16.loc = M
						var/list/menu = new()
						menu += "Drop"
						menu += "Inscribe"
						menu += "Inspect"

						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Inspect")
							usr << m.desc
						if (Result == "Inscribe")
							var/T = input("Inscribe Tomb Stone")as null|text
							if(!T)
								return
							else
								m.name = T
								m.icon_state = "TombStone2"
								return
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return
			if(m.TP == 1) if(M.HoldingWeapon != "Bow") M.destination = m
			if(m.icon_state == "Grave")
				M.destination = null
				if(m in view(1,M))
					if(M.Wagon == 0)
						var/list/menu = new()
						menu += "Rob Grave"
						menu += "Inspect"
						menu += "Cancel"
						var/Result = input("What Action Will You Choose?", "Choose", null) in menu
						if (Result != "Cancel")
							..()
						if (Result == "Rob Grave")
							for(var/obj/Q in m)
								Q.loc = M.loc
								Q.suffix = null
							for(var/mob/Z in m)
								Z.loc = M.loc
								Z.suffix = null
							del(m)
							return
						if (Result == "Inspect")
							for(var/atom/F in m)
								usr << F
						if (Result == "Drop")
							if(m.suffix == "(Carrying)")
								var/obj/A1 = m
								A1.loc = M.loc
								A1.suffix = null
								M.weight -= A1.weight
								return