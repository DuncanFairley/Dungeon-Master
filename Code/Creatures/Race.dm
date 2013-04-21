//This File is more simply here to contain updates in an organized way. Similar to race speicific, there will eventually be a bunch of procs here referanced by the main code in the place of the old stuff.

atom/movable/var //Some objects hold these vars, but no turfs. So movable atoms it is.
	Race = null
	SubRace = null
	Werepowers = 0
	Level = 0
	EXP = 0
	HasGland = 0
mob/proc/RaceChange(RACE,SUBRACE) //Both Arguments are optional.
	if(RACE)
		switch(RACE)
			if("Vampire")
				ImmuneToTemperature = 1
				UsesPoison = 1
				AM = 1
				Carn=1
				VampPick = 1
				DieAge += 2500
				CliffClimber=1
				SubRace=Race
				SavedIcon = icon
		Race=RACE
	if(SUBRACE)
		switch(SUBRACE)
			if("Werewolf")
				SubRace=SUBRACE
				WerewolfTransformation()
				Regen()
				Carn = 1
				if(Delay>=4) Delay -= 1
			if("HalfDemon")
				SubRace="HalfDemon"
				ImmuneToTemperature=1
				Defence+=Level/5
				if(Race=="Lizardman")
					if(Level>40) Defence-=8
					else Defence-=Level/5
				Strength+=Level/2
				Agility+=Level/2
				weightmax+=Level*5
				Intelligence+=Level*0.01
				spawn(500)
					overlays += 'RedEye.dmi'
					spawn(500)
						icon += rgb(150,0,0)
						overlays -= 'RedEye.dmi'
						Strength += rand(3,5)
						spawn(500)
							icon = 'Demon.dmi'
							Strength += rand(3,5)
							LimbLoss()
mob/proc/Fly(SAY=1,FLY) if(!Morphed) if(!IsMist)
	if(!Flying) if(FLY==null||FLY=="Fly")
		if(HasLeftLeg&&HasRightLeg&&HasLeftArm&&HasRightArm)
			switch(Race)
				if("Vampire") icon = 'Fly.dmi'
				if("Demon") icon = 'Fly2.dmi'
				if("Gargoyle") icon = 'Fly3.dmi'
				if("Angel of Death") icon = 'Fly4.dmi'
				if("Dragon") icon_state = "flying[icon_state]"
			if(Race!="Gargoyle") Tiredness *= 0.5
			Flying = 1
			Old = weightmax
			weightmax = -10
			Morphed = 0
			RebuildOverlays()
			if(SAY)
				if(Race!="Gargoyle") Owner << "[src] starts to fly!"
				else Owner << "[src] starts to fly, they become highly vulnerable to damage!"
				if(ismob(Owner)) if(Owner:CoolDown("FlyMessage",12000)) Owner<<"[src] will now automatically attempt to match the z level of their destination when moving."
			return
		else if(SAY) Owner << "[src] is in too much pain to fly!"
	else if(FLY==null||FLY=="Land")
		switch(Race)
			if("Vampire") icon = 'Vampire.dmi'
			if("Demon") icon = 'Demon.dmi'
			if("Gargoyle") icon = 'Gargoyle.dmi'
			if("Angel of Death") icon = 'Angel of Death.dmi'
			if("Dragon") if(copytext(icon_state,1,7)=="flying") icon_state=copytext(icon_state,7)
		Flying = 0
		WingsOut = 1
		weightmax = Old
		Old = null
		if(SAY) Owner << "[src] lands."
		LimbLoss()
		RebuildOverlays()
		return