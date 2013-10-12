mob/proc/Death()
	if(key||CantKill||Wagon) return
	if(src.GoingToDie)
		if(src.Race == "Kobold")
			if(src.Level >= 20)
				for(var/mob/Monsters/K in list(new/mob/Monsters/Kobold(loc),new/mob/Monsters/Kobold(loc)))
					var/obj/Items/Equipment/Weapon/Spears/Spear/S = new(loc)
					S.PoisonDMG = 10
					S.WeaponDamageMin = 15
					S.WeaponDamageMax = 20
					S.name = "Spear - Poor Quality {Poisoned}"
					S.Poisoned = 1
					K.destination = src.destination
					if(K.PickUpItem(S)) K.EquipItem(S)
					K.ChangeOwnership(Owner)
				view(src) << "Enraged by the death of [src], two kobolds jump out of the underbrush and attack!"
		src.destination = null
		if(src.Killer && ismob(src.Killer)) if(!Critter)
			var/mob/K = src.Killer
			if(!Undead)
				for(var/obj/Items/Equipment/Weapon/DemonicWeapons/SoulBlade/S in K) if(S.suffix == "(Equipped)")
					if(S.WeaponDamageMin<60)
						S.WeaponDamageMin+=Level/150
						K.WeaponDamageMin+=Level/150
					if(S.WeaponDamageMax<80)
						S.WeaponDamageMin+=Level/150
						K.WeaponDamageMin+=Level/150
					if(S.WeaponDamageMin>60)
						K.WeaponDamageMin-=S.WeaponDamageMin-60
						S.WeaponDamageMin=60
					if(S.WeaponDamageMax>80)
						K.WeaponDamageMax-=S.WeaponDamageMax-80
						S.WeaponDamageMax=80
					K.Owner << "[S.name] absorbs the soul of the slain creature and gains it's power!"
			if(Killer!=src)
				var/EXPREWARD=EXPNeeded+Level+Strength+Agility//-100
				switch(Race)
					if("Dragon") EXPREWARD*=2
					if("Spider") EXPREWARD*=0.75
					if("Skeleton") EXPREWARD*=0.4
				for(var/mob/Monsters/M in view(K,6)) if(M.Owner != src.Owner) if(M != K) if(M.Owner==K.Owner) M.GainEXP(EXPREWARD*0.1)
				K.GainEXP(EXPREWARD)
				if(ismob(K.Owner)) if(K != src)
					K.Owner<<"[Killer] gained [EXPREWARD*ExperienceMultiplier] Experience for slaying [src]"
					var/mob/KO = K.Owner
					KO.Kills += 1
				if(!ismob(Owner)) K.MakeHostile("[Owner]",18000)
		if(ismob(src.Owner))
			var/mob/S = src.Owner
			if(IsRoyal)
				S.CoolDown("[GenderToLeader(Gender)]",36000)
				S << "[src] has been slain! You now must wait a full hour before you may declare a new [GenderToLeader(Gender)]."
			S.UnitList -= src
		for(var/atom/movable/A in src) DropItem(A)
		MakeBody(loc)
		for(var/obj/DigAt/DD in world) if(DD.Owner == src.Owner) del(DD)
		if(ismob(Owner)) if(!Critter) Legends = {"[Legends]<p>[src] - Died [Date] at age [Age], [name] had reached level [Level] before being killed by [Killer] and died from [DeathType]"}
		del(src)
