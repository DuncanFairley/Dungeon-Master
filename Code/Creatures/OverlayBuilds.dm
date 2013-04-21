atom/movable/var
	Beard=null
	Hair=null
mob/proc/AddTurnedOverlay(icon/ICON)
	ICON.Turn(90)
	overlays+=ICON
mob/proc/RebuildOverlays()
	overlays = list()
	if(IsMist) return
	if(!Critter) if(Gender=="Female") if(!Werepowers) switch(Race)
		if("Human","Dwarf","Elf") overlays+=icon('Female.dmi',"Unders")
		if("Dragon","Spider")
		else overlays+=icon('Female.dmi',"Shirt")
	for(var/obj/Items/Equipment/Armour/Leggings/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Chestplate/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	if(Beard) overlays += icon('Beards.dmi',"[Beard]") //Under the helmet, over the chestplate.
	if(Hair) overlays += icon('Hair.dmi',"[Hair]") //Over the beard.
	for(var/obj/Items/Equipment/Armour/LeftArm/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/RightArm/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Capes/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Helmet/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Crown/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Quiver/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Armour/Shield/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	for(var/obj/Items/Equipment/Weapon/ITEM in src) if(ITEM.suffix=="(Equipped)") overlays+=icon(ITEM.icon,ITEM.icon_state)
	if(HasWings&&WingsOut)
		switch(icon) //This won't cause issues with flying as the actual icon gets changed to 'Fly.dmi' while flying, and these overlays are based on icon.
			if('Vampire.dmi') overlays += icon('Wings.dmi',"Vampire")
			if('Demon.dmi') overlays += icon('Wings.dmi',"Demon")
			if('Gargoyle.dmi') overlays += icon('Wings.dmi',"Gargoyle")
			if('Angel of Death.dmi') overlays += icon('Wings.dmi',"Death Angel")
	if(SubRace == "Illithid" && Race == "Illithid") overlays += icon('Book.dmi',"Illithid Tentacles")
	if(icon=='Lizardman.dmi') overlays += icon(icon,"Tail") //Over Everything else as to stick out. Both 'LizardMan.dmi' and 'LizardWoman.dmi' have the tail state.
	if(CHILDMALE||CHILDFEMALE) if(!Egg) overlays += icon('Cave.dmi',"preg")
	if("LizardEgg" in CoolDowns) overlays += icon('Cave.dmi',"preg")

	if(Shielded&&Race!="Dragon") overlays += 'HolyShield.dmi'
	if(OnFire) overlays += 'Fire.dmi'
	if(Sleeping) overlays += 'Sleep.dmi'