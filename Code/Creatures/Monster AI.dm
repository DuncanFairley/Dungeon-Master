mob/var/tmp/list/Hostilities=new()
mob/proc/MakeHostile(NAME="Basic",TIME=6000)
	if("[NAME]" in Hostilities) return
	Hostilities+="[NAME]"
	if(TIME>0) spawn(TIME) Hostilities-="[NAME]"
	return(1)
mob/Monsters/var/tmp
	ReturnDelay=400
	PatrolPoint1
	PatrolPoint2
	HomeLoc = null
	list/GuardRules = new
mob/Monsters/var
	list/Friendlies = new
mob/Monsters/proc/StayLocal()
	HomeLoc = loc
	spawn() while(CanBeSlaved)
		sleep(ReturnDelay)
		ReturningHome=2
mob/verb/Guard()
	var/list/menu = new()
	menu += "Guard On"
	menu += "Guard Off"
	menu += "Check Rules"
	menu += "Add Agressive Rule"
	menu += "Add Patrol Rule"
	menu += "Clear Rules"
	menu += "Set Friendly to..."
	menu += "Clear Friendlies"
	menu += "Cancel"
	switch(input("What Action Will You Choose?", "Choose", null) in menu)
		if("Guard On")
			for(var/mob/Monsters/M in usr.Selected) if(!M.Wagon) M.Guarding()
			usr << "<b>Selected units will now use guarding AI."
		if("Guard Off")
			for(var/mob/Monsters/M in usr.Selected) if(!M.Wagon) M.HomeLoc = null
			usr << "<b>Selected units will no longer use guarding AI."
		if("Check Rules")
			for(var/mob/Monsters/M in usr.Selected)
				var/RULES="[M]'s Rules:"
				for(var/R in M.GuardRules) RULES+=" '[R]'"
				if(M.PatrolPoint1&&M.PatrolPoint2) RULES+=" 'Patrol'"
				var/FRIENDLIES="[M]'s Friendlies:"
				for(var/F in M.Friendlies) FRIENDLIES+=" '[F]'"
				usr<<"[RULES]<br>[FRIENDLIES]<br>"
		if("Add Patrol Rule")
			usr << "<b>Click tile to create a patrol route between that location and your unit's current location."
			usr.Function = "Patrol"
		if("Add Agressive Rule")
			for(var/mob/Monsters/M in usr.Selected) if(!M.Wagon) if(!M.GuardRules.Find("Agressive")) M.GuardRules += "Agressive"
			usr << "<b>Agressive Rule added to selected units. They will now automatically attack any units they see while on guard."
		if("Set Friendly to...")
			var/FRIEND = input("Set a Owner to friendly for selected units, input including parentheses if adding a NPC Owner.","Add Friendly","{NPC Alliance}") as text|null
			if(FRIEND)
				for(var/mob/Monsters/M in usr.Selected) if(!M.Wagon) M.Friendlies+=FRIEND
				usr<<"<b>Selected units will no longer be agressive to units owned by ''[FRIEND]''."
		if("Clear Friendlies")
			for(var/mob/Monsters/M in usr.Selected) M.Friendlies=list()
			usr << "<b>Selected units have been cleared of all friendlies."
		if("Clear Rules")
			usr << "<b>Selected units have been cleared of all guard rules."
			for(var/mob/Monsters/M in usr.Selected)
				M.PatrolPoint1 = null
				M.PatrolPoint2 = null
				M.GuardRules = list()
				if(M.destination==M.PatrolPoint1 || M.destination==M.PatrolPoint2) M.destination=null
				if(M.HomeLoc==M.PatrolPoint1 || M.HomeLoc==M.PatrolPoint2) M.HomeLoc=null
mob/Monsters/proc/Patrol(LOC1,LOC2)
	PatrolPoint1=LOC1
	PatrolPoint2=LOC2
	HomeLoc=PatrolPoint1
