mob/Monsters/Egg //Probably should make this a sub-type of critter..
	Race="Egg"
	SubRace="Blooded"
	icon='Eggs.dmi'
	icon_state="Lizardman"
	Egg=1
	HumanParts = 0
	Age=0
	DieAge=999
mob/var
	tmp //Reason it's temp is so as to evade saving duplicates of particular units and to not have breeding details carry in saves.
		mob //Reason these two are named "MALE" and "FEMALE" rather than FutureFather/Mother, is simply to keep em close to the vars used in "BreedWith()"
			CHILDMALE //Doubles as a "IsPregnent" var by use of "if(CHILDMALE)"
			CHILDFEMALE //This is mostly used for eggs, but having it in the code allows for complicated things like having someone have someone elses kid or something.
		CHILDTYPE //This holds the actual type value that the child will be. In most cases equal to FEMALE's racetype durring births, but needs to be set for eggs.
		CHILDCOUNT //This holds the ammount of children that will be created upon "GiveBirth()".
mob/proc/BreedWith(mob/TARGET,ALLOWED) spawn() //Don't want to lock up our callers on sleeps, so we spawn, that means no return values.
	//Notably, setting "ALLOWED" is used to just skip asking for permission if your owners aren't the same.
	var/mob/MALE
	var/mob/FEMALE
	if(Gender=="Male" && TARGET.Gender=="Female")
		MALE=src
		FEMALE=TARGET
	if(TARGET.Gender=="Male" && Gender=="Female")
		MALE=TARGET
		FEMALE=src
	switch(MALE.Race) if("Vampire","Dragon","Svartalfar") return
	switch(FEMALE.Race) if("Vampire","Dragon","Svartalfar") return
	if(MALE.Critter) if(!FEMALE.Critter) return
	if(FEMALE.Critter) if(!MALE.Critter) return
	if(MALE&&FEMALE)
		if(FEMALE.CHILDMALE||FEMALE.CHILDFEMALE) return
		if(MALE.Owner==FEMALE.Owner) ALLOWED=1
		else if(!ALLOWED)
			if(ismob(TARGET.Owner)) if(alert(TARGET.Owner, "[Owner] is asking to breed [src] with [TARGET]", "Choose", "Yes", "No", null)=="Yes") ALLOWED=1
			else return //No more breeding with NPCs randomly in combat, reason there's an else case is just so I can remember to add in something later here.
		if(ALLOWED) if(MALE in view(1,FEMALE))
			if(!MALE.Critter) //No need to evaluate the female's critter part, cuz they'll always be the same if you reach this point.
				if(MALE.Age<5||MALE.Age>100) //This ended up being more code than I expected just to tell both sides that a side isn't of age to breed.
					MALE.Owner<<"[MALE] isn't of age to breed!"
					if(MALE.Owner!=FEMALE.Owner) FEMALE.Owner<<"[MALE] isn't of age to breed!"
					return
				if(FEMALE.Age<5||FEMALE.Age>100)
					MALE.Owner<<"[FEMALE] isn't of age to breed!"
					if(MALE.Owner!=FEMALE.Owner) FEMALE.Owner<<"[FEMALE] isn't of age to breed!"
					return
			switch(FEMALE.Race)
				if("Spider")
					if(FEMALE.CanBreed == 0 && FEMALE.SubRace=="Queen") if(Age>=29) //Should really use a diffrent var.. maybe just go on icon? Deal with it when I finish breeding off.
						FEMALE.Owner << "<b><font color=purple>[FEMALE]'s egg sack begins to swell she may now create a lair!"
						FEMALE.icon = 'SpiderQueenMature.dmi'
						FEMALE.MaxWebContent += 100
						FEMALE.WebContent = FEMALE.MaxWebContent
						FEMALE.CanBreed = 1
					return
				if("Lizardman")
					if(FEMALE.CoolDown("LizardEgg",4200)) //The perent shares a cooldown with the hatch time of the egg. She isn't really connected to it. (Though it's connected to her slightly)
						var/mob/Monsters/Egg/E = new(FEMALE.loc) //Makes a Egg at their location.
						E.icon_state="Lizardman"
						E.ChangeOwnership(FEMALE.Owner) //For now the Female always gets ownership.
						E.Breeding(MALE,FEMALE,4200) //The new Egg is the src.
						FEMALE.RebuildOverlays() //Due to recent var changes, the P will show up after refreshing.
						spawn(4201) FEMALE.RebuildOverlays() //After 4200 vars will have reverted.
					else
						FEMALE.Owner << "[FEMALE.Owner] is still recovering from the last egg she layed."
				else FEMALE.Breeding(MALE,FEMALE) //FEMALE is both src, and an argument in traditional cases.
