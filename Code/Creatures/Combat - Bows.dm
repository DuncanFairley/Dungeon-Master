
mob/proc/BowTarget()
	if(src.BowOn == 0)
		return
	if(src.HoldingWeapon == "Bow")
		if(src.Meditating == 0)
			if(src.HasRightArm == 1)
				if(src.Sleeping == 0)
					if(src.Target)
						if(src.Target in oview(5,src))
							if(src.HoldingWeapon == "Bow")
								for(var/obj/Items/Equipment/Armour/Quiver/LeatherQuiver/L in src)
									if(L.suffix == "(Equipped)" && L.Content >= 1)
										for(var/obj/Items/Arrows/A in L)
											view() << 'Arrow.wav'
											A.suffix = null
											A.Owner = src.Owner
											A.Target = src.Target
											src.BowSkill += 0.3
											src.GainEXP(4)
											src.destination = null
											if(src.BowSkill >= 200)
												src.BowSkill = 200
											for(var/mob/Monsters/M in oview(5,src))
												if(M == src.Target)
													var/Block = 0
													var/Hit = prob(src.BowSkill / 4 + src.Agility / 2)
													var/Deflect = 0
													var/BreakA = prob(25)
													var/LodgeA = prob(3)
													var/Damage = rand(src.WeaponDamageMin,src.WeaponDamageMax)
													Damage += src.BowSkill
													Damage -= M.Defence
													Damage += src.Agility / 10
													A.loc = M.loc
													if(M.HumanParts == 0)
														M.HP -= Damage / 2
														if(M.HP <= 0)
															M.GoingToDie = 1
															M.Death()
													if(M.WearingShield)
														var/BlockChance = prob(M.ShieldSkill / 2)
														if(BlockChance == 1)
															view(M) << "[M] blocks [src]'s arrow with their shield!"
															Block = 1
													if(M.WearingChest || !M.UsesEquipment && M.WearingLegs || !M.UsesEquipment)
														var/DeflectChance = prob(M.Defence / 10 + M.ArmourSkill / 10)
														if(DeflectChance == 1)
															Deflect = 1
															view(M) << "[M]'s armour deflects the arrow!"
													if(Hit == 1)
														if(Block == 0 && Deflect == 0)
															var/Limb = rand(1,20)
															view(M) << "[M] is hit by [src]'s arrow!"
															M.BloodContent -= Damage
															M.BloodLoss()
															if(M.ImmunePoison == 0)
																M.BloodContent -= A.PoisonContent / 5
															if(M.ImmunePoison == 1)
																M.BloodContent -= A.PoisonContent / 7
															var/Faint = 0
															if(Limb == 1)
																M.LeftLegHP -= Damage
																if(M.LeftLegHP <= 0)
																	M.HasLeftLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LimbFling("Left Leg")
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 2)
																M.RightLegHP -= Damage
																if(M.RightLegHP <= 0)
																	M.HasRightLeg  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightLeg  = "Destroyed"
																	M.LimbLoss()
																	M.LimbFling("Right Leg")
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																	M.CanWalk = 0
															if(Limb == 3)
																M.RightArmHP -= Damage
																if(M.RightArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.RightArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.RightArmHP <= 0)
																	M.HasRightArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.RightArm  = "Destroyed"
																	M.LimbLoss()
																	M.LimbFling("Right Arm")
																	for(var/obj/Items/Equipment/Weapon/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s right arm is broken, they drop their weapon!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 4)
																M.LeftArmHP -= Damage
																if(M.LeftArmHP <= 50)
																	M.BloodContent -= 10
																	M.BloodLoss()
																	M.LeftArm  = "Slashed"
																	Faint = prob(0.1)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
																if(M.LeftArmHP <= 0)
																	M.HasLeftArm  = 0
																	M.BloodContent -= 90
																	M.BloodLoss()
																	M.LeftArm  = "Destroyed"
																	M.LimbLoss()
																	M.LimbFling("Left Arm")
																	for(var/obj/Items/Equipment/Armour/Shield/S in M) if(M.UnEquipItem(S)) if(M.DropItem(S)) view() <<"<b><font color=red>[M]'s left arm is broken, they drop their shield!"
																	Faint = prob(2.5)
																	if(Faint == 1)
																		M.Fainted = 1
																		M.destination = null
																		view(src) << "<b><font color=red>[M] has fainted!"
															if(Limb == 5 && M.HasRightEye == 1)
																M.RightEyeHP -= Damage
																M.RightEye = "Slashed"
																view(M) << "[M] is hit in the right eye by the arrow!"
																if(M.RightEyeHP <= 0)
																	M.HasRightEye = 0
																	M.RightEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
															if(Limb == 6 && M.HasLeftEye == 1)
																M.LeftEyeHP -= Damage
																M.LeftEye = "Slashed"
																view(M) << "[M] is hit in the left eye by the arrow!"
																if(M.LeftEyeHP <= 0)
																	M.HasLeftEye = 0
																	M.LeftEye = "Destroyed"
																if(M.HasRightEye == 0 && M.HasLeftEye == 0)
																	M.CanSee = 0
																	view(M) << "[M] is blinded!"
															if(Limb == 7)
																var/HeartShot = prob(2)
																if(HeartShot == 1 && M.Race != "Gargoyle")
																	view(M) << "[M] is hit in the heart with an arrow and instantly killed!"
																	M.GoingToDie = 1
																	M.Killer = "[src]"
																	M.DeathType = "being shot in the heart with an arrow"
																	M.Death()
															if(Limb == 8)
																var/SpleenShot = prob(40)
																if(SpleenShot == 1 && M.Race != "Gargoyle")
																	view(M) << "[M] is hit in the spleen with an arrow!"
																	M.SpleenHP -= Damage
																	M.Spleen = "Destroyed"
																	M.BloodContent -= rand(1,10)
															if(Limb == 9)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Race != "Gargoyle")
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.LeftLungHP -= Damage
																	M.LeftLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.LeftLungHP <= 0)
																		M.LeftLung = "Destroyed"
																		M.HasLeftLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()
															if(Limb == 10)
																var/LungShot = prob(25)
																if(LungShot == 1 && M.Race != "Gargoyle")
																	view(M) << "[M] is hit in the left lung with an arrow!"
																	M.RightLungHP -= Damage
																	M.RightLung = "Damaged"
																	M.BloodContent -= rand(1,10)
																	if(M.RightLungHP <= 0)
																		M.RightLung = "Destroyed"
																		M.HasRightLung = 0
																	if(M.HasLeftLung == 0 && M.HasRightLung == 0)
																		M.GoingToDie = 1
																		M.Killer = "[src]"
																		M.DeathType = "being shot in the lungs with arrows"
																		M.Death()
															if(LodgeA == 1)
																view(M) << "<b><font color=red>[A] lodges itself into [M]<br>"
																A.loc = M
																M.weight += A.weight
																A.suffix = "(Stuck In)"
															if(BreakA == 1 && LodgeA == 0)
																del A
																break
															break
														break

													else
														view(src) << "[src] fires an arrow but misses its target!"
														break
											L.Content -= 1
											break
									break
						else
							src.Target = null
							src.BowOn = 0
			else
				src.BowOn = 0
				return
		else
			src.BowOn = 0
			src.Target = null
			return
	else
		src.BowOn = 0
		return
	if(src.BowOn)
		spawn(50) BowTarget()