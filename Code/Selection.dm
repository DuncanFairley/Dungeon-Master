obj/Hud
	DigAdd
		icon = 'Selection.dmi'
		icon_state = "addi"
		layer = 11
		name = "Add tiles to autodig selection. Hot Key - (tab)"
		New(client/c)
			screen_loc = "2,19"
			c.screen += src
		DblClick()
			usr.digadd()
	DigSub
		icon = 'Selection.dmi'
		icon_state = "subi"
		layer = 11
		name = "Subtract tiles from autodig selection. Hot Key - (tab)"
		New(client/c)
			screen_loc = "3,19"
			c.screen += src
		DblClick()
			usr.digsub()
	DigSel
		icon = 'Selection.dmi'
		icon_state = "autodig"
		layer = 11
		name = "Use selection autodig. To use you must have at least one unit selected with autodig on. Hot Key - (f5)"
		New(client/c)
			screen_loc = "1,19"
			c.screen += src
		DblClick()
			usr.switchdig()
mob
	var/autodigging = 0
	var/adding = 1
	proc/GetADiggers()
		var/digcount = 0
		for(var/mob/M in usr.Selected)
			if(M.Dig)
				digcount++
		return digcount
	verb/digadd()
		set name = ".digsub"
		if(usr.Function == "RemoveAutodig")
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "adda"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You are now adding autodig!"
			usr.Function = "PlaceAutodig"
	verb/digsub()
		set name = ".digsub"
		if(usr.Function == "PlaceAutodig")
			adding = 0
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "suba"
			usr << "You are now removing autodig!"
			usr.Function = "RemoveAutodig"
	verb/enddig()
		set name = ".enddig"
		if(autodigging)
			autodigging = 0
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You have stopped using the autodigging selection feature!"
	verb/switchdig()
		set name = "Use Autodigging"
		if(usr.Function == "PlaceAutodig" || usr.Function == "RemoveAutodig")
			autodigging = 0
			adding = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "addi"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You have stopped using the autodigging selection feature!"
			usr.Function = null
		else
			autodigging = 1
			for(var/obj/Hud/DigAdd/O in usr.client.screen)
				O.icon_state = "adda"
			for(var/obj/Hud/DigSub/O in usr.client.screen)
				O.icon_state = "subi"
			usr << "You are now using the autodigging selection feature!"
			usr.Function = "PlaceAutodig"
	verb/switchadd()
		set name = "Toggle Autodigging add/sub"
		if(autodigging)
			if(usr.Function == "PlaceAutodig")
				adding = 0
				for(var/obj/Hud/DigAdd/O in usr.client.screen)
					O.icon_state = "addi"
				for(var/obj/Hud/DigSub/O in usr.client.screen)
					O.icon_state = "suba"
				usr << "You are now removing autodig!"
				usr.Function = "RemoveAutodig"
			else if(usr.Function == "RemoveAutodig")
				adding = 1
				for(var/obj/Hud/DigAdd/O in usr.client.screen)
					O.icon_state = "adda"
				for(var/obj/Hud/DigSub/O in usr.client.screen)
					O.icon_state = "subi"
				usr << "You are now adding autodig!"
				usr.Function = "PlaceAutodig"
client
	var/paintdigon
	var/paintdigoff
	var/blockdigon = 1
	var/blockdigoff
	var/selecting
	var/list/box
	var/tmp/sellist[] = list()
	var/list/block1
	var/turf/loc1
	var/turf/loc2
	var/list/selected
	New()
		new/obj/Hud/DigSel(src)
		new/obj/Hud/DigAdd(src)
		new/obj/Hud/DigSub(src)
		..()