mob
	Monsters
		Wolf
			icon = 'Wolf.dmi'
			density = 1
			Wolf = 1
			DieAge = 35
			BloodContent = 300
			MaxBloodContent = 300
			Age = 1
			Cantame = 1
			Humanoid = 0
			Tame = 0
			WearingLeftArm = 1
			WearingRightArm = 1
			WearingShield = 1
			WearingHelmet = 1
			WearingLegs = 1
			WearingChest = 1
			HoldingWeapon = "Sword"
			Owner = "Wolves"
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



			LeftEye = "Good"

			RightEye = "Good"

			RightLung = "Good"

			LeftLung = "Good"

			Spleen = "Good"

			Teeth = "Good"

			LeftArm = "Good"

			RightArm= "Good"

			LeftLeg = "Good"

			RightLeg = "Good"

			Head= "Good"

			LeftEar= "Good"

			RightEar= "Good"

			Guts= "Good"

			Stomach= "Good"

			LeftKidney= "Good"

			RightKidney= "Good"

			Liver= "Good"

			Brain= "Good"

			Heart= "Good"

			Throat= "Good"

			Nose= "Good"
			New()
				var/M
				M = prob(50)
				if(M == 1)
					usr.Gender = "Male"
				else
					usr.Gender = "Female"
				usr.Strength = rand(10,20)
				usr.Agility = rand(5,10)
				Heal()
				usr.Defence = rand(5,10)
				usr.MAXHP = rand(50,150)
				usr.HP = usr.MAXHP
				WalkTo()
				Level()
				TurnOffAttack()
				Attacks()
				var/image/I = new('mob.dmi',src)
				src.Star = I
			Bump(atom/m)
				if(m == src.destination)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()

					if(m)
						if(m.icon_state == "Lava")
							if(m.density == 1)
								if(src.IsWood)
									src.Owner << "[src] is Burning To Death!"

									src.Fire()

						if(m)
							if(m.CanDigAt == 1)
								if(src.HasPick == 1)

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
			DblClick()
				if(src.Owner == usr)
					if(usr.User== 1)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star