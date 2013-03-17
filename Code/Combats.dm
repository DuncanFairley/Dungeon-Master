/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/


mob/proc/RemoveAllLeft()
	src.overlays -= /obj/Items/Armours/LeftArms/SkornLeftGauntlet
	src.overlays -= /obj/Items/Armours/LeftArms/MetalLeftGauntlet
	src.overlays -= /obj/Items/Armours/LeftArms/ChitinLeftGauntlet
	src.overlays -= /obj/Items/Armours/LeftArms/BoneLeftGauntlet
mob/proc/RemoveAllRight()
	src.overlays -= /obj/Items/Armours/RightArms/SkornRightGauntlet
	src.overlays -= /obj/Items/Armours/RightArms/MetalRightGauntlet
	src.overlays -= /obj/Items/Armours/RightArms/ChitinRightGauntlet
	src.overlays -= /obj/Items/Armours/RightArms/BoneRightGauntlet
mob/proc/RemoveAllShields()
	src.overlays -= /obj/Items/Armours/Shields/BoneBuckler
	src.overlays -= /obj/Items/Armours/Shields/ChitinBuckler
	src.overlays -= /obj/Items/Armours/Shields/GoldBuckler
	src.overlays -= /obj/Items/Armours/Shields/MetalBuckler
	src.overlays -= /obj/Items/Armours/Shields/SilverBuckler
	src.overlays -= /obj/Items/Armours/Shields/WoodenBuckler
mob/proc/RemoveAllWeapons()
	src.overlays -= /obj/Items/Weapons/Bows/MetalBow/
	src.overlays -= /obj/Items/Weapons/Bows/WoodenBow/
	src.overlays -= /obj/Items/Weapons/Bows/BoneBow/
	src.overlays -= /obj/Items/Weapons/Axes/GoldAxe/
	src.overlays -= /obj/Items/Weapons/Axes/MetalAxe/
	src.overlays -= /obj/Items/Weapons/Axes/BoneAxe/
	src.overlays -= /obj/Items/Weapons/Daggers/GoldDagger/
	src.overlays -= /obj/Items/Weapons/Daggers/MetalDagger/
	src.overlays -= /obj/Items/Weapons/Maces/GoldMace/
	src.overlays -= /obj/Items/Weapons/Maces/MetalMace/
	src.overlays -= /obj/Items/Weapons/Maces/SkullMace/
	src.overlays -= /obj/Items/Weapons/Picks/GoldPickAxe/
	src.overlays -= /obj/Items/Weapons/Picks/PickAxe/
	src.overlays -= /obj/Items/Weapons/Spears/BoneSpear/
	src.overlays -= /obj/Items/Weapons/Spears/ChitinSpear/
	src.overlays -= /obj/Items/Weapons/Spears/GoldSpear/
	src.overlays -= /obj/Items/Weapons/Spears/MetalSpear/
	src.overlays -= /obj/Items/Weapons/Spears/SilverSpear/
	src.overlays -= /obj/Items/Weapons/Spears/Spear/
	src.overlays -= /obj/Items/Weapons/Swords/GoblinSword/
	src.overlays -= /obj/Items/Weapons/Swords/StraightSword/
	src.overlays -= /obj/Items/Weapons/Swords/Gladius/
	src.overlays -= /obj/Items/Weapons/Swords/GoldStraightSword/
	src.overlays -= /obj/Items/Weapons/Swords/GoldGladius/
	src.overlays -= /obj/Items/Weapons/Swords/BoneSword/
