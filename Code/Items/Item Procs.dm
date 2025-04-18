mob/proc/HasItem(TYPE) for(var/obj/Items/I in src) if(istype(I,TYPE)) return(I) //Useful in "if" or "while" cases to save a couple lines of text. Works on child types of TYPE.
mob/proc/HasItems(TYPE)
	var/NUM=0
	for(var/obj/Items/I in src) if(istype(I,TYPE)) NUM+=1
	return NUM
mob/proc/SetEquipmentUse(TYPE="Normal")
	if(UsesEquipment==TYPE) return
	for(var/obj/Items/Equipment/I in src) if(UnEquipItem(I)) I.ReEquipWhen = UsesEquipment
	UsesEquipment=TYPE
	if(UsesEquipment=="Normal") for(var/obj/Items/Equipment/I in src) if(I.ReEquipWhen==UsesEquipment) EquipItem(I)
	return(1)
mob/var
	UsesEquipment="Normal" //Simply set to 0 to stop use of equipment.
	HoldingWeapon
	WearingChest
	WearingShield
	WearingHelmet
	WearingLegs
	WearingBack
	WearingCape
	WearingLeftArm
	WearingRightArm
	WearingFullPlateHelm
	WearingRing = 0
	WearingCrown
atom/var
	WeaponDamageMin
	WeaponDamageMax
obj/Items/var
	ReEquipWhen=0 //Used Simply for the process above to re-equip items un-equipped durring SetEquipmentUse upon returning to the original UsesEquipment var.
	ItemType
obj/Items/proc/EquipmentType() switch(ItemType)
	if("Sword","Spear","Axe","Mace","Dagger","Pickaxe","Bow","Butcher Knife") return("Weapon")
	if("Crown","Helmet","Cape","Neckguard","Quiver","Chestplate","LeftArm","RightArm","Leggings","Shield") return("Armour")
	else return(0)
atom/proc/DeleteItem() if(!Content3) spawn()
	if(icon_state=="Arm") Content3=80
	while(!suffix)
		Content3+=1
		if(Content3>180) del(src)
		sleep(10)
	Content3=null
