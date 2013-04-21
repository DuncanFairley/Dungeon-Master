/*===========================================================================================
Version 1.4 of Murrawhip's Murra-Admin library. Use what you wish, change what you
  wish. This is only very standard at the moment, send suggestions/bug reports to
  info@murrawhip.net if you wish. Enjoy!
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
mob/var{Mcloaked=0;Mprevicon}
var/moblist=list()
var/adminlist=list()
var/councillist=list()
var/modlist=list()
var/Players=list()
var/Players2=list()
mob

	Topic(href,href_list[])
		switch(href_list["action"])
			if("PM")//action, if its PM it goes on, if its not it just does nothing
				if(usr.Muted)
					usr<<"You are muted."
					return
				var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
				if(!msg) return
				//sends the message and tells the user the message they sent
				if(usr.ckey in src.IgnoreList)
					usr << "You are on [src]'s ignore list<br>"
					return
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PM>[src]</a>:</font color> [html_encode(msg)]"
				src<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PM>[usr]</a>:</font color> [html_encode(msg)]"
				for(var/mob/D in Players2)
					if(D.GM == 1 && D.DE == 1 && D != src && D != usr)
						D<<"<b><font color=silver>[usr] sent to [src]:</font color> [msg]"
			if("PPM")//action, if its PM it goes on, if its not it just does nothing
				var/msg = input("What would you like to privately say to [src] ([src.name])?","Private Message") as text|null
				if(!msg) return
				//sends the message and tells the user the message they sent
				if(usr.ckey in src.IgnoreList)
					usr << "You are on [src]'s ignore list<br>"
					return
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[src];action=PPM>[src]</a>:</font color> [html_encode(msg)]"
				src<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"
				for(var/mob/D in Players2)
					if(D.key == "Felix Rose")
						D<<"<b><font color=silver>(Priv)[usr] sent to [src]:</font color> [msg]"

mob
	verb
		Adminhelp(msg as text) if(msg) for(var/mob/M in world) if(M.GM || M == src) M << "<font color=blue>Admin-help from: <a href=?src=\ref[usr];action=PM>[usr]</a>([usr.Race]):</font color> [html_encode(msg)]"

mob/var/tmp/FreeSelect
mob/var/tmp/LockDown=null
Admin/verb/LockDownPlayer(Player/PLAY in world)
	set category = "Admin"
	if(alert("Remove [PLAY]'s verbs and disable any ability to do anything till the next reboot?","You sure?","Yes","No")=="Yes")
		PLAY.verbs-=PLAY.verbs
		PLAY.LockDown=1
		usr<<"Applied lockdown to [PLAY]."
		PLAY<<"You've been locked down. Or at least we think you have."
Admin/verb/FreeSelect()
	set category = "Admin"
	if(usr.FreeSelect) usr.FreeSelect=null
	else usr.FreeSelect=1
Admin/verb/MakeArmy(ARM as num,NUM as num)
	set category = "NPC's"
	set desc = "(Army ID,Value)"
	Army(ARM,NUM,usr.loc)
var/DamageMultiplier=1
Admin/verb
	ChangeDamageMultiplier(DAMAGE as num)
		set category = "Admin"
		usr << "You have set the Damage Multiplier from [DamageMultiplier] to [DAMAGE]."
		DamageMultiplier=DAMAGE
	ChangeExperienceMultiplier(EXPERIENCE as num)
		set category = "Admin"
		usr << "You have set the Experience Multiplier from [ExperienceMultiplier] to [EXPERIENCE]"
		ExperienceMultiplier=EXPERIENCE
	make_vote()
		set category="Admin"
		if(vote_system.vote) return
		var/question = input("What will the question be?", "Question") as text
		var/list/options = list()
		var/option
		var/i = 0
		do
			if(option) options += option
			option = input(usr, "What will option #[++i] be?", "Option [i]") as null|text
		while(option != null && !vote_system.vote)

		if(vote_system.vote) return
		var/vote_data/result = vote_system.Query(question, options)
		if(result.tie)
			var/list/tie_data = new/list()
			for(i in result.tie_list) tie_data += options[i]
			world <<"<b>Tie!</b> between [dd_list2text(tie_data, "; ")]..."
		world << "Result: <b>[options[result.winner]]</b>"
	CheckOwner(var/mob/M in range())
		set category="Admin"
		usr << "[M]'s Owner is [M.Owner]"
	RollDice()
		set category="Admin"
		var/N = input("Format = 2d3 etc.") as null|text
		var/G = roll("[N]")
		world << "<font color=yellow><font size=3>[usr] has rolled [N] dice with result [G]"
	CheckPlayerGenders()
		set category="Admin"
		for(var/mob/M in Players2) usr << "[M] - [M.gender]"
	FakeLogout()
		set category="Admin"
		world << "<b><font color=purple>[usr] has logged out."
		Players -= usr
		usr.Content2 = "Invisible"
		usr.invisibility = 25
		usr.see_invisible = 100
	FakeLogin()
		set category="Admin"
		world << "<b><font color=purple>[usr] has logged in."
		if(usr in Players) ..()
		else Players += usr
		usr.Content2 = 0
	CheckRaces()
		set category="Admin"
		for(var/mob/M in world) if(M.key) usr << "--<font color = purple>[M] - Race:[M.Race]"
	HealUnit(var/mob/M in view())
		set category="Admin"
		M.FullHeal(1)
	Admin_Send_File(var/mob/person in Players2,filez as file)
		set hidden = 1
		switch(alert(person,"[usr] is trying to send you [filez].  Do you accept the file?","**File Transfer**","Yes","No"))
			if("Yes")
				alert(usr,"[person] accepted the file","File Accepted")
				person<<ftp(filez)
			if("No")
				alert(usr,"[person] declined the file","File Declined")
	MakeChess()
		set hidden = 1
		var/obj/Items/Furniture/Tables/Table/T1 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T2 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T3 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T4 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T5 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T6 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T7 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T8 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T9 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T10 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T11 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T12 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T13 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T14 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T15 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T16 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T17 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T18 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T19 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T20 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T21 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T22 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T23 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T24 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T25 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T26 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T27 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T28 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T29 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T30 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T31 = new(usr.loc)
		var/obj/Items/Furniture/Tables/Table/T32 = new(usr.loc)
		T1.icon_state = "WPawn"
		T2.icon_state = "WPawn"
		T3.icon_state = "WPawn"
		T4.icon_state = "WPawn"
		T5.icon_state = "WPawn"
		T6.icon_state = "WPawn"
		T7.icon_state = "WPawn"
		T8.icon_state = "WPawn"
		T9.icon_state = "BPawn"
		T10.icon_state = "BPawn"
		T11.icon_state = "BPawn"
		T12.icon_state = "BPawn"
		T13.icon_state = "BPawn"
		T14.icon_state = "BPawn"
		T15.icon_state = "BPawn"
		T16.icon_state = "BPawn"
		T17.icon_state = "BRook"
		T18.icon_state = "WRook"
		T19.icon_state = "BRook"
		T20.icon_state = "WRook"
		T21.icon_state = "BKnight"
		T22.icon_state = "BKnight"
		T23.icon_state = "WKnight"
		T24.icon_state = "WKnight"
		T25.icon_state = "BQueen"
		T26.icon_state = "WQueen"
		T27.icon_state = "BKing"
		T28.icon_state = "WKing"
		T29.icon_state = "BBishop"
		T30.icon_state = "BBishop"
		T31.icon_state = "WBishop"
		T32.icon_state = "WBishop"
		for(var/obj/Items/Furniture/Tables/Table/T in range(1,usr))
			T.icon = 'Chess Pieces.dmi'
			T.name = T.icon_state
			T.weight = 0
	SendSound(var/mob/person in Players2,filez as file)
		set hidden = 1
		person << sound(filez)
	SendSoundAll(filez as file)
		set hidden = 1
		world << sound(filez)
	SoundOffAll()
		world << sound(null)
	GiveRare()
		set category="Admin"
		var/T = input("Select Player Here")as null|anything in Players
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S)
					var/list/menu4 = new()
					menu4 += "Sandking"
					menu4 += "Illithids"
					menu4 += "Remove All"
					menu4 += "Cancel"
					switch(input("Which Race?", "Choose", null) in menu4)
						if("Sandking")
							S.Rares += "SandKing"
							usr << "You have given [S] Sandking"
						if("Illithids")
							S.Rares += "Illithids"
							usr << "You have given [S] Illithid"
						if("Remove All")
							S.Rares -= S.Rares
							usr << "You have removed [S]'s rares"
	RolePlayAnnounce()
		set category="Admin"
		var/T = input("Whisper to who?")as null|text
		if(!T)
			..()
		else
			world<<"<b><font color=yellow>[T]"
	WarningAnnounce()
		set category="Admin"
		var/T = input("Type Warning Here")as null|text
		if(!T)
			..()
		else
			world<<"<b><font color=white>[T]"

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
				P.Portal()
				var/obj/Portal/P2 = new
				P2.loc = locate(P.x,P.y,4)
				P2.suffix = "Stuck"
				P2.Content = P.z
				P2.Portal()
	UnlimitedHungerTiredness(mob/Monsters/m in view())
		set category="Admin"
		if(m.Hunger<=100 ||m.Tiredness<=100)
			m.Owner << "[m]'s sleep and hunger will now be set to 40000!"
			m.Hunger = 40000
			m.Tiredness = 40000
		else
			m.Owner << "[m]'s sleep and hunger will now be set to 100!"
			m.Hunger = 100
			m.Tiredness = 100
	Mute()
		set category="Admin"
		var/T = input("Mute/Un-Mute who?")as null|text
		if(T) for(var/mob/S in world)
			if(T == S.key)
				if(S.Muted)
					world << "[S] has been un-muted by [usr]."
					S.Muted = 0
					return
				else
					world << "[S] has been muted by [usr]."
					S.Muted = 1
	WarpTo()
		set category="Admin"
		var/T = input("Warp to who?")as null|text
		if(T) for(var/mob/S in world) if(T == S.name) usr.loc = S.loc
	AdminKill(mob/m in view())
		set category="Admin"
		if(m.HumanParts)
			usr << "You admin kill [m]."
			m.GoingToDie = 1
			m.Death()
	ForceNight()
		set category="Admin"
		Night()
		world << "<b><font color=aqua>[usr] forces Night/Day."
	ForceSeasons()
		set category="Admin"
		Seasons()
		world << "<b><font color=red>[usr] forces Season Changes."
	MakeExplode(mob/m in view())
		set category="Admin"
		if(m.HumanParts == 1)
			view() << "[usr] sends a bolt of energy into [m]!"
			m.HasLeftArm = 0
			m.HasLeftLeg = 0
			m.HasRightLeg = 0
			m.HasRightArm = 0
			m.CanWalk = 0
			m.CanSee = 0
			m.Stunned = 0
			m.LimbLoss()
			m.BloodContent -= 400
			m.BloodLoss()
			m.LimbFling("Left Arm")
			sleep(1)
			m.LimbFling("Right Arm")
			sleep(1)
			m.LimbFling("Left Leg")
			sleep(1)
			m.LimbFling("Right Leg")
	CheckIP()
		set category="Admin"
		var/T = input("IP Check who?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					usr << "[S]'s IP is: [S.client.address]"
					usr << "[S] is registered in DM as: [S.DMID]"
	Announcement(msg as message)///Nifty window pop-up announcement
		set category="Admin"
		var/html_doc="<head><title>Announcement</title></head><body bgcolor=#000000 text=#FFFF00><center><B><U><font color = red><font size=1><font face=Verdana>Announcement</U>From:<br> [usr]</font><font face=Verdana><font color=COCOCO><br><br>[msg]"
		world<<browse(html_doc,"window=Announcement")
	Summon(mob/M in world)
		set category = "Admin"
		M.x = usr.x; M.y = usr.y; M.z = usr.z; if(M.client) M.client.eye = M;
	SummonPlayer()
		set category = "Admin"
		var/T = input("Summon who's units?")as null|text
		if(!T)
			..()
		else
			for(var/mob/S in world)
				if(T == S.key)
					switch(alert("Summon: [S]","Summon Player & Units?","Yes","No"))
						if("Yes")
							S.x = usr.x; S.y = usr.y; S.z = usr.z; if(S.client) S.client.eye = S;
							for(var/mob/Monsters/H in S.UnitList)
								H.x = usr.x; H.y = usr.y; H.z = usr.z; if(H.client) H.client.eye = H;
	Watch(mob/M in world)
		set category="Admin"
		usr.client.eye = M
		usr.client.perspective = EYE_PERSPECTIVE
	StopWatching()
		set category="Admin"
		usr.client.eye = usr
		usr.client.perspective = MOB_PERSPECTIVE
	Delete(atom/M in view())
		set category="Admin"
		del M

	Create()
		set category="Admin"
		usr.client<<link("?command=create;")
	Edit(obj/O as obj|turf|mob in view())
		set category="Admin"
		if(O)
			var/variable=input("Which var?","Var") in O.vars
			var/default
			var/typeof=O.vars[variable]
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
	SetOwner(obj/O as mob in view())
		set category="Admin"
		var/T = input("Set Who as Owner?")as null|text
		if(T) for(var/Player/S in world) if(T == S.name)
			S.Deselect()
			O.Owner = S
			O.CanBeSlaved = 0
			S.UnitList += O
			S << "[usr] makes [S] the owner of [O]"
			if(S != usr) usr << "[usr] makes [S] the owner of [O]"
	MakeNPC(mob/Monsters/O in view())
		set category="Admin"
		usr << "You make [O] into an NPC"
		if(ismob(O))
			O.ChangeOwnership(FORCE=1)
			O.CanBeSlaved = 1
			O.RandomWalk()
			return
	MeteorStrikeLocation()
		set category="Admin"
		for(var/turf/grounds/G in view(8,usr)) G.MeteorStrike()
		world << "A meteor has struck at [usr.x],[usr.y],[usr.z]!!!!"
	Server_Options()
		set category="Admin"
		set name="Server Options"
		switch(input("Select Option","Server Panel")as null|anything in list ("Reboot Server","Shutdown Server","Repop Server","Change Server Name","Change Server Status","Admin Log","Chat Log","Unitchat Log","Emote Log"))
			if("Reboot Server")
				world<<"<b><font color = red>[usr] is Restarting the world in 10 seconds.</font></b>"
				sleep(100)
				world.Reboot()
			if("Shutdown Server") if(usr.key == "Felix Rose")
				world<<"<b><font color = red>Server will shut down in 15 seconds.</font></b>"
				sleep(150)
				del world
			if("Repop Server") world.Repop()
			if("Change Server Name")
				set category="Admin"
				world.name=input("What is the new world name?","Change World Name",world.name)
			if("Change Server Status")
				set category="Admin"
				world.status=input("What is the new world status?","Change World Status",world.status)
proc
	Edit_null_display(typeof)
		if(typeof=="")return"and currently equals null"
		else return"and currently equals [typeof]"
MiscCreate/verb
	LegendaryMetalSword()
		set category="Misc"
		var/obj/Items/Equipment/Weapon/Swords/StraightSword/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.MetalWeaponCraft()
	LegendaryMetalSpear()
		set category="Misc"
		var/obj/Items/Equipment/Weapon/Spears/MetalSpear/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.MetalWeaponCraft()
	LegendaryMetalMace()
		set category="Misc"
		var/obj/Items/Equipment/Weapon/Maces/MetalMace/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.MetalWeaponCraft()
	LegendaryMetalAxe()
		set category="Misc"
		var/obj/Items/Equipment/Weapon/Axes/MetalOrcAxe/A1 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A1.MetalWeaponCraft()
	FullMetalLegendary()
		set category="Misc"
		var/obj/Items/Equipment/Armour/Chestplate/MetalChestPlate/A1 = new (usr.loc)
		var/obj/Items/Equipment/Armour/Leggings/MetalLeggings/A2 = new (usr.loc)
		var/obj/Items/Equipment/Armour/RightArm/MetalRightGauntlet/A3 = new (usr.loc)
		var/obj/Items/Equipment/Armour/LeftArm/MetalLeftGauntlet/A4 = new (usr.loc)
		var/obj/Items/Equipment/Armour/Helmet/MetalHelmet/A5 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A2.CraftRank = "Legendary Quality"
		A3.CraftRank = "Legendary Quality"
		A4.CraftRank = "Legendary Quality"
		A5.CraftRank = "Legendary Quality"
		A1.MetalArmourCraft()
		A2.MetalArmourCraft()
		A3.MetalArmourCraft()
		A4.MetalArmourCraft()
		A5.MetalArmourCraft()
	FullBoneLegendary()
		set category="Misc"
		var/obj/Items/Equipment/Armour/Chestplate/BoneChestPlate/A1 = new (usr.loc)
		var/obj/Items/Equipment/Armour/Leggings/BoneLeggings/A2 = new (usr.loc)
		var/obj/Items/Equipment/Armour/RightArm/BoneRightGauntlet/A3 = new (usr.loc)
		var/obj/Items/Equipment/Armour/LeftArm/BoneLeftGauntlet/A4 = new (usr.loc)
		var/obj/Items/Equipment/Armour/Helmet/BoneHelmet/A5 = new (usr.loc)
		A1.CraftRank = "Legendary Quality"
		A2.CraftRank = "Legendary Quality"
		A3.CraftRank = "Legendary Quality"
		A4.CraftRank = "Legendary Quality"
		A5.CraftRank = "Legendary Quality"
		A1.BoneArmourCraft()
		A2.BoneArmourCraft()
		A3.BoneArmourCraft()
		A4.BoneArmourCraft()
		A5.BoneArmourCraft()
	Grapes()
		set category="Misc"
		var/obj/Items/Plants/GrapeVine/item = new (usr.loc)
		item=item
	Garlic()
		set category="Misc"
		var/obj/Items/Plants/GarlicPlant/item = new (usr.loc)
		item=item
	Tomatos()
		set category="Misc"
		var/obj/Items/Plants/TomatoPlant/item = new (usr.loc)
		item=item
	IronIngot()
		set category="Misc"
		var/obj/Items/Ingots/IronIngot/item = new (usr.loc)
		item=item
	SilverIngot()
		set category="Misc"
		var/obj/Items/Ingots/SilverIngot/item = new (usr.loc)
		item=item
	GoldIngot()
		set category="Misc"
		var/obj/Items/Ingots/GoldIngot/item = new (usr.loc)
		item=item
	Stone()
		set category="Misc"
		var/obj/Items/ores/stone/item = new (usr.loc)
		item=item
	Wood()
		set category="Misc"
		var/obj/Items/woods/wood/item = new (usr.loc)
		item=item
	Food()
		set category="Misc"
		var/obj/Items/Food/Meat/Cooked_Meat/item = new (usr.loc)
		item=item
	Bones()
		set category="Misc"
		var/obj/Items/Bones/Bones/item = new (usr.loc)
		item=item
	WoodenDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/WoodenDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
	BoneDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/BoneDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
	MetalDoor()
		set category="Misc"
		var/obj/Items/Furniture/Doors/MetalDoor/item = new (usr.loc)
		item=item
		item.dir = usr.dir
		item.Placed = 1
		item.HP = 5000
		item.Owner = usr
		item.density = 1
	EmptyBottle()
		set category="Misc"
		var/obj/Items/Potions/EmptyBottle/item = new (usr.loc)
		item=item
	LonglifePotion()
		set category="Misc"
		var/obj/Items/Potions/LifePotion/item = new (usr.loc)
		item=item
	ImmuneToDevPotion()
		set category="Misc"
		var/obj/Items/Potions/DevourerPotion/item = new (usr.loc)
		item=item
	VampCurePotion()
		set category="Misc"
		var/obj/Items/Potions/VampirismCure/item = new (usr.loc)
		item=item
TurfCreate/verb
	CreateStoneFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateCrystalFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "IllithidFloor"
		item.name = "crystalfloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateObsidianFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "GoblinFloor"
		item.name = "obsidianfloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSandkingFloor()
		set category="Turf"
		var/turf/grounds/DetailedFloor/item = new (usr.loc)
		item=item
		item.icon_state = "SandFloor"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateWoodFloor()
		set category="Turf"
		var/turf/grounds/WoodFloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateHellFloor()
		set category="Turf"
		var/turf/grounds/hellfloor/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGrass()
		set category="Turf"
		var/turf/grounds/grass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateEvilTurf()
		set category="Turf"
		var/turf/grounds/deadgrass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGoodTurf()
		set category="Turf"
		var/turf/grounds/goodgrass/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateEvilTree()
		set category="Turf"
		var/turf/grounds/Trees/DeadTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateGoodTree()
		set category="Turf"
		var/turf/grounds/Trees/GoodTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateNoDig()
		set category="Turf"
		var/turf/grounds/NoDig/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSnow()
		set category="Turf"
		var/turf/grounds/snow/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateDesert()
		set category="Turf"
		var/turf/grounds/desert/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateMarsh()
		set category="Turf"
		var/turf/grounds/marsh/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCaveFloor()
		set category="Turf"
		var/turf/grounds/cavefloor2/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCaveWall()
		set category="Turf"
		var/turf/grounds/cavefloor/item = new (usr.loc)
		item=item
		item.name = "Mountain"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateStoneWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateCrystalWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "IllithidWall"
		item.name = "Crystal Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateObsidianWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "GoblinWall"
		item.name = "Obsidian Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSandkingWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "SandWall"
		item.name = "Sandking Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateAdamantiumSpire()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "AdaSpire"
		item.name = "Adamantium Spire"
		item.HP = 10000
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateBoneWall()
		set category="Turf"
		var/turf/grounds/DetailedWall/item = new (usr.loc)
		item=item
		item.icon_state = "Bone Wall"
		item.name = "Bone Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateTribalWall()
		set category="Turf"
		var/turf/grounds/WoodWall/item = new (usr.loc)
		item=item
		item.icon_state = "TribalWall"
		item.name = "Tribal Wall"
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateHellCliff()
		set category="Turf"
		var/turf/grounds/hellcliff/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateWoodWall()
		set category="Turf"
		var/turf/grounds/WoodWall/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateChasm()
		set category="Turf"
		var/turf/grounds/Chasm/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateLava()
		set category="Turf"
		var/turf/grounds/lavas/lava/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateWater()
		set category="Turf"
		var/turf/grounds/waters/water/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateSwampWater()
		set category="Turf"
		var/turf/grounds/waters/swamp/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1


	CreateTree()
		set category="Turf"
		var/turf/grounds/Trees/Tree1/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1

	CreateTundraTree()
		set category="Turf"
		var/turf/grounds/Trees/TundraTree/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateCactus()
		set category="Turf"
		var/turf/grounds/Trees/Cactus/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
	CreateBamboo()
		set category="Turf"
		var/turf/grounds/Trees/Bamboo/item = new (usr.loc)
		item=item
		if(usr.z == 1)
			item.Sky = 1
		if(usr.z == 2)
			item.Sky = 1
		if(usr.z == 3)
			item.Content3 = "Peak"
		if(usr.z == 4)
			item.Cant = 1
mob
	Spawn
		verb
			Devourer()
				set category = "Creatures"
				new/mob/Monsters/Devourer(usr.loc)
			Dwarf()
				set category = "Creatures"
				new/mob/Monsters/Dwarf(usr.loc)
			Human()
				set category = "Creatures"
				new/mob/Monsters/Human(usr.loc)
			Goblin()
				set category = "Creatures"
				new/mob/Monsters/Goblin(usr.loc)
			Kobold()
				set category = "Creatures"
				new/mob/Monsters/Kobold(usr.loc)
			Lizard_Man()
				set category = "Creatures"
				new/mob/Monsters/Lizardman(usr.loc)
			Orc()
				set category = "Creatures"
				new/mob/Monsters/Orc(usr.loc)
			Sand_King()
				set category = "Creatures"
				new/mob/Monsters/SandKing(usr.loc)
			Spider_Warrior()
				set category = "Creatures"
				new/mob/Monsters/Spider(usr.loc)
			Spider_Queen()
				set category = "Creatures"
				new/mob/Monsters/Spider/Queen(usr.loc)
			Spider_Worker()
				set category = "Creatures"
				new/mob/Monsters/Spider/Worker(usr.loc)
			Spider_Hunter()
				set category = "Creatures"
				new/mob/Monsters/Spider/Hunter(usr.loc)
			Spawn_Zombie()
				set category = "Creatures"
				new/mob/Monsters/Zombie(usr.loc)
			Vampire()
				set category = "Creatures"
				new/mob/Monsters/Vampire(usr.loc)
			Gargoyle()
				set category = "Creatures"
				new/mob/Monsters/Gargoyle(usr.loc)
			Ratman()
				set category = "Creatures"
				new/mob/Monsters/Ratman(usr.loc)
			Svartalfar()
				set category = "Creatures"
				new/mob/Monsters/Svartalfar(usr.loc)
			Demon()
				set category = "NPC's"
				new/mob/Monsters/Demon/NPC(usr.loc)
			Frogman()
				set category = "NPC's"
				new/mob/Monsters/Frogman/NPC/Scout(usr.loc)
			Frogman_Chieftain()
				set category = "NPC's"
				new/mob/Monsters/Frogman/NPC/Chieftain(usr.loc)
			Gremlin()
				set category = "NPC's"
				new/mob/Monsters/Critters/Gremlin(usr.loc)
Targeting/verb
	SetTarget(var/mob/Monsters/M in view()) for(var/mob/Monsters/X in usr.Selected)
		X.MagicTarget = M
		usr << "[X] is now targeting [M]"
Clan/verb
	Invite_To_Clan()
		set category="Clan"
		if(usr.IsClanLeader == 1)
			var/T = input("Pick Someone")as null|anything in Players
			if(!T)
				return
			else
				for(var/Player/M in Players)
					if(T == M)
						if(usr.ckey in M.IgnoreList)
							usr << "You are on [src]'s ignore list<br>"
							return
						var/choice = alert(M, "[usr] has invited you to their clan, [usr.Faction], Do you accept?", "Choose", "No","Yes",null)
						if (choice == "No")
							usr << "[M] has refused."
							return
						if (choice == "Yes")
							usr << "[M] has accepted."
							M << "You have accepted, - for clanchat, = for clan tapestries."
							M.Faction = usr.Faction
							M.IsClanLeader = 0
	Boot_From_Clan()
		set category="Clan"
		if(usr.IsClanLeader)
			var/T = input("Kick Someone.") as null|text
			if(!T) return
			else for(var/Player/M in world) if(T == M.key) if(M.Faction == usr.Faction)
				M << "You have been booted from your clan!"
				M.Faction = "Player"
				return
mob
	Developer
		verb
			RealPrivateMessage(var/mob/M in Players, msg as text)
				set hidden=1
				usr<<"<font color=red>(PM)</font color><font color=blue><--- To: <a href=?src=\ref[M];action=PPM>[M]</a>:</font color> [html_encode(msg)]"
				M<<"<font color=red>(PM)</font color><font color=blue>---> From: <a href=?src=\ref[usr];action=PPM>[usr]</a>:</font color> [html_encode(msg)]"
				for(var/mob/D in Players2)
					if(D != M && D != usr)
						if(D.key == "Felix Rose")
							D<<"<b><font color=silver>(Priv)[usr] sent to [M]:</font color> [msg]"
			Change_Login_Message(msg as message)
				set category="Admin"
				usr << "<b><font color=red>The login message is currently: '[LoginMessage]'"
				LoginMessage=msg
			DevEdit(A in world)
				set category="Admin"
				usr.client<<link("?command=edit;target=\ref[A];type=view;")
			DevCreate()
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




proc
	Log_bug(adminaction) //Define adminaction as a string then call this proc
		file("Logs/Bugs.html")<<"[time2text(world.realtime,"MMM DD - hh:mm")]: [adminaction]<br />"


mob/proc/ReportDate(time)
	var/format = "<b>hh:mm:ss</b>" //MM/DD/YYYY
	return time2text(time, format)

var
	Bugs = null//The var for the logging

mob
	verb
		Reportabug(msg as message)
			set hidden = 1
			set desc = "If this is spam, you will be Murdered"
			Bugs+="([ReportDate(world.realtime)]) [src] Reported: [html_encode(msg)]<br>"//THIS IS WHERE THE BUG LOGS TO THE HTML
			Log_bug("[src] reported: [msg]")

		ViewBug()
			set hidden = 1
			usr<<browse("<b><body bgcolor=black><font color=white><center><u>Bug Reports For [world.name]</u></center></b><br><br>Time at view [ReportDate(world.realtime)]<br><br><font color=white>[(Bugs)]<br>")//HERES WHERE THE BUGS RECORED WILL SHOW


///////////////Cow RP vote system.

mob
	Admin
		verb
			make_vote()
				set category="Admin"
				if(vote_system.vote) return
				var/question = input("What will the question be?", "Question") as text
				var/list/options = list()
				var/option
				var/i = 0
				do
					if(option) options += option
					option = input(usr, "What will option #[++i] be?", "Option [i]") as null|text
				while(option != null && !vote_system.vote)

				if(vote_system.vote) return
				var/vote_data/result = vote_system.Query(question, options)
				if(result.tie)
					var/list/tie_data = new/list()
					for(i in result.tie_list) tie_data += options[i]
					world <<"<b>Tie!</b> between [dd_list2text(tie_data, "; ")]..."
				world << "Result: <b>[options[result.winner]]</b>"




var/vote_system/vote_system = new
vote_data
	var
		winner
		tie = 0 //1 if this was a tie
		list/tie_list
		aborted = 0
	New(winner, tie = 0, tie_list)
		if(!winner)
			aborted = 1
		else
			src.winner = winner
			src.tie = tie
			src.tie_list = tie_list
vote_system
	var
		question
		list
			answers
			results
		vote = 0 //if 1, a vote is already in progress
		default_answer = 0 //0 = H
		vote_reboot = TRUE
		reboot_vote = FALSE //if the vote is actually on
		reboot_time
		vote_timeout
		flags = 0
		const
			VOTING = 1
			ABORTING = 2
			REBOOT = 4
	proc
		Abort() flags |= 2
		Query(vote, list/answers, timeout = 300)
			set background = 1
			src.question = vote
			src.answers = answers
			src.results = new/list()
			src.vote = 1
			SendMessage(world)

			vote_timeout = timeout + world.timeofday

			timeout /= 10
			while(--timeout && !(flags & ABORTING))
				sleep(10)

			if(flags & ABORTING)
				flags = 0
				return new/vote_data()

			world << "<b>Voting has ended!</b>"
			var/list/winners[src.answers.len]
			for(var/i = 1 to src.answers.len) winners[i] = 0

			for(var/ckey in results)
				winners[results[ckey]]++
				for(var/mob/XX in Players2)
					if(XX.DE == 1 && XX.GM == 1)
						XX << "[dd_list2text(winners, "; ")] - [ckey]"

			var/highest = 0
			for(var/i = 1 to winners.len) if(winners[i] > highest) highest = winners[i]

			var/winner
			for(var/i = 1 to winners.len)
				if(winners[i] >= highest)
					if(istype(winner, /list)) winner += i
					else if(winner) winner = list(winner, i)
					else winner = i

			src.vote = 0
			if(istype(winner, /list)) return new/vote_data(pick(winner), 1, winner)
			else return new/vote_data(winner)
		SendMessage(recp)
			if(!vote) return
			recp << "<center><b>A vote has been started! ([question])</b></center>"
			recp << "<center>Click <a href=\"byond://?src=\ref[src];cmd=view\">here</a> to cast your vote.</center>"
	Topic(href, href_list[])
		if(!vote)
			usr << browse(null, "window=\ref[src]")
			return
		if(href_list["cmd"] == "vote" || href_list["cmd"] == "view")
			if(href_list["cmd"] == "vote")
				var/choice = text2num(href_list["choice"])
				if((usr.ckey in results) && results[usr.ckey] == choice) results -= usr.ckey
				else results[usr.ckey] = choice
				if(href_list["verbose"])
					/*if(istype(usr, /mob/character_handling))
						var/mob/character_handling/M = usr
						M.Display2()*/
					return
			. = {"
			<html>
				<head>
					<title>Voting Booth</title>
					<style>
						 body {
						 	font-family: Courier;
						 	font-size: 10pt;
						 	background-color: rgb(200, 220, 200);
						 	color: rgb(109, 64, 18);
						 }
						 input {
						 	background-color: rgb(200, 220, 200);
						 	color: rgb(109, 64, 18);
						 	margin-right: 8px;
						 	width: 100%;
						 	height: 24px;
						 	cursor: pointer;
						 }
						 input.selected {
						 	border-style: inset;
						 }
					</style>
				</head>
				<body>
					<p>[question]</p>
					<table width="100%">
						<tr><td>"}
			for(var/i = 1 to src.answers.len)
				. += "<input type=\"button\" value=\"[src.answers[i]]\" onclick=\"parent.location='byond://?src=\ref[src];cmd=vote;choice=[i]';\" [(usr.ckey in results) && results[usr.ckey] == i ? "class=\"selected\"" :] /></td>"
				if((i % 3) == 0)
					. += "</tr><tr>"
				. += "<td>"
			. += {"
					</table>
				</body>
			</html>"}
			usr << browse(., "window=\ref[src];size=600x256")