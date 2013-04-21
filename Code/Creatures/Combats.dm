atom/movable/proc/Fling(DIR=pick(NORTH,SOUTH,WEST,EAST,SOUTHEAST,SOUTHWEST,NORTHEAST,NORTHWEST),DIST=2,BLEED=0)
	dir=DIR
	if(BLEED)
		var/obj/Bloods/Blood5/B = new(loc)
		B.dir = dir
	spawn()
		for(var/PRO=0,PRO<DIST,PRO++) if(isturf(loc))
			step(src,dir)
			sleep(2)
			if(BLEED&&PRO+1!=DIST)
				var/obj/Bloods/Blood5/B2 = new(loc)
				B2.dir = dir
		if(istype(src,/obj/Items/Equipment/)) dir=SOUTH
mob/proc/LimbFling(NAME) if(!Fling)
	var/obj/Items/Bones/BloodyLimb/A = new(loc)
	A.name = "[src]'s [NAME]"
	A.Fling(DIST=2,BLEED=prob(50))
mob/proc/BleedingPropell() if(!Fling)
	dir = pick(NORTH,SOUTH,WEST,EAST)
	var/obj/Bloods/Blood/B = new(loc)
	B.dir = dir
	step(src,dir)
	spawn(1)
		var/obj/Bloods/Blood/B2 = new(loc)
		B2.dir = dir
		step(src,dir)
		spawn(1)
			var/obj/Bloods/Blood/B3 = new(loc)
			B3.dir = dir
			step(src,dir)
			var/obj/Bloods/Blood/B4 = new(loc)
			B4.dir = dir

mob/proc/LimbLoss()
	switch(Race)
		if("Devourer","Dragon","Spider") return
		else if(!CantLoseLimbs)
			if(!HasLeftArm) icon_state = "NoLeftArm"
			if(!HasRightArm) icon_state = "NoRightArm"
			if(!HasLeftLeg) icon_state = "NoLeftLeg"
			if(!HasRightLeg) icon_state = "NoRightLeg"
			if(!HasRightArm&&!HasLeftArm) icon_state = "NoArms"
			if(!HasRightLeg&&!HasLeftLeg)icon_state = "NoLegs"
			if(!HasRightLeg&&!HasLeftArm) icon_state = "NoRightLegNoLeftArm"
			if(!HasLeftLeg&&!HasRightArm)icon_state = "NoLeftLegNoRightArm"
			if(!HasRightLeg&&!HasRightArm)icon_state = "NoRightArmNoRightLeg"
			if(!HasLeftLeg&&!HasLeftArm)icon_state = "NoLeftArmNoLeftLeg"
			if(!HasRightLeg&&!HasLeftLeg&&!HasRightArm) icon_state = "NoLegsNoRightArm"
			if(!HasRightLeg&&!HasLeftLeg&&!HasLeftArm) icon_state = "NoLegsNoLeftArm"
			if(!HasRightLeg&&!HasRightArm&&!HasLeftArm) icon_state = "NoArmsNoRightLeg"
			if(!HasLeftLeg&&!HasRightArm&&!HasLeftArm) icon_state = "NoArmsNoLeftLeg"
			if(!HasLeftLeg&&!HasRightArm&&!HasLeftArm&&!HasRightLeg)
				icon_state = "None"
				switch(Race)
					if("Gargoyle")
						GoingToDie = 1
						DeathType = "Smashed"
						Owner << "<b><font color=red>[src] is smashed into a greyish powder!!!"
						Death()
					if("Skeleton")
						GoingToDie = 1
						DeathType = "Crumbled into Bonemeal"
						Owner << "<b><font color=red>[src] crumbles into a white bonemeal!!!"
						Death()
			if(HasLeftLeg&&HasRightArm&&HasLeftArm&&HasRightLeg) icon_state = "Normal"
mob/proc/BloodLoss() if(src.Race != "Gargoyle" && Race != "Skeleton")
	for(var/mob/Monsters/M in range(2,src))
		if(M.destination == src)
			if(M.HoldingWeapon == "Dagger" && M.DaggerSkill >= 125)
				src.SaidBleed = 1
	if(src.SaidBleed == 0)
		src.SaidBleed = 1
		src.Owner << "<b><font color=red>[src] is bleeding!!"
	if(src.BloodContent <= 300) src.BleedType = "Very Mildly"
	if(src.BloodContent <= 260) src.BleedType = "Mildly"
	if(src.BloodContent <= 130) src.BleedType = "Badly"
	if(src.BloodContent <= 90) src.BleedType = "Very Badly"
	if(src.BloodContent <= 20) src.BleedType = "Extremly"
mob/proc/DamageType(MULTI=1,MAX=150)
	if(Race=="Human")
		MULTI*=1.25
		MAX=200
	if(IsRoyal)
		MAX+=25
	var/SKILLEXP = MULTI*0.04
	switch(HoldingWeapon)
		if("Bow","Mace")
			src.DamageType = "Blunt"
			src.MaceSkill += SKILLEXP
			src.SkillDMG = src.MaceSkill / 4
			if(src.MaceSkill > MAX) src.MaceSkill = MAX
		if("Butcher Knife")
			src.DamageType = "Slashing"
			src.ButcherySkill += SKILLEXP
			src.SkillDMG = src.ButcherySkill / 4
			if(src.ButcherySkill > MAX) src.ButcherySkill = MAX
		if("Sword")
			src.DamageType = "Slashing"
			src.SwordSkill += SKILLEXP
			src.SkillDMG = src.SwordSkill / 4
			if(src.SwordSkill > MAX) src.SwordSkill = MAX
		if("Claws")
			src.DamageType = "Slashing"
			src.ClawSkill += SKILLEXP
			if(src.Race != "Spider") src.SkillDMG = src.ClawSkill / 4
			else src.SkillDMG = src.ClawSkill / 15
			if(src.ClawSkill > MAX) src.ClawSkill = MAX
		if("Dagger")
			src.DamageType = "Slashing"
			src.DaggerSkill += SKILLEXP
			src.SkillDMG = src.DaggerSkill / 4
			if(src.DaggerSkill > MAX) src.DaggerSkill = MAX
		if("Axe")
			src.DamageType = "Slashing"
			src.AxeSkill += SKILLEXP
			src.SkillDMG = src.AxeSkill / 4
			if(src.AxeSkill > MAX) src.AxeSkill = MAX
		if("Spear")
			src.DamageType = "Slashing"
			src.SpearSkill += SKILLEXP
			src.SkillDMG = src.SpearSkill / 4
			if(src.SpearSkill > MAX) src.SpearSkill = MAX
		else
			switch(Race)
				if("Kobold","Vampire")
					src.DamageType = "Slashing"
					src.SkillDMG = src.UnArmedSkill / 3
				else
					src.DamageType = "Blunt"
					src.SkillDMG = src.UnArmedSkill / 3.5
			src.UnArmedSkill += SKILLEXP
			if(src.UnArmedSkill > MAX) src.UnArmedSkill = MAX


