mob/Monsters/Bump(atom/m)
	if(m!=destination) for(var/atom/DESTINATION in range(0,m)) if(DESTINATION==destination) if(DESTINATION.density) return(Bump(DESTINATION))
	if(src.Flying) if(m.density)
		if(m.icon_state == "Lava") src.loc = m
		if(m.CaveWater) src.loc = m
		if(m.icon == 'Swamp.dmi') src.loc = m
		if(m.icon_state == "water") src.loc = m
	if(m==src.destination && m.density && density && m.Owner!=Owner)
		if(m.TP)
			if(ismob(Owner)) if(!Owner:client) destination = null
			flick("Dig",m)
			GainEXP(m.Content3)
			Hunger -= 0.2
			DamageType(0.5)
			return
		if(!isturf(m))
			Combats(m)
			return
		if(!src.Flying)
			if(m.icon_state == "Lava")
				if(m.density)
					if(src.IsWood && src.Race != "Gargoyle")
						src.Owner << "[src] is Burning To Death!"
						src.Fire()
					if(src.Race == "Gargoyle")
						flick("Dig",m)
						var/find
						find = prob(src.FishingSkill/10)
						if(find == 1)
							var/obj/Items/ores/stone/B = new
							B.loc = src.loc
							if(src.FishingSkill < 120) src.FishingSkill += 0.3
							return
			if(m.CaveWater)
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				if(find == 1)
					var/mob/Body/B = new
					B.loc = src.loc
					B.icon = 'cave.dmi'
					B.icon_state = "CaveFish"
					B.Race = "Fish"
					B.name = "CaveFish"
					B.FishDecay()
					B.Race = "Fish"
					B.weight = 5
					if(src.FishingSkill < 120) src.FishingSkill += 0.3
					return
			if(m.icon == 'Swamp.dmi')
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				if(find == 1)
					var/TFish = prob(50)
					if(TFish == 1)
						var/mob/Body/B = new
						B.loc = src.loc
						B.icon = 'cave.dmi'
						B.icon_state = "TFish"
						B.name = "TropicalFish"
						B.FishDecay()
						B.Race = "Fish"
						B.weight = 5
						if(src.FishingSkill < 120) src.FishingSkill += 0.3
						return
					if(TFish == 0)
						var/mob/Body/B = new
						B.loc = src.loc
						B.icon = 'cave.dmi'
						B.icon_state = "BlowFish"
						B.name = "BlowFish"
						B.FishDecay()
						B.Race = "Fish"
						B.weight = 5
						if(src.FishingSkill < 120) src.FishingSkill += 0.3
						return
			if(m.icon_state == "water")
				flick("Dig",m)
				var/find
				find = prob(src.FishingSkill/10)
				src.WaterPoints += 0.25
				if(find == 1)
					var/mob/Body/B = new
					B.loc = src.loc
					B.icon = 'cave.dmi'
					B.icon_state = "Fish"
					B.name = "Fish"
					B.FishDecay()
					B.Race = "Fish"
					B.weight = 5
					if(src.FishingSkill < 120) src.FishingSkill += 0.3
					return
		if(m.Tree == 1)
			if(src.UsesPicks == 0 || src.HoldingWeapon == "Axe" || src.Race == "Goblin" || src.Werepowers == 1 || src.VampPick == 1)
				m.HP -= src.WoodCuttingSkill / 4
				src.GainEXP(0.4)
				src.WoodCuttingSkill += 0.15
				flick("Dig",m)
				if(m.HP <= 0)
					m.overlays = null
					m.overlays -= /obj/Trees/tree1x2
					m.overlays -= /obj/Trees/tree3x2
					m.overlays -= /obj/Trees/leaves3x2
					m.overlays -= /obj/Trees/leaves2x2
					m.overlays -= /obj/Trees/leaves1x2
					m.overlays -= /obj/Trees/leaves1x1
					m.overlays -= /obj/Trees/leaves2x1
					m.overlays -= /obj/Trees/leaves3x1
					m.IsWood = 0
					for(var/obj/DigAt/DD in view(1,src))
						if(DD.Owner == src)
							if(DD == src.DigTarget)
								src.DigTarget = null
								del(DD)
					var/E
					E = prob(100)
					if(E == 1)
						var/obj/Items/Seeds/TreeSeed/TS2 = new
						TS2.loc = src.loc
						var/obj/Items/Seeds/TreeSeed/TS = new
						TS.loc = src.loc
						var/obj/Items/woods/wood/MET = new
						MET.loc = src.loc
						var/obj/Items/woods/wood/MET2 = new
						MET2.loc = src.loc
						if(src.Race == "Lizardman" || src.Race == "Human" || src.Race == "Elf")
							var/obj/Items/woods/wood/MET3 = new
							MET3.loc = src.loc
							var/obj/Items/woods/wood/MET4 = new
							MET4.loc = src.loc
					m.icon = 'Cave.dmi'
					m.icon_state = "Grass"
					if(m.Cactus) m.icon_state = "Desert"
					if(m.Bamboo) m.icon_state = "Marsh"
					if(m.Content3 == "PermTree") m.icon_state = "Snow"
					if(m.Content3 == "EvilTree") m.icon_state = "DeadGrass"
					if(m.Content3 == "HolyTree") m.icon_state = "GoodGrass"
					m.density = 0
					m.opacity = 0
				return
		if(m.CanDigAt == 1)
			if(src.UsesPicks == 0 || HoldingWeapon == "Pickaxe" || src.VampPick == 1 || src.Werepowers == 1)
				src.GainEXP(0.4)
				m.HP -= src.MineingSkill / 4
				src.MineingSkill += 0.1
				if(m.icon_state == "Elf Wall")
					if(src.Race != "Elf")
						var/Harm = prob(2)
						if(HoldingWeapon != "Pickaxe") Harm = prob(6)
						if(Harm == 1)
							src.BloodContent -= rand(15,25)
							src.BloodLoss()
							src.RightArmHP -= 15
							src.LeftArmHP -= 15
				flick("Dig",m)
				if(m.HP <= 0)
					for(var/obj/ArrowSlit/K in m)
						m.overlays -= K
						m.opacity = 1
						del K
					for(var/obj/Tapestry/K in m)
						m.overlays -= K
						del K
					for(var/obj/DigAt/DD in view(1,src))
						if(DD.Owner == src)
							if(DD == src.DigTarget)
								src.DigTarget = null
								del(DD)
					var/CI
					CI = prob(1)
					if(src.Race == "Spider" || src.Race == "Dwarf" || src.Race == "Kobold")
						CI = 0
					if(CI == 1)
						view() << "Cave In!"
						for(var/turf/grounds/cellarfloor/CF in view(3,src))
							if(CF.density == 0)
								CF.T = prob(50)
							for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
								if(CF.T == 1)
									CF.T = 0
							if(CF.T == 1)
								CF.opacity = 1
								CF.density = 1
								CF.CanDigAt = 1
								CF.icon_state = "CaveWall"
								CF.HP = 200
								CF.T = 0
								CF.Cant = 1
								CF.text = "<font color=#999966>#"
								CF.Detailed = 0
						for(var/turf/grounds/cavefloor/CF in view(3,src))
							if(CF.density == 0)
								CF.T = prob(50)
							for(var/obj/Items/Furniture/Pillars/P in range(4,CF))
								if(CF.T == 1)
									CF.T = 0
							if(CF.T == 1)
								CF.opacity = 1
								CF.density = 1
								CF.CanDigAt = 1
								CF.icon_state = "CaveWall"
								CF.HP = 200
								CF.T = 0
								CF.Detailed = 0
								CF.text = "<font color=#999966>#"
								if(CF.z == 1)
									var/obj/Support/Q = new
									Q.loc = locate(CF.x,CF.y,3)
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
												m.text = "<font color=#999966>×"
											if(T.Content == "Sky")
												T.icon = 'Cave.dmi'
												T.icon_state = "Sky"
												T.name = "Sky"
												T.text = "<font color=#33FFFF>×"
									del(Q)
					var/E
					var/D
					var/EM
					var/R
					var/S
					var/AD
					var/G
					var/Wood
					var/Bone
					var/SIL
					var/BUG2
					var/BUG
					var/BUG3
					var/CAP
					if(m.IsWall == 0)
						E = prob(35)
						D = prob(1.5)
						EM = prob(0.75)
						SIL = prob(5)
						BUG2 = prob(2)
						R = prob(0.75)
						S = prob(70)
						G = prob(5)
						BUG3 = prob(2)
						BUG = prob(2)
						CAP = prob(3)
					if(m.IsWall == 1)
						if(m.icon_state == "WoodWall" || m.icon_state == "TribalWall" || m.icon_state == "Elf Wall")
							Wood = prob(65)
						if(m.icon_state == "StoneWall" || m.icon_state == "DetailedWall" || m.icon_state == "GoblinWall" || m.icon_state == "StoneWall2" || m.icon_state == "SandWall" || m.icon_state == "IllithidWall")
							S = prob(65)
						if(m.icon_state == "BoneWall")
							Bone = prob(65)
					m.IsWall = 0
					if(BUG2 == 1)
						var/mob/Monsters/Critters/DeathBeatle/DB = new
						DB.loc = src.loc
						return
					if(src.Race == "Dwarf")
						AD = prob(1)
						if(src.z == 4)
							AD = prob(2)
					if(m.icon_state == "AdaSpire")
						AD = prob(70)
					if(BUG3 == 1)
						var/mob/Monsters/Critters/Mole/Mole = new
						Mole.loc = src.loc
					if(src.Race == "Goblin" && src.Level >= 20)
						EM = prob(1.25)
						R = prob(1.25)
						D = prob(2)
					if(CAP == 1)
						var/mob/Monsters/Critters/TowerCap/SS = new
						SS.loc = src.loc
					if(SIL == 1)
						var/obj/Items/ores/Silver/SS = new
						SS.loc = src.loc
					if(Wood == 1)
						var/obj/Items/woods/wood/SS = new
						SS.loc = src.loc
					if(Bone == 1)
						var/obj/Items/Bones/Bones/SS = new
						SS.loc = src.loc
					if(BUG == 1)
						var/mob/Monsters/Critters/CaveSpider/CS = new
						CS.loc = src.loc
					if(G == 1)
						var/obj/Items/ores/Gold/GN = new
						GN.loc = src.loc
					if(E == 1)
						var/obj/Items/ores/Iron/MET = new
						MET.loc = src.loc
					if(AD == 1)
						var/obj/Items/ores/Adamantium/AA = new
						AA.loc = src.loc
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
					m.text = "<font color=#999966>×"
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
									m.text = "<font color=#999966>×"
								if(T.Content == "Sky")
									T.icon_state = "Sky"
									m.text = "<font color=#33FFFF>×"
						del(Q)
				return
		return
	if(m)
		if(m.Owner == src.Owner && src.destination == m.loc) return
		else step_rand(src)