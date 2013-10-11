mob
	Monsters

		StrayGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Goblin = 1

			Humanoid = 1
			Carn = 1
			CanBeSlaved = 1
			Intelligent = 1
			SneakingSkill = 20
			UsesPosion = 1
			HumanParts = 1
			BloodContent = 200
			MaxBloodContent = 200
			SpearSkill = 10
			HoldingWeapon = "Spear"
			Owner = "{NPC Goblin}"
			HasLeftEye = 1

			HasRightEye = 1

			HasRightLung  = 1


			HasLeftLung  = 1

			HasSpleen  = 1

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			HasLeftEar = 1

			HasRightEar = 1

			HasGuts = 1

			HasStomach = 1

			HasLeftKidney = 1

			HasRightKidney = 1

			HasLiver = 1

			HasBrain = 1

			HasHeart = 1

			HasThroat = 1

			HasNose = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0





			Bump(atom/m)
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")

							m.HP -= 10
							flick("Dig",m)
							if(m.HP <= 0)
								var/E
								E = prob(100)
								if(E == 1)
									var/obj/Items/woods/wood/MET = new
									MET.loc = src.loc
								m.icon = 'Cave.dmi'
								m.icon_state = "Grass"
								m.density = 0
								m.opacity = 0
							return
						if(m.CanDigAt == 1)
							m.HP -= src.MineingSkill / 4
							src.MineingSkill += 0.1
							flick("Dig",m)
							if(m.HP <= 0)

								m.opacity = 0
								m.density = 0
								m.CanDigAt = 0
								m.Detailed = 0
								m.icon = 'cave.dmi'
								m.icon_state = m.OIcon
								m.IsWood = 0
								if(m.Content3 == "Peak")
									m.icon_state = "Peak"
								if(m.Content == "Sky")
									m.icon_state = "Sky"
								if(m.z == 1)
									var/obj/Support/Q = new
									Q.loc = locate(m.x,m.y,3)
									for(var/turf/T in view(0,Q))
										if(T.Supported == 1)
											T.Supported = 0
											T.opacity = 0
											T.density = 0
											T.CanDigAt = 0
											T.Detailed = 0
											if(T.Content3 == "Peak")
												T.icon_state = "Peak"
											if(T.Content == "Sky")
												T.icon_state = "Sky"
									del(Q)
							return
			New()
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				Age = rand(20,60)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon = 'FemaleGoblin.dmi'
					usr.icon_state = "Normal"
				usr.Strength = rand(5,7)
				usr.Agility = rand(5,10)
				usr.Defence = rand(5,10)
				usr.MAXHP = 100
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				NPCGoblinName()
				WalkTo()
				Bleeding()
				ResetTarget()
				RandomWalk()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star