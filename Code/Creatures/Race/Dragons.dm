mob/Monsters/Dragon
	icon = 'dragons.dmi'
	icon_state = "black"
	density = 1
	weightmax = 200
	Race = "Dragon"
	Age=0
	HP = 300
	MAXHP = 300
	Carn = 1
	BloodContent = 300
	MaxBloodContent = 300
	ArmourSkill = 20
	SwordSkill = 20
	SneakingSkill = 0
	Delay = 4
	ImmuneToTemperature = 1
	ImmunePoison = 1
	HoldingWeapon = "Claws"
	UsesEquipment=0
	ButcherySkill = 5
	UnArmedSkill = 30
	HasLeftEye = 1
	FishingSkill = 25
	HasWings = 1
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
	OrganMaxHP = 150
	DieAge = 15000
	WeaponDamageMin = 15
	WeaponDamageMax = 20
	Defence = 75
	New(LOC,GENDER=prob(50))
		usr.Strength = rand(15,20)
		usr.Agility = rand(10,15)
		if(GENDER)
			Gender="Male"
			Strength += 10
			Agility += 10
		else Gender="Female"
		StartAllProcs()
		..()
		var/image/I = new('mob.dmi',src)
		src.Star = I
	NPCDragon
		ReturnDelay = 400
		CanBeSlaved = 1
		SneakingSkill = 20
		Owner = "{NPC Dragons}"
		name = "{NPC Dragons} Dragon"
		EXP=5000
		New()
			StayLocal()
			ClawSkill+=50
			..()
		Fire
			name = "{NPC Dragons} Fire Dragon"
			FirePoints=1001
		Ice
			name = "{NPC Dragons} Snow Dragon"
			IcePoints=1001
		Poison
			name = "{NPC Dragons} Swamp Dragon"
			PoisonPoints=1001
mob/proc/DragonLayEgg(COST=1) //Cost is how much Egg Content you need to lay a dragon.
	if(EggContent>=COST)
		if(ismob(Owner))
			var/mob/OWNER=Owner
			var/DRAGONS
			for(var/mob/M in OWNER.UnitList) if(M.Race=="Dragon"||M.icon_state=="Dragon") DRAGONS+=1
			if(DRAGONS>=20)
				OWNER << "You have too many dragons, you can only control 20."
				return
		EggContent-=COST
		var/mob/Monsters/Egg/E = new(loc)
		E.icon_state="Dragon"
		E.ChangeOwnership(Owner)
		E.Breeding(src,src,3600)
		E.CHILDTYPE=/mob/Monsters/Dragon/
		return(1)
	else Owner << "[src] needs [COST-EggContent] more egg content to lay an egg."
mob/proc/CheckDragonElement()
	if(SubRace==null)
		if(Unholy)
			SubRace = "Unholy"
			ImmuneToMagic = 1
			if(Flying) icon_state = "flyingdark"
			else icon_state = "dark"
			Owner << "[src] has become an dark drake (Gains immunity to magic, disease, and the ability to brainwash units!)."
			return
		if(Shielded)
			SubRace = "Holy"
			ImmuneToMagic = 1
			if(Flying) icon_state = "flyinggold"
			else icon_state = "gold"
			Owner << "[src] has become an holy drake (Gains immunity to magic, disease, and the ability to heal units!)."
			return
		if(MagmaPoints >= 1000)
			SubRace = "Magma"
			if(Flying) icon_state = "flyingred2"
			else icon_state = "red2"
			Owner << "[src] has become an magma drake (Gains magma spit & magic immmunity & more damage.)."
			WeaponDamageMin += 10
			WeaponDamageMax += 15
			ImmuneToMagic = 1
			return
		if(ZombiePoints >= 1000)
			SubRace = "Zombie"
			Undead = 1
			ImmuneToDevourer = 1
			ImmuneToVampire = 1
			if(Flying) icon_state = "flyingzombie"
			else icon_state = "zombie"
			Owner << "[src] has become an zombie drake (Gains diseased breath & disease immmunity.)."
			return
		if(IcePoints >= 1000)
			SubRace = "Ice"
			if(Flying) icon_state = "flyingice"
			else icon_state = "ice"
			Owner << "[src] has become an ice drake (Gains ice breath & more defence)."
			Defence += 40
			return
		if(FirePoints >= 1000)
			SubRace = "Fire"
			if(Flying) icon_state = "flyingred"
			else icon_state = "red"
			Owner << "[src] has become an fire drake (Gains fire breath & more speed.)."
			Delay -= 1
			return
		if(SandPoints >= 1000)
			SubRace = "Desert"
			if(Flying) icon_state = "flyingsand"
			else icon_state = "sand"
			Owner << "[src] has become an sand drake (Gains entomb & more speed.)."
			Delay -= 1
			return
		if(PoisonPoints >= 1000)
			SubRace = "Poison"
			if(Flying) icon_state = "flyinggreen"
			else icon_state = "green"
			Owner << "[src] has become an poison drake (Gains poison spit & fangs.)."
			HasGland = 1
			PoisonDMG += 30
			return
		if(WaterPoints >= 1000)
			SubRace = "Water"
			Delay -= 1
			if(Flying) icon_state = "flyingblue"
			else icon_state = "blue"
			Owner << "[src] has become an water drake (Gains immunity to disease, faster movement, and the ability to spit water!)."
			return
