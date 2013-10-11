area
	Square1
	Square2
	Square3
	Square4
	Square5
	Square6
	Square7
	Square8
	Square9
	Square10
	Square11
	Square12
	Underground
	Sky
	Hell
mob/proc/SunLight() if(!key) switch(Race) if("Vampire","Svartalfar") if(!NotInLight)
	NotInLight=1
	spawn() while(NotInLight)
		var/turf/LOCATION = loc
		if(!isturf(loc))
			NotInLight=0
			return
		if(DayWalker || LOCATION.density || LOCATION.icon_state=="CaveFloor" || LOCATION.icon_state=="HellFloor" || LOCATION.Detailed || LOCATION.isbridge || LOCATION.CaveWater || LOCATION.icon_state=="Chasm"||night)
			NotInLight=0
			return
		switch(Race)
			if("Vampire")
				src.Owner << "<b><font color=red>[src] takes damage from the sun!"
				src.HP -= 35
				if(src.HP <= 0)
					src.GoingToDie = 1
					src.Killer = "The Sun"
					src.DeathType = "Being Burned"
					src.Death()
					return
			if("Svartalfar") if(Mana>=5) Mana-=5
			else
				NotInLight=0
				return
		sleep(50)
turf/proc //This should REALLY be a mob proc..
	ApplyTemperature(Temperature) if(usr) if(!usr.key) if(!usr.ImmuneToTemperature) if(!usr.Undead) if(!usr.CanBeSlaved)
		if(Temperature>0&&!night) usr.Coldness -= Temperature
		if(Temperature<0&&night) usr.Coldness -= Temperature
		if(usr.Coldness >= 100)
			usr.Coldness -= 5
			usr.destination = null
			usr.Owner << "[usr] starts to get frost bite!"
			usr.HP -= 20
			if(usr.HP <= 0)
				usr.GoingToDie = 1
				usr.Killer = "Frost Bite"
				usr.DeathType = "Coldness"
				usr.Death()
				return
		else if(usr.Coldness <= -100)
			usr.Coldness += 5
			usr.destination = null
			usr.Owner << "The heat damages [usr]"
			usr.HP -= 20
			if(usr.HP <= 0)
				usr.GoingToDie = 1
				usr.Killer = "Heat Stroke"
				usr.DeathType = "Overheating"
				usr.Death()
				return
	RestoreTemperature() if(usr) if(usr.Coldness)
		if(usr.Coldness>0)
			usr.Coldness-=1
			if(usr.Coldness<0) usr.Coldness=0
		else if(usr.Coldness<0)
			usr.Coldness+=1
			if(usr.Coldness>0) usr.Coldness=0

turf/grounds/Entered() if(ismob(usr))if(!usr.Wagon)
	if(src.Content3 == "Liquid")
		if(OnFire)
			usr.OnFire = 0
			usr.IsWood = 0
			usr.Fuel = 100
			usr.Safe()
	if(!usr.key) switch(icon_state)
		if("water","Peak","Grass","GoodGrass")
			usr.SunLight()
			RestoreTemperature()
		if("DeadGrass") if(usr.Shielded == 0 && usr.Infects == 0 && usr.Race != "Svartalfar") ApplyTemperature(-5)
		if("Marsh","Tropical1","Tropical2","Tropical2","Tropical3","Tropical4","Tropical5")
			if(usr.Race == "Dragon") usr.PoisonPoints += 1
			usr.SunLight()
			if(usr.Race=="Lizardman" || usr.Race=="Frogman") ApplyTemperature(0.05)
			else ApplyTemperature(0.1)
		if("HellFloor")
			if(usr.Race == "Dragon") usr.FirePoints += 1
			ApplyTemperature(1)
		if("Desert")
			if(usr.Race == "Dragon") usr.SandPoints += 1
			ApplyTemperature(0.5)
			usr.SunLight()
		if("Snow")
			if(usr.Race == "Dragon") usr.IcePoints += 1
			if(usr.Race=="Orc") ApplyTemperature(-0.25)
			else ApplyTemperature(-1)
			usr.SunLight()
		if("Sky")
			usr.SunLight()
			if(usr.density && !usr.Flying)
				usr.z = 1
				if(!usr.CliffClimber && usr.SubRace != "Illithid" && usr.SubRace != "Werewolf")
					if(usr.HasLeftLeg) if(prob(50))
						usr.LeftLegHP = 10
						usr.LeftLeg  = "Mangled"
						usr.BloodContent -= 25
						usr.BloodLoss()
						view(usr) << "<b><font color=red>[usr] falls and mangles their left leg!<br>"
						if(usr.RightLegHP <= 10) usr.CanWalk = 0
					if(usr.HasRightLeg) if(prob(50))
						usr.RightLegHP = 10
						usr.RightLeg  = "Mangled"
						usr.BloodContent -= 25
						usr.BloodLoss()
						view(usr) << "<b><font color=red>[usr] falls and mangles their right leg!<br>"
						if(usr.LeftLegHP <= 10) usr.CanWalk = 0
		if("Chasm")
			if(usr.density && !usr.Flying)
				Owner << "[usr] falls down a large chasm!<br>"
				view(usr) << "[usr] falls down a large chasm!<br>"
				del(usr)
				return
		else RestoreTemperature()
	if(icon=='Stairs.dmi')
		if(copytext(icon_state,-2)=="Up") switch(z)
			if(GROUND_LAYER) usr.z=SKY_LAYER
			if(UNDERGROUND_LAYER) usr.z=GROUND_LAYER
			if(SKY_LAYER) return
		if(copytext(icon_state,-4)=="Down") switch(z)
			if(GROUND_LAYER) usr.z=UNDERGROUND_LAYER
			if(UNDERGROUND_LAYER) return
			if(SKY_LAYER) usr.z=GROUND_LAYER
		usr.destination = null
obj/proc/Delete() spawn()
	if(BloodAcidity)
		sleep(750)
		del(src)
	else
		sleep(rand(1500,3000))
		del(src)
