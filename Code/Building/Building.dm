/*turf/Ground
	icon='Grounds.dmi'
	New(turf/LOC)
		..()
		TurfBase = type
		TurfFloor = null
		TurfLiquid = null
		TurfBridge = null
		TurfWall = null
	Cave
		icon_state="Cave"
		New(turf/LOC)
			..()
			if(y==3) icon_state="Peak"
	Sand icon_state="Sand"
	Snow icon_state="Snow"
	Hell icon_state="Hell"
	Grass icon_state="Grass"
	Marsh
		icon_state="Marsh"
		New(turf/LOC)
			..()
			if(prob(40)) icon_state="[icon_state][rand(1,5)]"
turf/Floor
	New(turf/LOC)
		..()
		TurfFloor=type
		TurfLiquid = null
		TurfBridge = null
		TurfWall = null
		return(1)
turf/Liquid
	New(turf/LOC)
		..()
		TurfLiquid=type
		TurfBridge = null
		TurfWall = null
		return(1)
turf/Bridge
	New(turf/LOC)
		..()
		TurfBridge=type
		TurfWall = null
		return(1)
turf/Wall
	New(turf/LOC)
		..()
		TurfWall=type

turf/New(turf/LOC) if(isturf(LOC))
	TurfBase = LOC.TurfBase
	TurfFloor = LOC.TurfFloor
	TurfLiquid = LOC.TurfLiquid
	TurfBridge = LOC.TurfBridge
	TurfWall = LOC.TurfWall
turf/var
	TurfBase = /turf/grounds/cavefloor2/
	TurfFloor = null
	TurfLiquid = null
	TurfBridge = null
	TurfWall = null
mob/proc/BuildAt(turf/LOCATION) if(isturf(LOCATION)) for(var/mob/Monsters/M in view(1,LOCATION)) if(M.Owner==src) switch(SubFunction)
	if("DestroyFloor") if(!LOCATION.density) if(LOCATION.Detailed) new LOCATION.TurfBase(LOCATION)
	else
		new SubFunction(LOCATION)*/
mob/var/tmp
	Function = null
	SubFunction = null
turf/proc/ClearTurf(LINKED)
	if(icon=='Stairs.dmi')
		underlays-=underlays
		var/Z
		if(copytext(icon_state,-2)=="Up") switch(z)
			if(GROUND_LAYER) Z=SKY_LAYER
			if(UNDERGROUND_LAYER) Z=GROUND_LAYER
			if(SKY_LAYER) return
		if(copytext(icon_state,-4)=="Down") switch(z)
			if(GROUND_LAYER) Z=UNDERGROUND_LAYER
			if(UNDERGROUND_LAYER) return
			if(SKY_LAYER) Z=GROUND_LAYER
		var/turf/TURF=locate(x,y,Z)
		if(TURF) if(TURF.icon=='Stairs.dmi') if(!LINKED) TURF.ClearTurf(LINKED=1)
	if(isbridge)
		CanFish = 1
		density = 1
		opacity = 0
		Detailed = 0
		isbridge = 0
		name = null
		IsWood = 0
		if(Content == "Swamp")
			icon = 'Swamp.dmi'
			icon_state = "water"
			name = "Swamp"
			text = "<font color=#33CC99>S"
		if(icon_state == "LavaBridge")
			icon_state = "Lava"
			name = "Magma"
			CanFish = 0
			text = "<font color=#FF3333>L"
		if(Content == "Water")
			icon = 'water.dmi'
			icon_state = "water"
			name = "Water"
			text = "<font color=#0000CC>W"
		if(Content == "CaveWater")
			icon = 'water.dmi'
			icon_state = "water"
			name = "Water"
			CaveWater = 1
			text = "<font color=#0000CC>W"
		return
	else
		icon='Cave.dmi'
		icon_state = "DFloor"
		name = "Floor"
		density = 0
		opacity = 0
		name = null
		Detailed = 0
		IsWood = 0
		if(Content3 == "Peak")
			icon = 'Cave.dmi'
			icon_state = "Peak"
			name = "MountainPeak"
			density = 0
			Detailed = 0
			text = "<font color=#999966>×"
		if(Content == "Sky")
			icon = 'Cave.dmi'
			icon_state = "Sky"
			name = "Sky"
			density = 0
			Detailed = 0
			text = "<font color=#66FFFF>×"
		if(z == 1)
			var/obj/Support/Q = new
			Q.loc = locate(x,y,3)
			for(var/turf/T in view(0,Q))
				if(T.Supported == 1)
					T.Supported = 0
					T.icon_state = "DFloor"
					T.name = "Floor"
					T.density = 0
					T.Detailed = 0
					if(T.Content3 == "Peak")
						T.icon = 'Cave.dmi'
						T.icon_state = "Peak"
						T.name = "MountainPeak"
						T.text = "<font color=#999966>×"
					if(T.Content == "Sky")
						T.icon = 'Cave.dmi'
						T.icon_state = "Sky"
						T.name = "Sky"
						T.text = "<font color=#66FFFF>×"
			del(Q)
		return