mob/proc/BrainWashing() if(src.Wagon == 0)
	for(var/Player/M in world) if(M == src.BrainWasher)
		Deselect()
		src.Owner = M
		spawn(500)
			Deselect()
			M << "The brainwashing has worn off of [src]."
			for(var/Player/M2 in world) if(M2 == src.PreviousOwner)
				src.Owner = M2
				M2 << "The brainwashing has worn off of [src]."
				break
			src.BrainWasher = null
			src.PreviousOwner = null
		break
mob/proc/Slowdown()
	if(src.Wagon == 0)
		src.Delay += 4
		src.overlays += .obj/frozen/
		spawn(500)
			src.Delay -= 4
			src.overlays -= .obj/frozen/
			src.Owner << "Ice Effect has worn off."
mob/proc/DragonBreath(mob/TARGET) //Target is unrequired for Magma/Water Dragons.
	var/ALLOWED=0
	if(TARGET)
		if(TARGET in oview(5,src))
			ALLOWED=1
			dir=get_dir(src,TARGET)
		else if(TARGET != destination) TARGET=null
	if(!TARGET) if(ismob(destination)) if(destination in oview(src,5)) return(DragonBreath(destination))
	if(SubRace=="Magma"||SubRace=="Water") if(ALLOWED!=1)
		ALLOWED=1
		TARGET=null
	if(ALLOWED)
		if(CoolDown("DragonBreath",200))
			switch(SubRace)
				if("Ice")
					view(src) << "[src] breaths a cone of cold at [TARGET] slowing their movements!!"
					TARGET.Slowdown()
					TARGET.Coldness += Level
					if(prob(Level))
						TARGET.LeftArmHP -= Level+20
						TARGET.RightArmHP -= Level+20
						TARGET.LeftLegHP -= Level+20
						TARGET.RightLegHP -= Level+20
						if(TARGET.LeftArmHP <= 0) TARGET.HasLeftArm = 0
						if(TARGET.RightArmHP <= 0) TARGET.HasRightArm = 0
						if(TARGET.LeftLegHP <= 0) TARGET.HasLeftLeg = 0
						if(TARGET.RightLegHP <= 0) TARGET.HasRightLeg = 0
						TARGET.LimbLoss()
						view(TARGET) << "[TARGET] is frostbitten by the icy breath of [src]."
				if("Fire")
					view(src) << "[src] spews a gout of flame at [TARGET]"
					if(prob(Level)) TARGET.Fire()
					else
						TARGET.Coldness -= 25 //Why was that cooling them before..?
						TARGET.BloodContent -= 10
						TARGET.BloodLoss()
				if("Desert")
					view(src) << "[src] spits a flurry of sand particles at [TARGET] blinding them temporarily!!"
					TARGET.CanSee = 0
					spawn(300)
						TARGET.CanSee = 1
						TARGET.Owner << "[TARGET] can see again."
					return
				if("Poison")
					view(src) << "[src] vomits a spray of poison at [TARGET]!!"
					TARGET.BloodContent -= Level
					TARGET.BloodLoss()
				if("Magma")
					if(x==1||y==1||x==1000||y==1000)return
					view(src) << "[src] sends a torrent of lava from their mouth to the ground around them forming a small pool of lava."
					var/mob/Test/T=new()
					T.loc=src.loc
					step(T,turn(dir,-90))
					FloodLocation(T.x,T.y,T.z,"Lava")
					step(T,dir)
					FloodLocation(T.x,T.y,T.z,"Lava")
					step(T,turn(dir,90))
					FloodLocation(T.x,T.y,T.z,"Lava")
					step(T,turn(dir,90))
					FloodLocation(T.x,T.y,T.z,"Lava")
					del(T)
				if("Zombie")
					view(src) << "[src] breaths a misty cloud of diseased gas at [TARGET]!!"
					if(prob(Level/4)&&TARGET.Infects==0&&TARGET.Undead==0&&TARGET.Race!="Gargoyle"&&TARGET.ImmuneToDevourer==0)
						Owner << "<font color = teal>[src] Infects [TARGET]!"
						TARGET.Infection(Owner)
					else Owner << "<b><font color = silver>[TARGET] is not infected."
				if("Water")
					if(x==1||y==1||x==1000||y==1000)return
					view(src) << "[src] spits a gush of water from their left to right onto the ground around themself forming a small pond."
					var/mob/Test/T=new()
					T.loc=src.loc
					step(T,turn(dir,-90))
					FloodLocation(T.x,T.y,T.z,"Water")
					step(T,dir)
					FloodLocation(T.x,T.y,T.z,"Water")
					step(T,turn(dir,90))
					FloodLocation(T.x,T.y,T.z,"Water")
					step(T,turn(dir,90))
					FloodLocation(T.x,T.y,T.z,"Water")
					del(T)
				if("Unholy")
					var/Resist=prob((Level*2) - (TARGET.Level*2))
					if(Shielded||BrainWasher) Resist = 0
					if(Resist)
						view(src) << "[src] spits an orb of darkness at [TARGET] brainwashing them temporarily!!"
						TARGET.BrainWasher = Owner
						TARGET.PreviousOwner = TARGET.Owner
						TARGET.BrainWashing()
					else view(src) << "[src] spits an orb of darkness at [TARGET] but they resist!!"
				if("Holy")
					view(src) << "[src] breaths a cone of warm glowing light at [TARGET]."
					TARGET.HealSlow()
				else
					view(src) << "[src] spits a hail of spiritual needles at [TARGET] doing minor damage!!"
					TARGET.LeftArmHP -= 5
					TARGET.RightArmHP -= 5
					TARGET.BloodContent -= 5
					TARGET.BloodLoss()
		else view(src) << "[src] attempts to use their dragon breath but is unable to as they have just recently used it."