mob/proc/CheckDefence()
	for(var/mob/Monsters/M in oview(1,src))
		if(M == src.destination)
			if(src.HitHead == 1)
				if(M.WearingHelmet == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitHead = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						else if(M.Race == "Dwarf" && M.ArmourSkill <= 120)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitLeftArm == 1)
				if(M.WearingLeftArm == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLeftArm = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitRightArm == 1)
				if(M.WearingRightArm == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitRightArm = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitLeftLeg == 1)
				if(M.WearingLegs == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLeftLeg = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitRightLeg == 1)
				if(M.WearingLegs == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitRightLeg = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitLowerBody == 1)
				if(M.WearingChest == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLowerBody = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitUpperBody == 1)
				if(M.WearingChest == 1 || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitUpperBody = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/
			if(src.HitWings)
				if(M.WearingChest || !M.UsesEquipment)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitUpperBody = 0
						M.overlays += /obj/miss/
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
						spawn(10) if(M) M.overlays -= /obj/miss/

mob/proc/Combats(atom/movable/TARGET)
	if(HoldingWeapon=="Bow") return
	if(isobj(TARGET))
		var/obj/M=TARGET
		if(M == src.destination) if(M.HumanParts == 0) if(M.Wagon == 0)
			var/WepDMG = rand(src.WeaponDamageMin,src.WeaponDamageMax)
			var/Damage = WepDMG + src.Strength / 2 + src.SkillDMG
			M.HP -= Damage
			if(M.HP <= 0) del(M)
		return
	if(ismob(TARGET)) src.Attack(TARGET)
mob/proc/Attack(mob/Monsters/M)
	var/Faint
	var/Stun
	if(Owner == M.Owner) return
	if(Stunned || Fainted || M.WS || M.key) return
//	if(!CanSee) return
	src.HitHead = 0
	src.HitLeftArm = 0
	src.HitRightArm = 0
	src.HitLowerBody = 0
	src.HitUpperBody = 0
	src.HitLeftEar = 0
	src.HitRightEar = 0
	src.HitNose = 0
	src.HitTeeth = 0
	src.HitLeftEye = 0
	src.HitRightEye = 0
	src.HitBrain = 0
	src.HitSkull = 0
	src.HitThroat = 0
	src.HitSpleen = 0
	src.HitLeftLung = 0
	src.HitRightLung = 0
	src.HitHeart = 0
	src.HitLeftKidney = 0
	src.HitRightKidney = 0
	src.HitLiver = 0
	src.HitGuts = 0
	src.HitStomach = 0
	src.HitWings = 0
	src.GainEXP(3)
	src.DamageType()
	if(!M.HumanParts)
		if(!M.Wagon)
			M.HP -= rand(src.WeaponDamageMin,src.WeaponDamageMax) + Strength/2 + SkillDMG
			if(M.HP <= 0)
				M.GoingToDie = 1
				M.Death()
		return //Saves running an else case and having to indent.
	for(var/obj/Items/Equipment/Weapon/DemonicWeapons/DestructionSword/D in src) if(D.suffix == "(Equipped)") if(prob(0.5)) M.Fire()
	if(src.Race == "Vampire") if(M.WearingFullPlateHelm == 0 && M.Race!="Skeleton") VampireBite(M,85,0.5)
	if(M.HoldingWeapon && M.HoldingWeapon != "Dagger") if(src.HoldingWeapon && src.HoldingWeapon != "Dagger") src.FightSound()
	if(!HoldingWeapon) src.FightSound2()
	switch(HoldingWeapon)
		if("Butcher Knife") if(prob(ButcherySkill/60))
			var/obj/Items/Food/MEAT=M.MakeMeat()
			if(MEAT)
				MEAT.Fling(DIST=2,BLEED=1)
				view(M) << "[src] prematurely butchers [M]!"
				M.BloodContent -= round(ButcherySkill/15)
				M.BloodLoss()
		if("Axe") if(prob(AxeSkill/350)) for(var/obj/Items/Equipment/Armour/Shield/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S))
			view(M) << "[M]'s shield is broken by [src]'s axe blow!"
			del(S)
		if("Sword") if(M.Race!="Demon") if(prob(SwordSkill/350)) for(var/obj/Items/Equipment/Weapon/W in M) if(M.UnEquipItem(W)) if(M.DropItem(W))
			view(M) << "[M] is skillfully disarmed by [src]!"
			W.Fling()
		if("Mace") if(prob(MaceSkill/350)) for(var/obj/Items/Equipment/Armour/Helmet/W in M) if(UnEquipItem(W)) if(DropItem(W))
			view(M) << "[src] violently bashes [M] in the skull smashing their helmet!"
			M.BrainHP -= 1
			del(W)
		if("Spear","Claws","Dagger")
		else if(M.Race!="Demon") if(prob(UnArmedSkill/350)) for(var/obj/Items/Equipment/Weapon/W in M) if(M.UnEquipItem(W)) if(M.DropItem(W))
			view(M) << "[src] wrenches [M]'s weapon out of their hands!"
			if(PickUpItem(W)) EquipItem(W)
	if(M.Race=="Frogman") if(prob((M.Level/33)+1))
		if(!src.ImmunePoison)
			src.BloodContent -= M.Level/6
			src.BloodLoss()
			view(src) << "[M]'s skin poisons [src]"
		else
			src.BloodContent -= M.Level/12
			src.BloodLoss()
			view(src) << "[M]'s skin poisons [src] - 1/2 of the damage is resisted"
	if(HasGland) if(prob(3))
		if(!M.ImmunePoison)
			M.BloodContent -= src.PoisonDMG
			M.BloodLoss()
			view(src) << "[src]'s fangs poison [M]"
		else
			M.BloodContent -= src.PoisonDMG/2
			M.BloodLoss()
			view(src) << "[src]'s fangs poison [M] - 1/2 damage is resisted"
	for(var/obj/Items/Equipment/Weapon/W in src) if(W.suffix == "(Equipped)") if(W.Poisoned)
		var/HIT = prob(2)
		if(HoldingWeapon=="Dagger") HIT = prob(3)
		if(HIT)
			if(M.ImmunePoison)
				M.BloodContent -= W.PoisonDMG/2
				M.BloodLoss()
				view(src) << "[src]'s [W] poisons [M] - 1/2 damage is resisted"
			else
				M.BloodContent -= W.PoisonDMG
				M.BloodLoss()
				view(src) << "[src]'s [W] poisons [M]"
	var/Hit = prob(src.Agility)
	if(Hit == 0)
		..()
	if(M.WearingShield)
		var/Block
		var/Blocked
		Block += M.ShieldSkill / 2
		Block -= src.Agility / 4
		if(Block >= 90) Block = 90
		Blocked = prob(Block)
		if(M.HoldingWeapon == "Spear")
			var/SpearBlockChance = prob(M.SpearSkill/50)
			if(SpearBlockChance) Blocked = 1
		if(Blocked)
			M.overlays += /obj/block/
			M.ShieldSkill += 0.4
			if(M.ShieldSkill >= 100) M.ShieldSkill = 100
			spawn(10)
				M.overlays -= /obj/block/
			..()
	if(prob(M.Agility/4-Agility/6) && !M.Stunned && !M.Fainted)
		if(M.DodgeDelay == 0)
			M.overlays += /obj/dodge/
			M.DodgeDelay = 1
			spawn(10)
				M.overlays -= /obj/dodge/
				M.DodgeDelay = 0
	else
		var/WepDMG = 0
		WepDMG += rand(src.WeaponDamageMin,src.WeaponDamageMax)
		var/Damage = WepDMG + src.Strength / 2  + src.SkillDMG
		if(src.HoldingWeapon == "Dagger") if(M.Sleeping) Damage += src.DaggerSkill
		if(src.HoldingWeapon=="Mace") if(M.Race=="Gargoyle") Damage += M.Defence/4
		if(M.Race=="Gargoyle"&&M.Flying) Damage -= M.Defence/4
		else Damage -= M.Defence/2
		if(M.SubRace == "Werewolf")
			Damage -= 5
			if(M.Werepowers) Damage -= 10
		if(src.WearingRing)
			for(var/obj/Items/gems/G in src) if(G.suffix == "(Equipped)")
				if(G.icon_state == "Ruby Ring") Damage += 3
				if(G.icon_state == "Emerald Ring") if(prob(0.8))
					M.BloodContent -= 10
					M.BloodLoss()
					view() << "[src]'s ring [G] poisons [M]"
		for(var/obj/Items/Equipment/Armour/A in M) if(A.suffix == "(Equipped)" && A.Silver)
			switch(SubRace)
				if("Werewolf")
					Damage-=6
					if(Werepowers) Damage-=8
				if("HalfDemon") Damage-=8
			if(Undead) Damage-=8
		for(var/obj/Items/Equipment/Weapon/SW in src) if(SW.suffix == "(Equipped)")
			if(SW.Silver)
				if(M.SubRace=="HalfDemon")
					Damage += 12
					Damage += M.Level*0.1
				if(M.SubRace=="Werewolf")
					Damage += 12
					if(M.Werepowers) Damage += M.Level*0.7
				if(M.Undead) Damage += 12
			switch(SW.Content3)
				if("Cursed")
					Damage += rand(-10,15)
					if(prob(0.25))
						M.BloodContent -= 5
						src.BloodContent += 5
						view(src) << "[src] leeches some of [M]'s life force!"
					if(prob(0.25))
						GainEXP(M.EXP)
						M.EXP = 0
						EXPNeeded -= 1
						M.EXPNeeded += 1
						view(src) << "[src] drains strength and knowledge from [M]!"
				if("Blessed")
					if(M.Undead) Damage += 10
					if(M.Race == "Vampire") Damage -= 2
					if(M.Race == "Demon") Damage += 12
					if(M.SubRace == "HalfDemon") Damage += 12
					if(M.SubRace == "Werewolf")
						if(M.Werepowers) Damage += 7
						else Damage += 3
		if(M.Race == "Frogman") Damage*=0.80
		Damage*=DamageMultiplier
		if(Damage<5) Damage=5
		if(Delay==5) Damage*=1.25
		if(Running) switch(Delay)
			if(3) Damage*=0.75
			if(2) Damage*=0.66
			if(1) Damage*=0.50
		if(M.Race != "Spider")
			src.HitLeftLeg = prob(4)
			src.HitRightLeg = prob(4)