mob/proc/Breeding(mob/MALE,mob/FEMALE,TIME=3000) //src is the one having the kid, the arguments are just for setting statistics.
	var/WasSet //Quick little var to fix up some buggyness.
	if(!FEMALE)
		WasSet=1
		FEMALE=src //To stop any crashes of the proc that can cause src to bug up we set female to src if there isn't one.
	if(CHILDMALE||CHILDFEMALE) return //This is the only "rule" in this proc, meaning you can get anything, even males preg if you really wanted by calling this proc directly.
	CHILDMALE=MALE //Durring birth this will be set to CHILDFEMALE if null.
	CHILDFEMALE=FEMALE //Durring birth this will be set to CHILDMALE if null.
	CHILDCOUNT=1 //Number to create upon giving birth()
	CHILDTYPE=text2path("/mob/Monsters/[FEMALE.Race]")
	if(FEMALE.Critter) CHILDTYPE=text2path("/mob/Monsters/Critters/[FEMALE.Race]")
	if(FEMALE) switch(FEMALE.Race) //Race of FEMALE, not src.
		if("Kobold")
			CHILDCOUNT=2
			TIME*=0.6
		if("Ratman")
			CHILDCOUNT=3
			TIME*=0.5
		if("Elf") TIME*=0.75
		if("Goblin") TIME*=0.75
		if("Orc") TIME*=0.9
		if("Human") TIME*=0.8
	if(Egg) if(FEMALE) switch(FEMALE.Race)
		if("Zombie","Devourer") view(FEMALE) << "[FEMALE] expells a putrid bag of rotting flesh and bones which promptly attaches itself to the nearest surface"
		else view(FEMALE) << "[FEMALE] lays an egg."
	else
		view(src) << "[src] is due to have a baby!"
		FEMALE.RebuildOverlays()
	if(WasSet) FEMALE=null //As a result we follow the old method of override.
//		RebuildOverlays() //Adding the Preg overlay.
	spawn(TIME) GiveBirth() //While spawning you have a chance to change child details as they're attatched to src rather than this proc.