proc/FloodLocation(X,Y,Z,TYPE="Water") //Tests if the cords could be flooded with liquid, and then fills with "Water" or "Lava".
	var/turf/LIQUID=locate(X,Y,Z)
	if(LIQUID) if(LIQUID.density==0)
		switch(TYPE)
			if("Water") new/turf/grounds/waters/water(locate(X,Y,Z))
			if("Lava") new/turf/grounds/lavas/lava(locate(X,Y,Z))
mob/proc/HealSlow()
	if(src.Undead == 0)
		src.HealNumber += 1
		src.Teeth = "Healing"
		src.TeethHP += 1
		src.LeftArm = "Healing"
		src.RightArm = "Healing"
		src.LeftLeg = "Healing"
		src.RightLeg = "Healing"
		src.RightLegHP += 1
		src.LeftLegHP += 1
		src.LeftArmHP += 1
		src.RightArmHP += 1
		src.CanSee = 1
		if(src.BloodContent<src.MaxBloodContent) src.BloodContent += 5
		src.BleedType = null
		if(src.LeftLegHP >= 10)
			src.HasLeftLeg = 1
			src.CanWalk = 1
			src.LeftLeg = "Good"
		if(src.RightLegHP >= 10)
			src.HasRightLeg = 1
			src.CanWalk = 1
			src.RightLeg = "Good"
		if(src.LeftArmHP >= 10)
			src.HasLeftArm = 1
			src.CanUseLeftArm = 1
			src.LeftArm = "Good"
		if(src.RightArmHP >= 10)
			src.HasRightArm = 1
			src.CanUseRightArm = 1
			src.RightArm = "Good"
		if(src.TeethHP >= 10)
			src.HasTeeth = 1
		src.LimbLoss()
		if(src.HealNumber >= 10)
			src.HealNumber = 0
			return
		else
			spawn(50)
				src.HealSlow()
	else
		src.HealNumber += 1
		src.Teeth = "Damaging"
		src.TeethHP -= 1
		src.LeftArm = "Damaging"
		src.RightArm = "Damaging"
		src.LeftLeg = "Damaging"
		src.RightLeg = "Damaging"
		src.RightLegHP -= 1
		src.LeftLegHP -= 1
		src.LeftArmHP -= 1
		src.RightArmHP -= 1
		src.BloodContent -= 5
		src.HP -= 5
		if(src.HP <= 0)
			src.GoingToDie = 1
			src.Killer = "Holy Breath"
			src.DeathType = "being slowly melted by holy energy"
			src.Death()
			return
		if(src.Race!="Devourer")
			if(src.LeftLegHP <= 10)
				src.HasLeftLeg = 0
				src.CanWalk = 0
				src.LeftLeg = "Destroyed"
			if(src.RightLegHP <= 10)
				src.HasRightLeg = 0
				src.CanWalk = 0
				src.RightLeg = "Destroyed"
		if(src.LeftArmHP <= 10)
			src.HasLeftArm = 0
			src.CanUseLeftArm = 0
			src.LeftArm = "Destroyed"
		if(src.RightArmHP <= 10)
			src.HasRightArm = 0
			src.CanUseRightArm = 0
			src.RightArm = "Destroyed"
		if(src.TeethHP <= 10)
			src.HasTeeth = 0
			src.Teeth = "Destroyed"
		src.LimbLoss()
		if(src.HealNumber >= 10)
			src.HealNumber = 0
			return
		else
			spawn(50)
				src.HealSlow()