obj
	Support
	miss
		icon = 'fx.dmi'
		icon_state = "Miss"
		layer = 5
	dodge
		icon = 'fx.dmi'
		icon_state = "Dodge"
		layer = 5
	block
		icon = 'fx.dmi'
		icon_state = "Block"
		layer = 5
	frozen
		icon = 'ColoredEyes.dmi'
		icon_state = "BlueHaze"
		layer = 5
	Tapestry
		icon = 'Tapestries.dmi'
		icon_state = null
		layer = 5
	ArrowSlit
		icon = 'Cave.dmi'
		icon_state = "ArrowSlit"
		layer = 5
	sparkle
		icon = 'Book.dmi'
		icon_state = "SparkleGlow"
		layer = 8
	forcefield
		icon = 'Book.dmi'
		icon_state = "Forcefield"
		layer = 8
	Portal
		layer = 5
		Content = 4
		icon = 'Cave.dmi'
		icon_state = "Portal"
	AstralPortal
		layer = 5
		Content = 4
		icon = 'Blood.dmi'
		icon_state = "AstralBurst"
		text = "<font color=blue>@<b><font color=cyan>@"
		DblClick()
			for(var/mob/Monsters/M in usr.Selected)
				if(src in view(1,M))
					M.loc = src.GoesTo
	PowerupPillar
		layer = 4
		Content = 4
		Content2 = "Uncaptured"
		icon = 'Book.dmi'
		icon_state = "Pillar1"
		DblClick()
			var/mob/Test/A = new()
			A.loc = src.loc
			A.z = 3
			var/mob/Test/A2 = new()
			A2.loc = src.loc
			A2.z = 2
			for(var/Player/M in world)
				if(src.Content2 == M.Faction)
					for(var/mob/Monsters/X in M.UnitList)
						if(X in range(20,src))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
						if(X in range(20,A))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
						if(X in range(20,A2))
							usr << "There is a unit owned by the clan -[src.Content2]- within 20 spaces, kill it and remove the body to take control of this pillar."
							del A
							del A2
							return
			if(usr.Faction != "Player" && usr.Faction != "Uncaptured")
				for(var/mob/Monsters/M in usr.Selected) if(src in range(1,M))
					world << "<b><font color=silver><font size=3>[src] has been captured by [usr.Faction] at [src.x],[src.y],[src.z]"
					src.Content2 = usr.Faction
					del A
					del A2
					return
			else usr << "You need to be in a clan to capture a shrine."
			del A
			del A2
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
		Poison
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
		mouse_opacity=0 //Thus when you click blood you will be clicking the turf under the blood.
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			text = "<font color=red>~"

		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			text = "<font color=red>~"
			New()
				AcidSpray()

		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			text = "<font color=red>~"

			New()
				AcidSpray()

	Bloods
		mouse_opacity=0 //Thus when you click blood you will be clicking the turf under the blood.
		Zombie
			icon = 'Blood.dmi'
			icon_state = "Zombie"
			layer = 5
		BlackBlight
			icon = 'Blood.dmi'
			icon_state = "BlackBlight"
			layer = 5
		Infection
			icon = 'Blood.dmi'
			icon_state = "Infection"
			layer = 5
		AcidGoo
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "AcidGoo"
			text = "<font color=lime>~"
			New()
				AcidSpray()
				Delete()
		Blood
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "Propelled"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood1
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "1"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood2
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "2"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood3
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "3"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood4
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "4"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
		Blood5
			icon = 'Blood.dmi'
			name = "Blood"
			icon_state = "5"
			text = "<font color=red>~"
			New()
				AcidSpray()
				Delete()
	Items
		layer = 4
		Skin
			icon = 'Skin.dmi'
			icon_state = "FrogSkin"
			weight = 10
			suffix = null
			desc = "This is a peice of skin, it can be used for creating leather armour and clothes"
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
		Traps
			IsTrap = 1
			Cages
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
								var/obj/A4 = src
								A4.loc = M
								var/list/menu = new()
								if(M.density == 1)
									menu += "Drop"
									menu += "Inspect"
									for(var/mob/Monsters/Q in src)
										if(Q.Cantame == 1) menu += "Tame"
										if(Q.CanBeSlaved == 1 && Q.Race != "Demon") menu += "Enslave"
									//	if(M.Age >= 29 && M.SubRace=="Queen") menu += "Lay Eggs In"
										menu += "Contents"
										menu += "TakeItems"
										menu += "Release"
									menu += "Capture"
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
								if (Result == "Contents") for(var/mob/Monsters/A in src) usr << "[A] - [A.Gender]"
								if (Result == "TakeItems") for(var/mob/Monsters/A in src) for(var/obj/Items/O in A) if(A.DropItem(O)) O.loc=M.loc
								if (Result == "Enslave")
									for(var/mob/Monsters/A in src)
										A.ChangeOwnership(M.Owner)
										view() << "[A] has been enslaved!"
										A.name = "{[M.Owner]} Slave"
										A.loc = M.loc
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										A.InHole = 0
										A.CanBeCaged = 1
										A.HomeLoc=null
										A.PatrolPoint1 = null
										A.PatrolPoint2 = null
										A.HomeLoc = null
										A.Target = null
										A.Caged = 0
								if (Result == "Capture") for(var/mob/Monsters/C in oview(1,M)) if(!HasPersonIn&&!C.Wagon)
									if(!M.CanBeCaged)
										switch(C.Race)
											if("Gremlin","SandKing") usr << "[C.Race]s cannot be caged"
											else
												var/CAN
												if(C.CanBeCaged&&C.Owner==M.Owner) CAN=1
												if(C.InHole || C.Fainted || C.Tame || C.Cantame) CAN=1
												if(CAN)
													for(var/obj/Items/Traps/PitTrap/P in oview(1,M)) if(C.loc == P.loc) if(P.HasPersonIn) del(P)
													var/Escape = prob(C.Level - M.Level)
													if(M.Race == "Spider") Escape = prob(C.Level - (M.Level+10))
													if(!Escape)
														C.Target = null
														C.HomeLoc = null
														C.destination = null
														C.PatrolPoint1 = null
														C.PatrolPoint2 = null
														C.loc = src
														C.BleedType = null
														C.BloodContent = C.MaxBloodContent
														C.Caged = 1
														view(M) << "<b><font color=red>[C] is loaded into [src]"
														HasPersonIn = 1
														underlays += C
														C.Deselect()
													else
														C.InHole = 0
														view() << "[M] attempts to load [C] into a cage but they escape and climb out of the pit!"
														return
									else M.Owner << "[M] is part of a slave race, races that have been enslaved cannot cage units."
								if (Result == "Tame")
									for(var/mob/Monsters/C in src)
										C.loc = M.loc
										view() << "<b><font color=red>[C] is tamed by [M]"
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										C.name = "{[M.Owner]}"
										C.Tame = 1
										C.Cantame = 0
										C.destination = M
										C.InHole = 0
										C.WalkTo()
										C.Owner = C.OldOwner
										C.OldOwner = null
										C.Caged = 0
										C.Owner = M.Owner
										var/mob/F = M.Owner
										F.UnitList += C
								if (Result == "Release")
									for(var/mob/Monsters/C in src)
										C.loc = M.loc
										view(C) << "<b><font color=red>[C] is released from [src] by [M]"
										src.underlays = null
										src.overlays = null
										src.HasPersonIn = 0
										if(C.OldOwner)
											C.Owner = C.OldOwner
											C.OldOwner = null
										C.InHole = 0
										C.Caged = 0
				Content3 = "Cage"
				GoldCage
					icon = 'GoldItems.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a gold cage, it can be used to capture creatures in"

				MetalCage
					icon = 'MetalObjects.dmi'
					icon_state = "Cage"
					weight = 50
					suffix = null
					desc = "This is a metal cage, it can be used to capture creatures in"

				Cacoon
					icon = 'Spiders.dmi'
					icon_state = "Cage"
					weight = 25
					suffix = null

				BoneCage
					icon = 'BoneItems.dmi'
					icon_state = "Cage"
					weight = 40
					suffix = null
				WoodenCage
					icon = 'Cave.dmi'
					icon_state = "Cage"
					weight = 40
					suffix = null
					desc = "This is a wooden cage, it can be used to capture creatures in"

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
			CacoonTrap
				icon = 'Devourer.dmi'
				icon_state = "TinyCacoon"
				New()
					CacoonTrap()
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
			MagicScroll
				icon = 'Book.dmi'
				icon_state = "Scroll"
				weight = 2
				suffix = null
				desc = "An empty scroll."
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
								if(M.Race == "Svartalfar" && src.Content2 == 0)
									menu += "Write Magic"
								if(M.Intelligence >= 10 && M.MagicalAptitude == 1)
									menu += "Write Magic"
								if(src.Content2 != 0 && M.Intelligence >= 1)
									menu += "Cast"
								if(src.Content2 != 0 && M.Intelligence < 1)
									menu += "[M]'s too stupid to read"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if(Result == "[M]'s too stupid to read")
									M.Owner << pick("[M] gnaws on the paper and tears it to shreds!","[M] sits down and draws stupid scribbles all over the paper and ruins it!","[M] sets the paper on fire and watches it burn","[M] uses the scroll to wipe dirt off of it's face.","[M] thinks the scroll is a treasure map but is confused about the difDipopent X's marking the spots, so it throws it away.")
									M.weight -= src.weight
									del src
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
								if (Result == "Cast")
									if (src.Content2 == "Nether Travel")
										view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
										M.loc = locate(M.x,M.y,4)
										M.weight -= src.weight
										del src
									if (src.Content2 == "Teleportation")
										var/X = M.icon
										M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
										M.icon = 'Blood.dmi'
										flick("AstralBurst",M)
										view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
										for(var/turf/T in view(0,M))
											if(T.density == 1 && T.opacity == 1)
												M.icon = 'Blood.dmi'
												flick("AstralBurst",M)
												view(M) << "....and is torn to pieces by the dense object they stepped into!"
												spawn(10)
													M.icon = 'Blood.dmi'
													flick("HolyBurst",M)
												spawn(20)
													del(M)
										spawn(10)
											M.icon = X
											M.weight -= src.weight
											del src
									if (src.Content2 == "Nether Return")
										M.loc = locate(M.x,M.y,1)
										view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
										M.weight -= src.weight
										del src
									if (src.Content2 == "Damage Mind")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
												MM.EXP = 0
												MM.SwordSkill -= M.Intelligence/2
												MM.AxeSkill -= M.Intelligence/2
												MM.MaceSkill -= M.Intelligence/2
												MM.MetalCraftingSkill -= M.Intelligence/2
												MM.LeatherCraftingSkill -= M.Intelligence/2
												MM.MagicalConcentration -= M.Intelligence/2
												MM.MagicalAnger -= M.Intelligence/2
												MM.MagicalWill -= M.Intelligence/2
												MM.UnArmedSkill -= M.Intelligence/2
												M.weight -= src.weight
												del src
									if (src.Content2 == "Steal Thoughts")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
												M.GainEXP(MM.EXP)
												MM.EXP = 0
												MM.SwordSkill -= M.Intelligence/2
												MM.AxeSkill -= M.Intelligence/2
												MM.MaceSkill -= M.Intelligence/2
												MM.MetalCraftingSkill -= M.Intelligence/2
												MM.LeatherCraftingSkill -= M.Intelligence/2
												MM.MagicalConcentration -= M.Intelligence/2
												MM.MagicalAnger -= M.Intelligence/2
												MM.MagicalWill -= M.Intelligence/2
												MM.UnArmedSkill -= M.Intelligence/2
												M.SwordSkill += M.Intelligence/2
												M.AxeSkill += M.Intelligence/2
												M.MaceSkill += M.Intelligence/2
												M.MetalCraftingSkill += M.Intelligence/2
												M.LeatherCraftingSkill += M.Intelligence/2
												M.UnArmedSkill += M.Intelligence/2
												M.weight -= src.weight
												del src
									if (src.Content2 == "Insanity")
										for(var/mob/Monsters/MM in oview(5,M))
											if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM && src)
												view(M) << "[M] uses their force of *Thought* to scramble the mind of [MM] causing them to go in to temporary insanity."
												for(var/mob/Monsters/GGL in oview(6,MM))
													if(GGL != M)
														view(MM) << "[MM] starts chasing after random creatures!!!"
														MM.destination = GGL
														spawn(25)
															MM.destination = GGL
														spawn(50)
															MM.destination = GGL
														spawn(75)
															MM.destination = GGL
														break
												spawn(100)
												for(var/obj/Items/LLK in oview(6,MM))
													view(MM) << "[MM] starts chasing after random objects!!!"
													MM.destination = LLK
													spawn(200)
														MM.destination = LLK
													break
												spawn(300)
													view(MM) << "[MM]'s temporary insanity seems to have worn off."
													M.weight -= src.weight
													del src
													return
									if (src.Content2 == "Nether Alteration")
										var/list/menu3 = new()
										menu3 += "Grass"
										menu3 += "Snow"
										menu3 += "Desert"
										menu3 += "Hell"
										menu3 += "Mountains"
										menu3 += "Nether"
										menu3 += "Cancel"
										var/Result3 = input("Do What?", "Choose", null) in menu3
										if(Result3 == "Cancel") return
										if(M in range(10,usr))
											if(Result3 == "Grass")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "grass"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "Grass"
														Y.Sky = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "Grass"
														Y.density = 0
														Y.CanDigAt = 0
														Y.opacity = 0
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
											if(Result3 == "Nether")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "nether"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "NetherFloor"
														Y.Sky = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "NetherFloor"
														Y.density = 0
														Y.CanDigAt = 0
														Y.opacity = 0
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
											if(Result3 == "Snow")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "snow"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "Snow"
														Y.Sky = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "Snow"
														Y.density = 0
														Y.CanDigAt = 0
														Y.opacity = 0
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
											if(Result3 == "Desert")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "sand"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "Desert"
														Y.Sky = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "Desert"
														Y.density = 0
														Y.CanDigAt = 0
														Y.opacity = 0
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
											if(Result3 == "Hell")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "hellfloor"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "HellFloor"
														Y.Sky = 1
														Y.Cant = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "HellFloor"
														Y.density = 0
														Y.CanDigAt = 0
														Y.opacity = 0
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
											if(Result3 == "Mountains")
												for(var/mob/Monsters/MM in view(2,usr))
													if(MM.Owner != usr)
														usr << "You can't use this on someone elses units."
														return
												if(M in range(100,usr) && src)
													for(var/turf/grounds/Y in view(2,usr))
														Y.name = "Mountain"
														Y.icon = 'Cave.dmi'
														Y.icon_state = "CaveWall"
														Y.Sky = 1
														Y.Content3 = "CanClimb"
														Y.OIcon = "CaveFloor"
														Y.density = 1
														Y.CanDigAt = 1
														Y.opacity = 1
													view(usr) << "[M] uses its pure willpower to alter the landscape in this distant place."
													M.weight -= src.weight
													del src
												else
													usr << "[M] needs to be within 100 spaces of the target to use this!"
													return
										else usr<<"You can only cast this spell within 10 tiles of your unit."
									if (src.Content2 == "Willful Alteration")
										var/list/menu3 = new()
										menu3 += "Grass"
										menu3 += "Snow"
										menu3 += "Desert"
										menu3 += "Hell"
										menu3 += "Mountains"
										menu3 += "Cancel"
										var/Result3 = input("Do What?", "Choose", null) in menu3
										if (Result3 != "Cancel")
											..()
										if(Result3 == "Grass" && src)
											view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
											for(var/turf/grounds/Y in view(4,M))
												Y.name = "grass"
												Y.icon = 'Cave.dmi'
												Y.icon_state = "Grass"
												Y.Sky = 1
												Y.Content3 = "CanClimb"
												Y.OIcon = "Grass"
												Y.density = 0
												Y.CanDigAt = 0
												Y.opacity = 0
											M.weight -= src.weight
											del src
										if(Result3 == "Snow" && src)
											view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
											for(var/turf/grounds/Y in view(4,M))
												Y.name = "snow"
												Y.icon = 'Cave.dmi'
												Y.icon_state = "Snow"
												Y.Sky = 1
												Y.Content3 = "CanClimb"
												Y.OIcon = "Snow"
												Y.density = 0
												Y.CanDigAt = 0
												Y.opacity = 0
											M.weight -= src.weight
											del src
										if(Result3 == "Desert" && src)
											view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
											for(var/turf/grounds/Y in view(4,M))
												Y.name = "sand"
												Y.icon = 'Cave.dmi'
												Y.icon_state = "Desert"
												Y.Sky = 1
												Y.Content3 = "CanClimb"
												Y.OIcon = "Desert"
												Y.density = 0
												Y.CanDigAt = 0
												Y.opacity = 0
											M.weight -= src.weight
											del src
										if(Result3 == "Hell" && src)
											view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
											for(var/turf/grounds/Y in view(4,M))
												Y.name = "hellfloor"
												Y.icon = 'Cave.dmi'
												Y.icon_state = "HellFloor"
												Y.Sky = 1
												Y.Cant = 1
												Y.Content3 = "CanClimb"
												Y.OIcon = "HellFloor"
												Y.density = 0
												Y.CanDigAt = 0
												Y.opacity = 0
											M.weight -= src.weight
											del src
										if(Result3 == "Mountains" && src)
											view(M) << "[M] uses its pure willpower to alter the landscape surrounding itself"
											for(var/turf/grounds/Y in view(4,M))
												Y.name = "Mountain"
												Y.icon = 'Cave.dmi'
												Y.icon_state = "CaveWall"
												Y.Sky = 1
												Y.Content3 = "CanClimb"
												Y.OIcon = "CaveFloor"
												Y.density = 1
												Y.CanDigAt = 1
												Y.opacity = 1
											M.weight -= src.weight
											del src
									if (src.Content2 == "Destructive Alteration")
										for(var/mob/Monsters/MK in range(2,usr))
											if(MK.Owner != usr)
												usr << "You can't cast this directly on a unit."
												return
										var/list/menu3 = new()
										menu3 += "Lava"
										menu3 += "Water"
										menu3 += "Cancel"
										var/Result3 = input("Do What?", "Choose", null) in menu3
										if(Result3 == "Cancel") return
										if(usr in orange(10,M))
											if(Result3 == "Lava" && src)
												for(var/mob/Monsters/MK in range(2,usr))
													if(MK.Owner != usr)
														usr << "You can't cast this directly on a unit."
														return
												view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
												for(var/turf/grounds/Y in view(2,usr))
													Y.name = "Lava"
													Y.icon = 'Lava.dmi'
													Y.icon_state = "Lava"
													Y.Sky = 1
													Y.Content3 = "Lava"
													Y.OIcon = "Lava"
													Y.density = 1
													Y.CanDigAt = 0
													Y.opacity = 0
												M.weight -= src.weight
												del src
											if(Result3 == "Water" && src)
												for(var/mob/Monsters/MK in range(2,usr))
													if(MK.Owner != usr)
														usr << "You can't cast this directly on a unit."
														return
												view() << "[M] uses their furious force of will to alter the terrain in a very dangerous manner..."
												for(var/turf/grounds/Y in view(2,usr))
													Y.name = "Water"
													Y.icon = 'water.dmi'
													Y.icon_state = "water"
													Y.Sky = 1
													Y.Content3 = "Liquid"
													Y.OIcon = "water"
													Y.density = 1
													Y.CanDigAt = 0
													Y.opacity = 0
												M.weight -= src.weight
												del src
										else usr<<"You can only cast this spell within 10 tiles of your unit."
								if (Result == "Write Magic")
									var/list/menu2 = new()
									menu2 += "Cancel"
									if(M.MagicalConcentration >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Nether Travel"
										menu2 += "Nether Return"
										if(M.MagicalWill >= 20)
											menu2 += "Nether Alteration"
									if(M.MagicalWill >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Willful Alteration"
									if(M.MagicalAnger >= 20 && usr.DieAge >= usr.Age)
										if(M.MagicalWill >= 25)
											menu2 += "Destructive Alteration"
									if(M.MagicalMind >= 20 && usr.DieAge >= usr.Age)
										menu2 += "Insanity"
										if(M.MagicalAnger >= 20)
											menu2 += "Damage Mind"
											if(M.MagicalConcentration >= 25)
												menu2 += "Steal Thoughts"
										if(M.MagicalWill >= 25)
											menu2 += "Teleportation"
									var/Result2 = input("Do What?", "Choose", null) in menu2
									if (Result2 != "Cancel")
										..()
									if (Result2 == "Nether Travel")
										if(M.Mana >= 10 - M.MagicalConcentration / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 10 - M.MagicalConcentration / 10
										else
											M.Owner << "You need [10 - M.Mana] more mana."
									if (Result2 == "Teleportation")
										if(M.Mana >= 80 - M.MagicalWill / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 80 - M.MagicalWill / 10
										else
											M.Owner << "You need [80 - M.Mana] more mana."
									if (Result2 == "Nether Return")
										if(M.Mana >= 10 - M.MagicalConcentration / 10)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 10
										else
											M.Owner << "You need [10 - M.Mana] more mana."
									if (Result2 == "Damage Mind")
										if(M.Mana >= M.MagicalMind / 2)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalMind / 2
										else
											M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
									if (Result2 == "Steal Thoughts")
										if(M.Mana >= M.MagicalMind * 2)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= M.MagicalMind * 2
										else
											M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
									if (Result2 == "Insanity")
										if(M.Mana >= 25)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 25
											return
										else
											M.Owner << "You need [25 - M.Mana] more mana."
									if (Result2 == "Nether Alteration")
										if(M.Mana >= 30)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 30
										else
											M.Owner << "You need [30 - M.Mana] more mana."
									if (Result2 == "Willful Alteration")
										if(M.Mana >= 50)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 50
										else
											M.Owner << "You need [50 - M.Mana] more mana."
									if (Result2 == "Destructive Alteration")
										if(M.Mana >= 100)
											src.Content2 = "[Result2]"
											src.name = "[Result2] Scroll"
											src.icon_state = "SvartalfarScroll"
											M.Mana -= 100
										else
											M.Owner << "You need [100 - M.Mana] more mana."
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
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Race == "Vampire")
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										if(src.HasWater != "Unholy" && src.HasWater != "Holy")
											menu += "Drink"
										else
											menu += "Bless Equipped Weapon"
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
								if(Result == "Bless Equipped Weapon")
									for(var/obj/Items/Equipment/Weapon/W in M)
										if(W.suffix == "(Equipped)" && W.Content3 == 0)
											if(src.HasWater == "Unholy")
												W.name = "[W.name] - Cursed"
												W.Content3 = "Cursed"
											if(src.HasWater == "Holy")
												W.name = "[W.name] - Blessed"
												W.Content3 = "Blessed"
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
									if(M.Race == "Vampire")
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
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Race == "Vampire")
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
									if(V.Gender == "Female")
										menu += "Milk"
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
								if (Result == "Milk")
									for(var/mob/Monsters/V in oview(1,M))
										if(V.Gender == "Female")
											if(V.Hunger >= 25)
												var/GG = Race
												src.HasWater = "Milk"
												src.Content3 = GG
												if(!src.Content3)
													src.Content3 = "Unknown"
												V.Hunger -= 10
												view() << "[M] grabs [V] and milks her"
												return
											else
												usr << "[V] is too hungry!"
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
									if(src.HasWater == "Milk")
										M.Owner << "[M] drinks [src.Content3] milk from [src]"
										M.Hunger += 10
										if(M.Hunger >= 100)
											M.Hunger = 100
										src.HasWater = null
										src.Content3 = 0
									if(M.Race == "Vampire")
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
								for(var/turf/grounds/W in view(1,M))
									if(W.CanFish == 1)
										if(src.HasWater == null)
											if(M.Wagon == 0)
												menu += "Fill [src] with water"
								for(var/turf/grounds/Trees/Cactus/C in view(1,M))
									if(src.HasWater == null)
										if(M.Wagon == 0)
											menu += "Fill [src]"
								for(var/mob/Monsters/V in oview(1,M))
									if(V.Race == "Vampire")
										if(src.HasWater == "Water")
											if(M.Wagon == 0)
												menu += "Spray"
								if(src.HasWater)
									if(M.Wagon == 0)
										menu += "Empty [src]"
										if(src.HasWater != "Unholy" && src.HasWater != "Holy")
											menu += "Drink"
										else
											menu += "Bless Equipped Weapon"
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
								if(Result == "Bless Equipped Weapon")
									for(var/obj/Items/Equipment/Weapon/W in M)
										if(W.suffix == "(Equipped)" && W.Content3 == 0)
											if(src.HasWater == "Unholy")
												W.name = "[W.name] - Cursed"
												W.Content3 = "Cursed"
											if(src.HasWater == "Holy")
												W.name = "[W.name] - Blessed"
												W.Content3 = "Blessed"
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
									if(M.Race == "Vampire")
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
			DoorKey
				icon = 'MetalObjects.dmi'
				icon_state = "Key"
				weight = 5
				suffix = null
				desc = "This is a key, it opens a door and is attuned to a door"
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
									for(var/turf/grounds/D in view(0,M))
										if(D.icon_state == "Desert")
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
			MobileSandKing
				icon = 'Book.dmi'
				icon_state = "MobileSand"
				weight = 5
				suffix = null
				desc = "You can hear the sand king inside this caccoon, scratching against the inside with its slimy tendrils"
			EngineeredOrgan
				icon = 'Devourer.dmi'
				icon_state = "Organ"
				weight = 0
				NoDropOnDeath = 1
				suffix = null
				desc = "This disgusting organ appears to be alive and functioning, it is impossible to determine the original owner..."
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Inspect"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
			PortableDevourerCacoon
				icon = 'Eggs.dmi'
				icon_state = "Devourer"
				weight = 0
				name = "Dormant Cacoon"
				NoDropOnDeath = 1
				suffix = null
				desc = "The devourer is storing an unimaginable monstrosity in this pod constructed of reeking flesh, ready to be released upon the world at any time."
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						M.destination = null
						if(src in M)
							if(M.Wagon == 0)
								var/obj/A = src
								A.loc = M
								var/list/menu = new()
								menu += "Inspect"
								menu += "Initiate Incubation"
								menu += "Add Organ"
								menu += "Remove Organ"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Initiate Incubation")
									if(src in M)
										var/mob/Monsters/Egg/E = new(M.loc)
										E.icon_state="Devourer"
										E.ChangeOwnership(M.Owner)
										E.Breeding(M,M,600)
										E.CHILDTYPE = /mob/Monsters/DevourerZombie
										for(var/obj/G in src) G.loc = E
										del src
								if(Result == "Add Organ")
									if(src in M)
										var/list/menu2 = new
										for(var/obj/Items/Shafts/EngineeredOrgan/E in M)
											menu2 += E
										menu2 += "None"
										var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
										if(Result2 != "None")
											var/obj/I = Result2
											M.weight -= I.weight
											I.loc = src
								if(Result == "Remove Organ")
									if(src in M)
										var/list/menu2 = new
										for(var/obj/Items/Shafts/EngineeredOrgan/E in src)
											menu2 += E
										menu2 += "None"
										var/Result2 = input("What Organ Will You Choose?", "Choose", null) in menu2
										if(Result2 != "None")
											var/obj/I = Result2
											M.weight += I.weight
											I.loc = M
			AstralBook
				icon = 'Book.dmi'
				icon_state = "AstralBook"
				weight = 5
				Enchanted = 1
				suffix = null
				desc = "This book gives off a bit of static electricity while you hold it, the instructions page reads: Teleport: Teleports caster to desired location(Where your ghost is), be cautious as you will be incapacitated upon reaching your destination. Find: Locate someone who you wish to find. Lightning Bolt: Fire the energies of the book at your enemies."
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
							var/obj/A = src
							A.loc = M
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Create Portal"
							menu += "Destroy Portal"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Inspect") usr << src.desc
							if (Result == "Create Portal")
								for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
									usr << "There is a magic blocking portal stone near your destination, you cannot make a portal!"
									return
								for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
									usr << "There is a magic blocking portal stone near [M], you cannot make a portal!"
									return
								var/obj/AstralPortal/Port = new
								var/obj/AstralPortal/Port2 = new
								Port.loc = M.loc
								Port.GoesTo = usr.loc
								Port2.loc = usr.loc
								Port2.GoesTo = M.loc
								view() << "Someone has created a portal with this location as the destination!!!"
								return
							if (Result == "Destroy Portal")
								for(var/obj/AstralPortal/Port in view(5,M))
									view() << "[M] fires a bolt of astral energy into the portal and causes it to implode upon itself, destroying it completely"
									for(var/obj/AstralPortal/Port2 in range(1,Port.GoesTo))
										del Port2
										break
									del Port
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
									for(var/turf/grounds/D in view(0,M))
										if(D.icon_state == "Desert")
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
			Flag
				icon = 'Flags.dmi'
				icon_state = "Soviet Flag"
				weight = 7
				suffix = null
				desc = "This is a Flag, it can be used to poke out someone's eyes or to beat the over the head, also you can use it to symbolize your country..."
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
			SilverIngot
				icon = 'Cave.dmi'
				icon_state = "SilverIngot"
				weight = 20
				suffix = null
				desc = "This is a silver bar, it can be used to create armour and weapons as well as other fanciful things"
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.weight <= M.weightmax)
									if(M.Race != "Vampire" && M.SubRace != "Werewolf")
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
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
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Gold"
									menu += "Transmute Into Iron"
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
								if (Result == "Transmute Into Gold")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/GoldIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
								if (Result == "Transmute Into Iron")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/IronIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			GoldIngot
				icon = 'Cave.dmi'
				icon_state = "GoldIngot"
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
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Silver"
									menu += "Transmute Into Iron"
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
								if (Result == "Transmute Into Silver")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/SilverIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
								if (Result == "Transmute Into Iron")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/IronIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			IronIngot
				icon = 'Cave.dmi'
				icon_state = "IronIngot"
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
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Silver"
									menu += "Transmute Into Gold"
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
								if (Result == "Transmute Into Gold")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/GoldIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
								if (Result == "Transmute Into Silver")
									if(src.suffix == "(Carrying)")
										var/obj/Items/Ingots/SilverIngot/B = new()
										B.loc = M
										B.suffix = "(Carrying)"
										M.weight += B.weight
										M.weight -= src.weight
										view(M) << "[M] uses their force of will to change the metal into another type of metal."
										del src
										return
			AdamantiumIngot
				icon = 'Cave.dmi'
				icon_state = "AdamantiumIngot"
				weight = 0
				suffix = null
				desc = "This is a Adamantium ingot, it can be used to create amazing armour and weapons."
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
		Poisons
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
			Toxic
				icon = 'Cave.dmi'
				icon_state = "Toxic"
				weight = 10
				suffix = null
				desc = "This is toxic, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal posion."

			Poison
				icon = 'Cave.dmi'
				icon_state = "Poison"
				weight = 10
				suffix = null
				desc = "This is posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep."

			StrongPoison
				icon = 'Cave.dmi'
				icon_state = "StrongPoison"
				weight = 10
				suffix = null
				desc = "This is strong posion, it can be used to add poison to weapons, traps and food, it can be used to even poison units in their sleep. It is more deadly than normal poison and toxic"

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
			EternalLifePotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "SparklePotion"
				name = "Potion of Eternal Life"
				weight = 10
				suffix = null
				desc = "This is a potion of Eternal life, it will extend a units life time infinitely."
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
			DevourerPotion
				IsPotion = 1
				IsEmpty = 0
				icon = 'Farm Items.dmi'
				icon_state = "PurplePotion"
				name = "Immunity To Devourer Potion"
				weight = 10
				suffix = null
				desc = "This is a potion of immunity, it will make you immune to the dread Devourer disease"
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
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
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
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
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
				DblClick()

					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
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
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src in view(1,M))
							M.destination = null
							if(src.suffix == null)
								if(M.WearingBack == 1)
									for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in M)
										if(L.suffix == "(Equipped)")
											if(L.Content <= 250)
												src.loc = L
												L.Content += 1
												return
								else
									usr << "[M] : I have no quiver to put arrows in<br>"
									return
		Plants
			suffix = "Stuck"
			New()
				TomatoDecay()
			GrapeVine
				icon = 'Cave.dmi'
				icon_state = "PPlant1"
				Content3 = "Grape"
				weight = 10
				Content = 5
				desc = "This is a grape vine plant."
				New() src.PlantRegen()
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
										var/obj/Items/Food/Grape/T = new
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
				Content3 = "Tomato"
				weight = 10
				Content = 5
				desc = "This is a tomato plant."
				New() src.PlantRegen()
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
										var/obj/Items/Food/Tomato/T = new
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
			New() ItemDecay()
			Garlic
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
												A1.GarlicGrow()
												return
			PoisonSporeSeed
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
												A1.PoisonSporeGrow()
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
		Graves
			TombStone
				icon = 'StoneItems.dmi'
				icon_state = "TombStone1"
				weight = 30
				suffix = null
				TS = 1
				desc = "This a tomb stone, it can be placed over a Vrage."
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
				icon_state = "Vrage"
				weight = 10
				suffix = null
				desc = "Vrage"
		Furniture
			Fences
				WoodenFence
					icon = 'Fences.dmi'
					icon_state = "Wooden Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
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
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
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
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
				StoneFence
					icon = 'Fences.dmi'
					icon_state = "Stone Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
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
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
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
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
				MetalFence
					icon = 'Fences.dmi'
					icon_state = "Metal Fence"
					weight = 25
					desc = "This is a fence."
					suffix = null
					HumanParts = 0
					HP = 10
					DblClick()
						for(var/mob/Monsters/M in usr.Selected)
							if(src.Placed == 1)
								var/list/menu = new()
								menu += "Attack"
								menu += "Cancel"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Cancel")
									return
								if (Result == "Attack")
									M.destination = src
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
										var/list/menu = new()
										menu += "Drop"
										menu += "Inspect"
										menu += "Place"
										menu += "Destroy"
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
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Place")
											if(src.Placed == 0)
												src.loc = M.loc
												src.dir = M.dir
												src.density = 1
												M.weight -= src.weight
												src.Placed = 1
												src.opacity = 0
												src.Door = 1
												src.Locked = 0
												src.Death()
												return
			Doors
				Door = 1
				TrapDoor
					icon = 'Cave.dmi'
					icon_state = "ClosedTrapDoor"
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
										menu += "Make Key"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
											del(src)
											return
										if (Result == "Lock")
											if(src.Locked == 0)
												if(src.icon_state == "ClosedTrapDoor")
													src.Locked = 1
													view() << "[src] Locked!"
													return
											if(src.Locked == 1)
												if(src.icon_state == "ClosedTrapDoor")
													src.Locked = 0
													view() << "[src] Un-Locked!"
													return
										if (Result == "Make Key")
											var/obj/Items/Shafts/DoorKey/D = new
											D.loc = M
											M.weight += D.weight
											D.LockVar = src.LockVar
											M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Race == "Human")
													menu += "PickLock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															view(M) << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the trapdoor with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.icon_state == "OpenTrapDoor")
												src.icon_state = "ClosedTrapDoor"
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
														if(src.icon_state == "ClosedTrapDoor")
															src.Locked = 1
															view() << "[src] Locked!"
															return
													if(src.Locked == 1)
														if(src.icon_state == "ClosedTrapDoor")
															src.Locked = 0
															view() << "[src] Un-Locked!"
															return
												return
											if(src.icon_state == "ClosedTrapDoor")
												src.icon_state = "OpenTrapDoor"
												var/list/menu = new()
												menu += "Lock"
												menu += "Destroy"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Destroy")
													if(src in M)
														M.weight -= src.weight
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
											if(src.icon_state == "OpenTrapDoor")
												src.icon_state = "ClosedTrapDoor"
												return
											if(src.icon_state == "ClosedTrapDoor")
												src.icon_state = "OpenTrapDoor"
												return





								if(M in view(1,src))
									if(src.icon_state == "OpenTrapDoor")
										src.icon_state = "ClosedTrapDoor"
										return
									if(src.icon_state == "ClosedTrapDoor")
										src.icon_state = "OpenTrapDoor"
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
										menu += "Make Key"
										menu += "Destroy"
										menu += "Cancel"
										var/Result = input("What Action Will You Choose?", "Choose", null) in menu
										if (Result == "Cancel")
											return
										if (Result == "Destroy")
											if(src in M)
												M.weight -= src.weight
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
										if (Result == "Make Key")
											var/obj/Items/Shafts/DoorKey/D = new
											D.loc = M
											M.weight += D.weight
											D.LockVar = src.LockVar
											M.Owner << "[M] makes a key to this door, it can be used by anyone to unlock it"
									else
										if(M in view(1,src))
											if(src.density == 1)
												var/list/menu = new()
												for(var/obj/Items/Shafts/LockPick/P in M)
													menu += "PickLock"
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Race == "Human")
													menu += "PickLock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															view(M) << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
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
													if(src in M)
														M.weight -= src.weight
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
											if(src in M)
												M.weight -= src.weight
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
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Race == "Human")
													menu += "PickLock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
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
											if(src in M)
												M.weight -= src.weight
											del src
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
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Race == "Human")
													menu += "PickLock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
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
				StoneDoor
					icon = 'StoneItems.dmi'
					icon_state = "StoneDoor"
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
											if(src in M)
												M.weight -= src.weight
											del src
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
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.Race == "Human")
													menu += "PickLock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
													return
								if(src.Locked == 0)
									if(M.Owner == src.Owner)
										if(M in view(1,src))
											if(src.density == 0)
												src.density = 1
												src.opacity = 1
												src.icon_state = "StoneDoor"
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
												src.icon_state = "StoneOpen"
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
												src.icon_state = "StoneDoor"
												return
											if(src.density == 1)
												src.density = 0
												src.opacity = 0
												src.icon_state = "StoneOpen"
												return





								if(M in view(1,src))
									if(src.density == 0)
										src.density = 1
										src.opacity = 1
										src.icon_state = "StoneDoor"
										return
									if(src.density == 1)
										src.density = 0
										src.opacity = 0
										src.icon_state = "StoneOpen"
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
											if(src in M)
												M.weight -= src.weight
											del src
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
												for(var/obj/Items/Shafts/DoorKey/P in M)
													menu += "Unlock"
												if(M.SubRace == "Illithid")
													menu += "Unlock - TK"
												if(M.Race == "Human")
													menu += "PickLock"
												menu += "Attack"
												menu += "Cancel"
												var/Result = input("What Action Will You Choose?", "Choose", null) in menu
												if (Result == "Cancel")
													return
												if (Result == "Attack")
													M.destination = src
													src.Owner << "[M] is attacking your door at [src.x],[src.y],[src.z]!"
													return
												if (Result == "PickLock")
													if(M.Race != "Human")
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
													else
														var/a
														a = prob(M.LockPickingSkill+5)
														if(a == 0)
															M.Owner << "Failed"
															M.LockPickingSkill += 1
															break
															return
														else
															M.Owner << "Unlocked!"
															src.Locked = 0
															M.LockPickingSkill += 1
															return
												if (Result == "Unlock")
													for(var/obj/Items/Shafts/DoorKey/P in M)
														if(P.LockVar == src.LockVar)
															M.Owner << "[M] unlocks the door with a key."
															src.Locked = 0
															return
													return
												if (Result == "Unlock - TK")
													M.Owner << "[M] unlocks the door with their mind."
													src.Locked = 0
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
				PortalStone
					icon = 'Book.dmi'
					icon_state = "PortalStone"
					name = "Anti-Astral Stone"
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
									menu += "Destroy"
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
									if (Result == "Destroy")
										if(src.suffix == "(Carrying)")
											M.weight -= src.weight
											del src
											return
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
				BoneTrainingPost
					icon = 'Cave.dmi'
					icon_state = "BonePost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1
				SilkTrainingPost
					icon = 'Cave.dmi'
					icon_state = "SilkPost"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1
				WoodTrainingPost
					icon = 'Cave.dmi'
					icon_state = "Wood Post"
					weight = 50
					Content3 = 1
					suffix = null
					HP = 100
					TP = 1
					density = 1
				GoldTrainingPost
					icon = 'GoldItems.dmi'
					icon_state = "Gold Training Post"
					weight = 50
					suffix = null
					Content3 = 1
					HP = 100
					TP = 1
					density = 1
				SilverTrainingPost
					icon = 'SilverItems.dmi'
					icon_state = "Silver Training Post"
					weight = 50
					Silver = 1
					Content3 = 1
					HP = 100
					TP = 1
					density = 1
				MetalTrainingPost
					icon = 'MetalObjects.dmi'
					icon_state = "Metal Training Post"
					weight = 50
					HP = 100
					Content3 = 1
					TP = 1
					density = 1
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
				WoodenChair
					icon = 'Cave.dmi'
					icon_state = "Chair"
					weight = 15
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


									var/obj/A14 = src
									A14.loc = M
									var/list/menu = new()
									menu += "Drop"
									menu += "Face North"
									menu += "Face East"
									menu += "Face West"
									menu += "Face South"
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
									if (Result == "Face North")
										if(src.suffix == "(Carrying)")
											src.dir = 3
											src.layer = 5
									if (Result == "Face South")
										if(src.suffix == "(Carrying)")
											src.dir = 2
											src.layer = 4
									if (Result == "Face East")
										if(src.suffix == "(Carrying)")
											src.dir = 4
											src.layer = 4
									if (Result == "Face West")
										if(src.suffix == "(Carrying)")
											src.dir = 8
											src.layer = 4
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
						M.destination = null
						if(src in M)
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.MagicalWill >= 5)
								menu += "Transmute Into Stone"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Transmute Into Stone")
								var/obj/Items/ores/stone/K = new()
								K.loc = M
								M.weight += K.weight
								K.suffix = "(Carrying)"
								if(src in M)
									M.weight -= src.weight
								view(M) << "[M] uses their force of will to transmute the piece of wood into a large stone."
								del src
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
		gems
			New()
				ItemDecay()
			RubyRing
				icon = 'Jewelry.dmi'
				icon_state = "Ruby Ring"
				weight = 5
				desc = "This is a Ruby Ring, it can be enchanted by a Mage to create a Ring of Fury"
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
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.MagicalAptitude == 1 && src.Enchanted == 0)
								menu += "Enchant"
							if(src.Enchanted == 1) if(M.UsesEquipment)
								menu += "Wear"
								menu += "Remove"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Enchant")
								if(M.Mana >= 40)
									if(src.icon_state == "Silver Ruby Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Fury"
									if(src.icon_state == "Ruby Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Berserker Fury"
								else
									usr << "[M] needs 40 mana to do this!"
							if (Result == "Wear")
								if(src.suffix == "(Carrying)")
									if(M.WearingRing == 0)
										src.suffix = "(Equipped)"
										M.WearingRing = 1
										usr << "[M] puts on the [src]"
										M.WeaponDamageMin += 2
										M.WeaponDamageMax += 5
										return
									else
										usr << "[M] is already wearing a ring"
							if (Result == "Remove")
								if(src.suffix == "(Equipped)")
									if(M.WearingRing == 1)
										src.suffix = "(Carrying)"
										M.WearingRing = 0
										usr << "[M] takes off the [src]"
										M.WeaponDamageMin -= 2
										M.WeaponDamageMax -= 5
										return
									else
										usr << "[M] isn't wearing a ring"
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
			DiamondRing
				icon = 'Jewelry.dmi'
				icon_state = "Diamond Ring"
				weight = 5
				desc = "This is a Diamond Ring, it can be enchanted by a Mage to create a Ring of Protection"
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
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.MagicalAptitude == 1 && src.Enchanted == 0)
								menu += "Enchant"
							if(src.Enchanted == 1) if(M.UsesEquipment)
								menu += "Wear"
								menu += "Remove"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Enchant")
								if(M.Mana >= 40)
									if(src.icon_state == "Silver Diamond Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Protection"
									if(src.icon_state == "Diamond Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Invulnerable Flesh"
								else
									usr << "[M] needs 40 mana to do this!"
							if (Result == "Wear")
								if(src.suffix == "(Carrying)")
									if(M.WearingRing == 0)
										src.suffix = "(Equipped)"
										M.WearingRing = 1
										usr << "[M] puts on the [src]"
										M.Defence += 10
										if(src.icon_state == "Diamond Ring")
											M.Defence += 5
											M.ImmuneToMagic = 1
										return
									else
										usr << "[M] is already wearing a ring"
							if (Result == "Remove")
								if(src.suffix == "(Equipped)")
									if(M.WearingRing)
										src.suffix = "(Carrying)"
										M.WearingRing = 0
										usr << "[M] takes off the [src]"
										M.Defence -= 10
										if(src.icon_state == "Diamond Ring")
											M.Defence -= 5
										return
									else
										usr << "[M] isn't wearing a ring"
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
			EmeraldRing
				icon = 'Jewelry.dmi'
				icon_state = "Emerald Ring"
				weight = 5
				desc = "This is a Emerald Ring, it can be enchanted by a Mage to create a Ring of Poison Resistance"
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
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.MagicalAptitude == 1 && src.Enchanted == 0)
								menu += "Enchant"
							if(src.Enchanted == 1) if(M.UsesEquipment)
								if(!M.WearingRing)
									menu += "Wear"
								if(M.WearingRing)
									menu += "Remove"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Enchant")
								if(M.Mana >= 40)
									if(src.icon_state == "Silver Emerald Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Poison Resistance"
									if(src.icon_state == "Emerald Ring")
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 40
										src.Enchanted = 1
										src.name = "Ring of Pestilence"
								else usr << "[M] needs 40 mana to do this!"
							if (Result == "Wear")
								if(src.suffix == "(Carrying)")
									if(!M.WearingRing)
										if(M.ImmunePoison == 0)
											src.suffix = "(Equipped)"
											M.WearingRing = 1
											usr << "[M] puts on the [src]"
											M.ImmunePoison = 1
											return
										else usr << "[M] is already immune to poison!"
									else usr << "[M] is already wearing a ring"
							if (Result == "Remove")
								if(src.suffix == "(Equipped)")
									if(M.WearingRing)
										src.suffix = "(Carrying)"
										M.WearingRing = 0
										usr << "[M] takes off the [src]"
										M.ImmunePoison = 0
										return
									else usr << "[M] isn't wearing a ring"
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
			PlantFibreRing
				icon = 'Jewelry.dmi'
				icon_state = "Lycan Ring"
				weight = 5
				desc = "This is a Plant Fibre Ring, it can be enchanted by a Mage to create a Ring of Lycanthropy"
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
								if(M.MagicalAptitude == 1 && src.Enchanted == 0)
									menu += "Enchant"
								if(src.Enchanted == 1)
									if(!M.WearingRing) if(M.UsesEquipment)
										menu += "Wear"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Enchant")
									if(M.Mana >= 60)
										usr << "Enchants the ring with magical essence!"
										M.Mana -= 60
										src.Enchanted = 1
										src.name = "Ring of Lycanthropy"
									else
										usr << "[M] needs 60 mana to do this!"
								if (Result == "Wear")
									if(src.suffix == "(Carrying)")
										if(!M.WearingRing)
											if(!M.SubRace && M.Race != "Vampire" && M.Race != "Spider" && M.Race != "Gargoyle" && M.Wagon == 0 && M.Race != "Skeleton" )
												M.WearingRing = 1
												usr << "[M] puts on the ring of Lycanthropy, it bonds to their flesh and eats into their hand!"
												M.SubRace = "Werewolf"
												M.Carn = 1
												M.Strength += 4
												M.Agility += 4
												M.Defence += 15
												M.Delay -= 1
												M.Regen()
												if(M.DropItem(src)) del(src)
											else
												usr << "[M] attempts to wear the ring but it slips off their finger leaving large, bloody gashes"
												M.BloodLoss()
												M.BloodContent -= 10
												if(M.Race == "Vampire")
													usr << "[M]'s ring finger is sliced off!"
													M.WearingRing = 1
										else
											usr << "[M] is already wearing a ring"
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
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
				desc = "This is an Un-Cut Diamond, it can be used by a Jewel Crafter to create a Diamond"
				DblClick()
					for(var/mob/Monsters/M in usr.Selected)
						if(src in oview(1,M)) if(M.PickUpItem(src,1)) return
						if(loc==M)
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.Race == "Gargoyle")
								menu += "Eat"
								menu += "Heal"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Eat")
								usr << "[M] shoves the diamond down its gullet and begins to digest it and gains a bonus 10 defence!"
								M.Hunger = 100
								if(M.SavedDefence < 150)
									M.Defence += 10
									M.SavedDefence += 10
								else M.Owner << "You have gained over 150 defence from eating gems and can no longer gain further defense from eating them."
								if(M.DropItem(src)) del(src)
							if (Result == "Heal")
								usr << "[M] uses a diamond's energy to heal the cracks and damages of their body. The absorbtion causes their body to become weaker and loses 10 points of defence."
								M.FullHeal(1)
								M.Defence -= 10
								M.SavedDefence -= 10
								if(M.DropItem(src)) del(src)
							if (Result == "Drop") M.DropItem(src)
			UnCutRuby
				icon = 'Cave.dmi'
				icon_state = "Un-CutRuby"
				weight = 10
				desc = "This is an Un-Cut Ruby, it can be used by a Jewel Crafter to create a Ruby"
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
								if(M.Race == "Gargoyle")
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the ruby down its gullet and begins to digest it   You have eaten [M.GargRuby] Rubies, you gain power at 15, 30, and 100."
									M.Hunger = 100
									M.GargRuby += 1
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			UnCutEmerald
				icon = 'Cave.dmi'
				icon_state = "Un-CutEmerald"
				desc = "This is an Un-Cut Emerald, it can be used by a Jewel Crafter to create a Emerald"
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
						M.destination = null
						if(src in M)
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							menu += "Cancel"
							if(M.Race == "Gargoyle")
								menu += "Eat"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Eat")
								usr << "[M] shoves the emerald down its gullet and begins to digest it   You have eaten [M.GargEmerald] Emeralds, you gain power at 15, 30, and 100."
								M.Hunger = 100
								M.GargEmerald += 1
								var/obj/St = src
								M.weight -= St.weight
								del St
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
		ores
			New() ItemDecay()
			Iron
				name = "Iron"
				icon = 'Cave.dmi'
				icon_state = "Iron"
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
						M.destination = null
						if(src in M)
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							if(M.Race == "Gargoyle")
								menu += "Eat"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Eat")
								usr << "[M] shoves the iron down its gullet and begins to digest it"
								M.Hunger = 100
								var/obj/St = src
								M.weight -= St.weight
								del St

							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
			Adamantium
				name = "Adamantium"
				icon = 'Cave.dmi'
				icon_state = "Adamantium"
				weight = 20
				desc = "This is a chunk of Adamantium, it can be used to create Ingots for amazing armour and weapon creation"
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
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							if(M.Race == "Gargoyle")
								menu += "Eat"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result == "Inspect")
								usr << src.desc
							if (Result == "Eat")
								usr << "[M] shoves the Adamantium down its gullet and starts to crack and crumbles as it's body is destroyed!"
								src.loc = M.loc
								src.suffix = null
								M.weight -= src.weight
								M.GoingToDie = 1
								M.Killer = "a piece of Adamantium ore"
								M.DeathType = "eating it like a moron."
								M.Death()
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
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
			Gold
				icon = 'Cave.dmi'
				icon_state = "Gold"
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
						M.destination = null
						if(src in M)
							if(M)



								var/list/menu = new()
								menu += "Drop"
								menu += "Inspect"
								if(M.Race == "Gargoyle")
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the piece of gold down its gullet"
									M.Hunger = 100
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			Silver
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
									if(M.Race != "Vampire" && M.SubRace != "Werewolf")
										src.loc = M
										src.suffix = "(Carrying)"
										M.weight += src.weight
										return
									else
										view() << "[M] tries to pick up the silver but it leaves a steaming, burnt spot on their hand and they drop it"
										M.BloodContent -= 5
										M.BloodLoss()
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
								if(M.Race == "Gargoyle")
									menu += "Eat"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Eat")
									usr << "[M] shoves the piece of silver down it's gullet"
									M.Hunger = 100
									var/obj/St = src
									del St

									M.weight -= St.weight
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return
			stone
				name="Stone"
				icon = 'Cave.dmi'
				icon_state = "Stone"
				weight = 20
				desc = "This is a lump of stone, it can be used to detail walls and floors, it can also be used for statue creation or food for Gargoyles"
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
								if(M.Race == "Gargoyle")
									menu += "Eat"
								if(M.MagicalWill >= 10)
									menu += "Transmute Into Wood"
								var/Result = input("What Action Will You Choose?", "Choose", null) in menu
								if (Result != "Cancel")
									..()
								if (Result == "Inspect")
									usr << src.desc
								if (Result == "Transmute Into Wood")
									var/obj/Items/woods/wood/K = new()
									K.loc = M
									M.weight += K.weight
									K.suffix = "(Carrying)"
									if(src in M)
										M.weight -= src.weight
									view(M) << "[M] uses their force of will to transmute the piece of stone into a piece of wood."
									del src
								if (Result == "Eat")
									view() << "[M] swallows a large rock whole"
									M.Hunger = 100
									var/obj/St = src
									M.weight -= St.weight
									del St
								if (Result == "Drop")
									if(src.suffix == "(Carrying)")
										var/obj/A1 = src
										A1.loc = M.loc
										A1.suffix = null
										M.weight -= A1.weight
										return