mob/Monsters/proc/Guarding(RANGE=5,RATE=10,AUTO=0) if(!Critter) if(StopDouble("Guard"))
	HomeLoc=loc
	spawn()
		spawn() while(HomeLoc)
			sleep(250)
			if(ismob(destination))
				ReturningHome=1
				sleep(50)
				ReturningHome=0
		while(HomeLoc)
			if(AUTO) if(ismob(Owner)) if(!Owner:client) break
			if(ReturningHome)
				if(loc!=HomeLoc) destination = HomeLoc
				else ReturningHome=0
			else
				if(!destination || prob(10))
					destination=LocateTarget(RANGE)
					if(!destination)
						destination=HomeLoc
						if(loc==PatrolPoint1) HomeLoc=PatrolPoint2
						if(loc==PatrolPoint2) HomeLoc=PatrolPoint1
			sleep(RATE)
		RunningProcs-="Guard"
mob/Monsters/proc/RandomWalk(LINKED=0) if(StopDouble("WalkTo") || LINKED)
	if("Guard" in RunningProcs)
		GuardWalk(1)
		return
	spawn() while(CanBeSlaved)
		sleep(300)
		src.destination = null
		src.BowOn = 0
	while(CanBeSlaved)
		sleep(Delay+1)
		FindGear()
		if(!InHole && CanWalk)
			if(destination)
				if(ismob(destination) || destination == HomeLoc)
					if(destination in range(6,src)) step_towards(src,destination)
					else
						if(destination==HomeLoc) step_towards(src,destination)
						else destination = null
				if(destination == loc) destination=null
			if(!destination)
				if(HomeLoc&&ReturningHome==2)
					step_towards(src,HomeLoc)
					ReturningHome=0
				else
					step_rand(src)
					destination = LocateTarget()
	WalkTo(1)
mob/Monsters/proc/GuardWalk(LINKED=0) if(StopDouble("WalkTo") || LINKED) spawn()
	spawn() while(CanBeSlaved)
		FindGear()
		sleep(200)
	while(CanBeSlaved)
		sleep(Delay+1)
		if(!InHole && CanWalk)
			if(destination==HomeLoc) if(loc==HomeLoc) destination=null
			if(destination) step_towards(src,destination)
	WalkTo(1)
mob/Monsters/proc/LocateTarget(RANGE=5) for(var/mob/Monsters/M in oview(RANGE,src))
	var/Gunna=CanBeSlaved
	if("Agressive" in GuardRules) Gunna=1
	if(ismob(M.Owner)) switch(Owner)
		if("{NPC Alliance}") if(!M.Undead&&!M.Morphed&&M.SubRace!="HalfDemon"&&!M.Werepowers) Gunna=0
		if("{NPC Undead}") if(M.Undead || M.Race==Race) Gunna=0
		else if(M.Race == Race) Gunna=0
	if("[M.Owner]" in Friendlies) Gunna=0
	if("[Owner]" in M.Hostilities) Gunna=1
	if(ismob(Owner)&&ismob(M.Owner))
		var/mob/OWNERA = Owner
		var/mob/OWNERB = M.Owner
		if(OWNERB.name in OWNERA.AllyList) Gunna=0
		if(OWNERB.Faction == OWNERA.Faction) Gunna=0
	if(ismob(M.destination))
		var/mob/Monsters/D = M.destination
		if(D.Owner == Owner) Gunna=1
	if(M.Owner == Owner || M.CantKill) continue
	switch(M.Race)
		if("Plant") if(prob(99)) continue
		if("Egg") continue
	if(Gunna) return(M)
mob/proc/FindGear()
	var/OOO
	for(var/obj/Items/I in view(1,src))
		OOO = 1
		break
	if(OOO == 1) for(var/obj/Items/Equipment/E in view(1,src))
		var/OLDLOCATION=E.loc
		var/TryIt
		switch(E.ItemType)
			if("Helmet") if(!WearingHelmet) TryIt=1
			if("Cape") if(!WearingCape) TryIt=1
			if("Neckguard") if(!WearingFullPlateHelm) TryIt=1
			if("Quiver") if(!WearingBack) TryIt=1
			if("Chestplate") if(!WearingChest) TryIt=1
			if("LeftArm") if(!WearingLeftArm) TryIt=1
			if("RightArm") if(!WearingRightArm) TryIt=1
			if("Leggings") if(!WearingLegs) TryIt=1
			if("Shield") if(!WearingShield) TryIt=1
			else if(E.EquipmentType()=="Weapon") if(!HoldingWeapon) TryIt=1
		if(TryIt) if(PickUpItem(E))
			if(EquipItem(E)) continue
			else if(DropItem(E)) E.loc=OLDLOCATION