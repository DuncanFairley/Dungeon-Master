mob
	Monsters
		SkeletonLord
			icon = 'Skeleton.dmi'
			icon_state = "Normal"
			density = 1
			weightmax = 100
			Undead = 1

			Humanoid = 1
			ImmunePosion = 1
			Fling = 1
			HoldingWeapon = "Sword"
			Carn = 1
			HP = 400
			Race = "Skeleton"
			SpecialUnit = 1
			Intelligent = 1
			SneakingSkill = 10
			HumanParts = 1
			UnArmedSkill = 10
			Owner = "{NPC Undead}"

			HasTeeth  = 1

			CanSee = 1

			HasLeftArm  = 1

			HasRightArm = 1

			HasLeftLeg = 1

			HasRightLeg = 1

			HasHead = 1

			BleedType = null



			Stunned  = 0



			Fainted  = 0



			LeftEye = "Destroyed"

			RightEye = "Destroyed"

			RightLung = "Destroyed"

			LeftLung = "Destroyed"

			Spleen = "Destroyed"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Destroyed"

			RightEar= "Destroyed"

			Guts= "Destroyed"

			Stomach= "Destroyed"

			LeftKidney= "Destroyed"

			RightKidney= "Destroyed"

			Liver= "Destroyed"

			Brain= "Destroyed"

			Heart= "Destroyed"

			Throat= "Destroyed"

			Nose= "Destroyed"

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
								var/E
								var/D
								var/EM
								var/R
								var/S
								E = prob(35)
								D = prob(1)
								EM = prob(0.5)
								R = prob(0.5)
								S = prob(70)
								var/G
								G = prob(5)
								var/BUG
								BUG = prob(2)
								var/SIL
								SIL = prob(5)
								if(SIL == 1)
									var/obj/Items/ores/silver/SS = new
									SS.loc = src.loc
								if(BUG == 1)
									var/mob/Monsters/CaveSpider/CS = new
									CS.loc = src.loc
									return
								if(G == 1)
									var/obj/Items/ores/GoldNugget/GN = new
									GN.loc = src.loc
								if(E == 1)
									var/obj/Items/ores/metal/MET = new
									MET.loc = src.loc
								if(S == 1)
									var/obj/Items/ores/stone/ST = new
									ST.loc = src.loc
								if(D == 1)
									var/obj/Items/gems/UnCutDiamond/DI = new
									DI.loc = src.loc
								if(EM == 1)
									var/obj/Items/gems/UnCutEmerald/UD = new
									UD.loc = src.loc
								if(R == 1)
									var/obj/Items/gems/UnCutRuby/RE = new
									RE.loc = src.loc
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
				usr.Strength = rand(15,20)
				usr.Agility = rand(10,15)
				usr.Defence = rand(10,20)
				usr.WeaponDamageMin = 25
				usr.WeaponDamageMax = 35
				usr.MAXHP = 75
				usr.HP = usr.MAXHP
				usr.DieAge = rand(100,120)
				usr.name = "{NPC} SkeletonLord"
				WalkTo()
				ResetTarget()
				RanWalk()
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
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