mob/proc/LegFling()
	if(src)
		if(src.Fling == 0)
			if(src)
				var/F = prob(50)
				var/obj/Items/Bones/BloodyLeg/A = new
				A.Owner = src
				A.name = "[src]'s Leg"
				A.loc = src.loc
				var/DIR
				DIR = rand(1,8)
				if(DIR == 1)
					A.dir = NORTH
				if(DIR == 2)
					A.dir = SOUTH
				if(DIR == 3)
					A.dir = WEST
				if(DIR == 4)
					A.dir = EAST
				if(DIR == 5)
					A.dir = SOUTHEAST
				if(DIR == 6)
					A.dir = SOUTHWEST
				if(DIR == 7)
					A.dir = NORTHEAST
				if(DIR == 8)
					A.dir = NORTHWEST
				if(F == 1)
					var/obj/Bloods/Blood5/B = new
					B.loc = A.loc
					B.dir = A.dir
				step(A,A.dir)
				sleep(1)
				if(F == 1)
					var/obj/Bloods/Blood5/B2 = new
					B2.loc = A.loc
					B2.dir = A.dir
				sleep(1)
				step(A,A.dir)

mob/proc/ArmFling()
	if(src)
		if(src.Fling == 0)
			if(src)
				var/F = prob(50)
				var/obj/Items/Bones/BloodyArm/A = new
				A.Owner = src
				A.name = "[src]'s Arm"
				A.loc = src.loc
				var/DIR
				DIR = rand(1,8)
				if(DIR == 1)
					A.dir = NORTH
				if(DIR == 2)
					A.dir = SOUTH
				if(DIR == 3)
					A.dir = WEST
				if(DIR == 4)
					A.dir = EAST
				if(DIR == 5)
					A.dir = SOUTHEAST
				if(DIR == 6)
					A.dir = SOUTHWEST
				if(DIR == 7)
					A.dir = NORTHEAST
				if(DIR == 8)
					A.dir = NORTHWEST
				if(F == 1)
					var/obj/Bloods/Blood5/B = new
					B.loc = A.loc
					B.dir = A.dir
				step(A,A.dir)
				sleep(1)
				if(F == 1)
					var/obj/Bloods/Blood5/B2 = new
					B2.loc = A.loc
					B2.dir = A.dir
				sleep(1)
				step(A,A.dir)


mob/proc/BleedingPropell()
	if(src.Fling == 0)
		var/DIR
		DIR = rand(1,4)
		if(DIR == 1)
			src.dir = NORTH
		if(DIR == 2)
			src.dir = SOUTH
		if(DIR == 3)
			src.dir = WEST
		if(DIR == 4)
			src.dir = EAST
		var/obj/Bloods/Blood/B = new
		B.loc = src.loc
		B.dir = src.dir
		step(src,src.dir)
		sleep(1)
		var/obj/Bloods/Blood/B2 = new
		B2.loc = src.loc
		B2.dir = src.dir
		step(src,src.dir)
		sleep(1)
		var/obj/Bloods/Blood/B3 = new
		B3.loc = src.loc
		B3.dir = src.dir
		step(src,src.dir)
		var/obj/Bloods/Blood/B4 = new
		B4.loc = src.loc
		B4.dir = src.dir


mob/proc/Bleeding()
	if(src.InHole == 0)
		if(src.HasLeftLung == 0)
			if(src.HasRightLung == 0)
				src.GoingToDie = 1
				src.DeathType = "Lung Failure"
				src.Owner << "<b><font color=red>[src]'s lungs have failed!!"
				src.Death()
		if(src.BleedType)
			var/bleed
			bleed = rand(1,4)
			if(bleed == 1)
				var/obj/Bloods/Blood1/B1 = new
				B1.loc = src.loc
			if(bleed == 2)
				var/obj/Bloods/Blood2/B2 = new
				B2.loc = src.loc
				if(src.Spider)
					if(src.CanBuildSilk)
						var/obj/Items/Silks/SpiderSilk/S = new
						S.loc = src.loc
			if(bleed == 3)
				var/obj/Bloods/Blood3/B3 = new
				B3.loc = src.loc
			if(bleed == 4)
				var/obj/Bloods/Blood4/B4 = new
				B4.loc = src.loc
				if(src.Spider)
					var/obj/Items/Silks/SpiderSilk/S = new
					S.loc = src.loc
			var/heal
			heal = prob(20)
			if(heal == 1)
				src.BleedType = null
				src.BloodContent = src.MaxBloodContent
				src.Owner << "<b><font color=red>[src] has stopped bleeding!!"
		if(src.BleedType == "Badly")
			var/DieChance
			DieChance = prob(10)
			if(DieChance)
				src.DeathType = "Bleeding To Death"
				src.GoingToDie = 1
				view() << "<b><font color=red>[src] has bled to death!!"
				src.Death()
				return
		if(src.BleedType == "Very Badly")
			var/DieChance
			DieChance = prob(20)
			if(DieChance)
				src.DeathType = "Bleeding To Death"
				src.GoingToDie = 1
				view() << "<b><font color=red>[src] has bled to death!!"
				src.Death()
				return
		if(src.BleedType == "Extremly")
			var/DieChance
			DieChance = prob(40)
			if(DieChance)
				src.DeathType = "Bleeding To Death"
				src.GoingToDie = 1
				view() << "<b><font color=red>[src] has bled to death!!"
				src.Death()
				return
		src.SaidBleed = 0
	spawn(50) Bleeding()
