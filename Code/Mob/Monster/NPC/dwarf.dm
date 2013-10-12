mob
	Monsters
		NPCDwarf
			icon = 'Human.dmi'
			icon_state = "Normal"
			name = "{NPC} Dwarf"
			density = 1
			weightmax = 150
			Dwarf = 1
			Humanoid = 1

			UsesPicks = 1
			HumanParts = 1
			Carn = 0
			CanDetail = 1
			NPC = 1
			HammerSkill = 10
			AxeSkill = 10
			Intelligent = 1
			HoldingWeapon = "Spear"
			BloodContent = 300
			MaxBloodContent = 300
			ArmourSkill = 10
			ShieldSkill = 15
			ButcherySkill = 10
			ArmourSkill = 20
			MaceSkill = 10
			SkinningSkill = 10
			UnArmedSkill = 10
			StoneCraftingSkill = 20
			MetalCraftingSkill = 20
			SmeltingSkill = 20
			Owner = "{NPC Dwarf}"
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


			Bump(atom/m)
				if(m == src.destination)
					if(m.Owner == src.Owner)
						return
					else
						src.Combats()
					if(m)
						if(m.icon_state == "tree")
							if(src.HoldingWeapon == "Axe")
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
							if(src.HasPick == 1)

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
					return
				if(m)
					if(m.Owner == src.Owner)
						return
					else
						step_rand(src)
			New()
				usr.G = prob(33)
				usr.B = prob(33)
				usr.BB = prob(33)
				M = prob(50)
				Age = rand(20,30)
				if(M == 1)
					usr.Gender = "Male"
					usr.icon_state = "Normal"
				else
					usr.Gender = "Female"
					usr.icon_state = "Normal"
				WalkTo()
				usr.Strength = rand(10,15)
				usr.Agility = rand(3,6)
				usr.Defence = rand(100,150)
				usr.MAXHP = rand(100,150)
				usr.Tiredness = rand(50,100)
				usr.HP = usr.MAXHP
				usr.HomeLoc = usr.loc
				usr.overlays += /obj/Items/Armours/Legs/MetalLeggings/
				usr.overlays += /obj/Items/Armours/ChestPlates/MetalChestPlate/
				usr.overlays += /obj/Items/Weapons/Spears/MetalSpear/
				NPCAttack()
				usr.IsTrader = prob(33)
				ReturnHome()
				usr.DieAge = rand(120,150)
				..()
				if(G == 1)
					usr.overlays += 'Beards.dmi'
				if(B == 1)
					usr.overlays += 'BlackBeard.dmi'
				if(BB == 1)
					usr.overlays += 'BrownBeard.dmi'
				if(BB == 0)
					if(B == 0)
						if(G == 0)
							usr.overlays += 'Beards.dmi'
							usr.G = 1
				var/image/I = new('mob.dmi',src)
				src.Star = I
			DblClick()
				for(var/mob/Monsters/M in usr.Selected)
					if(M in view(1,src))
						if(M.Human == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail human, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Size matters not!")
										return
									if(Taunt == 1)
										alert("[src] : Try not to bump your head hehehe!")
										return
						if(M.Dwarf == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Hail fellow dwarf, please make your self at home")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we wont be happy!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : Are you a male or female? I really cant tell!")
										return
									if(Taunt == 1)
										alert("[src] : You look shorter than the average dwarf, you need more ale my friend!")
										return
						if(M.Goblin == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Ah a Goblin, you better whatch your step, you Goblins are known to be tricksy")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : wow! You Goblins are smart, I even heard you can count to ten!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
						if(M.Kobold == 1)
							if(src.IsTrader == 0)
								if(M.StoleFromDwarfs == 0)
									var/Warning = prob(33)
									var/Greet = prob(33)
									var/Trade = prob(33)
									var/Joke = prob(33)
									var/Taunt = prob(33)
									if(Warning == 1)
										alert("[src] : Heh a Kobold hey, you better whatch your self, if your thinking of stealing any of our goods then you better think again my pointy eared friend")
										return
									if(Greet == 1)
										alert("[src] : Hey, welcome to our settlement, you can look around but if you take anything we will hunt you down!")
										return
									if(Trade == 1)
										alert("[src] : Please check our fine selection of goods while your here!")
										return
									if(Joke == 1)
										alert("[src] : What do ya get when you cross a Kobold with a LockPick? Kboldy Locks!!")
										return
									if(Taunt == 1)
										alert("[src] : Haha, eat enough carrots large eyes?! oh I forgot you eat worms!")
										return
					else
						if(M.Wagon == 0)
							M.destination = src