mob/verb/Interact() for(var/mob/Monsters/M in usr.Selected)
	var/list/menu = new()
	menu += "Closest Creature"
	menu += "This Creature"
	if(M.MagicalAptitude) menu += "Magical Skills"
	menu += "Cancel"
	var/Result = input("Have [M] interact how?", "[M]", null) in menu
	if (Result != "Cancel") ..()
	if (Result == "Magical Skills")
		var/list/menu2 = new()
		if(M.MagicalAptitude == 1 && usr.DieAge >= usr.Age)
			if(M.Meditating == 0) menu2 += "Meditate"
			if(M.Meditating == 1) menu2 += "Stop Meditating"
		if(M.MagicalConcentration >= 20 && usr.DieAge >= usr.Age)
			menu2 += "Nether Travel"
			menu2 += "Nether Return"
			if(M.MagicalWill >= 20) menu2 += "Nether Alteration"
		if(M.MagicalWill >= 20 && usr.DieAge >= usr.Age)
			menu2 += "Willful Alteration"
		if(M.MagicalAnger >= 20 && usr.DieAge >= usr.Age)
			if(M.MagicalWill >= 25) menu2 += "Destructive Alteration"
		if(M.MagicalMind >= 20 && usr.DieAge >= usr.Age)
			menu2 += "Insanity"
			if(M.MagicalAnger >= 20)
				menu2 += "Damage Mind"
				if(M.MagicalConcentration >= 25)
					menu2 += "Steal Thoughts"
			if(M.MagicalWill >= 25)
				menu2 += "Teleportation"
		menu2 += "Cancel"
		var/Result2 = input("Do What?", "Choose", null) in menu2
		if (Result2 != "Cancel")
			..()
		if (Result2 == "Nether Travel")
			if(M.Mana >= 10 - M.MagicalConcentration / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
					return
				view(M) << "[M] twists in and out of view and turns into some kind of dark shadowy substance before dissappearing."
				M.loc = locate(M.x,M.y,4)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether travel!"
					M.loc = locate(M.x,M.y,1)
					return
				M.Mana -= 10 - M.MagicalConcentration / 10
			else
				M.Owner << "You need [10 - M.Mana] more mana."
		if (Result2 == "Teleportation")
			if(M.Mana >= 80 - M.MagicalWill / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,usr))
					usr << "There is a magic blocking portal stone near your destination, you cannot teleport!"
					return
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot teleport!"
					return
				var/X = M.icon
				M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
				M.icon = 'Blood.dmi'
				flick("AstralBurst",M)
				view(M) << "A glowing blue portal snaps into existance and [M] steps through it!"
				M.Mana -= 80 - M.MagicalWill / 10
				for(var/turf/T in view(0,M))
					if(T.density == 1 && T.icon_state != "water" && T.icon_state != "Lava")
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
			else
				M.Owner << "You need [80 - M.Mana] more mana."
		if (Result2 == "Nether Return")
			if(M.Mana >= 10 - M.MagicalConcentration / 10)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M], you cannot nether return!"
					return
				M.loc = locate(M.x,M.y,1)
				for(var/obj/Items/Furniture/Pillars/PortalStone/PP in range(20,M))
					usr << "There is a magic blocking portal stone near [M]'s destination, you cannot nether return!"
					M.loc = locate(M.x,M.y,4)
					return
				M.Mana -= 10 - M.MagicalConcentration / 10
				view(M) << "A dark shadow begins to creep forth from the earth and forms into the shape of [M]"
			else
				M.Owner << "You need [10 - M.Mana] more mana."
		if (Result2 == "Damage Mind")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= M.MagicalMind / 2)
						view(M) << "[M] uses their force of *Thought* to re-write the mind of [MM], causing them to lose some of the knowledge they once possessed."
						MM.EXP = 0
						MM.SwordSkill -= M.MagicalMind / 15
						MM.AxeSkill -= M.MagicalMind / 15
						MM.MaceSkill -= M.MagicalMind / 15
						MM.MetalCraftingSkill -= M.MagicalMind / 15
						MM.LeatherCraftingSkill -= M.MagicalMind / 15
						MM.MagicalConcentration -= M.MagicalMind / 15
						MM.MagicalAnger -= M.MagicalMind / 15
						MM.MagicalWill -= M.MagicalMind / 15
						MM.UnArmedSkill -= M.MagicalMind / 15
						M.Mana -= M.MagicalMind / 2
					else
						M.Owner << "You need [M.MagicalMind / 2 - M.Mana] more mana."
		if (Result2 == "Steal Thoughts")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= M.MagicalMind * 2)
						view(M) << "[M] uses their force of *Mind* to absorb some of the knowledge [MM] once held, making it their own...."
						M.GainEXP(MM.EXP)
						MM.EXP = 0
						MM.SwordSkill -= M.MagicalMind / 15
						MM.AxeSkill -= M.MagicalMind / 15
						MM.MaceSkill -= M.MagicalMind / 15
						MM.MetalCraftingSkill -= M.MagicalMind / 15
						MM.LeatherCraftingSkill -= M.MagicalMind / 15
						MM.MagicalConcentration -= M.MagicalMind / 15
						MM.MagicalAnger -= M.MagicalMind / 15
						MM.MagicalWill -= M.MagicalMind / 15
						MM.UnArmedSkill -= M.MagicalMind / 15
						M.SwordSkill += M.MagicalMind / 15
						M.AxeSkill += M.MagicalMind / 15
						M.MaceSkill += M.MagicalMind / 15
						M.MetalCraftingSkill += M.MagicalMind / 15
						M.LeatherCraftingSkill += M.MagicalMind / 15
						M.UnArmedSkill += M.MagicalMind / 15
						M.Mana -= M.MagicalMind * 2
					else
						M.Owner << "You need [M.MagicalMind * 2 - M.Mana] more mana."
		if (Result2 == "Insanity")
			for(var/mob/Monsters/MM in oview(5,M))
				if(MM.ImmuneToMagic == 0 && M.MagicTarget == MM)
					if(M.Mana >= 25)
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
							M.Mana -= 25
							return
					else
						M.Owner << "You need [25 - M.Mana] more mana."
		if (Result2 == "Nether Alteration")
			if(M.Mana >= 30)
				var/list/menu3 = new()
				menu3 += "Grass"
				menu3 += "Snow"
				menu3 += "Desert"
				menu3 += "Hell"
				menu3 += "Mountains"
				menu3 += "Nether"
				menu3 += "Cancel"
				var/Result3 = input("Do What?", "Choose", null) in menu3
				if (Result3 == "Cancel") return
				if(M in range(10,usr))
					if(Result3 == "Grass")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Nether")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Snow")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Desert")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Hell")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
					if(Result3 == "Mountains")
						for(var/mob/Monsters/MM in view(2,usr))
							if(MM.Owner != usr)
								usr << "You can't use this on someone elses units."
								return
						if(M in range(100,usr))
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
							M.Mana -= 30
						else
							usr << "[M] needs to be within 100 spaces of the target to use this!"
							return
				else usr<<"You can only cast this spell within 10 tiles of your unit."
			else
				M.Owner << "You need [30 - M.Mana] more mana."
		if (Result2 == "Willful Alteration")
			if(M.Mana >= 50)
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
				if(Result3 == "Grass")
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
					M.DieAge -= 0.25
				if(Result3 == "Snow")
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
					M.DieAge -= 0.25
				if(Result3 == "Desert")
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
					M.DieAge -= 0.25
				if(Result3 == "Hell")
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
				if(Result3 == "Mountains")
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
				M.Mana -= 50
			else
				M.Owner << "You need [50 - M.Mana] more mana."
		if (Result2 == "Destructive Alteration")
			for(var/mob/Monsters/MK in range(2,usr))
				if(MK.Owner != usr)
					usr << "You can't cast this directly on a unit."
					return
			if(M.Mana >= 100)
				var/list/menu3 = new()
				menu3 += "Lava"
				menu3 += "Water"
				menu3 += "Cancel"
				var/Result3 = input("Do What?", "Choose", null) in menu3
				if(Result3 == "Cancel") return
				if(M in range(usr,10))
					if(Result3 == "Lava")
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
					if(Result3 == "Water")
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
					if(Result3 != "Cancel") M.Mana -= 100
				else usr<<"You can only cast this spell within 10 tiles of your unit."
			else
				M.Owner << "You need [100 - M.Mana] more mana."
		if(Result2 == "Meditate" || Result2 == "Stop Meditating") M.Meditation()
	if (Result == "This Creature")
		var/list/menu2 = new()
		menu2 += "Run"
		menu2 += "Dig On/Off"
		menu2 += "Give Creature To"
		menu2 += "Suicide"
		if(M.Race == "Gargoyle" || M.Race == "Dragon" || M.SubRace == "Illithid" || M.Undead) menu2 += "Rest"
		if(M.Race == "Orc")
			if(M.Level >= 40)
				menu2 += "Berserk"
				menu2 += "Defensive Fighting"
		if(M.GargRuby >= 15) menu2 += "Firebolt"
		if(M.GargRuby >= 30)
			menu2 -= "Firebolt"
			menu2 += "Fireball"
		if(M.GargRuby >= 100)
			menu2 -= "Fireball"
			menu2 += "Fiery Death"
		if(M.GargEmerald >= 15)
			menu2 += "Poison Bolt"
		if(M.GargEmerald >= 30)
			menu2 += "Create Tree"
		if(M.GargEmerald >= 100)
			menu2 += "Grant Life"
		for(var/obj/Items/Arrows/A in M) if(A.suffix == "(Stuck In)") menu2 += "Pull Out Arrow"
		if(M.density)
			if(M.Race == "Vampire") menu2 += "Rest"
			if(M.Race == "Svartalfar") menu2 += "Rest"
		if(M.Race == "Vampire")
			if(M.Level >= 10)
				menu2 += "Morph"
				if(M.Level >= 15)
					menu2 += "Turn Into Mist"
					if(!M.DayWalker) if(M.Level >= 40) menu2 += "Become Daywalker"
		if(M.HasWings)
			if(M.Race == "Angel of Death" || M.Race == "Demon" || M.Race == "Gargoyle" || M.Race == "Vampire") menu2 += "Retract Wings"
			menu2 += "Fly"
		if(M.Race == "Spider")
			menu2 += "Rest"
			if(M.SubRace == "Queen") menu2 += "Lay Egg"
		if(M.Race == "Dragon")
			menu2 += "Dragon Breath"
			if(M.Age >= 50 && M.Gender == "Female") menu2 += "Lay Eggs"
		if(M.Race == "SandKing")
			menu2 += "Generate Sand Maggot"
			menu2 += "Generate Sand Humanoid"
			menu2 += "Generate Sand Dragon"
			menu2 += "Create Mobile Caccoon"
		menu2 += "Cancel"
		var/Result2 = input("Do What?", "Choose", null) in menu2
		switch(Result2)
			if("Cancel") return
			if("Generate Sand Maggot")
			if("Generate Sand Humanoid")
			if("Generate Sand Dragon")
			if("Give Creature To")
				var/CAN=1
				switch(M.Race) if("Spider","Svartalfar","SandKing","Devourer","Dragon","Illithid") CAN=0
				if(M.Wagon || M.Infects || M.IsRoyal || M.CantBeGiven) CAN=0
				if(!CAN) usr<<"This unit cannot be given away."
				if(CAN)
					var/T = input("Set Who as Owner?")as null|text
					if(T) for(var/Player/S in world) if(S.client) if(T == S.name)
						if(usr.ckey in S.IgnoreList)
							usr << "[S] is ignoring you."
							return
						else
							var/choice = alert(S, "[M.Owner] is asking to give [M] to you", "Choose", "Yes", "No", null)
							if(choice == "Yes")
								M.ChangeOwnership(S)
								S << "[usr] makes [S] the owner of [M]"
								if(S != usr) usr << "[usr] makes [S] the owner of [M]"
							else usr << "[S] has refused."
			if("Pull Out Arrow")
				for(var/obj/Items/Arrows/A in M)
					if(A.suffix == "(Stuck In)")
						A.loc = M.loc
						M.weight -= A.weight
						A.suffix = null
						M.Owner << "[M] pulls out [A]"
						M.BloodContent -= rand(5,15)
						M.BloodLoss()
						break
						return
			if("Suicide")
				switch(alert("Kill: [M]","Suicide this Unit?","Yes","No"))
					if("Yes") if(!M.PreviousOwner)
						M.GoingToDie = 1
						M.DeathType = "Suicide"
						M.Killer = M
						M.Death()
						M.Owner << "[M] has commited SUICIDE!"
			if("Firebolt") if(!M.Flying)
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							var/fireprob = prob(M.GargRuby / 15)
							view() << "[M] tosses a firebolt at [X]!!"
							X.BloodContent -= 15
							X.BloodLoss()
							if(fireprob)
								X.Fire()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if("Fireball") if(!M.Flying)
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							var/fireprob = prob(M.GargRuby / 15)
							view() << "[M] throws a fireball at [X]!!"
							X.BloodContent -= 35
							X.BloodLoss()
							if(fireprob)
								X.Fire()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if("Fiery Death") if(!M.Flying)
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							view(M) << "[M] sends forth the flames of hell to strike [X]!!"
							if(X.Race!="Demon"&&X.SubRace!="HalfDemon")
								X.BloodContent -= 100
								X.BloodLoss()
								X.Fire()
							M.PracticeSkill = 1
							spawn(100) M.PracticeSkill = 0
						else
							view() << "[M] attempts to throw some sort of flaming projectile but is unable to as they have just recently tossed something else."
							return
			if("Poison Bolt") if(!M.Flying)
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							view() << "[M] tosses a green, glowing ball of poison at [X]!!"
							X.BloodContent -= 25
							X.BloodLoss()
							M.PracticeSkill = 1
							spawn(100)
							M.PracticeSkill = 0
							return
						else
							view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
							return
			if("Create Tree") if(!M.Flying)
				view() << "[M] begins to glow green and uses the powers of nature to promote the growth of forest!!"
				new/turf/grounds/Trees/Tree1(M.loc)
			if("Grant Life") if(!M.Flying)
				for(var/mob/Monsters/X in oview(5,M))
					if(M.MagicTarget == X)
						if(M.PracticeSkill == 0)
							view() << "[M] makes a deep rumbling sound and waves its arms, glowing bright green with the powers of nature, and then points at [X] as a green light flies from their outstreched finger... [X] begins to look younger...."
							if(X.Age >= 10)
								X.Age -= 10
							else
								X.Age = 1
							M.PracticeSkill = 1
							spawn(2000)
							M.PracticeSkill = 0
						else
							view() << "[M] attempts to toss some sort of green projectile but is unable to as they have just recently tossed something else."
			if("Lay Eggs") M.DragonLayEgg()
			if("Dragon Breath") M.DragonBreath(M.MagicTarget)
			if("Fly Up")
				view(M) << "[M] flies up into the sky!"
				M.loc = locate(M.x,M.y,3)
			if("Fly Down")
				view(M) << "[M] flies down to the ground!"
				M.loc = locate(M.x,M.y,1)
			if("Run") M.Running()
			if("Lay Egg") M.SpiderChooseEgg()
			if("Dig On/Off")
				if(!M.Dig)
					M.Dig = 1
					M.Dig()
					usr << "[M]'s Auto Dig is On!"
					return
				else
					M.Dig = 0
					M.destination = null
					M.DigTarget = null
					usr << "[M]'s Auto Dig is off!"
					for(var/obj/DigAt/DD in world) if(DD.Owner == M) del(DD)
			if("Morph") M.VampireMorph()
			if("Turn Into Mist") M.VampireMistForm()
			if("Become Daywalker")
				M.DayWalker = 1
				view(M) << "[M] harnesses their power and transforms into a creature out of nightmares, a creature not bound to the darkness!"
			if("Fly") M.Fly()
			if("Retract Wings") if(!M.Flying) if(M.Race == "Demon" || M.Race == "Gargoyle" || M.Race == "Vampire" || M.Race == "Angel of Death")
				if(M.WingsOut) M.WingsOut = 0
				else M.WingsOut = 1
				M.RebuildOverlays()
				return
			if("Rest")
				if(!M.IsMist)
					if(!M.Flying) M.Sleep(300-Level)
					else M.Owner << "[M] can't sleep while flying"
				else M.Owner<<"[M] cannot rest while in the form of mist!"
	if (Result == "Closest Creature")
		for(var/mob/Monsters/C in oview(1,M))
			if(M)
				var/list/menu2 = new()
				if(M.Race == "Vampire")
					if(M.density)
						menu2 += "Feed From [C]"
				menu2 += "Rescue [C]"
				if(M.Race != "Vampire") menu2 += "Breed With [C]"
				if(M.Werepowers == 1)
					menu2 += "Bite [C]"
				menu2 += "Cancel"
				var/Result2 = input("Interact With What Object", "Choose", null) in menu2
				if (Result2 != "Cancel")
					..()
				if (Result2 == "Feed From [C]") M.VampireBite(C)
				if (Result2 == "Bite [C]")
					var/Bite = null
					var/CheckStr = M.Strength - C.Strength
					Bite = prob(CheckStr)
					if(Bite == null) Bite = 0
					if(M in view(1,C))
						if(Bite)
							if(M.density == 1)
								if(M.CoolDown == 0)
									if(M.HasTeeth == 1)
										if(C.Race != "Vampire" && C.SubRace != "Werewolf" && C.Race != "Gargoyle" && C.Race != "Svartalfar" && C.Race != "Demon" && C.Race != "Skeleton" && C.Race != "Dragon")
											if(C.Wagon == 0)
												if(C.Race != "TowerCap")
													if(M.IsMist == 0)
														var/WereInfect = prob(50)
														if(C.SubRace) WereInfect = 0
														if(WereInfect)
															var/WerewolfYes = prob(65)
															view() << "<b><font color=red>[C] is infected by a werewolf!"
															view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
															C.BloodContent -= 15
															C.BloodLoss()
															M.GainEXP(25)
															M.CoolDown = 1
															spawn(500)
															if(WerewolfYes) switch(C.Race)
																if("Human","Dwarf","Lizardman","Goblin","Orc","Kobold")
																	C.SubRace = "Werewolf"
																	C.WerewolfTransformation()
																	C.Carn = 1
																	C.Delay -= 1
																	C.Regen()
																	view() << "[C] has succumbed to the terrible lycanthropy and falls under the control of [M]"
																	var/Resist = prob(90)
																	if(Resist&&!C.IsRoyal)
																		C.Deselect()
																		C.ChangeOwnership(usr)
																		view(C) << "[C] is completely dominated by the lycanthropy and becomes a slave to [M]."
																	else
																		view(C) << "[C] resists the controlling impulse of the disease and remains in control of their body and mind!"
																	M.CoolDown = 0
																else
																	view() << "[C] has succumbed to the terrible lycanthropy, but it is not compatible with their body, they begin to waste away as blood pours from their eyes and body."
																	C.BloodContent -= 250
																	C.BloodLoss()
																	M.CoolDown = 0
															else
																view() << "[C] has recovered from the vile infection passed to it by the werewolf"
																M.CoolDown = 0
															return
														else
															view() << "<b><font color=red>[M] slashes at [C] and sinks its teeth into them!"
															C.BloodContent -= 15
															C.BloodLoss()
															M.GainEXP(25)
															C.Death()
															M.CoolDown = 1
															spawn(300)
																if(M)
																	M.CoolDown = 0
															return
										else
											M.Owner << "You can't bite one of those creatures!"
						else
							view() << "<b><font color=red> [M] tries to grab hold of [C] and bite them, but [C] escapes!"
							M.CoolDown = 1
							spawn(300)
							M.CoolDown = 0
							return

				if(Result2 == "Breed With [C]") M.BreedWith(C)
				if (Result2 == "Rescue [C]")
					if(C.InHole == 1)
						if(M in view(1,C))
							view() << "<b><font color=red>[M] Rescues [C] from a trap"
							C.InHole = 0
							C.SneakingSkill +=1
							C.HasPersonIn = 0
							for(var/obj/Items/Traps/PitTrap/P in view(0,C))
								del(P)