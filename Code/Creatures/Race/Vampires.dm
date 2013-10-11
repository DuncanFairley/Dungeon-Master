mob/proc/VampireBite(mob/TARGET,HITCHANCE=50,INFECT=15) //300 hit chance is the true 100%, as chance is devided by 3 in the case of having lower strength than your target.
	if(TARGET in view(1,src)) if(density&&Flying==0&&HasTeeth==1&&TARGET.Race!="Vampire"&&TARGET.Wagon==0&&TARGET.Flying==0&&IsMist==0&&TARGET.Race!="TowerCap")
		if(CoolDown("Bite",300)||INFECT==1) //INFECT 1 is autofeed, this line triggers the cooldown so you can't feed directly after an autofeed, but allows autofeed even if on cooldown.
			var/BITE = prob(Agility-TARGET.Agility+HITCHANCE)
			if(TARGET.Owner==Owner) BITE=1
			if(BITE)
				if(!TARGET.WearingFullPlateHelm&&TARGET.Race!="Skeleton")
					view(src) << "<b><font color=red>[src] feeds on [TARGET]!"
					TARGET.BloodContent -= Level/5
					TARGET.BloodLoss()
					Hunger = 100
					GainEXP(TARGET.Level+5)
					if(prob(INFECT)) TARGET.VampireInfection(src)
					return(1)
				else if(INFECT!=1) //Autofeed has a 1 infect chance, this simply stops you from breaking your teeth durring autofeed.
					view(src) << "<b><font color=red>[src] teeth shatter!!!"
					TeethHP = 0
					Teeth = "Destroyed"
					BloodContent -= 10
					BloodLoss()
			else view(src) << "<b><font color=red> [src] tries to grab hold of [TARGET] and bite them, but [TARGET] escapes!"
mob/proc/VampireInfection(mob/INFECTEDBYSET) spawn() //Via Bite, not potion. Mostly just ownership and messages here.
	if(Race=="Vampire"||SubRace||Critter||ImmuneToVampire||Infects||Race=="Dragon"||InfectedBy) return
	if(SubRace) return
	if(INFECTEDBYSET) InfectedBy=INFECTEDBYSET //Change this to work better later, works fine but lazy code.
	view(src) << "<b><font color=red>[src] is infected by a vampire!"
	sleep(300)
	if(InfectedBy)
		view(src) << "[src] starts to look sick."
		RebuildOverlays()
	sleep(300)
	if(InfectedBy)
		view(src) << "[src] turns into a vampire!"
		var/mob/OWNER
		var/mob/INFECTOR
		var/mob/NEWOWNER
		if(ismob(Owner))OWNER=Owner
		if(ismob(InfectedBy))INFECTOR=InfectedBy
		if(ismob(INFECTOR.Owner))NEWOWNER=INFECTOR.Owner
		if(IsRoyal) NEWOWNER=OWNER
		if(OWNER!=NEWOWNER)
			if(OWNER)OWNER<<"[src] has turned vampire! [x],[y],[z]"
			if(NEWOWNER)NEWOWNER<<"[src] has turned vampire and has fallen under your control! [x],[y],[z]"
		else Owner<<"[src] has turned into a vampire! [x],[y],[z]"
		if(INFECTOR.CanBeSlaved)
			Owner = "{NPC Undead}"
			CanBeSlaved = 1
		ChangeOwnership(NEWOWNER)
		RaceChange("Vampire")
	else RebuildOverlays()
mob/proc/VampireEvolution()
	if(Evolved) if(!HasWings)
		Owner << "[src] grows wings!"
		if(Morphed) VampireMorph()
		WingsOut = 1
		WingsHP = OrganMaxHP
		HasWings = 1
		RebuildOverlays()
	else
		Owner << "[src] has evolved into a full vampire!"
		icon = 'Vampire.dmi'
		CliffClimber = 1
		Evolved = 1
		Strength += 8
		Agility += 8
		weightmax += 50
		RebuildOverlays()
	if(Level >= 40) if(!DayWalker)
		view(src) << "[src] becomes a daywalker"
		src.DayWalker = 1
mob/proc/VampireMorph() if(!Flying) if(!IsMist)
	if(Morphed == 1)
		icon = 'Vampire.dmi'
		Morphed = 0
	else
		if(SavedIcon)
			icon = SavedIcon
			Morphed = 1
		else usr << "[src] seems to be missing a variable, and is unable to morph. This is a glich. Please report it."
	RebuildOverlays()
mob/proc/VampireMistForm()
	if(Flying) Fly(FLY="Land")
	if(density) if(!IsMist)
		Old=weightmax
		Owner << "[src] turns into mist, their tiredness is halved."
		icon = 'Mist.dmi'
		Morphed=0
		density=0
		IsMist=1
		Tiredness/=2
		SetEquipmentUse(0)
	else if(IsMist)
		weightmax=Old
		Old=null
		if(isturf(loc))
			var/turf/T=loc
			if(T.density) Owner << "Can not materialize in solid objects!"
			else
				Owner << "[src] turns solid again."
				icon = 'Vampire.dmi'
				density = 1
				IsMist = 0
				SetEquipmentUse()
	RebuildOverlays()