mob/proc/MakeBody(LOC)
	switch(Race)
		if("Skeleton")
			var/obj/Items/Bones/Bones/C = new(LOC)
			C.name = "[src]'s Bones"
			var/obj/Items/Bones/Skull/C2 = new(LOC)
			C2.name = "[src]'s Skull"
			del(src)
		if("TowerCap")
			new/obj/Items/woods/wood(LOC)
			new/obj/Items/Food/Fungus(LOC)
			new/obj/Items/Seeds/TowerCapSeed(LOC)
			new/obj/Items/Seeds/TowerCapSeed(LOC)
			del(src)
	if(Flying)
		Flying=0
		switch(Race)
			if("Vampire")
				icon = 'Vampire.dmi'
				LimbLoss()
				icon = turn(icon,90)
			if("Demon")
				icon = 'Demon.dmi'
				LimbLoss()
				icon = turn(icon,90)
			if("Gargoyle")
				icon = 'Gargoyle.dmi'
				LimbLoss()
				icon = turn(icon,90)
	var/icon/ICON = new('Hair.dmi',"") //This has a blank 32x32 icon with a movement state.
	ICON.Blend(icon(icon,icon_state),ICON_OVERLAY)
	if(!Critter) if(Gender=="Female") if(!Werepowers) switch(Race)
		if("Human","Dwarf","Elf")
			ICON.Blend(icon('Female.dmi',"Unders",SOUTH,1,1),ICON_OVERLAY)
			if(Black) ICON.Blend(icon('Female.dmi',"BlackHair"),ICON_OVERLAY)
			else ICON.Blend(icon('Female.dmi',"Hair"),ICON_OVERLAY)
		if("Dragon","Spider")
		else ICON.Blend(icon('Female.dmi',"Shirt"),ICON_OVERLAY)
	if(Beard) ICON.Blend(icon('Beards.dmi',Beard),ICON_OVERLAY)
	if(Hair) ICON.Blend(icon('Hair.dmi',Hair),ICON_OVERLAY)
	var/mob/Body/B = new(LOC)
	B.icon = ICON
	B.icon_state = icon_state
	B.icon = turn(B.icon,90)
	CarryPartStats(B)
	B.Owner = "[Owner]"
	B.name = "[src]'s Body"
	if(OnFire&&HumanParts)
		B.icon = 'DamagedParts.dmi'
		B.Skinned = 1
	B.Critter=Critter
	if(Race == "CaveSpider") B.weight = 10
	if(Race == "Plant") B.icon_state = "Dead[SubRace]"
mob/proc/TearSkin(mob/Body/BODY,Telling=0) if(BODY.loc==src)
	if(!BODY.Skinned)
		BODY.Skinned=1
		var/obj/Items/SKIN
		switch(BODY.Race)
			if("Fish","Spider","CaveSpider","Plant","DeathBeatle","Skeleton")
			else
				SKIN=new/obj/Items/Skin(loc)
				SKIN.icon_state=BODY.Race //In the icon file used, it's quite exact race to state name.
				SKIN.name="[BODY.Race] Skin"
				if(BODY.Black) SKIN.icon_state="[icon_state]Black"
				if(BODY.Infects) SKIN.icon_state="Zombie"
		if(BODY.CarryPartStats(SKIN)) return(SKIN)
	else if(Telling) usr<<"[BODY] has already been skinned."
mob/proc/TearMeat(mob/Body/BODY) if(DropItem(BODY))
	BODY.MakeBone() //Notably, the first created is also at the bottom as far as icon drawing goes.
	BODY.MakeSilk()
	BODY.MakeMeat()
	BODY.MakeGland()
	BODY.MakeHead()
	del(BODY)
mob/proc/MakeSkin(LOC=loc) //It's VERY unlikely that this proc will ever be used more than once in the code, but for the sake of being constant.
mob/proc/MakeHead(LOC=loc)
	var/obj/Items/HEAD
	switch(Race)
		if("Fish","Spider","CaveSpider","Plant","DeathBeatle")
		if("Dragon","Skeleton") //Needa give dragons some head icons.. that'll take a while.
			HEAD=new/obj/Items/Bones/Skull(LOC)
			HEAD.name="[name]'s Skull"
		else
			HEAD=new/obj/Items/Bones/Head(LOC)
			HEAD.icon_state=Race
			if(Black) HEAD.icon_state="[icon_state]Black"
			if(Infects) HEAD.icon_state="Zombie"
			if(Werepowers) HEAD.icon_state="Werewolf"
			HEAD.name="[name]'s Head"
	if(CarryPartStats(HEAD)) return(HEAD)
mob/proc/MakeBone(LOC=loc)
	var/obj/Items/BONE
	switch(Race)
		if("CaveSpider","Gargoyle","Plant")
		if("DeathBeatle","Spider")
			BONE=new/obj/Items/Bones/Shell(LOC)
			if(Race=="Spider")BONE.name="[Race] Chitin"
			else BONE.name="[Race] Shell"
		else
			BONE=new/obj/Items/Bones/Bones(LOC)
			BONE.name="[Race] Bones"
	if(CarryPartStats(BONE)) return(BONE)
