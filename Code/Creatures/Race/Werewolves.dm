//Don't forget combat bites, want em to work the same as vampires.
/*
mob/proc/WerewolfInfection(mob/TARGET) spawn()
	if(TARGET.Race=="Vampire"||TARGET.Critter||TARGET.ImmuneToVampire||TARGET.SubRace=="Werewolf"||TARGET.Infects||TARGET.Race=="Spider"||TARGET.Race=="Dragon"||TARGET.InfectedBy) return
	view(TARGET) << "<b><font color=red>[TARGET] is infected by a werewolf!"
	sleep(500)
	if(prob(65))
		if(TARGET.Race == "Human" || TARGET.Race == "Dwarf" || TARGET.Race == "Lizardman" || TARGET.Race == "Goblin" || TARGET.Race == "Orc" || TARGET.Race == "Kobold")
			view(TARGET) << "[TARGET] has succumbed to the terrible lycanthropy!"
			TARGET.RaceChange(null,"Werewolf")
			if(prob(90))
				var/mob/G
				if(ismob(TARGET.Owner)) G = TARGET.Owner
				if(G)
					G.UnitList -= TARGET
					G.Selected.Remove(TARGET)
					G.client.images -= TARGET.Star
				var/mob/GG
				if(ismob(Owner)) GG = Owner
				if(GG)
					GG.UnitList += TARGET
					TARGET.Owner = usr
				view(TARGET) << "[TARGET] is completely dominated by the lycanthropy and becomes a slave to [src]."
			else view(TARGET) << "[TARGET] resists the controlling impulse of the disease and remains in control of their body and mind!"
		else
			view(TARGET) << "[TARGET] has succumbed to the terrible lycanthropy, but it is not compatible with their body, and blood begins flowing from their body until the infection is no more."
			TARGET.BloodContent -= 90
			TARGET.BloodLoss()
	else view(TARGET) << "[TARGET] has recovered from the vile infection passed to it by the werewolf"
mob/proc/WerewolfBite(mob/TARGET)
	var/Bite = prob(Strength-TARGET.Strength)
	if(TARGET in range(1,src))
		if(HasTeeth==0) return
		if(CoolDown("Bite",300))
			if(Bite)
				if(TARGET.WearingSilver)
					view(src) << "<b><font color=red>[src] tries to bite [TARGET] but is burned by their silver armor!"
					BloodContent -= 15
					BloodLoss()
				else if(TARGET.SubRace!="Werewolf"&&TARGET.Race!="Gargoyle"&&TARGET.Race!="PlayerSkeleton"&&TARGET.Wagon==0&&TARGET.Race != "TowerCap")
					view(src) << "<b><font color=red>[src] slashes at [TARGET] and sinks its teeth into them!"
					if(prob(50)) WerewolfInfection(TARGET)
					TARGET.BloodContent -= 15
					TARGET.BloodLoss()
					GainEXP(25)
			else view(src) << "<b><font color=red> [src] tries to grab hold of [TARGET] and bite them, but [TARGET] escapes!"*/
mob/proc/WerewolfTransformation() if(SubRace == "Werewolf")
	if(night) if(!Werepowers)
		SetEquipmentUse(0)
		SavedDefence = Defence
		SavedIcon = icon
		icon = 'Werewolf.dmi'
		Werepowers = 1
		HoldingWeapon = "Claws"
		Strength += 20
		Agility += 20
		Defence += 50
		WeaponDamageMin += 15
		WeaponDamageMax += 20
		Defence += Level * 1.4
		WeaponDamageMin += Level*0.25
		WeaponDamageMax += Level*0.25
	else if(Werepowers)
		Werepowers = 0
		HoldingWeapon = 0
		Defence = SavedDefence
		WeaponDamageMin = 0
		WeaponDamageMax = 0
		SetEquipmentUse()
		Agility -= 20
		Strength -= 20
		icon = SavedIcon