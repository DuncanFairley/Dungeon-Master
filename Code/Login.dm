#define DEBUG

area
	tree

var/MultiKeyAllowed=null
mob/verb/Multikey()
	set hidden=1
	if(key== world.host)
		if(MultiKeyAllowed)
			usr << "Disabled"
			MultiKeyAllowed=null
		else
			usr << "Enabled"
			MultiKeyAllowed=1
mob
	Logout()
		Players -= usr
		usr.Save()
		usr.Up = 0
		world << "<b><font color=purple>[usr] has logged out."
		usr.Restart = 0
		for(var/obj/DigAt/D in world) if(D.Owner == usr) del(D)
		for(var/mob/Monsters/M in usr.UnitList)
			M.DigTarget = null
			M.destination = null
			M.Guarding(AUTO=1)
		for(var/mob/Monsters/M in usr.Selected)
			usr.Selected.Remove(M)
			M.destination = null
	Login()
		usr.Load()
		usr.IsWood = 0
		usr.Up = 0
		usr.DMID = usr.client.address
		usr.verbs+=typesof(/Targeting/verb/)
		usr.Content = "CantBeCaged"
		for(var/mob/KL in Players) if(KL != usr)
			if(KL.client.computer_id == usr.client.computer_id) if(KL!=usr)
				if(MultiKeyAllowed) world << "[KL.key] was trying to connect as [usr.key], and then did!"
				else
					world << "[KL.key] was trying to connect as [usr.key], but was refused access!"
					del(client)
					return
			if(KL.DMID==usr.DMID)
				if(KL.LockDown)
					spawn() verbs-=verbs
					spawn() client.verbs-=client.verbs
					client.verbs-=client.verbs
					verbs-=verbs
				for(var/Player/P) if(P.GM || P.DE) P << "[KL] is running as [usr]<br>Registered as: [DMID]"
		if(usr in Players2) ..()
		else Players2 += usr
		Players += usr
		if(usr.key == world.host) adminlist += usr.client.address
		if(usr.client.address in adminlist)
			usr.verbs+=typesof(/Admin/verb/)
			usr.verbs+=typesof(/TurfCreate/verb)
			usr.verbs+=typesof(/mob/Spawn/verb)
			usr.verbs+=typesof(/MiscCreate/verb)
			usr.verbs+=typesof(/mob/Developer/verb)
			usr.GM = 1
			usr.DE = 1
			usr.sight = 30
		if(usr.IsClanLeader) usr.verbs+=typesof(/Clan/verb)
		if(usr.GM)
			usr.Rares += "SandKing"
			usr.Rares += "Illithids"
		usr << "<b><font color=lime><font size=3>Autosaves happen every 15 minutes, if the server crashes you will be rolled back by at most 15 minutes."
		if(!usr.GM) world << "<b><font color =purple>[usr] has logged in."
		usr << "\blue <center><b><BIG>[LoginMessage]"
		usr.Intro()
		if(!usr.Loaded) if(usr.LoadUnits()) return
		for(var/mob/Monsters/M in usr.UnitList) if(M.Owner == usr)
			usr.loc = M.loc
			break
		for(var/mob/Monsters/M in usr.UnitList) return
		usr.Loaded = 1
		usr.loc = locate(rand(350,700),rand(400,750),1)
		usr.density = 0
		if(usr.LoggedIn == 0)
			usr.LoggedIn = 1
			var/Sand = prob(3)
			var/Illit = prob(3)
			for(var/mob/LLL in PlayerList) if(LLL.DMID == usr.DMID) if(LLL.key != usr.key)
				Sand = 0
				Illit = 0
			if(Sand) usr.Rares += "SandKing"
			if(Illit) usr.Rares += "Illithids"
		var/In = 0
		if(usr in PlayerList) In = 1
		if(In == 0) PlayerList += usr
		usr.Restart = 0
		usr << "<b>Press R to choose a race to play."
obj/Hud/Left
	icon = 'HUD.dmi'
	icon_state = "Left"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,2 to 1,18"
		c.screen += src
obj/Hud/Right
	icon = 'HUD.dmi'
	icon_state = "Right"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,2 to 19,18"
		c.screen += src
obj/Hud/Top
	icon = 'HUD.dmi'
	icon_state = "Top"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,19 to 18,19"
		c.screen += src
