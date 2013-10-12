obj/Items/Equipment/Armour/Crown
	ItemType="Crown"
	Bone
		name="Bone Crown"
		icon = 'RoyalItems.dmi'
		icon_state = "BoneCrown"
		weight=5
		Defence=6
		WeaponDamageMin=6
		WeaponDamageMax=6
	Gold
		name="Gold Crown"
		icon = 'GoldItems.dmi'
		icon_state = "Crown"
		weight=10
		Defence=16
proc/GenderToLeader(GENDER)
	if(GENDER=="Female") return("Queen")
	else return("King")
proc/GenderToTheir(GENDER) switch(GENDER)
	if("Female") return("her")
	if("Male") return("his")
	else return("its")
mob/verb/DeclareLeader() for(var/mob/Monsters/M in Selected)
	if(M.IsRoyal) if(M.RemoveLeader()) return
	else if(M.AddLeader()) return
mob/proc
	AddLeader(obj/Items/Equipment/CROWN)
		if(!IsRoyal) if(alert(Owner,"Do you wish to make [src] into your [GenderToLeader(Gender)]?","Set Leader","Yes","No")=="Yes") if(!IsRoyal)
			var/mob/Monsters
				KING
				QUEEN
			for(var/mob/Monsters/M in usr.UnitList) if(M.IsRoyal) switch(GenderToLeader(M.Gender))
				if("King") KING=M
				if("Queen") QUEEN=M
			if(Gender=="Female")
				if("Queen" in usr.CoolDowns)
					usr<<"You cannot declare a new queen so soon after the loss of your last queen. You must wait one full hour."
					return
				if(QUEEN)
					usr<<"You already have [QUEEN] as your Queen. You may only have one Queen at a time."
					return
			else
				if("King" in usr.CoolDowns)
					usr<<"You cannot declare a new king so soon after the loss of your last king. You must wait one full hour."
					return
				if(KING)
					usr<<"You already have [KING] as your King. You may only have one King at a time."
					return
			if(CROWN) Owner<<"[src] places the [CROWN] upon [GenderToTheir(Gender)] head and becomes [GenderToLeader(Gender)] of your Empire!"
			else Owner<<"[src] has become [GenderToLeader(Gender)] of your Empire!"
			ChangeRoyal()
			name="[GenderToLeader(Gender)] [name]"
		if(IsRoyal) return(1)
	RemoveLeader() if(IsRoyal) if(alert(Owner,"Do you wish [src] to step down from being the [GenderToLeader(Gender)] of your Empire? You will have to wait a full hour before declaring a new unit as [GenderToLeader(Gender)].","Remove Leader","Yes","No")=="Yes") if(IsRoyal)
		for(var/obj/Items/Equipment/Armour/Crown/CROWN in src) UnEquipItem(CROWN,MANUAL=1)
		ChangeRoyal()
		if(copytext(name,1,6)=="King ") name=copytext(name,6)
		if(copytext(name,1,7)=="Queen ") name=copytext(name,7)
		Owner<<"[src] has stepped down from being [GenderToLeader(Gender)] of your Empire."
		usr.CoolDown("[GenderToLeader(Gender)]",36000)
		return(1)
mob/var/IsRoyal

mob/proc/ChangeRoyal()
	var/INFLUENCE
	if(IsRoyal)
		IsRoyal=null
		INFLUENCE=(-1)
	else
		IsRoyal=1
		INFLUENCE=(1)

	Strength+=10*INFLUENCE
	Agility+=10*INFLUENCE

	SneakingSkill+=40*INFLUENCE
	HP+=100*INFLUENCE
	MAXHP+=100*INFLUENCE
	SpearSkill+=25*INFLUENCE
	SwordSkill+=25*INFLUENCE
	MaceSkill+=25*INFLUENCE
	AxeSkill+=25*INFLUENCE
	DaggerSkill+=25*INFLUENCE
	UnArmedSkill+=25*INFLUENCE
	BowSkill+=25*INFLUENCE
	return(1)