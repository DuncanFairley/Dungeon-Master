mob/var/tmp/list/RunningProcs=new()
mob/proc/StopDouble(NAME="Basic")
	if("[NAME]" in RunningProcs) return
	RunningProcs+="[NAME]"
	return(1)
mob/var/tmp/list/CoolDowns=new() //Temporary, meaning all cooldowns are clear when a unit is reconstructed from a save file.
mob/proc/CoolDown(NAME="Basic",TIME=150) //Can be called without using arguments to have a 15 second generic cooldown.
	if("[NAME]" in CoolDowns) return //Returns null, thus saying "no" to an "if(CoolDown())" case.
	if(TIME>0)
		CoolDowns+="[NAME]" //Makes it a text string and adds to active cooldowns.
		spawn(TIME) CoolDowns-="[NAME]" //Removes from active cooldowns after TIME.
	return(1) //Return 1, thus saying "yes" to an "if(CoolDown())"
var/tmp/list/Events=new()
proc/Event(NAME="Basic",TIME=150) //Time > 0 is a timer, Time = 0 is a trigger, Time < 0 is a check, Time = "C" is a clear.
	if(TIME=="C") if("[NAME]" in Events)
		Events-="[NAME]"
		return(1)
	if("[NAME]" in Events) return
	if(TIME>=0)
		Events+="[NAME]"
		if(TIME>0)spawn(TIME) Events-="[NAME]"
	return(1)



mob/var/tmp/list //Correct this later, might be causing excess process on mob creations for non-player mobs too...
	Group1=new()
	Group2=new()
	Group3=new()
	Group4=new()
	Group5=new()
	Group6=new()
	Group7=new()
	Group8=new()
	Group9=new()
mob/var/tmp/LastQuickButtonPress=null
mob/verb
	Quick(Number as num,Action as text)
		var/list/LIST=new()
		if(Action!="Set") switch(Number)
			if(1) LIST=Group1
			if(2) LIST=Group2
			if(3) LIST=Group3
			if(4) LIST=Group4
			if(5) LIST=Group5
			if(6) LIST=Group6
			if(7) LIST=Group7
			if(8) LIST=Group8
			if(9) LIST=Group9
			else
				usr<<"''[Number]'' isn't a usable value. You must use a full value between 1 to 9."
				return
		switch(Action)
			if("Add") for(var/mob/Monsters/M in Selected)
				if(M in LIST) continue
				LIST+=M
			if("Set") for(var/mob/Monsters/M in Selected) LIST+=M
			if("Select")
				if(LastQuickButtonPress=="[Number]Select") for(var/mob/Monsters/M in Selected)
					usr.loc=M.loc
					return
				for(var/mob/Monsters/M in Selected) M.Deselect(src)
				for(var/mob/Monsters/M in LIST)
					if(M in Selected) continue
					M.Select(src)
			else
				usr<<"Only options are 'Add', 'Set', and 'Select'. cApS matter."
				return
		LastQuickButtonPress="[Number][Action]"
		spawn(3) LastQuickButtonPress=null
		if(Action!="Select") switch(Number)
			if(1) Group1=LIST
			if(2) Group2=LIST
			if(3) Group3=LIST
			if(4) Group4=LIST
			if(5) Group5=LIST
			if(6) Group6=LIST
			if(7) Group7=LIST
			if(8) Group8=LIST
			if(9) Group9=LIST