turf/MouseDrag(src)
	var/turf/S = src
	if(isturf(src))
//		switch(usr.Function)
//			if("Build") for(var/mob/Monsters/M in view(1,src)) if(M.Owner==usr) usr.BuildAt(src)
		if(usr.Function == "Pyrokinesis") for(var/mob/Monsters/M in usr.Selected)
			if(M.SubRace == "Illithid" && M.Tiredness >= 0)
				if(S.IsWood == 1)
					if(M in range(8,S))
						if(S.OnFire == 0)
							for(var/mob/Monsters/M2 in view(0,S))
								return
							S.Fire()
							M.Tiredness -= 75
							if(M.invisibility >= 1)
								M.invisibility = 0
								view(M) << "[M] becomes visible!"
							view(M) << "[M] uses their powers of pyrokinesis to set [S] ablaze!"
							return
					else M.Owner << "[M] is too far away to use their pyrokinesis"
			else M.Owner << "[M] cannot use pyrokinesis right now."
		if(usr.Function == "Forcefield")
			for(var/mob/Monsters/M in usr.Selected)
				if(M.SubRace == "Illithid" && M.Tiredness >= 0)
					if(M in range(8,S))
						for(var/mob/Monsters/M2 in view(0,S))
							return
						M.destination = null
						M.Tiredness -= 10
						M.Tiredness += M.Intelligence / 50
						S.ForceField()
						return
					else M.Owner << "[M] is too far away to use their forcefield"
				else M.Owner << "[M] cannot use forcefield right now."
		if(usr.Function == "Telekinesis")
			for(var/mob/Monsters/M in usr.Selected)
				if(M.Tiredness >= 0)
					if(M.SubRace == "Illithid" && M.CoolDown("Telekinesis",-1))
						if(M in range(8,S))
							M.destination = null
							M.Tiredness -= 5
							M.Tiredness += M.Intelligence / 25
							M.StopWalk()
							if(M.invisibility >= 1)
								M.invisibility = 0
								view(M) << "[M] becomes visible!"
							S.SparkleGlow()
							for(var/obj/Items/I in view(1,S))
								if(S.density == 0)
									if(M.Tiredness >= 0)
										I.loc = S
										for(var/mob/Monsters/M2 in S)
											view(M2) << "[I] flies into [M2]!"
											M2.BloodContent -= I.weight / 4
											M.GainEXP(5)
											M.Tiredness -= I.weight / 10
											M2.BloodLoss()
											M.CoolDown("Telekinesis",30)
											return
										M.Tiredness -= I.weight / 10
							for(var/mob/Monsters/M2 in view(1,S))
								if(S.density == 1 && S.opacity == 1)
									var/Stunned = prob(30)
									var/DropWeapon = prob(7)
									var/DropShield = prob(7)
									view(M2) << "[M2] slams into [S]!"
									M.CoolDown("Telekinesis",30)
									M.GainEXP(5)
									M.Intelligence += 0.01
									M2.StopWalk()
									M2.BloodContent -= 15
									M2.BloodContent -= M.Intelligence / 10
									M2.BloodLoss()
									if(Stunned == 1)
										M2.StunnedWalk()
									if(DropWeapon) for(var/obj/Items/Equipment/Weapon/W in M2) if(M2.UnEquipItem(W)) if(M2.DropItem(W)) view(M2) << "[M2] loses hold of [W]!"
									if(DropShield) for(var/obj/Items/Equipment/Armour/Shield/W in M2) if(M2.UnEquipItem(W)) if(M2.DropItem(W)) view(M2) << "[M2] loses hold of [W]!"
									return
								if(S.density == 0)
									for(var/mob/Monsters/M3 in view(1,S))
										if(M3 != M2)
											var/Stunned = prob(15)
											var/DropWeapon = prob(5)
											var/DropShield = prob(4)
											view(M2) << "[M2] slams into [M3]!"
											M.CoolDown("Telekinesis",30)
											M.GainEXP(5)
											M.Intelligence += 0.02
											M2.StopWalk()
											M3.StopWalk()
											M2.BloodContent -= 15
											M3.BloodContent -= 15
											M2.BloodLoss()
											M3.BloodLoss()
											M2.loc = S
											if(Stunned == 1)
												M2.StunnedWalk()
												M3.StunnedWalk()
											if(DropWeapon) for(var/obj/Items/Equipment/Weapon/W in M2) if(M2.UnEquipItem(W)) if(M2.DropItem(W)) view(M2) << "[M2] loses hold of [W]!"
											if(DropShield) for(var/obj/Items/Equipment/Armour/Shield/W in M2) if(M2.UnEquipItem(W)) if(M2.DropItem(W)) view(M2) << "[M2] loses hold of [W]!"
											return
									M2.loc = S
									M2.StopWalk()
									return
						else
							M.Owner << "[M] is too far away to use their telekinesis"
				else
					M.Owner << "[M] is too tired to use telekinesis right now."
		if(usr.Function == "PlaceAutodig")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(S.CanDigAt == 1 || S.Tree == 1 || S.icon_state == "CaveWall")
					for(var/obj/DigAt/DD2 in S) return
					var/obj/DigAt/DD = new(S)
					DD.Owner = M
		if(usr.Function == "RemoveAutodig")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				for(var/obj/C in S) if(istype(C,/obj/DigAt/) && C.Owner == M) del(C)
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
								S.text = "<font color=#909090>×"
								M.weight -= W.weight
								del(W)
								break
						if(S.Content == "Chasm")
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
								S.text = "<font color=#909090>×"
								S.Content = null
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
								S.text = "<font color=#660000>×"
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
								if(M.Race == "Spider")
									if(S.isbridge == 0)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.icon = 'Spiders.dmi'
										S.icon_state = "Silk Bride"
										S.text = "<font color=#D8D8D8>×"
										M.WebContent -= 25
					if(S.Content == "Chasm")
						if(S.isbridge == 0)
							if(M.WebContent >= 25)
								if(M.Race == "Spider")
									if(S.isbridge == 0)
										S.density = 0
										S.CanFish = 0
										S.name = null
										S.isbridge = 1
										S.icon = 'Spiders.dmi'
										S.icon_state = "Silk Bride"
										S.text = "<font color=#D8D8D8>×"
										S.Content = null
										M.WebContent -= 25
		if(usr.Function == "PlaceBoneBridge")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					for(var/obj/Items/Bones/Bones/W in M)
						if(S.Content3 == "Liquid")
							if(S.isbridge == 0)
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
								S.text = "<font color=#C8C8C8>×"
								M.weight -= W.weight
								del(W)
								break
						if(S.Content == "Chasm")
							if(S.isbridge == 0)
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
								S.text = "<font color=#C8C8C8>×"
								M.weight -= W.weight
								S.Content = null
								del(W)
								break
		if(usr.Function == "PlaceTribalBridge")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					for(var/obj/Items/woods/wood/W in M)
						if(S.Content3 == "Liquid")
							if(S.isbridge == 0)
								if(M.Race == "Lizardman" || M.Race == "Frogman")
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
									S.text = "<font color=#999966>×"
									M.weight -= W.weight
									del(W)
									break
						if(S.Content == "Chasm")
							if(S.isbridge == 0)
								if(M.Race == "Lizardman" || M.Race == "Frogman")
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
									S.text = "<font color=#999966>×"
									S.Content = null
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
								S.text = "<font color=#999966>×"
								M.weight -= W.weight
								del(W)
								break
						if(S.Content == "Chasm")
							if(S.isbridge == 0)
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
								S.text = "<font color=#999966>×"
								S.Content = null
								M.weight -= W.weight
								del(W)
								break
		if(usr.Function == "DestroyFloor")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					if(S.density == 0)
						if(S.Detailed) S.ClearTurf()
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
										S.text = "<font color=#888888>×"
										if(M.SandWorker == 1)
											S.icon_state = "SandFloor"
											S.text = "<font color=#CCCC33>×"
										if(M.Race == "Goblin")
											S.icon_state = "GoblinFloor"
											S.text = "<font color=#383838>×"
										if(M.SubRace == "Illithid")
											S.icon_state = "IllithidFloor"
											S.text = "<font color=#9966CC>×"
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
											if(M.SandWorker == 1)
												S.icon_state = "SandFloor"
												S.text = "<font color=#CCCC33>×"
											if(M.Race == "Goblin")
												S.icon_state = "GoblinFloor"
												S.text = "<font color=#383838>×"
											if(M.SubRace == "Illithid")
												S.icon_state = "IllithidFloor"
												S.text = "<font color=#9966CC>×"
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
										if(M.Race == "Lizardman" || M.Race == "Frogman")
											S.icon_state = "Tribal"
											S.name = "TribalFloor"
											S.density = 0
											S.Detailed = 1
											S.IsWood = 1
											S.text = "<font color=#99CC00>×"
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
												S.name = "TribalFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 1
												S.text = "<font color=#99CC00>×"
									M.BuildingSkill += 0.5
									break
		if(usr.Function == "PlaceDevourerFloor")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					if(S.Detailed == 0)
						if(S.isbridge == 0)
							if(S.density == 0)
								if(M.EggContent >= 1)
									if(S.icon_state != "Sky")
										if(M.Race == "Devourer")
											S.icon_state = "DevourerFloor"
											S.name = "DevourerFloor"
											S.density = 0
											S.Detailed = 1
											S.IsWood = 0
											S.text = "<font color=red>×"
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
												S.icon_state = "DevourerFloor"
												S.name = "DevourerFloor"
												S.density = 0
												S.Detailed = 1
												S.IsWood = 0
												S.text = "<font color=red>×"
									M.BuildingSkill += 0.5
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
										S.icon_state = "BoneFloor"
										S.name = "Floor"
										S.density = 0
										S.name = null
										S.Detailed = 1
										S.text = "<font color=#D0D0D0>×"
										if(S.z == 1)
											var/obj/Support/Q = new
											Q.loc = locate(S.x,S.y,3)
											for(var/turf/T in view(0,Q))
												if(T.Supported == 0)
													T.Supported = 1
											del(Q)
									else
										if(S.density == 0)
											if(S.Supported == 1)
												S.icon_state = "BoneFloor"
												S.name = "bonefloor"
												S.density = 0
												S.name = null
												S.Detailed = 1
												S.text = "<font color=#D0D0D0>×"
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
										S.icon_state = "WoodFloor"
										S.name = "woodfloor"
										S.density = 0
										S.name = null
										S.Detailed = 1
										S.IsWood = 1
										S.text = "<font color=#999933>×"
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
												S.name = "woodfloor"
												S.density = 0
												S.Detailed = 1
												S.name = null
												S.IsWood = 1
												S.text = "<font color=#999933>×"
									break
		if(usr.Function == "PlaceBoneWall")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/obj/Items/Bones/Bones/W in M)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(S.icon_state != "Sky")
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
								S.text = "<font color=#D8D8D8>#"
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
										S.text = "<font color=#D8D8D8>#"
										M.weight -= W.weight
										del(W)
										break
		if(usr.Function == "PlaceSilkWall")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					if(S.density == 0)
						if(M.Race == "Spider")
							if(M.WebContent >= 25)
								if(S.icon_state != "Sky")
									S.icon = 'Cave.dmi'
									S.icon_state = "SilkWall2"
									S.name = "SilkWall"
									S.density = 1
									S.HP = 1000
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.IsWall = 1
									S.IsWood = 1
									M.WebContent -= 25
									S.CanDigAt = 1
									S.opacity = 1
									S.text = "<font color=#E8E8E8>#"
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
											S.icon_state = "SilkWall2"
											S.name = "SilkWall"
											S.density = 1
											S.HP = 1000
											S.IsWood = 1
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.IsWall = 1
											M.WebContent -= 25
											S.CanDigAt = 1
											S.opacity = 1
											S.text = "<font color=#E8E8E8>#"
		if(usr.Function == "PlaceDevourerWall")
			for(var/mob/Monsters/M in usr.Selected)
				M.destination = null
				if(M in range(1,S))
					if(S.density == 0)
						if(M.Race == "Devourer")
							if(M.EggContent >= 0.25)
								if(S.icon_state != "Sky")
									S.icon = 'Cave.dmi'
									S.icon_state = pick("DevourerWall1","DevourerWall2","DevourerWall3","DevourerWall4")
									S.name = "DevourerWall"
									S.density = 1
									S.HP = 1100
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.IsWall = 1
									S.IsWood = 0
									M.EggContent -= 0.25
									S.CanDigAt = 1
									S.opacity = 1
									S.text = "<font color=red>#"
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
											S.icon_state = pick("DevourerWall1","DevourerWall2","DevourerWall3","DevourerWall4")
											S.name = "DevourerWall"
											S.density = 1
											S.HP = 1100
											S.IsWood = 0
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.IsWall = 1
											M.EggContent -= 0.25
											S.CanDigAt = 1
											S.opacity = 1
											S.text = "<font color=red>#"
		if(usr.Function == "PlaceTribalWall")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/obj/Items/woods/wood/W in M)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(S.icon_state != "Sky")
								if(M.Race == "Lizardman" || M.Race == "Frogman")
									S.icon_state = "TribalWall"
									S.name = "Tribal Wall"
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
									S.text = "<font color=#99CC66>#"
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
										S.name = "Tribal Wall"
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
										S.text = "<font color=#99CC66>#"
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
								S.name = "Mountain"
								S.HP += 1000
								S.HP += M.BuildingSkill
								M.BuildingSkill += 1
								S.CanDigAt = 1
								M.StoneCraftingSkill += 1
								S.density = 1
								S.IsWall = 0
								S.opacity = 1
								S.name = null
								S.Detailed = 1
								S.text = "<font color=#999933>#"
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
										S.name = "Mountain"
										S.HP += 1000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 0
										S.opacity = 1
										S.Detailed = 1
										S.name = null
										S.text = "<font color=#999933>#"
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
								switch(M.Race)
									if("Goblin")
										S.icon_state = "GoblinWall"
										S.name = "ObsidianWall"
										S.HP += 4500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#404040>#"
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
									if("Illithid")
										S.icon_state = "IllithidWall"
										S.name = "CrystalWall"
										S.HP += 4500
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#990099>#"
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
									else
										if(M.SandWorker)
											S.icon_state = "SandWall"
											S.name = "Sand Wall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#CCCC33>#"
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
										S.icon_state = "DetailedWall"
										S.name = "StoneWall"
										S.HP += 3000
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										M.StoneCraftingSkill += 1
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666666>#"
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
										if(M.Race != "Goblin" && M.SandWorker == 0 && M.Race != "Illithid")
											S.icon_state = "DetailedWall"
											S.name = "Stone Wall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.name = null
											S.opacity = 1
											S.text = "<font color=#666666>#"
											M.weight -= W.weight
											del(W)
											break
										if(M.Race == "Goblin")
											S.icon_state = "GoblinWall"
											S.name = "Obsidian Wall"
											S.HP += 4500
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#404040>#"
											M.weight -= W.weight
											del(W)
											break
										if(M.SandWorker == 1)
											S.icon_state = "SandWall"
											S.name = "Sand Wall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#CCCC33>#"
											M.weight -= W.weight
											del(W)
											break
										if(M.Race == "Illithid")
											S.icon_state = "IllithidWall"
											S.name = "Crystal Wall"
											S.HP += 3000
											S.HP += M.BuildingSkill
											M.BuildingSkill += 1
											S.CanDigAt = 1
											M.StoneCraftingSkill += 1
											S.density = 1
											S.IsWall = 1
											S.opacity = 1
											S.text = "<font color=#CCCC33>#"
											M.weight -= W.weight
											del(W)
											break
		if(usr.Function == "PlaceBoneSpikes")
			for(var/mob/Monsters/M in usr.Selected)
				if(!M.CoolDown("Trap",50))
					usr << "Cannot build another trap so soon!"
					return
				if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
					for(var/obj/Items/Bones/Bones/W in M)
						M.destination = null
						if(M in range(1,S))
							for(var/mob/Monsters/X in range(0,S))
								if(X.Owner != M.Owner)
									M.Owner << "You can't place traps under someone else's unit."
									return
							for(var/obj/Items/Traps/X in range(0,S))
								M.Owner << "You can't place traps under other traps."
								return
							var/obj/Items/Traps/BST/L = new
							L.loc = S
							L.Owner = usr
							L.Hole = 1
							L.name = "Bone Spike Trap"
							M.BoneCraftingSkill += 1
							M.weight -= W.weight
							del W
							return
		if(usr.Function == "PlaceStoneFall")
			for(var/mob/Monsters/M in usr.Selected)
				if(!M.CoolDown("Trap",50))
					usr << "Cannot build another trap so soon!"
					return
				for(var/obj/Items/ores/stone/W in M)
					M.destination = null
					if(M in range(1,S))
						for(var/mob/Monsters/X in range(0,S))
							if(X.Owner != M.Owner)
								M.Owner << "You can't place traps under someone else's unit."
								return
						for(var/obj/Items/Traps/X in range(0,S))
							M.Owner << "You can't place traps under other traps."
							return
						var/obj/Items/Traps/StoneTrap/L = new
						L.loc = S
						L.Owner = usr
						L.Hole = 1
						L.name = "Stonefall Trap"
						M.StoneCraftingSkill += 1
						M.weight -= W.weight
						del W
						return
		if(usr.Function == "DigChannel")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/obj/Items/Shafts/Spade/W in M)
					if(M.Race == "Dwarf" || M.Race == "Human")
						if(M in range(1,S))
							if(S.density == 0)
								for(var/turf/T in view(1,src))
									if(T.isbridge == 0)
										if(T.icon_state == "Lava")
											S.name = "Magma"
											S.icon = 'Lava.dmi'
											S.icon_state = "Lava"
											S.density = 1
											S.Content3 = "Lava"
											S.text = "<font color=#FF0000>LLLLL<font color=#CC0033>LLLLL"
											return
										if(T.icon_state == "water")
											S.icon = 'water.dmi'
											S.icon_state = "water"
											S.CanFish = 1
											S.Detailed = 1
											S.Content3 = "Liquid"
											S.OIcon = "water"
											S.density = 1
											S.text = "<font color=#0000FF>WWWWW<font color=#0000CC>WWWWW"
											return
		if(usr.Function == "PlaceRibcage")
			for(var/mob/Monsters/M in usr.Selected)
				if(!M.CoolDown("Trap",50))
					usr << "Cannot build another trap so soon!"
					return
				if(M.Race == "Kobold" || M.Race == "Goblin" || M.Race == "Ratman")
					for(var/obj/Items/Bones/Bones/W in M)
						M.destination = null
						if(M in range(1,S))
							for(var/mob/Monsters/X in range(0,S))
								if(X.Owner != M.Owner)
									M.Owner << "You can't place traps under someone else's unit."
									return
							for(var/obj/Items/Traps/X in range(0,S))
								M.Owner << "You can't place traps under other traps."
								return
							var/obj/Items/Traps/RibTrap/L = new
							L.loc = S
							L.Owner = usr
							L.Hole = 1
							L.name = "Ribcage Trap"
							M.BoneCraftingSkill += 1
							M.weight -= W.weight
							del W
							return
		if(usr.Function == "PlaceElfWall")
			for(var/mob/Monsters/M in usr.Selected)
				for(var/obj/Items/woods/wood/W in M)
					M.destination = null
					if(M in range(1,S))
						if(S.density == 0)
							if(S.icon_state != "Sky")
								if(M.Race == "Elf")
									S.icon_state = "Elf Wall"
									S.name = "Elf Wall"
									S.HP += 700
									S.HP += M.BuildingSkill
									M.BuildingSkill += 1
									S.CanDigAt = 1
									M.WoodCraftingSkill += 0.3
									S.density = 1
									S.IsWood = 1
									S.IsWall = 1
									S.opacity = 1
									S.text = "<font color=#666600>#"
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
										S.icon_state = "Elf Wall"
										S.name = "Elf Wall"
										S.HP += 700
										S.HP += M.BuildingSkill
										M.BuildingSkill += 1
										S.CanDigAt = 1
										S.IsWood = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666600>#"
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
								S.icon_state = "WoodWall"
								S.name = "WoodWall"
								S.HP += 1000
								S.HP += M.BuildingSkill
								M.BuildingSkill += 1
								S.CanDigAt = 1
								M.WoodCraftingSkill += 0.3
								S.density = 1
								S.IsWood = 1
								S.IsWall = 1
								S.opacity = 1
								S.text = "<font color=#666600>#"
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
										S.IsWood = 1
										M.WoodCraftingSkill += 0.3
										S.density = 1
										S.IsWall = 1
										S.opacity = 1
										S.text = "<font color=#666600>#"
										M.weight -= W.weight
										del(W)
										break
								else
									usr << "Your race can not build this!"