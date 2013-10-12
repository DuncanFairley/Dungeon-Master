atom/movable/var
	WebContent = 0
	MaxWebContent = 0
mob/Monsters
	Spider
		UnArmedSkill = 1
		ArmourSkill = 20
		FishingSkill = 25
		PoisonSkill = 55
		ButcherySkill = 10
		UnArmedSkill = 35
		icon = 'SpiderWarriorYoung.dmi'
		icon_state = "Normal"
		Race = "Spider"
		SubRace = "Warrior"
		Gender = "Male"
		HoldingWeapon = "Claws"
		ImmunePoison = 1
		Delay = 3
		Age=1
		HP = 220
		MAXHP = 220
		WoodCraftingSkill = 25
		SneakingSkill = 60
		weightmax = 100
		density = 1
		Carn = 1
		BloodContent = 320
		MaxBloodContent = 320
		UsesEquipment=0
		HasLeftEye = 1
		HasRightEye = 1
		HasRightLung  = 1
		HasLeftLung  = 1
		HasSpleen  = 1
		HasTeeth  = 1
		HasLeftArm  = 1
		HasRightArm = 1
		HasLeftLeg = 1
		HasRightLeg = 1
		HasHead = 1
		HasLeftEar = 1
		HasRightEar = 1
		HasGuts = 1
		HasStomach = 1
		HasLeftKidney = 1
		HasRightKidney = 1
		HasLiver = 1
		HasBrain = 1
		HasHeart = 1
		HasThroat = 1
		HasNose = 1
		OrganMaxHP = 85
		CliffClimber=1
		New()
			usr.Strength = rand(15,20)
			usr.Agility = rand(15,20)
			usr.Defence = rand(25,35)
			usr.DieAge = rand(1300,1500)
			StartAllProcs()
			..()
			var/image/I = new('mob.dmi',src)
			src.Star = I
		Queen
			icon = 'SpiderQueenYoung.dmi'
			SubRace = "Queen"
			Gender = "Female"
			Age=20
			SneakingSkill = 65
			ArmourSkill = 25
		Worker
			icon = 'SpiderWorkerYoung.dmi'
			SubRace = "Worker"
			Gender = "Female"
		Hunter
			icon = 'SpiderHunterYoung.dmi'
			SubRace = "Hunter"
			Gender = "Male"
			SneakingSkill = 90
		Warrior
			icon = 'SpiderWarriorYoung.dmi'
			icon_state = "Normal"
			Race = "Spider"
			SubRace = "Warrior"
			Gender = "Male"
mob/proc/SpiderChooseEgg() //For manual egg creation. Eventually I want this to be replaced with direct HUD options.
	if(Age<24)
		Owner << "[src] needs to be at least 24 before she can lay eggs."
		return
	var/mob/A = Owner
	var/SPIDERS=0
	if(WebContent>=50)
		var/list/CHOICES=new()
		if(SubRace=="Queen")
			CHOICES+="Warrior"
			CHOICES+="Hunter"
			CHOICES+="Worker"
//		if(SubRace=="Worker")
//			CHOICES+="Queen"
		CHOICES+="Cancel"
		var/EGGTYPE=input(Owner,"Choose an Egg to lay.","Egg Laying") in CHOICES
		if(A)
			for(var/mob/M in A.UnitList) if(M.Race=="Spider"||M.icon_state=="Spider") SPIDERS+=1
			if(SPIDERS>Level/2)
				A << "[src] has too many spiders, she is limited to controlling half her level ([Level/2]) in spiders."
				return
		if(EGGTYPE!="Cancel"&&WebContent>=50)
			WebContent-=50
			SpiderLayEgg(EGGTYPE)
	else Owner << "[src] needs at least 50 web content to lay an egg."
