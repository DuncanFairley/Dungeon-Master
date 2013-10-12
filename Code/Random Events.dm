var/EVENT_ACTION=null
var/EVENT_DETAIL=null
var/EVENT_QUESTION=null
var/EVENT_TEXT=null
Admin/verb/ChangeEventButton(VERB as text)
	set category="Admin"
	EVENT_ACTION=VERB
	switch(EVENT_ACTION)
		if("Warp","SilentWarp")
			EVENT_DETAIL=usr.loc
			EVENT_QUESTION=input(usr,"Event Question, answered by a yes/no.","EVENT_QUESTION","Are you sure you wish to warp your selected units to the event zone?") as text
			EVENT_TEXT=input(usr,"Text displayed to all when used.","EVENT_TEXT"," has joined the event!") as text
		else
			usr<<"You input ''[VERB]''"
			return
mob/verb/EVENT()
	switch(EVENT_ACTION)
		if("Warp","SilentWarp")
			if(alert(usr,EVENT_QUESTION,"Event Button","Yes","No")=="Yes")
				if(EVENT_ACTION!="SilentWarp") world<<"[src][EVENT_TEXT]"
				if(EVENT_DETAIL) for(var/mob/Monsters/M in usr.Selected) M.loc=EVENT_DETAIL
		else usr<<"The event button doesn't seem to be active. If it's supposed to be, tell someone in charge."

proc/MakeMany(TYPE,NUMBER,LOCATION,GENDER) if(TYPE&&NUMBER)
	var/list/UNITS = new()
	if(GENDER) for(var/NUMBERS=0,NUMBERS<NUMBER,NUMBERS++)
		UNITS += new TYPE(LOCATION,GENDER)
		if(GENDER) GENDER=0
		else GENDER=1
	else for(var/NUMBERS=0,NUMBERS<NUMBER,NUMBERS++) UNITS += new TYPE(LOCATION)
	return(UNITS)
proc/Army(ARMY=rand(1,6),NUMBER=rand(25,33),var/turf/LOC=LocateValidLocation())
	if(LOC) switch(ARMY)
		if(1)
			MakeMany(/mob/Monsters/Kobold/NPC/Scout,NUMBER,LOC)
			var/mob/Monsters/Kobold/NPC/Chieftain/C = new(LOC)
			world << "An army of Kobolds have arrived at [C.x],[C.y],[C.z] to loot and pillage the land!"
		if(2)
			MakeMany(/mob/Monsters/Goblin/NPC/Scout,NUMBER,LOC)
			var/mob/Monsters/Goblin/NPC/Commander/C = new(LOC)
			world << "An army of Goblins have arrived at [C.x],[C.y],[C.z] to search for treasures!"
		if(3)
			MakeMany(/mob/Monsters/Skeleton/NPC/Warrior,NUMBER*2,LOC)
			MakeMany(/mob/Monsters/Skeleton/NPC/Lord,NUMBER,LOC)
			var/mob/Monsters/Skeleton/NPC/Lich/C = new(LOC)
			world << "An army of Undead have arrived at [C.x],[C.y],[C.z] to scourge the land of life!"
		if(4)
			MakeMany(/mob/Monsters/Ratman/NPC/Scout,NUMBER*2,LOC)
			var/mob/Monsters/Ratman/NPC/King/C = new(LOC)
			world << "An army of Ratmen have arrived at [C.x],[C.y],[C.z] in search of fine treasures!"
		if(5)
			MakeMany(/mob/Monsters/Human/NPC/Paladin,NUMBER,LOC)
			var/mob/Monsters/Human/NPC/Dragoon/C = new(LOC)
			world << "An army of Crusading Humans have arrived at [C.x],[C.y],[C.z] to decimate the evil of this land!"
		if(6)
			MakeMany(/mob/Monsters/Orc/NPCOrc/Warrior,round(NUMBER/2),LOC)
			var/mob/Monsters/Orc/NPCOrc/Warlord/C = new(LOC)
			world << "A horde of Orcs have arrived at [C.x],[C.y],[C.z] to make war upon this land!"
		else return(0)
	return(1)