mob/proc
	PickUpItem(atom/movable/ITEM,Telling=0,Range=1) //Rather than "obj/Items/ITEM" because of its use by bodies. Helps not write anything that could cause the proc to crash.
		if(ITEM in range(Range,src))if(ITEM.suffix==null)
			if(Flying||IsMist) return
			if(ITEM.Silver) if(Race=="Vampire"||SubRace=="Werewolf")
				if(Telling)
					view(src) << "[src] touched the [ITEM] for a moment but the silver caused a steaming, burnt spot to form on their hand forcing them to drop it."
					BloodContent -= 5
					BloodLoss()
				return(0)
			if(ITEM.weight+weight>weightmax)
				if(Telling) usr<<"[src]: I Cant Carry Too Much!"
			else return(ForcePickUpItem(ITEM))
	ForcePickUpItem(atom/movable/ITEM)
		ITEM.loc=src
		ITEM.suffix="(Carrying)"
		weight+=ITEM.weight
		return(ITEM)
	DropItem(atom/movable/ITEM,UnEquip=1)if(ITEM.loc==src)
		if(UnEquip) if(ITEM.suffix=="(Equipped)")UnEquipItem(ITEM)
		if(ITEM.suffix=="(Carrying)")return(ForceDropItem(ITEM))
	ForceDropItem(atom/movable/ITEM,UnEquip=1)
		if(UnEquip) if(ITEM.suffix=="(Equipped)")UnEquipItem(ITEM)
		ITEM.loc=loc
		ITEM.suffix=null
		weight-=ITEM.weight
		if(istype(ITEM,/obj/Items/)) //Simply because I don't want to define stuff as atom vars and procs.
			var/obj/Items/I=ITEM
			I.ReEquipWhen=0
		ITEM.DeleteItem()
		if(ITEM.NoDropOnDeath)
			del(ITEM)
			return(1)
		return(ITEM)
	ToggleEquipItem(obj/Items/ITEM,MANUAL) switch(ITEM.suffix)
		if("(Equipped)") return(UnEquipItem(ITEM,MANUAL))
		if("(Carrying)") return(EquipItem(ITEM,MANUAL))
		else return(0)
	EquipItem(obj/Items/ITEM,MANUAL) if(UsesEquipment&&ITEM.loc==src&&ITEM.EquipmentType()&&ITEM.suffix=="(Carrying)")
		var/AllowedToEquip=1
		if(AllowedToEquip) switch(ITEM.EquipmentType())
			if("Weapon") if(HasRightArm&&CanUseRightArm)
				if(HoldingWeapon)for(var/obj/Items/EquippedItem in src)if(EquippedItem.EquipmentType()=="Weapon")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
				else return(ForceEquipItem(ITEM))
			if("Armour") switch(ITEM.ItemType)
				if("Helmet")
					if(WearingHelmet)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Helmet")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Cape")
					if(WearingCape)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Cape")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Neckguard")
					if(WearingFullPlateHelm)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Neckguard")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Quiver")
					if(WearingBack)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Quiver")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Chestplate")
					if(WearingChest)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Chestplate")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("LeftArm")
					if(WearingLeftArm)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="LeftArm")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else if(HasLeftArm) return(ForceEquipItem(ITEM))
				if("RightArm")
					if(WearingRightArm)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="RightArm")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else if(HasRightArm) return(ForceEquipItem(ITEM))
				if("Leggings")
					if(WearingLegs)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Leggings")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Shield") if(HasLeftArm&&CanUseLeftArm)
					if(WearingShield)for(var/obj/Items/EquippedItem in src)if(EquippedItem.ItemType=="Shield")if(UnEquipItem(EquippedItem))return(ForceEquipItem(ITEM))
					else return(ForceEquipItem(ITEM))
				if("Crown") if(MANUAL) if(!WearingCrown) if(AddLeader(ITEM)) return(ForceEquipItem(ITEM))
	ForceEquipItem(obj/Items/ITEM)
		ITEM.ReEquipWhen=0
		if(ITEM.icon=='DemonicItems.dmi')
			var/ArmLoss=0
			switch(ITEM.EquipmentType())
				if("Weapon") switch(ITEM.ItemType)
					if("Sword")if(SwordSkill<150)ArmLoss=1
					if("Spear")if(SpearSkill<150)ArmLoss=1
					if("Axe")if(AxeSkill<150)ArmLoss=1
					if("Mace")if(MaceSkill<150)ArmLoss=1
					if("Dagger")if(DaggerSkill<150)ArmLoss=1
					if("Bow")if(BowSkill<150)ArmLoss=1
					else ArmLoss=0
				if("Armour") //Incase We All Decide to add Demonic Armour
					if(ArmourSkill<50) ArmLoss=1
			if(Race=="Demon" || SubRace=="HalfDemon")ArmLoss=0
			if(ArmLoss&&ITEM.EquipmentType()=="Armour")
				view(src,7)<<"[src] tried to equip themself with the [ITEM], but its energy backfired into [src]'s body!"
				BloodContent-=20
				BloodLoss()
				return
			if(ArmLoss&&ITEM.EquipmentType()=="Weapon")
				view(src,7)<<"[src] tried to equip themself with the hellish [ITEM.ItemType], but its energy backfired into [src]'s arm and tore it off of their body!"
				RightArmHP=0
				CanUseRightArm=0
				HasRightArm=0
				BloodContent-=20
				BloodLoss()
				RightArm="Destroyed"
				LimbLoss()
				LimbFling("Right Arm")
				if(DropItem(ITEM)) ITEM.Fling()
				return
		WeaponDamageMin+=ITEM.WeaponDamageMin
		WeaponDamageMax+=ITEM.WeaponDamageMax
		Defence+=ITEM.Defence
		BowOn=0
		ITEM.suffix="(Equipped)"
		RebuildOverlays()
		switch(ITEM.EquipmentType())
			if("Weapon") HoldingWeapon=ITEM.ItemType
			if("Armour") switch(ITEM.ItemType)
				if("Helmet")WearingHelmet=1
				if("Cape")WearingCape=1
				if("Neckguard")WearingFullPlateHelm=1
				if("Quiver")WearingBack=1
				if("Chestplate")WearingChest=1
				if("LeftArm")WearingLeftArm=1
				if("RightArm")WearingRightArm=1
				if("Leggings")WearingLegs=1
				if("Shield")WearingShield=1
				if("Crown")WearingCrown=1
		return(ITEM)
	UnEquipItem(obj/Items/ITEM,MANUAL) if(ITEM.EquipmentType()&&ITEM.suffix=="(Equipped)"&&ITEM.loc==src)
		if(ITEM.ItemType!="Crown" || MANUAL) return(ForceUnEquipItem(ITEM))
	ForceUnEquipItem(obj/Items/ITEM)
		WeaponDamageMin-=ITEM.WeaponDamageMin
		WeaponDamageMax-=ITEM.WeaponDamageMax
		Defence-=ITEM.Defence
		BowOn=0
		ITEM.suffix="(Carrying)"
		switch(ITEM.EquipmentType())
			if("Weapon") HoldingWeapon=0
			if("Armour") switch(ITEM.ItemType)
				if("Helmet")WearingHelmet=0
				if("Cape")WearingCape=0
				if("Neckguard")WearingFullPlateHelm=0
				if("Quiver")WearingBack=0
				if("Chestplate")WearingChest=0
				if("LeftArm")WearingLeftArm=0
				if("RightArm")WearingRightArm=0
				if("Leggings")WearingLegs=0
				if("Shield")WearingShield=0
				if("Crown")WearingCrown=0
		RebuildOverlays()
		return(ITEM)