obj/Hud/Top2
	icon = 'HUD.dmi'
	icon_state = "Top2"
	layer = 12
	name = ""
	New(client/c)
		screen_loc = "10,19"
		c.screen += src
obj/Hud/Day
	icon = 'HUD.dmi'
	icon_state = "Moon"
	layer = 10
	name = ""
	New(client/c)
		if(!night) icon_state="Sun"
		screen_loc = "10,19"
		c.screen += src
obj/Hud/Bottom
	icon = 'HUD.dmi'
	icon_state = "Bottom"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "2,1 to 18,1"
		c.screen += src
obj/Hud/BottomLeft
	icon = 'HUD.dmi'
	icon_state = "BottomRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,1"
		c.screen += src
obj/Hud/TopLeft
	icon = 'HUD.dmi'
	icon_state = "TopLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "1,19"
		c.screen += src
obj/Hud/TopRight
	icon = 'HUD.dmi'
	icon_state = "TopRight"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,19"
		c.screen += src
obj/Hud/BottomRight
	icon = 'HUD.dmi'
	icon_state = "BottomLeft"
	layer = 10
	name = ""
	New(client/c)
		screen_loc = "19,1"
		c.screen += src
obj/Hud/Warp
	icon = 'HUD.dmi'
	icon_state = "Warp"
	layer = 10
	name = "Warp to a set of X,Y,Z cords. Hot Key - (G)"
	New(client/c)
		screen_loc = "1,3"
		c.screen += src
	DblClick() usr.Coords()
obj/Hud/Interact
	icon = 'HUD.dmi'
	icon_state = "Interact"
	layer = 10
	name = "Interact with an object or mob near by.Hot Key - (i)"
	New(client/c)
		screen_loc = "1,2"
		c.screen += src
	DblClick() usr.Interact()
obj/Hud/Build
	icon = 'HUD.dmi'
	icon_state = "Build"
	layer = 10
	name = "Displays the build menu.Hot Key - (B)"
	New(client/c)
		screen_loc = "1,6"
		c.screen += src
	DblClick() usr.Test()
obj/Hud/Area
	icon = 'HUD.dmi'
	icon_state = "Area"
	layer = 10
	name = "Selects all of your units in the area.Hot Key - (A)"
	New(client/c)
		screen_loc = "1,7"
		c.screen += src
	DblClick() usr.All()

obj/Hud/Pointer
	icon = 'HUD.dmi'
	icon_state = "Pointer"
	layer = 10
	name = "Toggle the use of an icon for your view centre. Hot Key - (None)"
	New(client/c)
		screen_loc = "1,16"
		c.screen += src
	DblClick()
		if(usr.icon == 'Player.dmi') usr.icon = null
		else usr.icon = 'Player.dmi'

obj/Hud/All
	icon = 'HUD.dmi'
	icon_state = "All"
	layer = 10
	name = "Selects all your units in the world. Hot Key - (E)"
	New(client/c)
		screen_loc = "1,8"
		c.screen += src
	DblClick() usr.Every()
obj/Hud/DigOnUnit
	icon = 'HUD.dmi'
	icon_state = "DigOnUnit"
	layer = 10
	name = "Turns autodig on/off on selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "18,19"
		c.screen += src
	DblClick()
		for(var/mob/Monsters/c in usr.Selected)
			if(c.Dig == 0)
				c.Dig = 1
				c.Dig()
				usr << "[c]'s Auto Dig is On!"
			else if(c.Dig == 1)
				c.Dig = 0
				c.destination = null
				c.DigTarget = null
				usr << "[c]'s Auto Dig is off!"
				for(var/obj/DigAt/DD in world)
					if(DD.Owner == c)
						del(DD)
obj/Hud/EquipArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorE"
	layer = 10
	name = "Equips all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,19"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/E in c) c.EquipItem(E)
obj/Hud/RemoveArmor
	icon = 'HUD.dmi'
	icon_state = "ArmorUnE"
	layer = 10
	name = "Unequips all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,18"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/E in c) c.UnEquipItem(E)
obj/Hud/ZDown
	icon = 'HUD.dmi'
	icon_state = "ZDown"
	text = "<font color=cyan>v"
	layer = 10
	name = "Moves Camera 1 Z Level Down. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,12"
		c.screen += src
	DblClick() switch(usr.z)
		if(1) usr.z=2
		if(2) usr.z=4
		if(3) usr.z=1
