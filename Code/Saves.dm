mob/var
	savedx = 0
	savedy = 0
	savedz = 0
Admin/verb/SaveUnitsInWorld()
	set category="Admin"
	SaveUnits()
	world << "[usr] has saved units."
/proc/CallSave()
	spawn(9500)
		world << "<font size=4>Units Saving"
		CallSave()
		sleep(5)
		SaveUnits()
/proc/SaveUnits() for(var/mob/M in world) if(M.key)
	var/sav = "units/[M.ckey]_save.sav"
	var/savefile/S = new(sav)
	M.savedx = M.x
	M.savedy = M.y
	M.savedz = M.z
	for(var/mob/X in M.UnitList)
		X.savedx = X.x
		X.savedy = X.y
		X.savedz = X.z
	M.Write(S)

mob/proc/LoadUnits() if(fexists("units/[ckey]_save.sav"))
	var/sav = "units/[ckey]_save.sav"
	var/savefile/S = new(sav)
	Read(S)
	if(!isobj(loc))
		x = savedx
		y = savedy
		z = savedz
	Loaded = 1
	density = 0
	Selected = list()
	client.images = null
	if(IsClanLeader == 1) verbs+=typesof(/Clan/verb)
	var/In = 0
	if(usr in PlayerList) In = 1
	if(In == 0) PlayerList += usr
	for(var/mob/Monsters/K in UnitList)
		for(var/mob/CK in K) CK.Owner = usr
		K.x = K.savedx
		K.y = K.savedy
		K.z = K.savedz
		K.Owner = usr
		if(K.Meditating)
			K.Meditating = 0
			K.CanWalk = 1
		K.CoolDown = 0
		K.Sleeping = 0
		K.Stunned = 0
		K.Fainted = 0
		K.HomeLoc = null
		K.Target = null
		if(K.HasRightLeg == 1 && K.HasLeftLeg == 1) K.CanWalk = 1
		if(K.Race=="Devourer") K.CanWalk = 1
		K.RebuildOverlays()
		if(K.Race == "Vampire") if(K.y == 1 || K.y == 3) K.y = 2
		var/image/I = new('mob.dmi',K)
		K.Star = I
		K.LimbLoss()
	return(1)