mob/proc/Heal()
	for(var/mob/Monsters/M in oview(1,src))
		M.Told = 0
		if(M.destination == src)
			..()
	var/WakeUp = prob(50)
	if(WakeUp == 1)
		if(src.Stunned == 1)
			if(src.suffix == null)
				src.Stunned = 0
				view() << "[src] is no longer stunned!"
		if(src.Fainted == 1)
			src.Fainted = 0
			view() << "[src] wakes up!"
	var/HealArms = prob(50)
	if(HealArms == 1)
		if(src.LeftArmHP <= src.LeftArmMaxHP)
			if(src.HasLeftArm == 1)
				src.LeftArmHP = src.LeftArmMaxHP
				src.LeftArm = "Good"
				src.CanUseLeftArm = 1
		if(src.RightArmHP <= src.RightArmMaxHP)
			if(src.HasRightArm == 1)
				src.RightArmHP = src.RightArmMaxHP
				src.RightArm = "Good"
				src.CanUseRightArm = 1
		if(src.HasLeftArm == 1)
			src.Crippled = 0
		if(src.HasRightArm == 1)
			src.Crippled = 0

	var/HealLegs = prob(50)
	if(HealLegs == 1)
		if(src.LeftLegHP <= src.LeftLegMaxHP)
			if(src.HasLeftLeg == 1)
				src.LeftLegHP = src.LeftLegMaxHP
				src.LeftLeg = "Good"
				src.CanWalk = 1
		if(src.RightLegHP <= src.RightLegMaxHP)
			if(src.HasRightLeg == 1)
				src.RightLegHP = src.RightLegMaxHP
				src.RightLeg = "Good"
				src.CanWalk = 1
	var/HealHead = prob(50)
	if(HealHead == 1)
		if(src.NoseHP <= 100)
			if(src.HasNose == 1)
				src.NoseHP = 100
				src.Nose = "Good"
		if(src.LeftEarHP <= 100)
			if(src.HasLeftEar== 1)
				src.LeftEarHP = 100
				src.LeftEar = "Good"
		if(src.RightEarHP <= 100)
			if(src.HasRightEar== 1)
				src.RightEarHP = 100
				src.RightEar = "Good"
		if(src.TeethHP <= 100)
			if(src.HasTeeth== 1)
				src.TeethHP = 100
				src.Teeth = "Good"
		if(src.RightEyeHP <= 100)
			if(src.HasRightEye== 1)
				src.RightEyeHP = 100
				src.RightEye = "Good"
		if(src.LeftEyeHP <= 100)
			if(src.HasLeftEye== 1)
				src.LeftEyeHP = 100
				src.LeftEye = "Good"
	spawn(500) Heal()