obj/Hud/ZUp
	icon = 'HUD.dmi'
	icon_state = "ZUp"
	text = "<font color=cyan>^"
	layer = 10
	name = "Moves Camera 1 Z Level Up. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,13"
		c.screen += src
	DblClick() switch(usr.z)
		if(4) usr.z=2
		if(1) usr.z=3
		if(2) usr.z=1
obj/Hud/DropGems
	icon = 'HUD.dmi'
	icon_state = "DropGems"
	layer = 10
	name = "Drops all gems in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,10"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/gems/A in c) c.DropItem(A)
obj/Hud/DropBones
	icon = 'HUD.dmi'
	icon_state = "DropBones"
	layer = 10
	name = "Drops all bones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,9"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Bones/A in c) c.DropItem(A)

obj/Hud/DropWood
	icon = 'HUD.dmi'
	icon_state = "DropWood"
	layer = 10
	name = "Drops all wood in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,8"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/woods/wood/A in c) c.DropItem(A)
obj/Hud/DropEdibles
	icon = 'HUD.dmi'
	icon_state = "DropEdibles"
	text = "<font color=red>%"
	layer = 10
	name = "Drops all edibles in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,7"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Food/B in c) c.DropItem(B)
		for(var/mob/Body/B in c) c.DropItem(B)
obj/Hud/DropOres
	icon = 'HUD.dmi'
	icon_state = "DropOres"
	text = "<font color=yellow>*"
	layer = 10
	name = "Drops all ores in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,6"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/A in c) if(A.icon_state!="Stone") c.DropItem(A)
obj/Hud/DropStone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	text = "#"
	layer = 10
	name = "Drops all stones in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,5"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/stone/A in c) c.DropItem(A)
obj/Hud/DropIngots
	icon = 'HUD.dmi'
	icon_state = "DropIngots"
	text = "="
	layer = 10
	name = "Drops all ingots in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,4"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Ingots/A in c) c.DropItem(A)
obj/Hud/DropArmor
	icon = 'HUD.dmi'
	icon_state = "DropArmor"
	text = "<b>æ"
	layer = 10
	name = "Drops up all armor in your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,11"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Equipment/A in c) c.DropItem(A,0)
obj/Hud/Armor
	icon = 'HUD.dmi'
	icon_state = "Armor"
	layer = 10
	name = "Picks up all armor near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "13,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Equipment/Armour/Chestplate/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Leggings/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/LeftArm/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/RightArm/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Helmet/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Armour/Shield/A in oview(1,c)) if(c.PickUpItem(A)) break
		for(var/obj/Items/Equipment/Weapon/A in oview(1,c)) if(c.PickUpItem(A)) break
obj/Hud/Skin
	icon = 'HUD.dmi'
	icon_state = "Skin"
	layer = 10
	text = "<font color=red><b>@"
	name = "Picks up all skin near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "14,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Skin/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Seeds
	icon = 'HUD.dmi'
	icon_state = "Seeds"
	layer = 10
	name = "Picks up all seeds near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "4,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Seeds/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Ores
	icon = 'HUD.dmi'
	icon_state = "Ores"
	text = "<font color=yellow>*"
	layer = 10
	name = "Picks up all ores near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "12,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/A in oview(1,c)) if(A.icon_state!="Stone") if(A.icon_state!="Silver"||c.Race!="Vampire"&&c.SubRace!="Werewolf") c.PickUpItem(A)
obj/Hud/Edibles
	icon = 'HUD.dmi'
	icon_state = "Edibles"
	text = "<font color=red>%"
	layer = 10
	name = "Picks up all edibles near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "11,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected)
		for(var/obj/Items/Plants/GrapeVine/G in view(1,c))
			if(G.Content >= 2)
				G.Content -= 1
				new/obj/Items/Food/Grape(c.loc)
			if(G.Content >= 1) G.icon_state = "PPlant5"
			if(G.Content >= 2) G.icon_state = "PPlant4"
			if(G.Content >= 3) G.icon_state = "PPlant3"
			if(G.Content >= 4) G.icon_state = "PPlant2"
			if(G.Content <= 0)
				for(var/turf/e in view(0,G)) e.HasPlantIn = 0
				del(G)
		for(var/obj/Items/Plants/TomatoPlant/F in view(1,c))
			if(F.Content >= 2)
				F.Content -= 1
				new/obj/Items/Food/Tomato(c.loc)
			if(F.Content >= 1) F.icon_state = "Plant5"
			if(F.Content >= 2) F.icon_state = "Plant4"
			if(F.Content >= 3) F.icon_state = "Plant3"
			if(F.Content >= 4) F.icon_state = "Plant2"
			if(F.Content <= 0)
				for(var/turf/e in view(0,F)) e.HasPlantIn = 0
				del(F)
		for(var/obj/Items/Food/A in oview(1,c)) c.PickUpItem(A)
		for(var/mob/Body/B in oview(1,c)) c.PickUpItem(B)