mob/proc/GiveBirth() //Uses CHILDMALE and CHILDFEMALE rather than args, src is only used for deletion in the case of being an egg.
	//Added a few emergancy override details for if a perent is deleted. GiveBirth() will now still operate without CHILDMALE and CHILDFEMALE.
	if(CHILDMALE&&CHILDFEMALE==null) CHILDFEMALE=CHILDMALE
	if(CHILDMALE==null&&CHILDFEMALE) CHILDMALE=CHILDFEMALE
	if(CHILDTYPE) while(CHILDCOUNT>0)
		CHILDCOUNT-=1
		var/mob/Monsters/CHILD = new CHILDTYPE(loc) //Creates a new creature of the type in "CHILDTYPE" var at src's location.
		//Gender is handeled by the New() proc on the type, so none of that is required here.
		var/mob/FATHER=CHILDMALE //Part of the override.
		var/mob/MOTHER=CHILDFEMALE //Part of the override.
		if(FATHER==null&&MOTHER==null) //This isn't going to end badly, based on the fact I'm not going to save perents to the child anymore.
			FATHER=CHILD
			MOTHER=CHILD

		//My gosh, knowing how to do the line below this one dramatically shrank the breed code. Just needa remember to come back here if we make any skill vars.
		for(var/T in list("Spear","Bow","Sword","Axe","Mace","UnArmed","Shield","Armour","WoodCrafting","MetalCrafting","Skinning","Building","JewlCrafting","Butchery","LeatherCrafting","Poison","BoneCrafting","StoneCrafting","Sneaking","LockPicking","Cooking","Fishing","Potion")) CHILD.vars["[T]Skill"]+=FATHER.vars["[T]Skill"]/6+MOTHER.vars["[T]Skill"]/6
		CHILD.ChangeOwnership(Owner) //Sets CHILD's Owner var to the same Owner as src. Regardless of who the true perents are currently controlled by.
		CHILD.Age=0
		CHILD.CanBeCaged=MOTHER.CanBeCaged
		CHILD.name = "{[Owner]} [CHILD.Race]"
	//	if(Event("Shooting Star",-1)) if(!CHILD.Critter)
		switch(CHILD.Race)
			if("Human") CHILD.MagicalAptitude=prob(10)
			if("Elf") CHILD.MagicalAptitude=prob(12)
			if("Goblin") CHILD.MagicalAptitude=prob(7)
			if("Spider") CHILD.MagicalAptitude=prob(0.5)
			if("Dragon") CHILD.MagicalAptitude=prob(1)
			if("Zombie")
				CHILD.MagicalAptitude=prob(1)
				for(var/obj/G in src) G.loc = CHILD
				CHILD.ApplyOrgans()
			if("Ratman","Kobold") CHILD.MagicalAptitude=prob(2)
			else CHILD.MagicalAptitude=prob(3)
		if(CHILD.MagicalAptitude) CHILD.Owner<<"[CHILD] has been born with a connection to magical forces! (To use magic, use the interact menu)"
		CHILD.PillarPowerup()
	if(Egg)
		Owner << "[src] hatched!"
		del(src) //Yup, if you give someone a non-zero value in egg, and then breed with em, they'll delete on births.
	else //This else case is technecally unneeded, being when you delete src it ends the proc. But I'll keep it just for fun.
		Owner << "[src] has given birth!"
		CHILDMALE=null
		CHILDFEMALE=null
		CHILDTYPE=null
		CHILDCOUNT=null
		RebuildOverlays()
mob/proc/ApplyOrgans()
	for(var/obj/Items/Shafts/EngineeredOrgan/E in src)
		switch(E.Content2)
			if("Strength")
				Strength += 10
				WeaponDamageMin += 1
				WeaponDamageMax += 2
				weightmax += 20
			if("Agility")
				Agility += 10
				Delay -= 0.2
			if("Intelligence")
				Intelligence += 1
				EXPNeeded -= 50
			if("Resistance")
				ImmuneToMagic = 1
				ImmuneToTemperature = 1
				Defence += 1
			if("Toughness")
				Defence += 4
			if("Climbing")
				CliffClimber += 1
				Agility += 5
			if("Acid") BloodAcidity += 6
			if("Claws")
				HoldingWeapon = "Claws"
				WeaponDamageMin += 7
				WeaponDamageMax += 9
		del(E)
	if(Intelligence>10)
		EXPNeeded = -150
		Intelligence = 10
	if(BloodAcidity>30) BloodAcidity=30
	if(HoldingWeapon=="Claws") if(WeaponDamageMin>35)
		WeaponDamageMin = 35
		WeaponDamageMax = 45
	else if(WeaponDamageMin>5)
		WeaponDamageMin=5
		WeaponDamageMax=10
	if(Strength>60)
		Strength=60
		weightmax=200
	if(Agility>60+(5*CliffClimber)) Agility=60+(5*CliffClimber)
	if(Delay<3) Delay=3
	if(ImmuneToTemperature) if(Defence>25) Defence=25
	else if(Defence>20) Defence = 20