mob/proc/LimbLoss()
	if(src.Race == "Devourer")
		return
	if(src.Wolf == 0)
		if(src.Spider == 0)
			if(src)
				if(src.HasLeftArm == 0)
					src.icon_state = "NoLeftArm"
				if(src.HasRightArm == 0)
					src.icon_state = "NoRightArm"
				if(src.HasLeftLeg == 0)
					src.icon_state = "NoLeftLeg"
				if(src.HasRightLeg == 0)
					src.icon_state = "NoRightLeg"
				if(src.HasRightArm == 0)
					if(src.HasLeftArm == 0)
						src.icon_state = "NoArms"
				if(src.HasRightLeg == 0)
					if(src.HasLeftLeg == 0)
						src.icon_state = "NoLegs"
				if(src.HasRightLeg == 0)
					if(src.HasLeftArm == 0)
						src.icon_state = "NoRightLegNoLeftArm"
				if(src.HasLeftLeg == 0)
					if(src.HasRightArm == 0)
						src.icon_state = "NoLeftLegNoRightArm"
				if(src.HasRightLeg == 0)
					if(src.HasRightArm == 0)
						src.icon_state = "NoRightArmNoRightLeg"
				if(src.HasLeftLeg == 0)
					if(src.HasLeftArm == 0)
						src.icon_state = "NoLeftArmNoLeftLeg"
				if(src.HasRightLeg == 0)
					if(src.HasLeftLeg == 0)
						if(src.HasRightArm == 0)
							src.icon_state = "NoLegsNoRightArm"
				if(src.HasRightLeg == 0)
					if(src.HasLeftLeg == 0)
						if(src.HasLeftArm == 0)
							src.icon_state = "NoLegsNoLeftArm"
				if(src.HasRightLeg == 0)
					if(src.HasRightArm == 0)
						if(src.HasLeftArm == 0)
							src.icon_state = "NoArmsNoRightLeg"
				if(src.HasLeftLeg == 0)
					if(src.HasRightArm == 0)
						if(src.HasLeftArm == 0)
							src.icon_state = "NoArmsNoLeftLeg"
				if(src.HasLeftLeg == 0)
					if(src.HasRightArm == 0)
						if(src.HasLeftArm == 0)
							if(src.HasRightLeg == 0)
								src.icon_state = "None"
				if(src.HasLeftLeg == 1)
					if(src.HasRightArm == 1)
						if(src.HasLeftArm == 1)
							if(src.HasRightLeg == 1)
								src.icon_state = "Normal"
mob/proc/BloodLoss()
	if(src.SaidBleed == 0)
		src.SaidBleed = 1
		src.Owner << "<b><font color=red>[src] is bleeding!!"
	if(src.BloodContent <= 300)
		src.BleedType = "Very Mildly"
	if(src.BloodContent <= 260)
		src.BleedType = "Mildly"

	if(src.BloodContent <= 210)
		src.BleedType = "Badly"
	if(src.BloodContent <= 140)
		src.BleedType = "Very Badly"
	if(src.BloodContent <= 20)
		src.BleedType = "Extremly"

mob/proc/DamageTypePost()
	if(src.HoldingWeapon == "Bow")
		src.DamageType = "Mace"
		src.MaceSkill += 0.02
		src.SkillDMG = src.MaceSkill / 4
	if(src.HoldingWeapon == "Sword")
		src.DamageType = "Slashing"
		src.SwordSkill += 0.02
		src.SkillDMG = src.SwordSkill / 4
	if(src.HoldingWeapon == "Mace")
		src.DamageType = "Blunt"
		src.MaceSkill += 0.02
		src.SkillDMG = src.MaceSkill / 4
	if(src.HoldingWeapon == "Axe")
		src.DamageType = "Slashing"
		src.AxeSkill += 0.02
		src.SkillDMG = src.AxeSkill / 4
	if(src.HoldingWeapon == "Spear")
		src.DamageType = "Slashing"
		src.SpearSkill += 0.02
		src.SkillDMG = src.SpearSkill / 4
	if(src.HoldingWeapon == 0)
		src.DamageType = "Blunt"
		src.UnArmedSkill += 0.02
		src.SkillDMG = src.UnArmedSkill / 4
	if(src.MaceSkill >= 150)
		src.MaceSkill = 150
	if(src.SwordSkill >= 150)
		src.SwordSkill = 150
	if(src.AxeSkill >= 150)
		src.AxeSkill = 150
	if(src.SpearSkill >= 150)
		src.SpearSkill = 150
	if(src.UnArmedSkill >= 150)
		src.UnArmedSkill = 150
