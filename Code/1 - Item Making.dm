mob/proc //For NPC use only.
	CraftItem(obj/Items/A1,RANK)
		A1.CraftRank = "[RANK] Quality"
		if(RANK=="Quality") A1.CraftRank = "Quality"
		if(istype(A1,/obj/Items/Equipment/Armour/)) A1.MetalArmourCraft()
		if(istype(A1,/obj/Items/Equipment/Weapon/)) A1.MetalWeaponCraft()
		return(A1)