mob/proc/MakeMeat(LOC=loc)
	var/obj/Items/MEAT
	switch(Race)
		if("Plant","Skeleton")
		if("Gargoyle")
			MEAT=new/obj/Items/ores/stone(LOC)
			MEAT.name="[name]'s Stone"
		else
			MEAT=new/obj/Items/Food/Meat(LOC)
			MEAT.name="[Race] Meat"
	if(CarryPartStats(MEAT)) return(MEAT)
mob/proc/MakeSilk(LOC=loc)
	var/obj/Items/SILK
	if(prob(WebContent)||Race=="CaveSpider"&&prob(25))
		SILK=new/obj/Items/Silks/SpiderSilk(LOC)
		SILK.name="[Race] Silk"
	if(CarryPartStats(SILK)) return(SILK)
mob/proc/MakeGland(LOC=loc)
	var/obj/Items/Glands/GLAND
	switch(HasGland)
		if(1) GLAND = new/obj/Items/Glands/PoisonGland(LOC)
		if(2) GLAND = new/obj/Items/Glands/PoisonRoots(LOC)
		if(3) GLAND = new/obj/Items/Glands/ToxicGland(LOC)
	if(CarryPartStats(GLAND)) return(GLAND)
mob/proc/CarryPartStats(atom/movable/PART) if(PART) //Whenever a new part is created (Bodies too), some stats need to be carried to it. This also allows us to better control the values of those stats.
	PART.Strength=Strength
	PART.Agility=Agility
	PART.Intelligence=Intelligence
	PART.Defence=Defence //Items are un-equipped before the dead body is created, so we get the value without armour applied.
	PART.Level=Level
	PART.EXP=EXP
	PART.EXP=EXPNeeded
	PART.HasGland=HasGland
	PART.Race=Race
	PART.SubRace=SubRace
	PART.Werepowers=Werepowers //Most parts actually look diffrent based on this var rather than race, due to if you killed em in day or night.
	PART.Black=Black //Although only really used for skins and heads, we'll carry it to everything to save making extra lines of code.
	PART.Beard=Beard //Yup, them dwarves. So many exceptions just for their beards...
	PART.Hair=Hair
	PART.WebContent=WebContent
	PART.MaxWebContent=MaxWebContent
	return(1) //The only time 1 wouldn't be returned, is if Part doesn't exist.



mob/Body
	density = 0
	Body = 1
	layer = 4
	DieAge = 1
	IsWood = 0
	weight = 40
	density = 0
	desc = "This is a body, it can be used as food or burial, or will provide bones."
	New() BodyDecay()
	DblClick()
		for(var/mob/Monsters/M in usr.Selected)
			if(src in view(1,M))
				M.destination = null
				if(src.suffix == null)
					if(M.weight <= M.weightmax)
						src.loc = M
						src.suffix = "(Carrying)"
						M.weight += src.weight
						return
					else
						if(M.Wagon == 0)
							usr << "[M] : I cant Carry Too Much!"
						return
		for(var/mob/Monsters/M in usr.Selected)
			if(src.loc == M)
				if(src.suffix == "(Carrying)")
					M.destination = null
					if(src in M)
						if(M.Wagon == 0)
							var/list/menu = new()
							menu += "Drop"
							menu += "Inspect"
							for(var/obj/Items/Shafts/WoodenSpade/S in M) menu += "Bury"
							for(var/obj/Items/Shafts/Spade/S in M) menu += "Bury"
							if(M.Carn || M.HoldingWeapon == "Butcher Knife" || M.HoldingWeapon == "Dagger")
								menu += "Tear Meat Off"
								menu += "Tear Skin Off"
							if(icon != 'Cave.dmi' && Race!="FleshCrawler") if(!Critter)
								if(M.Race == "Devourer") menu += "Incorporate Mass"
					//			if(M.Werepowers == 1) menu += "Devour"
							menu += "Cancel"
							var/Result = input("What Action Will You Choose?", "Choose", null) in menu
							if (Result != "Cancel")
								..()
							if (Result == "Inspect") usr << src.desc
							if (Result == "Drop")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									A1.loc = M.loc
									A1.suffix = null
									M.weight -= A1.weight
									return
							if (Result == "Incorporate Mass")
								if(src.suffix == "(Carrying)")
									var/obj/A1 = src
									M.weight -= A1.weight
									M.EggContent += 1
									del A1
							if (Result == "Bury")
								if(src in M)
									var/obj/Items/Graves/Grave/G = new
									G.loc = M.loc
									var/mob/A2 = src
									A2.loc = G
									M.weight -= src.weight
									A2.suffix = null
									A2.suffix = "(Burried)"
									return
							if (Result == "Tear Skin Off") if(src in M) M.TearSkin(src,1)
							if (Result == "Tear Meat Off") if(src in M) M.TearMeat(src)