mob/proc/DamageType()
	if(src.HoldingWeapon == "Bow")
		src.DamageType = "Mace"
		src.MaceSkill += 0.04
		src.SkillDMG = src.MaceSkill / 4
	if(src.HoldingWeapon == "Mace")
		src.DamageType = "Blunt"
		src.MaceSkill += 0.04
		src.SkillDMG = src.MaceSkill / 4
	if(src.HoldingWeapon == "Sword")
		src.DamageType = "Slashing"
		src.SwordSkill += 0.04
		src.SkillDMG = src.SwordSkill / 4
	if(src.HoldingWeapon == "Axe")
		src.DamageType = "Slashing"
		src.AxeSkill += 0.04
		src.SkillDMG = src.AxeSkill / 4
	if(src.HoldingWeapon == "Spear")
		src.DamageType = "Slashing"
		src.SpearSkill += 0.04
		src.SkillDMG = src.SpearSkill / 4
	if(src.HoldingWeapon == 0)
		src.DamageType = "Blunt"
		src.UnArmedSkill += 0.04
		src.SkillDMG = src.UnArmedSkill / 4
	if(src.MaceSkill >= 150)
		src.MaceSkill = 150
	if(src.SwordSkill >= 150)
		src.SwordSkill = 150
	if(src.AxeSkill >= 150)
		src.AxeSkill = 150
	if(src.SpearSkill >= 150)
		src.SpearSkill = 150
	if(src.UnArmedSkill >= 150)
		src.UnArmedSkill = 150