mob/proc/SpiderLayEgg(TYPE) //Just look at 'Breeding.dm' for info on what exactly happens.
	var/mob/Monsters/Egg/E = new(loc)
	E.icon_state="Spider"
	E.ChangeOwnership(Owner)
	E.Breeding(src,src,1800) //Breeding Spawns, giving us a chance to change a few details on the child's result.
	E.CHILDTYPE = text2path("/mob/Monsters/Spider/[TYPE]")
	return(1)
mob/proc/SpiderAgeGains() if(Race=="Spider") //From Scratch! :D Outside of maybe the messages.
	var
		POISON_UP
		SILK_UP
		DAMAGE_UP_MIN //Generally, sharpness of claws? Meh logic doesn't matter.
		DAMAGE_UP_MAX //These two vars are also currently unused, they're just here to remind me to impliment them.
		DEFENCE_UP
	DAMAGE_UP_MIN = DAMAGE_UP_MIN
	DAMAGE_UP_MAX = DAMAGE_UP_MAX
	switch(SubRace)
		if("Queen")
			POISON_UP=1
			SILK_UP=15
			DAMAGE_UP_MIN=0
			DAMAGE_UP_MAX=0
			DEFENCE_UP=5
		if("Warrior")
			POISON_UP=1
			SILK_UP=0
			DAMAGE_UP_MIN=0
			DAMAGE_UP_MAX=0
			DEFENCE_UP=6
		if("Hunter")
			POISON_UP=2
			SILK_UP=1
			DAMAGE_UP_MIN=0
			DAMAGE_UP_MAX=0
			DEFENCE_UP=2.5
		if("Worker")
			POISON_UP=0.3
			SILK_UP=5
			DAMAGE_UP_MIN=0
			DAMAGE_UP_MAX=0
			DEFENCE_UP=0.5
	var/AGE=Age-1
	if(SubRace=="Queen") AGE-=19
	switch(AGE)
		if(1) if(SILK_UP)
			Owner << "<b><font color=purple>[src] grows a silk gland! It will improve by [SILK_UP] points every year."
			WebContent+=SILK_UP*5
			MaxWebContent+=SILK_UP*5
			WebContent+=25
			MaxWebContent+=25
		if(2) if(DEFENCE_UP)
			Owner << "<b><font color=purple>[src] has grown a layer of chitinous armour! It will improve by [DEFENCE_UP] points every year."
			Defence+=DEFENCE_UP*5
		if(3) if(POISON_UP)
			Owner << "<b><font color=purple>[src] grows a posion gland! It will improve by [POISON_UP] points every year."
			PoisonDMG+=POISON_UP*5
			HasGland = 1
	if(AGE>1) if(SILK_UP)
		WebContent+=SILK_UP
		MaxWebContent+=SILK_UP
	if(AGE>2) if(DEFENCE_UP) Defence+=DEFENCE_UP
	if(AGE>3) if(POISON_UP) PoisonDMG+=POISON_UP
	if(AGE==4)
		Strength+=5
		Agility+=5
		Owner << "<b><font color=purple>[src] has grown!"
		switch(SubRace)
			if("Warrior") icon='SpiderWarriorOlder.dmi'
			if("Hunter") icon='SpiderHunterOlder.dmi'
			if("Worker") icon='SpiderWorkerOlder.dmi'
			if("Queen")
				Owner << "<b><font color=purple>[src] grows an egg sack!"
				icon = 'SpiderQueenOlder.dmi'
	if(SubRace=="Queen") if(AGE==9) Owner << "<b><font color=purple>[src]'s organs have matured enough so that she may breed."
	switch(SubRace)
		if("Queen")
			if(PoisonDMG>95) PoisonDMG=95
			if(Defence>130) Defence=130
		if("Warrior")
			if(PoisonDMG>30) PoisonDMG=30
			if(Defence>100) Defence=100
		if("Hunter")
			if(PoisonDMG>80) PoisonDMG=80
			if(Defence>70) Defence=70
		if("Worker")
			if(PoisonDMG>30) PoisonDMG=30
			if(Defence>60) Defence=60