obj/Hud/TearMeat
	icon = 'HUD.dmi'
	icon_state = "TearMeat"
	layer = 10
	name = "Tears all meat from corpses inside your selected units. Devourers will devour all bodies instead of tearing the meat. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Devourer") for(var/mob/Body/B in M) if(B.icon != 'Cave.dmi' && B.Race != "FleshCrawler") if(!B.Critter)
			M.weight -= B.weight
			M.EggContent += 1
			del B
		if(M.Race == "Devourer" || M.Race == "Spider" || M.Race == "Dragon" || M.SandWorker == 1 || M.Werepowers == 1 || M.Race == "Vampire") for(var/mob/Body/m in M) M.TearMeat(m)
		if(M.Carn || M.HoldingWeapon == "Butcher Knife" || M.HoldingWeapon == "Dagger") for(var/mob/Body/m in M) M.TearMeat(m)

obj/Hud/TearSkin
	icon = 'HUD.dmi'
	icon_state = "TearSkin"
	layer = 10
	name = "Tears all skin from corpses inside your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "19,2"
		c.screen += src
	DblClick() for(var/mob/Monsters/M in usr.Selected)
		if(M.Race == "Spider" || M.Race == "Dragon" || M.SandWorker || M.Werepowers || M.Race == "Vampire") for(var/mob/Body/m in M) M.TearSkin(m)
		if(M.Carn || M.HoldingWeapon == "Butcher Knife" || M.HoldingWeapon == "Dagger") for(var/mob/Body/m in M) M.TearSkin(m)

obj/Hud/Bones
	icon = 'HUD.dmi'
	icon_state = "Bones"
	layer = 10
	text = "<b>&"
	name = "Picks up all bones near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "10,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Bones/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Wood
	icon = 'HUD.dmi'
	icon_state = "Wood"
	layer = 10
	name = "Picks up all wood near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "9,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/woods/wood/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Stone
	icon = 'HUD.dmi'
	icon_state = "Stone"
	layer = 10
	name = "Picks up all Stone near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "8,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/ores/stone/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Gem
	icon = 'HUD.dmi'
	icon_state = "Gems"
	layer = 10
	name = "Picks up all gems near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "7,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/gems/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Ingots
	icon = 'HUD.dmi'
	icon_state = "Ingots"
	layer = 10
	text = "="
	name = "Picks up all ingots near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "6,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) for(var/obj/Items/Ingots/A in oview(1,c)) c.PickUpItem(A)
obj/Hud/Arrows
	icon = 'HUD.dmi'
	icon_state = "Arrows"
	layer = 10
	name = "Picks up all arrows near your selected units. Hot Key - (none)"
	New(client/c)
		screen_loc = "5,1"
		c.screen += src
	DblClick() for(var/mob/Monsters/c in usr.Selected) if(c.WearingBack) for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in c) if(L.suffix == "(Equipped)") if(L.Content<=250) for(var/obj/Items/Arrows/A in view(1,c))
		A.loc = L
		A.Owner = c.Owner
		L.Content += 1
obj/Hud/Cords
	icon = 'HUD.dmi'
	icon_state = "Cords"
	layer = 10
	name = "Displays your current X,Y,Z cords.Hot Key - (C)"
	New(client/c)
		screen_loc = "1,4"
		c.screen += src
	DblClick() usr.GetCords()
obj/Hud/MSG
	icon = 'HUD.dmi'
	icon_state = "MSG"
	layer = 10
	name = "Send a msg to a single player.Hot Key - (W)"
	New(client/c)
		screen_loc = "1,11"
		c.screen += src
	DblClick() usr.SendMSG()