//		if(M.WingsOut&&M.HasWings) if(M.Race!="Dragon") src.HitWings = prob(4)
		src.HitHead = prob(3)
		src.HitLeftArm = prob(4)
		src.HitRightArm = prob(4)
		src.HitLowerBody = prob(4)
		src.HitUpperBody = prob(4)
		src.CheckDefence()
		if(src.HitWings)
			if(src.DamageType == "Blunt")
				M.WingsHP -= Damage
				if(M.WingsHP <= 100)
					M.Wings  = "Bruised"
					..()
				if(M.WingsHP <= 80)
					M.Wings  = "Damaged"
					.()
				if(M.WingsHP <= 60)
					M.Wings  = "Broken"
					Stun = prob(1)
					if(Stun == 1)
						M.Stunned = 1
						view(src) << "<b><font color=red>[M] is stunned!"
					..()
				if(M.WingsHP <= 40)
					M.Wings  = "Crushed"
					M.BloodContent -= 2
					M.BloodLoss()
					Stun = prob(1)
					if(Stun == 1)
						M.Stunned = 1
						view(src) << "<b><font color=red>[M] is stunned!"
					..()
				if(M.WingsHP <= 10)
					M.WingsHP = 10
					M.Wings  = "Mangled"
					M.BloodContent -= 5
					M.BloodLoss()
					Stun = prob(1)
					if(Stun == 1)
						M.Stunned = 1
						view(src) << "<b><font color=red>[M] is stunned!"
					..()
			if(src.DamageType == "Slashing")
				M.WingsHP -= Damage
				if(M.WingsHP <= 100)
					M.BloodContent -= 1
					M.BloodLoss()
					M.Wings  = "Cut"
					..()
				if(M.WingsHP <= 80)
					M.BloodContent -= 1
					M.BloodLoss()
					M.Wings  = "Slashed"
					..()
				if(M.WingsHP <= 60)
					M.Wings  = "Broken"
					M.BloodContent -= 2
					M.BloodLoss()
					Faint = prob(0.5)
					if(Faint == 1)
						M.Fainted = 1
						M.destination = null
						view(src) << "<b><font color=red>[M] has fainted!"
					..()
				if(M.WingsHP <= 40)
					M.Wings  = "Crushed"
					M.BloodContent -= 3
					M.BloodLoss()
					Faint = prob(0.5)
					if(Faint == 1)
						M.Fainted = 1
						M.destination = null
						view(src) << "<b><font color=red>[M] has fainted!"
					..()
				if(M.WingsHP <= 10)
					M.Wings  = "Mangled"
					M.BloodContent -= 4
					M.BloodLoss()
					Faint = prob(0.5)
					if(Faint == 1)
						M.Fainted = 1
						M.destination = null
						view(src) << "<b><font color=red>[M] has fainted!"
					..()
				if(M.WingsHP <= 0)
					M.HasWings  = 0
					M.BloodContent -= 5
					M.BloodLoss()
					M.Wings  = "Destroyed"
					M.LimbLoss()
					M.RebuildOverlays()
					view(src) << "<b><font color=red>[M]'s wings are slashed off"
					Faint = prob(0.5)
					if(Faint == 1)
						M.Fainted = 1
						M.destination = null
						view(src) << "<b><font color=red>[M] has fainted!"
					..()
			src.HitWings = 0
		if(src.HitLeftLeg == 1)
			if(M)
				if(M.HasLeftLeg == 1)
					if(src.DamageType == "Blunt")
						M.LeftLegHP -= Damage
						if(M.LeftLegHP <= 100)
							M.LeftLeg  = "Bruised"
							..()
						if(M.LeftLegHP <= 80)
							M.LeftLeg  = "Damaged"
							.()
						if(M.LeftLegHP <= 60)
							M.LeftLeg  = "Broken"
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.LeftLegHP <= 40)
							M.LeftLeg  = "Crushed"
							M.BloodContent -= 5
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.LeftLegHP <= 10)
							M.LeftLegHP = 10
							M.LeftLeg  = "Mangled"
							M.BloodContent -= 10
							M.BloodLoss()
							if(M.RightLegHP <= 10)
								M.CanWalk = 0
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
					if(src.DamageType == "Slashing")
						M.LeftLegHP -= Damage
						if(M.LeftLegHP <= 100)
							M.BloodContent -= 5
							M.BloodLoss()
							M.LeftLeg  = "Cut"
							..()
						if(M.LeftLegHP <= 80)
							M.BloodContent -= 10
							M.BloodLoss()
							M.LeftLeg  = "Slashed"
							..()
						if(M.LeftLegHP <= 60)
							M.LeftLeg  = "Broken"
							M.BloodContent -= 15
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftLegHP <= 40)
							M.LeftLeg  = "Crushed"
							M.BloodContent -= 20
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftLegHP <= 10)
							M.LeftLeg  = "Mangled"
							M.BloodContent -= 30
							M.BloodLoss()
							if(M.LeftLegHP <= 10)
								M.CanWalk = 0

							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftLegHP <= 0)
							M.HasLeftLeg  = 0
							M.BloodContent -= 90
							M.BloodLoss()
							M.LeftLeg  = "Destroyed"
							M.LimbLoss()
							M.LimbFling("Left Leg")
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
				src.HitLeftLeg = 0
		if(src.HitRightLeg == 1)
			if(M)
				if(M.HasRightLeg == 1)
					if(src.DamageType == "Blunt")
						M.RightLegHP -= Damage
						if(M.RightLegHP <= 100)
							M.RightLeg = "Bruised"
							..()
						if(M.RightLegHP <= 80)
							M.RightLeg = "Damaged"
							.()
						if(M.RightLegHP <= 60)
							M.RightLeg = "Broken"
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.RightLegHP <= 40)
							M.RightLeg = "Crushed"
							M.BloodContent -= 5
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.RightLegHP <= 10)
							M.RightLegHP = 10
							M.RightLeg = "Mangled"
							M.BloodContent -= 10
							M.BloodLoss()
							M.CanWalk = 0
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()




					if(src.DamageType == "Slashing")
						M.RightLegHP -= Damage
						if(M.RightLegHP <= 100)
							M.BloodContent -= 5
							M.BloodLoss()
							M.RightLeg = "Cut"
							..()
						if(M.RightLegHP <= 80)
							M.BloodContent -= 10
							M.BloodLoss()
							M.RightLeg = "Slashed"
							..()
						if(M.RightLegHP <= 60)
							M.RightLeg = "Broken"
							M.BloodContent -= 15
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightLegHP <= 40)
							M.RightLeg = "Crushed"
							M.BloodContent -= 20
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightLegHP <= 10)
							M.RightLeg = "Mangled"
							M.BloodContent -= 30
							M.BloodLoss()
							M.CanWalk = 0
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightLegHP <= 0)
							M.HasRightLeg = 0
							M.BloodContent -= 90
							M.BloodLoss()
							M.RightLeg = "Destroyed"
							M.LimbLoss()
							M.LimbFling("Right Leg")
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()






				src.HitRightLeg = 0
		if(src.HitRightArm == 1)
			if(M)
				if(M.HasRightArm == 1)
					if(src.DamageType == "Blunt")
						M.RightArmHP -= Damage
						if(M.RightArmHP <= 100)
							M.RightArm = "Bruised"
							..()
						if(M.RightArmHP <= 80)
							M.RightArm = "Damaged"
							.()
						if(M.RightArmHP <= 60)
							M.RightArm = "Broken"
							M.CanUseRightArm = 0
							for(var/obj/Items/Equipment/Weapon/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.RightArmHP <= 40)
							M.RightArm = "Crushed"
							M.BloodContent -= 5
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.RightArmHP <= 10)
							M.RightArmHP = 10
							M.RightArm = "Mangled"
							M.BloodContent -= 10
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()




					if(src.DamageType == "Slashing")
						M.RightArmHP -= Damage
						if(M.RightArmHP <= 100)
							M.BloodContent -= 5
							M.BloodLoss()
							M.RightArm = "Cut"
							..()
						if(M.RightArmHP <= 80)
							M.BloodContent -= 10
							M.BloodLoss()
							M.RightArm = "Slashed"
							..()
						if(M.RightArmHP <= 60)
							M.RightArm = "Broken"
							M.BloodContent -= 15
							M.BloodLoss()
							M.CanUseRightArm = 0
							for(var/obj/Items/Equipment/Weapon/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightArmHP <= 40)
							M.RightArm = "Crushed"
							M.BloodContent -= 20
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightArmHP <= 10)
							M.RightArm = "Mangled"
							M.BloodContent -= 30
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.RightArmHP <= 0)
							M.HasRightArm = 0
							M.BloodContent -= 90
							M.BloodLoss()
							M.RightArm = "Destroyed"
							M.LimbLoss()
							M.LimbFling("Right Arm")
							for(var/obj/Items/Equipment/Armour/RightArm/S in M)
								if(S.suffix == "(Equipped)")
									S.suffix = null
									M.WearingRightArm = 0
									M.Defence -= S.Defence
									M.weight -= S.weight
									S.loc = M.loc
									if(!S.Content3) S.DeleteItem()
									view() <<"<b><font color=red>[M]'s right arm is slashed off, they loose some of their armour!"
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							M.RebuildOverlays()
							..()






				src.HitRightArm = 0
		if(src.HitLeftArm == 1)
			if(M)
				if(M.HasLeftArm == 1)
					if(src.DamageType == "Blunt")
						M.LeftArmHP -= Damage
						if(M.LeftArmHP <= 100)
							M.LeftArm = "Bruised"
							..()
						if(M.LeftArmHP <= 80)
							M.LeftArm = "Damaged"
							.()
						if(M.LeftArmHP <= 60)
							M.LeftArm = "Broken"
							M.CanUseLeftArm = 0
							for(var/obj/Items/Equipment/Armour/Shield/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.LeftArmHP <= 40)
							M.LeftArm = "Crushed"
							M.BloodContent -= 5
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()
						if(M.LeftArmHP <= 10)
							M.LeftArmHP = 10
							M.LeftArm = "Mangled"
							M.BloodContent -= 10
							M.BloodLoss()
							Stun = prob(1)
							if(Stun == 1)
								M.Stunned = 1
								view(src) << "<b><font color=red>[M] is stunned!"
							..()




					if(src.DamageType == "Slashing")
						M.LeftArmHP -= Damage
						if(M.LeftArmHP <= 100)
							M.BloodContent -= 5
							M.BloodLoss()
							M.LeftArm = "Cut"
							..()
						if(M.LeftArmHP <= 80)
							M.BloodContent -= 10
							M.BloodLoss()
							M.LeftArm = "Slashed"
							..()
						if(M.LeftArmHP <= 60)
							M.LeftArm = "Broken"
							M.BloodContent -= 15
							M.BloodLoss()
							M.CanUseLeftArm = 0
							for(var/obj/Items/Equipment/Armour/Shield/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftArmHP <= 40)
							M.LeftArm = "Crushed"
							M.BloodContent -= 20
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftArmHP <= 10)
							M.LeftArm = "Mangled"
							M.BloodContent -= 30
							M.BloodLoss()
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()
						if(M.LeftArmHP <= 0)
							M.HasLeftArm = 0
							M.BloodContent -= 90
							M.BloodLoss()
							for(var/obj/Items/Equipment/Armour/LeftArm/S in M)
								if(S.suffix == "(Equipped)")
									S.suffix = null
									M.WearingLeftArm = 0
									M.Defence -= S.Defence
									M.weight-=S.weight
									S.loc = M.loc
									if(!S.Content3) S.DeleteItem()
									view() <<"<b><font color=red>[M]'s left arm is slashed off, they loose some of their armour!"
							M.RebuildOverlays()
							M.LeftArm = "Destroyed"
							M.LimbLoss()
							M.LimbFling("Left Arm")
							Faint = prob(0.5)
							if(Faint == 1)
								M.Fainted = 1
								M.destination = null
								view(src) << "<b><font color=red>[M] has fainted!"
							..()






				src.HitLeftArm = 0
		if(src.HitLowerBody == 1)
			src.HitLeftKidney = prob(4)
			src.HitRightKidney = prob(4)
			src.HitLiver = prob(4)
			src.HitSpleen = prob(4)
			src.HitGuts = prob(4)
			src.HitStomach = prob(4)
			if(src.HitStomach== 1)
				if(M)
					if(M.HasStomach == 1)
						if(src.DamageType == "Blunt")
							M.StomachHP -= Damage
							if(M.StomachHP <= 10)
								M.StomachHP = 10
								M.Stomach = "Mangled"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.StomachHP <= 40)
								M.Stomach = "Crushed"
								M.BloodContent -= 20
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.StomachHP <= 60)
								M.Stomach = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.StomachHP <= 80)
								M.Stomach = "Damaged"
								..()
							if(M.StomachHP <= 100)
								M.Stomach = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.StomachHP -= Damage
							if(M.StomachHP <= 0)
								M.HasStomach = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.Stomach = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s guts are slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.StomachHP <= 10)
								M.Stomach = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.StomachHP <= 40)
								M.Stomach = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.StomachHP <= 60)
								M.Stomach = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.StomachHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Stomach = "Slashed"
								..()
							if(M.StomachHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Stomach = "Cut"
								..()
					src.HitStomach = 0
			if(src.HitGuts== 1)
				if(M)
					if(M.HasGuts == 1)
						if(src.DamageType == "Blunt")
							M.GutsHP -= Damage
							if(M.GutsHP <= 10)
								M.GutsHP = 10
								M.Guts = "Mangled"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.GutsHP <= 40)
								M.Guts = "Crushed"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.GutsHP <= 60)
								M.Guts = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.GutsHP <= 80)
								M.Guts = "Damaged"
								..()
							if(M.GutsHP <= 100)
								M.Guts = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.GutsHP -= Damage
							if(M.GutsHP <= 0)
								M.HasGuts = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.Guts = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s guts are slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.GutsHP <= 10)
								M.Guts = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.GutsHP <= 40)
								M.Guts = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.GutsHP <= 60)
								M.Guts = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.GutsHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Guts = "Slashed"
								..()
							if(M.GutsHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Guts = "Cut"
								..()
					src.HitGuts = 0
			if(src.HitSpleen== 1)
				if(M)
					if(M.HasSpleen == 1)
						if(src.DamageType == "Blunt")
							M.SpleenHP -= Damage
							if(M.SpleenHP <= 10)
								M.SpleenHP = 10
								M.Spleen = "Mangled"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.SpleenHP <= 40)
								M.Spleen = "Crushed"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.SpleenHP <= 60)
								M.Spleen = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.SpleenHP <= 80)
								M.Spleen = "Damaged"
								..()
							if(M.SpleenHP <= 100)
								M.Spleen = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.SpleenHP -= Damage
							if(M.SpleenHP <= 0)
								M.HasSpleen = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.Spleen = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s spleen is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.SpleenHP <= 10)
								M.Spleen = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.SpleenHP <= 40)
								M.Spleen = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.SpleenHP <= 60)
								M.Spleen = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.SpleenHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Spleen = "Slashed"
								..()
							if(M.SpleenHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Spleen = "Cut"
								..()
					src.HitSpleen = 0
			if(src.HitLiver== 1)
				if(M)
					if(M.HasLiver == 1)
						if(src.DamageType == "Blunt")
							M.LiverHP -= Damage
							if(M.LiverHP <= 10)
								M.LiverHP = 10
								M.Liver = "Mangled"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LiverHP <= 40)
								M.Liver = "Crushed"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LiverHP <= 60)
								M.Liver = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LiverHP <= 80)
								M.Liver = "Damaged"
								..()
							if(M.LiverHP <= 100)
								M.Liver = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.LiverHP -= Damage
							if(M.LiverHP <= 0)
								M.HasLiver = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.Liver = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s liver is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LiverHP <= 10)
								M.Liver = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LiverHP <= 40)
								M.Liver = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LiverHP <= 60)
								M.Liver = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LiverHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Liver = "Slashed"
								..()
							if(M.LiverHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Liver = "Cut"
								..()
					src.HitLiver = 0
			if(src.HitLeftKidney == 1)
				if(M)
					if(M.HasLeftKidney == 1)
						if(src.DamageType == "Blunt")
							M.LeftKidneyHP -= Damage
							if(M.LeftKidneyHP <= 10)
								M.LeftKidneyHP = 10
								M.LeftKidney = "Mangled"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftKidneyHP <= 40)
								M.LeftKidney = "Crushed"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftKidneyHP <= 60)
								M.LeftKidney = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftKidneyHP <= 80)
								M.LeftKidney = "Damaged"
								..()
							if(M.LeftKidneyHP <= 100)
								M.LeftKidney = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.LeftKidneyHP -= Damage
							if(M.LeftKidneyHP <= 0)
								M.HasLeftKidney = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.LeftKidney = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s left kidney is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftKidneyHP <= 10)
								M.LeftKidney = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftKidneyHP <= 40)
								M.LeftKidney = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftKidneyHP <= 60)
								M.LeftKidney = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftKidneyHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.LeftKidney = "Slashed"
								..()
							if(M.LeftKidneyHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftKidney = "Cut"
								..()
					src.HitLeftKidney = 0
			if(src.HitRightKidney == 1)
				if(M)
					if(M.HasRightKidney == 1)
						if(src.DamageType == "Blunt")
							M.RightKidneyHP -= Damage
							if(M.RightKidneyHP <= 10)
								M.RightKidneyHP = 10
								M.RightKidney = "Mangled"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightKidneyHP <= 40)
								M.RightKidney = "Crushed"
								M.BloodContent -= 30
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightKidneyHP <= 60)
								M.RightKidney = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightKidneyHP <= 80)
								M.RightKidney = "Damaged"
								..()
							if(M.RightKidneyHP <= 100)
								M.RightKidney = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.RightKidneyHP -= Damage
							if(M.RightKidneyHP <= 0)
								M.HasRightKidney = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.RightKidney = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s right kidney is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightKidneyHP <= 10)
								M.RightKidney = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightKidneyHP <= 40)
								M.RightKidney = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightKidneyHP <= 60)
								M.RightKidney = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightKidneyHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.RightKidney = "Slashed"
								..()
							if(M.RightKidneyHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightKidney = "Cut"
								..()
					src.HitRightKidney = 0
		if(src.HitUpperBody == 1)
			src.HitLeftLung = prob(4)
			src.HitRightLung = prob(4)
			src.HitHeart = prob(4)
			if(src.HitRightLung == 1)
				if(M)
					if(M.HasRightLung == 1)
						if(src.DamageType == "Blunt")
							M.RightLungHP -= Damage
							if(M.RightLungHP <= 10)
								M.RightLungHP = 10
								M.RightLung = "Mangled"
								M.BloodContent -= 50
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightLungHP <= 40)
								M.RightLung = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightLungHP <= 60)
								M.RightLung = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightLungHP <= 80)
								M.RightLung = "Damaged"
								..()
							if(M.RightLungHP <= 100)
								M.RightLung = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.RightLungHP -= Damage
							if(M.RightLungHP <= 0)
								M.HasRightLung = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.RightLung = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s right lung is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightLungHP <= 10)
								M.RightLung = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightLungHP <= 40)
								M.RightLung = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightLungHP <= 60)
								M.RightLung = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightLungHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.RightLung = "Slashed"
								..()
							if(M.RightLungHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightLung = "Cut"
								..()
					src.HitRightLung = 0
			if(src.HitLeftLung == 1)
				if(M)
					if(M.HasLeftLung == 1)
						if(src.DamageType == "Blunt")
							M.LeftLungHP -= Damage
							if(M.LeftLungHP <= 10)
								M.LeftLungHP = 10
								M.LeftLung = "Mangled"
								M.BloodContent -= 50
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftLungHP <= 40)
								M.LeftLung = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftLungHP <= 60)
								M.LeftLung = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftLungHP <= 80)
								M.LeftLung = "Damaged"
								..()
							if(M.LeftLungHP <= 100)
								M.LeftLung = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.LeftLungHP -= Damage
							if(M.LeftLungHP <= 0)
								M.HasLeftLung = 0
								M.BloodContent -= 80
								M.BloodLoss()
								M.LeftLung = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s left lung is slashed open!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftLungHP <= 10)
								M.LeftLung = "Mangled"
								M.BloodContent -= 60
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftLungHP <= 40)
								M.LeftLung = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftLungHP <= 60)
								M.LeftLung = "Broken"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftLungHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.LeftLung = "Slashed"
								..()
							if(M.LeftLungHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftLung = "Cut"
								..()
					src.HitLeftLung = 0
			if(src.HitHeart == 1)
				if(M)
					if(M.HasHeart == 1)
						if(src.DamageType == "Blunt")
							M.HeartHP -= Damage
							if(M.HeartHP <= 10)
								M.HeartHP = 10
								M.Heart = "Mangled"
								M.BloodContent -= 100
								M.BloodLoss()
								M.BleedingPropell()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeartHP <= 40)
								M.Heart = "Crushed"
								M.BloodContent -= 80
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeartHP <= 60)
								M.Heart = "Broken"
								M.BloodContent -= 60
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeartHP <= 80)
								M.Heart = "Damaged"
								M.BloodContent -= 40
								..()
							if(M.HeartHP <= 100)
								M.Heart = "Bruised"
								M.BloodContent -= 20
								..()
						if(src.DamageType == "Slashing")
							M.HeartHP -= Damage
							if(M.HeartHP <= 0)
								M.HasHeart = 0
								M.BloodContent -= 100
								M.BloodLoss()
								M.Heart = "Destroyed"
								M.BleedingPropell()
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s heart is slashed open!!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/die
								die = prob(100)
								if(die == 1)
									view(src) << "<b><font color=purple>[M] dies from lethal wounds!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Heart Failure"
									M.Death()
									return
								..()
							if(M.HeartHP <= 10)
								M.Heart = "Mangled"
								M.BloodContent -= 90
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.HeartHP <= 40)
								M.Heart = "Crushed"
								M.BloodContent -= 70
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.HeartHP <= 60)
								M.Heart = "Broken"
								M.BloodContent -= 50
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.HeartHP <= 80)
								M.BloodContent -= 30
								M.BloodLoss()
								M.Heart = "Slashed"
								..()
							if(M.HeartHP <= 100)
								M.BloodContent -= 20
								M.BloodLoss()
								M.Heart = "Cut"
								..()
					src.HitHeart = 0
		if(src.HitHead == 1)
			src.HitLeftEar = prob(4)
			src.HitRightEar = prob(4)
			src.HitNose = prob(4)
			src.HitTeeth = prob(4)
			src.HitLeftEye = prob(4)
			src.HitRightEye = prob(4)
			src.HitBrain = prob(4)
			src.HitSkull = prob(4)
			if(M)
				if(M.Undead)
					src.HitSkull = prob(8)
			src.HitThroat = prob(4)
			if(src.HitNose == 1)
				if(M)
					if(M.HasNose == 1)
						if(src.DamageType == "Blunt")
							M.NoseHP -= Damage
							if(M.NoseHP <= 10)
								M.NoseHP = 10
								M.Nose = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.NoseHP <= 40)
								M.Nose = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.NoseHP <= 60)
								M.Nose = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.NoseHP <= 80)
								M.Nose = "Damaged"
								..()
							if(M.NoseHP <= 100)
								M.Nose = "Bruised"
								..()
						if(src.DamageType == "Slashing")
							M.NoseHP -= Damage
							if(M.NoseHP <= 0)
								M.HasNose = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.Nose = "Destroyed"
								Faint = prob(0.5)
								view(src) << "<b><font color=red>[M]'s nose flies off in a bloody arc!"
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.NoseHP <= 10)
								M.Nose = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.NoseHP <= 40)
								M.Nose = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.NoseHP <= 60)
								M.Nose = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.NoseHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Nose = "Slashed"
								..()
							if(M.NoseHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Nose = "Cut"
								..()
					src.HitNose = 0

			if(src.HitTeeth == 1)
				if(M)
					if(M.HasTeeth == 1)
						if(src.DamageType == "Blunt")
							M.TeethHP -= Damage
							if(M.TeethHP <= 0)
								M.TeethHP = 0
								M.HasTeeth = 0
								M.Teeth = "Destroyed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.TeethHP <= 10)
								M.Teeth = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.TeethHP <= 40)
								M.Teeth = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.TeethHP <= 60)
								M.Teeth = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.TeethHP <= 80)
								M.Teeth = "Damaged"
								..()
							if(M.TeethHP <= 100)
								M.Teeth = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.TeethHP -= Damage
							if(M.TeethHP <= 0)
								M.HasTeeth = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.Teeth = "Destroyed"
								view(src) << "<b><font color=red>[M]'s teeth shatter out of [M]'s mouth!"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.TeethHP <= 10)
								M.Teeth = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.TeethHP <= 40)
								M.Teeth = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.TeethHP <= 60)
								M.Teeth = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.TeethHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Teeth = "Slashed"
								..()
							if(M.TeethHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Teeth = "Cut"
								..()
					src.HitTeeth = 0
			if(src.HitThroat== 1)
				if(M)
					if(M.HasThroat == 1)
						if(src.DamageType == "Blunt")
							M.ThroatHP -= Damage
							if(M.ThroatHP <= 10)
								M.Throat = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.ThroatHP <= 40)
								M.Throat = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.ThroatHP <= 60)
								M.Throat = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.ThroatHP <= 80)
								M.Throat = "Damaged"
								..()
							if(M.ThroatHP <= 100)
								M.Throat = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.ThroatHP -= Damage
							if(M.ThroatHP <= 0)
								M.HasThroat = 0
								M.BloodContent -= 100
								M.BloodLoss()
								M.Throat = "Destroyed"
								view(src) << "<b><font color=red>[M]'s throat is slashed open!"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.ThroatHP <= 10)
								M.Throat = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.ThroatHP <= 40)
								M.Throat = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.ThroatHP <= 60)
								M.Throat = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.ThroatHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Throat = "Slashed"
								..()
							if(M.ThroatHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Throat = "Cut"
								..()
					src.HitThroat = 0
			if(src.HitLeftEar == 1)
				if(M)
					if(M.HasLeftEar == 1)
						if(src.DamageType == "Blunt")
							M.LeftEarHP -= Damage

							if(M.LeftEarHP <= 10)
								M.LeftEar = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEarHP <= 40)
								M.LeftEar = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEarHP <= 60)
								M.LeftEar = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEarHP <= 80)
								M.LeftEar = "Damaged"
								..()
							if(M.LeftEarHP <= 100)
								M.LeftEar = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.LeftEarHP -= Damage
							if(M.LeftEarHP <= 0)
								M.HasLeftEar = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.LeftEar = "Destroyed"
								view(src) << "<b><font color=red>[M]'s left ear is sliced off!!"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEarHP <= 10)
								M.LeftEar = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEarHP <= 40)
								M.LeftEar = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEarHP <= 60)
								M.LeftEar = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEarHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftEar = "Slashed"
								..()
							if(M.LeftEarHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftEar = "Cut"
								..()
					src.HitLeftEar = 0
			if(src.HitRightEar == 1)
				if(M)
					if(M.HasRightEar == 1)
						if(src.DamageType == "Blunt")
							M.RightEarHP -= Damage

							if(M.RightEarHP <= 10)
								M.RightEar = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEarHP <= 40)
								M.RightEar = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEarHP <= 60)
								M.RightEar = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEarHP <= 80)
								M.RightEar = "Damaged"
								..()
							if(M.RightEarHP <= 100)
								M.RightEar = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.RightEarHP -= Damage
							if(M.RightEarHP <= 0)
								M.HasRightEar = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.RightEar = "Destroyed"
								view(src) << "<b><font color=red>[M]'s right ear is sliced off!!"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEarHP <= 10)
								M.RightEar = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEarHP <= 40)
								M.RightEar = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEarHP <= 60)
								M.RightEar = "Broken"
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEarHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightEar = "Slashed"
								..()
							if(M.RightEarHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightEar = "Cut"
								..()
					src.HitRightEar = 0
			if(src.HitRightEye == 1)
				if(M)
					if(M.HasRightEye == 1)
						if(src.DamageType == "Blunt")
							M.RightEyeHP -= Damage

							if(M.RightEyeHP <= 10)
								M.RightEye = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEyeHP <= 40)
								M.RightEye = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEyeHP <= 60)
								M.RightEye = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.RightEyeHP <= 80)
								M.RightEye = "Damaged"
								..()
							if(M.RightEyeHP <= 100)
								M.RightEye = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.RightEyeHP -= Damage
							if(M.RightEyeHP <= 0)
								M.HasRightEye = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.RightEye = "Destroyed"
								view(src) << "<b><font color=red>[M]'s right eye is poked out!!!"
								if(M.HasLeftEye == 0)
									if(M.CanSee == 1)
										M.CanSee = 0
										view(src) << "<b><font color=red>[M] is blinded by [src]"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEyeHP <= 10)
								M.RightEye = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEyeHP <= 40)
								M.RightEye = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEyeHP <= 60)
								M.RightEye = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.RightEyeHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightEye = "Slashed"
								..()
							if(M.RightEyeHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.RightEye = "Cut"
								..()
					src.HitRightEye = 0
			if(src.HitLeftEye == 1)
				if(M)
					if(M.HasLeftEye == 1)
						if(src.DamageType == "Blunt")
							M.LeftEyeHP -= Damage

							if(M.LeftEyeHP <= 10)
								M.LeftEye = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEyeHP <= 40)
								M.LeftEye = "Smashed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEyeHP <= 60)
								M.LeftEye = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.LeftEyeHP <= 80)
								M.LeftEye = "Damaged"
								..()
							if(M.LeftEyeHP <= 100)
								M.LeftEye = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.LeftEyeHP -= Damage
							if(M.LeftEyeHP <= 0)
								M.HasLeftEye = 0
								M.BloodContent -= 10
								M.BloodLoss()
								M.LeftEye = "Destroyed"
								view(src) << "<b><font color=red>[M]'s left eye is poked out!!!"
								if(M.HasRightEye == 0)
									if(M.CanSee == 1)
										M.CanSee = 0
										view(src) << "<b><font color=red>[M] is blinded by [src]"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEyeHP <= 10)
								M.LeftEye = "Mangled"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEyeHP <= 40)
								M.LeftEye = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEyeHP <= 60)
								M.LeftEye = "Broken"
								M.BloodContent -= 5
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.LeftEyeHP <= 80)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftEye = "Slashed"
								..()
							if(M.LeftEyeHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.LeftEye = "Cut"
								..()
					src.HitLeftEye = 0
			if(src.HitSkull == 1)
				if(M)
					if(M.HasHead == 1)
						if(src.DamageType == "Blunt")
							M.HeadHP -= Damage

							if(M.HeadHP <= 10)
								M.HeadHP = 10
								M.Head = "Mangled"
								M.BloodContent -= 25
								M.BloodLoss()
								Stun = prob(4)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeadHP <= 40)
								M.Head = "Smashed"
								M.BloodContent -= 15
								M.BloodLoss()
								if(M.Race=="Zombie"||M.Race=="Skeleton")
									M.GoingToDie = 1
									M.DeathType = "Smashed Head"
									M.Death()
									return
								Stun = prob(3)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeadHP <= 60)
								M.Head = "Broken"
								Stun = prob(2)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.HeadHP <= 80)
								M.Head = "Damaged"
								..()
							if(M.HeadHP <= 100)
								M.Head = "Slighty Damaged"
								..()
						if(src.DamageType == "Slashing")
							M.HeadHP -= Damage
							if(M.HeadHP <= 0)
								M.HasHead = 0
								M.BloodContent -= 90
								M.BloodLoss()
								M.Head = "Destroyed"
								view(src) << "<b><font color=red>[src]'s weapon smashes [M]'s head into a gruesomly bloody mess!! !!!"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/Die = prob(100)
								if(Die == 1)
									view(src) << "<b><font color=purple>[M] dies from lethal wounds!"
									src.destination = null
									M.destination = null
									M.DeathType = "Head Mutalation"
									M.GoingToDie = 1
									var/P
									P = prob(75)
									if(P == 1)
										M.BleedingPropell()
									M.Killer = src
									M.Death()
									return
								..()
							if(M)
								if(M.HeadHP <= 10)
									M.Head = "Mangled"
									M.BloodContent -= 25
									M.BloodLoss()
									Faint = prob(0.5)
									if(Faint == 1)
										M.Fainted = 1
										M.destination = null
										view(src) << "<b><font color=red>[M] has fainted!"
									..()
								if(M.HeadHP <= 40)
									M.Head = "Crushed"
									M.BloodContent -= 15
									M.BloodLoss()
									Faint = prob(0.5)
									if(M.Race=="Zombie"||M.Race=="Skeleton")
										M.GoingToDie = 1
										M.DeathType = "Smashed Head"
										M.Death()
										return
									if(Faint == 1)
										M.Fainted = 1
										M.destination = null
										view(src) << "<b><font color=red>[M] has fainted!"
									..()
								if(M.HeadHP <= 60)
									M.Head = "Broken"
									M.BloodContent -= 10
									M.BloodLoss()
									Faint = prob(0.5)
									if(Faint == 1)
										M.Fainted = 1
										M.destination = null
										view(src) << "<b><font color=red>[M] has fainted!"
									..()
								if(M.HeadHP <= 80)
									M.BloodContent -= 5
									M.BloodLoss()
									M.Head = "Slashed"
									..()
								if(M.HeadHP <= 100)
									M.BloodContent -= 5
									M.BloodLoss()
									M.Head = "Cut"
									..()
					src.HitSkull = 0
			if(src.HitBrain == 1)
				if(M)
					if(M.HasBrain == 1)
						if(src.DamageType == "Blunt")
							M.BrainHP -= Damage

							if(M.BrainHP <= 10)
								M.BrainHP = 10
								M.Brain = "Mangled"
								M.BloodContent -= 20
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								var/die
								die = prob(10)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 40)
								M.Brain = "Smashed"
								M.BloodContent -= 10
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								var/die
								die = prob(5)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 60)
								M.Brain = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								var/die
								die = prob(2)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 80)
								M.Brain = "Damaged"
								var/die
								die = prob(1)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
						if(src.DamageType == "Slashing")
							M.BrainHP -= Damage
							if(M.BrainHP <= 0)
								M.HasBrain = 0
								M.BloodContent -= 100
								M.BloodLoss()
								M.Brain = "Destroyed"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/die
								die = prob(100)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									view(src) << "<b><font color=purple>[M] dies from lethal wounds!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 10)
								M.Brain = "Mangled"
								M.BloodContent -= 50
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/die
								die = prob(10)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 40)
								M.Brain = "Crushed"
								M.BloodContent -= 40
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/die
								die = prob(5)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 60)
								M.Brain = "Broken"
								M.BloodContent -= 30
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								var/die
								die = prob(2)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 80)
								M.BloodContent -= 20
								M.BloodLoss()
								M.Brain = "Slashed"
								var/die
								die = prob(1)
								if(die == 1)
									view(src) << "<b><font color=red>[src] bashes [M] in the head killing [M]'s brain!!"
									M.GoingToDie = 1
									M.Killer = src
									M.DeathType = "Brain Damage"
									M.Death()
									return
								..()
							if(M.BrainHP <= 100)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Brain = "Cut"
								..()
					src.HitBrain = 0

		if(M)
			M.Killer = src

