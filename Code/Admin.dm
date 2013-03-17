/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
/*===========================================================================================
Version 1.4 of Murrawhip's Murra-Admin library. Use what you wish, change what you
  wish. This is only very standard at the moment, send suggestions/bug reports to
  info@murrawhip.net if you wish. Enjoy!
  Addition in 2013: Gosh. I was a child when I made this terrible library.
---------------------------------------------------------------------------------------------
To install, merely include this library in your program, then add something similar
to this in your mob's Login() proc.
if(usr.key=="insertkeyhere")
	usr.verbs+=typesof(/Admin/verb/)//Gives all verbs under the mob/Admin mob.
The above shall grant the user specified, all adminstrative powers. If you wish to
only give select admin powers, then there are several ways you could go about it.

	if(usr.key=="insertkeyhere")
		usr.verbs+=typesof(/Admin/verb/)
		usr.verbs-=/Admin/verb/Delete
		usr.verbs-=/Admin/verb/Density_change
^Adding all powers of the Admin type, then subtracting
those powers you do not wish to give.

	if(usr.key=="insertkeyhere")
		usr.verbs+=/Admin/verb/Delete
		usr.verbs+=/Admin/verb/Density_change
^Adding those powers that you DO want to give.
---------------------------------------------------------------------------------------------
For banning/unbanning to work, include this in your mob's Login() proc also.
	if(usr.client.address in banlist)
			usr<<"You have been banned."
			del usr

===========================================================================================*/
proc
	Log_admin(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Adminlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"
	Log_chat(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Chatlog.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"

mob/var{Mcloaked=0;Mprevicon}
var/banlist=list()
var/Players=list()


world
	New()
		var/savefile/F=new("Bans.ban")
		var/tempban
		F["IP"] >> tempban
		for(var/A in tempban)
			banlist+=A

Admin/verb
	RaiseDead()
		set category="Admin"
		for(var/mob/Body/B in range())
			var/mob/Monsters/Zombie/Z = new
			Z.icon = B.icon
			Z.icon_state = B.icon_state
			Z.icon = turn(Z.icon,270)
			Z.Zombie()
			Z.loc = B.loc
			Z.Owner = usr
			Z.name = "([Z.Owner]) Zombie"
			Z.LimbLoss()
			usr.UnitList += Z
			var/obj/Bloods/Zombie/O = new
			Z.overlays += O
			del(B)
			return
	CheckOwner(var/mob/M in range())
		set category="Admin"
		usr << "[M]'s Owner is [M.Owner]"
	CreateFire(var/atom/a in view(9,usr))
		set category="Admin"
		if(a.IsWood)
			a.Fire()
	CheckRaces()
		set category="Admin"
		for(var/mob/M in world)
			if(M.User == 1)
				usr << "--<font color = purple>[M] - Queen:[M.QueenLeader] - King:[M.KingLeader] - Race:[M.Race]"
	HealUnit(var/mob/M in view())
		set category="Admin"
		view() << "[usr] heals [M]"
		M.HasLeftLeg = 1
		M.HasRightLeg = 1
		M.HasLeftArm = 1
		M.HasRightArm = 1
		M.HasTeeth = 1
		M.Teeth = "Good"
		M.TeethHP = M.TeethHPMax
		M.LeftArm = "Good"
		M.RightArm = "Good"
		M.LeftLeg = "Good"
		M.RightLeg = "Good"
		M.RightLegHP = M.RightLegMaxHP
		M.LeftLegHP = M.LeftLegMaxHP
		M.LeftArmHP = M.LeftArmMaxHP
		M.RightArmHP = M.RightArmMaxHP
		M.Crippled = 0
		M.CanUseRightArm = 1
		M.CanUseLeftArm = 1
		M.CanWalk = 1
		M.CanSee = 1
		M.BloodContent = M.MaxBloodContent
		M.BleedType = null
		M.LimbLoss()
		Log_admin("[usr] heals [M]")
	CreateGremlinSwarm()
		set category="Admin"
		var/choice2 = alert(usr, "Are you sure you want to create a gremlin horde?", "Choose", "No", "Yes", null)
		if (choice2 == null)
			return
		if (choice2 == "No")
			return
		if (choice2 == "Yes")
			var/mob/Monsters/Gremlin/A = new
			var/mob/Monsters/Gremlin/A2 = new
			var/mob/Monsters/Gremlin/A3 = new
			var/mob/Monsters/Gremlin/A4 = new
			var/mob/Monsters/Gremlin/A5 = new
			var/mob/Monsters/Gremlin/A6 = new
			A.loc = usr.loc
			A2.loc = usr.loc
			A3.loc = usr.loc
			A4.loc = usr.loc
			A5.loc = usr.loc
			A6.loc = usr.loc
			Log_admin("[usr] has created a gremlin horde")
	RolePlayAnnounce()
		set category="Admin"
		Log_admin("[usr] has used role play announce.")
		var/T = input("Whisper to who?")as null|text
		if(!T)
			..()
		else
			world<<"<b><font color=yellow>[T]"
	OpenHellPortal()
		set category="Admin"
		var/choice2 = alert(usr, "Are you sure you want to create a hell portal?", "Choose", "No", "Yes", null)
		if (choice2 == null)
			return
		if (choice2 == "No")
			return
		if (choice2 == "Yes")
			if(usr.z == 4)
				usr << "Cant make a portal to hell while in hell."
				return
			else
				var/obj/Portal/P = new
				P.loc = usr.loc
				P.suffix = "Stuck"
				world<<"<b><font color=yellow>The land starts to shake as a strange rift in time and space tear open, creating a way to hell its self!-[usr.x],[usr.y],[usr.z]"
				P.Spawn()
				var/obj/Portal/P2 = new
				P2.loc = locate(P.x,P.y,4)
				P2.suffix = "Stuck"
				P2.Content = P.z
				P2.Portal()
				Log_admin("[usr] has made a portal.")
	ImmuneToAll(mob/Monsters/m in view())
		set category="Admin"
		if(m.LoggedOut == 0)
			m.Owner << "[m]'s sleep and hunger will now not go down!"
			Log_admin("[usr] has immuned [m].")
			m.LoggedOut = 1
			return
		if(m.LoggedOut == 1)
			m.Owner << "[m]'s sleep and hunger will go down!"
			Log_admin("[usr] has un-immuned [m].")
			m.LoggedOut = 0
			return


	Mute()
		set category="Admin"
		var/T = input("Mute/Un-Mute who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					if(S.Muted == 1)
						world << "[S] is Un-Muted"
						S.Muted = 0
						Log_admin("[usr] has Un-Muted [S].")
						return
					if(S.Muted == 0)
						world << "[S] is Muted"
						Log_admin("[usr] has Muted [S].")
						S.Muted = 1
	WarpTo()
		set category="Admin"
		var/T = input("Warp to who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.name)
					usr.loc = S.loc
					Log_admin("[usr] has warped to [S].")
	MakeMelt(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			view() << "[usr] sends a bolt of energy into [m]!"
			m.icon = 'Blood.dmi'
			m.overlays = null
			m.CanWalk = 0
			flick("Burst",m)
			sleep(30)
			del(m)
			Log_admin("[usr] has melted [m].")
	MakeExplode(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			view() << "[usr] sends a bolt of energy into [m]!"
			m.HasLeftArm = 0
			m.HasLeftLeg = 0
			m.HasRightLeg = 0
			m.HasRightArm = 0
			m.CanWalk = 0
			m.Crippled = 1
			m.CanSee = 0
			m.Stunned = 0
			m.LimbLoss()
			m.ArmFling()
			m.ArmFling()
			m.LegFling()
			m.LegFling()
			m.BloodContent -= 400
			m.BloodLoss()
			Log_admin("[usr] has exploded [m].")

	UnBan()
		set category="Admin"
		var/T=input("Which address would you like to unban?")as null|anything in banlist
		banlist-=T

	Ban()
		set category="Admin"
		var/T = input("Ban who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					S<<"You have been banned."
					banlist+=S.client.address
					var/savefile/F=new("Maps/map_backup.sav")
					F["IP"] << banlist
					Log_admin("[usr] has banned [S].")
					del S
	Boot()
		set category="Admin"
		var/T = input("Ban who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					switch(alert("Boot: [S]","Boot Player?","Yes","No"))//Boot confirmation
						if("Yes")
							S<<"<b>You have been booted, reconsider how you have been acting before rejoining."
							Log_admin("[usr] has booted [S].")//Adds adminlog text to log
							del S
	Announcement(msg as message)///Nifty window pop-up announcement
		set category="Admin"
		var/html_doc="<head><title>Announcement</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U>From: [usr]</font><font face=Verdana><font color=COCOCO>[msg]"
		world<<browse(html_doc,"window=Announcement")
	Summon(mob/M in world)
		set category = "Admin"
		M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;

	Create()
		set category = "Admin"
		var
			maxlen = 0
			list/List2 = list()
			list/List3 = list()
			i = 0
			a
		for(a in typesof(/mob,/obj,/turf))
			List2.Add(a)
		maxlen = 200

		var/list/list= input("Make what?","List 1")in List2
		if(list)
			var/item = new list(usr.loc)
			item=item

		for(a in typesof(/mob,/obj,/turf))
			i ++
			if(i > maxlen)
				List3.Add(a)

		var/list/liste= input("Make what?","List 2")in List3
		if(liste)
			var/iteme = new liste(usr.loc)
			iteme=iteme
		usr<<"You create [liste]"
		Log_admin("[usr] has created [liste].")//Adds adminlog text to log
	Delete(obj/M as obj|turf in view())
		set category="Admin"
		Log_admin("[usr] has deleted [M].")//Adds adminlog text to log
		del M
	Edit(obj/O as obj|turf|mob in view())
		set category="Admin"
		var/variable=input("Which var?","Var") in O.vars
		var/default
		var/typeof=O.vars[variable]
		Log_admin("[usr] is editing/viewing [O]'s variable, '[variable]'.")
		var/value = Edit_null_display(typeof)
		if(isnull(typeof))
			usr<<"Unknown Variable-Type"
		else if(istext(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>TEXT</b> type [value]."
			default="text"
		else if(istype(typeof,/atom) || istype(typeof,/datum))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>TYPE</b> type [value]."
			default="type"
		else if(isicon(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>ICON</b> type [value]."
			typeof="\icon[typeof]"
			default="icon"
		else if(isloc(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>REFERENCE</b> type [value]."
			default="reference"
		else if(isnum(typeof))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>NUM</b> type [value]."
			default="num"
			usr.dir=1
		else if(istype(typeof,/list))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>LIST</b> type [value]."
			usr<<"Unable to edit Lists."
		else if(istype(typeof,/client))
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>CLIENT</b> type [value]."
			usr<<"Unable to edit Client."
		else
			usr<<"[O]\'s variable, '[variable]', appears to be of <b>FILE</b> type [value]."
			default="file"
		var/class=input("What type?","Variable Type",default)as null|anything in list("text","num","type","reference","icon","file","default")
		switch(class)
			if("default")
				O.vars[variable]=initial(O.vars[variable])
			if("text")
				O.vars[variable]=input("Enter new text:","Text",\
					O.vars[variable]) as null|text
			if("num")
				O.vars[variable]=input("Enter new number:","Num",\
					O.vars[variable]) as null|num
			if("icon")
				O.vars[variable]=input("Pick icon:","Icon",O.vars[variable]) \
					as null|icon
			if("type")
				O.vars[variable]=input("Enter type:","Type",O.vars[variable]) \
					in typesof(/obj,/mob,/area,/turf)
			if("reference")
				O.vars[variable]=input("Select reference:","Reference",\
					O.vars[variable]) as null|mob|obj|turf|area in world
			if("file")
				O.vars[variable]=input("Pick file:","File",O.vars[variable]) \
					as null|file
	Density_Change()
		set category="Admin"
		Log_admin("[usr] has used Density Change.")//Adds adminlog text to log
		for(var/mob/Monsters/M in usr.Selected)
			if(M.density==1)
				M.Owner << "Non-Dense"
				M.density=0
			else
				M.Owner << "Dense"
				M.density=1
	Cloak()
		set category="Admin"
		Log_admin("[usr] has used Cloak.")//Adds adminlog text to log
		for(var/mob/Monsters/M in usr.Selected)
			if(M.Mcloaked==0)
				M.Mcloaked=1
				M.Mprevicon=M.icon
				M.icon=null
				M.Owner << "Cloaked"
			else
				M.Mcloaked=0
				M.icon=M.Mprevicon
				M.Owner << "Un-Cloaked"
	Server_Options()
		set category="Admin"
		set name="Server Options"
		switch(input("Select Option","Server Panel")as null|anything in list ("Reboot Server","Shutdown Server","Repop Server","Change Server Name","Change Server Status","Admin Log","Chat Log"))
			if("Reboot Server")
				world<<"<b><font color = red>World Restarting in 10 seconds.</font></b>"
				Log_admin("[usr] has rebooted the world.")//Adds adminlog text to log
				sleep(100)
				world.Reboot()
			if("Shutdown Server")
				world<<"<b><font color = red>Server will shut down in 15 seconds.</font></b>"
				Log_admin("[usr] has shutdown the world.")//Adds adminlog text to log
				sleep(150)
				del world
			if("Repop Server")
				world<<"Repop"
				Log_admin("[usr] has repopped the world.")//Adds adminlog text to log
				world.Repop()
			if("Change Server Name")
				set category="Admin"
				world.name=input("What is the new world name?","Change World Name",world.name)
				Log_admin("[usr] has changed the server's name to [world.name].")//Adds adminlog text to log
			if("Change Server Status")
				set category="Admin"
				world.status=input("What is the new world status?","Change World Status",world.status)
				Log_admin("[usr] has changed the server's status to [world.status]")//Adds adminlog text to log
			if("Admin Log")
				switch(input("Select Option","Admin Log")as null|anything in list ("Read Log","Delete Log"))
					if("Read Log")
						usr<<browse(file("Logs/Adminlog.html"))
					if("Delete Log")
						if(usr.key == "Ginseng")
							fdel("Logs/Adminlog.html")
							Log_admin("[usr] has deleted the admin log.")
						else
							usr << "You are un-able to delete the admin log."
							Log_admin("[usr] tries to delete the admin log.")
			if("Chat Log")
				switch(input("Select Option","Chat Log")as null|anything in list ("Read Log","Delete Log"))
					if("Read Log")
						usr<<browse(file("Logs/Chatlog.html"))
					if("Delete Log")
						if(usr.key == "Ginseng")
							fdel("Logs/Chatlog.html")
							Log_admin("[usr] has deleted the chat log.")
						else
							usr << "You are un-able to delete the chat log."
							Log_admin("[usr] tries to delete the chat log.")
proc
	Edit_null_display(typeof)
		if(typeof=="")return"and currently equals null"
		else return"and currently equals [typeof]"