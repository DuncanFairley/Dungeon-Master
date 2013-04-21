mob/proc/ChangeOwnership(WHO,FORCE) //Sets to the owner to WHO, and if WHO is a mob adds to the unit list.
	//If setting to a player make sure WHO is the player's mob, and not just their name.
	//This meaning src's Owner and WHO can both be null and the proc will still work.
	if(!IsRoyal||FORCE)
		var/mob/OWNER
		var/mob/NEWOWNER
		if(ismob(Owner)) OWNER=Owner //Checks to see if src's owner is a mob, then assigns it to a mob var.
		if(ismob(WHO)) NEWOWNER=WHO//Same thing, but checks WHO instead of src's Owner.
		if(OWNER) //Thus only triggering if src's Owner is a mob.
			OWNER.UnitList -= src //Removes src from the old Owner's UnitList.
			Deselect()
		if(NEWOWNER) //Thus only triggering if WHO is a mob.
			NEWOWNER.UnitList += src //If WHO is a mob, we'll be adding it to that mob's unit list with this.
			CanBeSlaved=0 //We only want these set to 0 if the ownership if going to a mob.
		Owner=WHO //Regardless of other details, this proc ALWAYS sets src's Owner to WHO unless it is a royal unit.
		return(1)