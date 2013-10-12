mob
	Monsters
		NPCGoblin
			icon = 'Goblins.dmi'
			icon_state = "Normal"
			name = "{NPC} Goblin"
			density = 1
			weightmax = 100
			Goblin = 1
			Age = 18
			Humanoid = 1
			Carn = 1
			SpearSkill = 20

			Intelligent = 1
			DieAge = 100000000
			ArmourSkill = 10
			LockPickingSkill = 20
			SneakingSkill = 20
			NPC = 1
			UsesPosion = 1
			PosionSkill = 10
			SkinningSkill = 10
			BoneCraftingSkill = 20
			ButcherySkill = 10
			UnArmedSkill = 10
			Owner = "{NPC Goblin}"
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
					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				usr.HomeLoc = usr.loc
				var/M
				M = prob(50)
				usr.overlays += /obj/Items/Weapons/Spears/Spear/
				usr.WeaponDamageMin = 1
				usr.WeaponDamageMax = 2
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				usr.Strength = rand(12,14)
				usr.Agility = rand(12,15)
				usr.Defence = rand(6,7)
				usr.MAXHP = rand(75,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				WalkTo()
				ReturnHome()
				NPCAttack()
				..()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M.Wagon == 0)
						M.destination = src