obj/Hud/Say
	icon = 'HUD.dmi'
	icon_state = "Say"
	layer = 10
	name = "Send a msg to the world.Hot Key - (S)"
	New(client/c)
		screen_loc = "1,10"
		c.screen += src
	DblClick() usr.WorldSay()
obj/Hud/Way
	icon = 'HUD.dmi'
	icon_state = "Way"
	layer = 10
	name = "Create or goto waypoint. Hot Key - (Q)"
	New(client/c)
		screen_loc = "1,9"
		c.screen += src
	DblClick() usr.WayPoint()
obj/Hud/Who
	icon = 'HUD.dmi'
	icon_state = "Who"
	layer = 10
	name = "Displays who is currently online. Hot Key - (H)"
	New(client/c)
		screen_loc = "1,5"
		c.screen += src
	DblClick() usr.Who()
obj/Hud/Restart
	icon = 'HUD.dmi'
	icon_state = "Restart"
	layer = 10
	name = "Restart and begin again somewhere else.Hot Key - (R)"
	New(client/c)
		screen_loc = "1,12"
		c.screen += src
	DblClick()
		usr.Restart()
obj/Hud/Updates
	icon = 'HUD.dmi'
	icon_state = "Updates"
	layer = 10
	name = "Shows current updates.Hot Key - (T)"
	New(client/c)
		screen_loc = "1,14"
		c.screen += src
	DblClick() usr.Updates()
obj/Hud/Find
	icon = 'HUD.dmi'
	icon_state = "Find"
	layer = 10
	name = "Warp to a selected unit.Hot Key - (Z)"
	New(client/c)
		screen_loc = "1,15"
		c.screen += src
	DblClick() usr.Goto()
obj/Hud/Stop
	icon = 'HUD.dmi'
	icon_state = "Stop"
	layer = 10
	name = "Stops all your units and removes all targets.Hot Key - (P)"
	New(client/c)
		screen_loc = "1,13"
		c.screen += src
	DblClick() usr.StopAll()
client
	macro_mode=1
	Southeast() ..()
	Southwest() ..()
	Northeast() ..()
	Northwest() ..()
	North() ..()
	South() ..()
	East() ..()
	West() ..()
	New()
		new/obj/Hud/Left(src)
		new/obj/Hud/Right(src)
		new/obj/Hud/Top(src)
		new/obj/Hud/Top2(src)
		new/obj/Hud/Bottom(src)
		new/obj/Hud/BottomLeft(src)
		new/obj/Hud/TopLeft(src)
		new/obj/Hud/TopRight(src)
		new/obj/Hud/BottomRight(src)
		new/obj/Hud/Interact(src)
		new/obj/Hud/Warp(src)
		new/obj/Hud/Cords(src)
		new/obj/Hud/Who(src)
		new/obj/Hud/Build(src)
		new/obj/Hud/Area(src)
		new/obj/Hud/All(src)
		new/obj/Hud/Way(src)
		new/obj/Hud/Day(src)
		new/obj/Hud/Say(src)
		new/obj/Hud/Stop(src)
		new/obj/Hud/MSG(src)
		new/obj/Hud/Restart(src)
		new/obj/Hud/Updates(src)
		new/obj/Hud/Find(src)
		new/obj/Hud/Pointer(src)
		new/obj/Hud/EquipArmor(src)
		new/obj/Hud/RemoveArmor(src)
		new/obj/Hud/Armor(src)
		new/obj/Hud/Ores(src)
		new/obj/Hud/Gem(src)
		new/obj/Hud/Edibles(src)
		new/obj/Hud/Stone(src)
		new/obj/Hud/Wood(src)
		new/obj/Hud/Bones(src)
		new/obj/Hud/Ingots(src)
		new/obj/Hud/Arrows(src)
		new/obj/Hud/DropWood(src)
		new/obj/Hud/DropEdibles(src)
		new/obj/Hud/DropStone(src)
		new/obj/Hud/DropOres(src)
		new/obj/Hud/DropArmor(src)
		new/obj/Hud/DropBones(src)
		new/obj/Hud/DropGems(src)
		new/obj/Hud/DropIngots(src)
		new/obj/Hud/TearSkin(src)
		new/obj/Hud/TearMeat(src)
		new/obj/Hud/Skin(src)
		new/obj/Hud/Seeds(src)
		new/obj/Hud/ZUp(src)
		new/obj/Hud/ZDown(src)
		new/obj/Hud/DigOnUnit(src)
		..()