obj/Items/Equipment/DblClick() if(ItemType)
	if(ismob(loc))
		var/mob/M=loc
		if(M.Owner!=usr) return
		var/list/menu=new()
		if(EquipmentType())menu+="Equip/UnEquip"
		if(icon_state == "NecroStaff")menu += "Raise Skeleton"
		if(ItemType=="Quiver")menu+="Drop Arrows"
		menu+="Inspect"
		menu+="Drop"
		menu+="Cancel"
		var/Result=input("What would you like to do with the [src]?","Choose",null)in menu
		switch(Result)
			if("Equip/UnEquip")M.ToggleEquipItem(ITEM=src,MANUAL=1)
			if("Raise Skeleton")
				if(M.Mana >= 15) for(var/obj/Items/Bones/Skull/B in oview(M))
					var/mob/Monsters/Skeleton/Z = new(B.loc)
					view(M) << "[M] fires a bolt of death energy into [B], raising an evil creature from the bones!"
					Z.ChangeOwnership(usr)
					Z.name = "[M.name]'s Skeleton"
					M.Mana -= 15
					M.Hunger -= 25
					M.NecromancySkill += 0.25
					Z.PillarPowerup()
					Z.GainEXP(M.NecromancySkill*4)
					del(B)
					break
				else usr << "[M] needs 15 mana to do this."
			if("Drop Arrows") for(var/obj/Items/Arrows/A in src)
				A.loc = M.loc
				src.Content -= 1
			if("Inspect")
				usr<<"\icon[src] <b>[name]</b>"
				if(WeaponDamageMin||WeaponDamageMax)usr<<"Deals [WeaponDamageMin] to [WeaponDamageMax] Damage"
				if(ItemType=="Quiver")usr<<"Has [Content] arrows."
				if(Defence)usr<<"Grants [Defence] defence."
				if(weight) usr<<"Weighs [weight] units."
			//	if(desc)usr<<desc
				usr<<"" //just the same as including a "<br>" at the end, stops people from getting as confused when looking at lots of items.
			if("Drop")M.DropItem(src)
	else if(!suffix) for(var/mob/Monsters/M in usr.Selected) if(M.PickUpItem(src,1)) return(1)