mob/proc/CheckDefence()
	for(var/mob/Monsters/M in oview(1,src))
		if(M == src.destination)
			if(src.HitHead == 1)
				if(M.WearingHelmet == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitHead = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitLeftArm == 1)
				if(M.WearingLeftArm == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLeftArm = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitRightArm == 1)
				if(M.WearingRightArm == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitRightArm = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitLeftLeg == 1)
				if(M.WearingLegs == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLeftLeg = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitRightLeg == 1)
				if(M.WearingLegs == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitRightLeg = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitLowerBody == 1)
				if(M.WearingChest == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitLowerBody = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1
			if(src.HitUpperBody == 1)
				if(M.WearingChest == 1)
					var/DeflectChance
					DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
					if(DeflectChance == 1)
						src.HitUpperBody = 0
						view() << "<b><font color=red>[src]'s attack glances off"
						if(M.ArmourSkill <= 101)
							M.ArmourSkill += 0.1

mob/proc/Combats()
	var/Faint
	var/Stun
	for(var/obj/M in oview(1,src))
		if(M == src.destination)
			if(M.HumanParts == 0)
				if(M.Wagon == 0)
					var/WepDMG = rand(src.WeaponDamageMin,src.WeaponDamageMax)
					var/Damage = WepDMG + src.Strength / 2 + src.SkillDMG
					M.HP -= Damage
					if(M.HP <= 0)
						del(M)
						return
	for(var/mob/Monsters/M in oview(1,src))
		src.PosionHits = 0
		src.FangsHit = 0
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
		if(M == client)
			..()
		if(src.Owner == M.Owner)
			..()
		if(M.User == 1)
			..()
		if(src.CanSee == 0)
			..()
		if(src.Stunned == 1)
			..()
		if(src.Fainted == 1)
			..()
		if(M == src.destination)
			src.EXP += 1
			src.DamageType()
			if(M.HoldingWeapon)
				if(src.HoldingWeapon)
					src.FightSound()
			if(src.HoldingWeapon == 0)
				src.FightSound2()
			if(M.HumanParts == 0)
				if(M.Wagon == 0)
					var/WepDMG = rand(src.WeaponDamageMin,src.WeaponDamageMax)
					var/Damage = WepDMG + src.Strength / 2 + src.SkillDMG
					if(src.Infects && M.Infects == 0 && M.Undead == 0 && M.Vampire == 0)
						var/Infect = prob(2)
						if(Infect && src.Owner)
							src.Owner << "<font color = teal>[src] Infects [M]!<br>"
							M.Infection(src.Owner)
					M.HP -= Damage
					if(M.HP <= 0)
						M.GoingToDie = 1
						M.Death()
						return

			if(src.HasGland == 1)
				src.FangsHit = prob(4)
				if(src.FangsHit == 1)
					if(M.ImmunePosion == 0)
						M.BloodContent -= src.PosionDMG
						M.BloodLoss()
						view() << "[src]'s fangs poison [M]"
			if(src.Spider == 0)
				for(var/obj/Items/Weapons/W in src)
					if(W.suffix == "(Equiped)")
						if(W.Posioned == 1)
							src.PosionHits = prob(2)
							if(src.PosionHits == 1)
								if(M.ImmunePosion == 0)
									M.BloodContent -= W.PosionContent
									M.BloodLoss()
									view() << "[src]'s weapon [W] poisons [M]"


			if(M.HumanParts)
				var/Hit = prob(src.Agility)
				var/Dodge = prob(M.Agility/2)
				if(Hit == 0)
					..()
				if(M.WearingShield == 1)
					var/Block
					var/Blocked
					Block += M.ShieldSkill / 2
					Block -= src.Agility / 4
					if(Block >= 90)
						Block = 90
					Blocked = prob(Block)
					if(Blocked == 1)
						view() << "<b><font color=red>[M] blocks [src]'s attack!"
						M.ShieldSkill += 0.4
						if(M.ShieldSkill >= 100)
							M.ShieldSkill = 100
						..()
				if(Dodge == 1)
					if(M.Stunned == 0)
						if(M.Fainted == 0)
							view(src) << "<b><font color=red>[M] Dodges [src]"
							..()
				var/WepDMG = 0
				WepDMG += rand(src.WeaponDamageMin,src.WeaponDamageMax)
				var/Damage = WepDMG + src.Strength / 2  + src.SkillDMG
				Damage -=M.Defence/2
				if(src.Infects && M.Infects == 0 && M.Undead == 0 && M.Vampire == 0)
					var/Infect = prob(2)
					if(Infect && src.Owner)
						src.Owner << "<font color = teal>[src] Infects [M]!<br>"
						M.Infection(src.Owner)
				if(src.UsingSilver == 1)
					if(M.Undead == 1)
						Damage += rand(5,10)
					if(M.Vampire == 1)
						Damage += rand(2,4)
				if(Damage <= 0)
					Damage = 2
				if(src.Spider == 0)
					src.HitLeftLeg = prob(4)
					src.HitRightLeg = prob(4)
				if(src.Vampire == 1)
					src.HitWings = prob(4)
				src.HitHead = prob(3)
				src.HitLeftArm = prob(4)
				src.HitRightArm = prob(4)
				src.HitLowerBody = prob(4)
				src.HitUpperBody = prob(4)
				src.CheckDefence()
				if(M.Race == "Skeleton")
					M.HP -= Damage
					if(M.HP <= 0)
						M.GoingToDie = 1
						M.Death()
				if(src.HitWings == 1)
					if(M.HasWings == 1)
						if(src.DamageType == "Blunt")
							M.WingHP -= Damage
							if(M.WingHP <= 100)
								M.Wings  = "Bruised"
								..()
							if(M.WingHP <= 80)
								M.Wings  = "Damaged"
								.()
							if(M.WingHP <= 60)
								M.Wings  = "Broken"
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.WingHP <= 40)
								M.Wings  = "Crushed"
								M.BloodContent -= 5
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()
							if(M.WingHP <= 10)
								M.WingHP = 10
								M.Wings  = "Mangled"
								M.BloodContent -= 10
								M.BloodLoss()
								Stun = prob(1)
								if(Stun == 1)
									M.Stunned = 1
									view(src) << "<b><font color=red>[M] is stunned!"
								..()




						if(src.DamageType == "Slashing")
							M.WingHP -= Damage
							if(M.WingHP <= 100)
								M.BloodContent -= 5
								M.BloodLoss()
								M.Wings  = "Cut"
								..()
							if(M.WingHP <= 80)
								M.BloodContent -= 10
								M.BloodLoss()
								M.Wings  = "Slashed"
								..()
							if(M.WingHP <= 60)
								M.Wings  = "Broken"
								M.BloodContent -= 15
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.WingHP <= 40)
								M.Wings  = "Crushed"
								M.BloodContent -= 20
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.WingHP <= 10)
								M.Wings  = "Mangled"
								M.BloodContent -= 30
								M.BloodLoss()
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()
							if(M.WingHP <= 0)
								M.HasWings  = 0
								M.BloodContent -= 90
								M.BloodLoss()
								M.Wings  = "Destroyed"
								M.LimbLoss()
								M.overlays -= 'Wings.dmi'
								view(src) << "<b><font color=red>[M]'s wings are slashed off"
								Faint = prob(0.5)
								if(Faint == 1)
									M.Fainted = 1
									M.destination = null
									view(src) << "<b><font color=red>[M] has fainted!"
								..()






					src.HitLeftLeg = 0
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
									M.LegFling()
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
									M.LegFling()
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
									if(M.LeftArmHP <= 60)
										M.Crippled = 1
									for(var/obj/Items/Weapons/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.HasPick = 0
											M.HoldingWeapon = 0
											M.weight -= S.weight
											M.WeaponDamageMin -= S.WeaponDamageMin
											M.WeaponDamageMax -= S.WeaponDamageMax
											M.RemoveAllWeapons()
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
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
									if(M.LeftArmHP <= 60)
										M.Crippled = 1
									for(var/obj/Items/Weapons/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.HasPick = 0
											M.WeaponDamageMin -= S.WeaponDamageMin
											M.WeaponDamageMax -= S.WeaponDamageMax
											M.RemoveAllWeapons()
											M.HoldingWeapon = 0
											M.weight -= S.weight
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
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
									M.ArmFling()
									for(var/obj/Items/Armours/RightArms/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.WearingRightArm = 0
											M.Defence -= S.Defence
											M.RemoveAllRight()
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s right arm is slashed off, they loose some of their armour!"
									Faint = prob(0.5)
									if(Faint == 1)
										M.Fainted = 1
										M.destination = null
										view(src) << "<b><font color=red>[M] has fainted!"
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
									if(M.RightArmHP <= 60)
										M.Crippled = 1
									for(var/obj/Items/Armours/Shields/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.WearingShield = 0
											M.Defence -= S.Defence
											M.RemoveAllShields()
											M.weight -= S.weight
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
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
									for(var/obj/Items/Armours/Shields/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.WearingShield = 0
											M.Defence -= S.Defence
											M.RemoveAllShields()
											M.weight -= S.weight
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
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
									for(var/obj/Items/Armours/LeftArms/S in M)
										if(S.suffix == "(Equiped)")
											S.suffix = null
											M.WearingLeftArm = 0
											M.Defence -= S.Defence
											M.RemoveAllLeft()
											S.loc = M.loc
											view() <<"<b><font color=red>[M]'s left arm is slashed off, they loose some of their armour!"
									M.RemoveAllLeft()
									M.LeftArm = "Destroyed"
									M.LimbLoss()
									M.ArmFling()
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
										if(M.Undead == 1)
											M.GoingToDie = 1
											M.DeathType = "Smashed Head"
											M.Death()
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
											if(M.Undead == 1)
												M.GoingToDie = 1
												M.DeathType = "Smashed Head"
												M.Death()
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