obj/Items/Bones
	New() DeleteItem()
	DblClick()
		if(ismob(loc))
			var/mob/M=loc
			if(M.Owner!=usr) return
			var/list/menu=new()
			if(istype(src,/obj/Items/Bones/Head/))
				if(M.Race == "Illithid") menu += "Eat Brain"
				menu += "Make Into Skull"
				for(var/obj/Items/Traps/Spikes/S in M) menu += "Put On Spike"
			menu+="Inspect"
			menu+="Drop"
			menu+="Cancel"
			var/Result=input("What would you like to do with the [src]?","Choose",null)in menu
			if(src in M) switch(Result)
				if("Eat Brain")
					M.Hunger += 100
					if(M.Hunger>M.MaxHunger) M.Hunger=M.MaxHunger
					M.Intelligence += Intelligence / 25
					M.GainEXP(Intelligence*10)
					view(M) << "[M] sucks the brain out of [src] with their tentacles..."
					M.Owner << "[M] has gained [Intelligence / 25] intelligence."
					if(M.DropItem(src)) del(src)
				if("Put On Spike") for(var/obj/Items/Traps/Spikes/S in M) if(S.icon_state == "Spike") if(S.HasHeadOn == 0)
					S.name = name
					S.overlays += icon(icon,icon_state)
					S.HasHeadOn = 1
					if(M.DropItem(src)) del(src)
				if("Make Into Skull")
					var/obj/Items/Bones/Skull/SKULL = new(M.loc)
					SKULL.name = name
					if(M.DropItem(src)) del(src)
				if("Inspect")
					usr<<"\icon[src] <b>[name]</b>"
					if(weight) usr<<"Weighs [weight] units."
					if(desc)usr<<desc
					usr<<"" //just the same as including a "<br>" at the end, stops people from getting as confused when looking at lots of items.
				if("Drop")M.DropItem(src)
		else if(!suffix) for(var/mob/Monsters/M in usr.Selected) if(M.PickUpItem(src,1)) return(1)
	SkullPile
		icon = 'Cave.dmi'
		icon_state = "SkullPile"
		weight = 10
		desc = "This is a skull pile, it looks scary."
	Shell

		icon = 'Cave.dmi'
		icon_state = "Shell"
		weight = 10
		desc = "This is a hard shell, it can be used for crafting or burial."
	BloodyLimb
		icon = 'Blood.dmi'
		icon_state = "Arm"
		weight = 5
		desc = "This is limb, it's useless to hold onto."
	Head
		icon = 'Heads.dmi'
		icon_state = "FrogManHead"
		weight = 10
		desc = "This is a head, it can be stuck on a spike to warn invaders!"
	Skull
		icon = 'Cave.dmi'
		icon_state = "Skull"
		weight = 10
		desc = "This is a skull, it can be used for bone crafting or burial"
	Bones
		icon = 'Cave.dmi'
		icon_state = "Bone"
		weight = 10
		desc = "These are bones, they can be used for bone crafting or burial"


obj/Items/Glands
	New() ItemDecay()
	PoisonRoots
		icon = 'Animal.dmi'
		icon_state = "Gland"
		weight = 10
		suffix = null
		desc = "This is a posion root, it can be used to add posion to weapons, traps or food but first must be extracted."
	ToxicGland
		icon = 'Cave.dmi'
		icon_state = "Gland"
		weight = 10
		suffix = null
		desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
	PoisonGland
		name = "PoisonGland"
		icon = 'Cave.dmi'
		icon_state = "Gland"
		weight = 10
		suffix = null
		desc = "This is a posion gland, it can be used to add posion to weapons, traps or food but first must be extracted."
	DblClick()
		if(ismob(loc))
			var/mob/M=loc
			if(M.Owner!=usr) return
			M.DropItem(src)
		else if(!suffix) for(var/mob/Monsters/M in usr.Selected) if(M.PickUpItem(src,1)) return(1)