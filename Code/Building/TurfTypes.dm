turf/grounds
	Enter(atom/m)
		if(usr)
			if(usr.key) return(1)
			if(icon_state=="GoodGrass") if(usr.Infects || usr.Undead || usr.Unholy || usr.Race == "Svartalfar" || usr.Race == "Demon")
				if(!density)
					density=1
					spawn() density=0
				return
			if(m.IsMist) return(1)
			if(!density) for(var/atom/M in src) if(M.density) if(m.density) return
			else return
		return(1)
	DblClick() for(var/mob/Monsters/M in usr.Selected)
		for(var/obj/DigAt/D in view(0,src)) if(D.Owner == M)
			M.destination = null
			M.DigTarget = null
			del(D)
			return
		if(src.density == 1) if(M.Dig == 1)
			M.destination = null
			var/obj/DigAt/D2 = new
			D2.loc = locate(src.x,src.y,src.z)
			D2.Owner = M
	desert
		name = "desert"
		icon = 'Cave.dmi'
		icon_state = "Desert"
		Sky = 1
		Content3 = "CanClimb"
		OIcon = "Desert"
		text = "<font color=#FFFF66>×"
	snow
		name = "snow"
		icon = 'Cave.dmi'
		icon_state = "Snow"
		Content3 = "CanClimb"
		OIcon = "Snow"
		Sky = 1
		text = "<font color=#F8F8F8>×"
	marsh
		name = "marsh"
		icon = 'Cave.dmi'
		icon_state = "Marsh"
		Sky = 1
		Content = "Marsh"
		Content3 = "CanClimb"
		OIcon = "Marsh"
		text = "<font color=#00CC66>×"
		New() switch(rand(1,16))
			if(1) icon_state = "Tropical1"
			if(2) icon_state = "Tropical2"
			if(3) icon_state = "Tropical3"
			if(4) icon_state = "Tropical4"
			if(5) icon_state = "Tropical5"
			if(6 to 15) icon_state = "Marsh"
	grass
		name = "grass"
		icon = 'Cave.dmi'
		icon_state = "Grass"
		Sky = 1
		Content3 = "CanClimb"
		OIcon = "Grass"
		text = "<font color=#33CC33>×"
	deadgrass
		name = "dead grass"
		icon = 'Cave.dmi'
		icon_state = "DeadGrass"
		Sky = 1
		Content3 = "CanClimb"
		OIcon = "DeadGrass"
		text = "<font color=#003333>×"
	goodgrass
		name = "flowery grass"
		icon = 'Cave.dmi'
		icon_state = "GoodGrass"
		Sky = 1
		Content3 = "CanClimb"
		OIcon = "GoodGrass"
		text = "<font color=#66FF00>×"
	cavefloor2
		name = "cavefloor"
		icon = 'Cave.dmi'
		icon_state = "CaveFloor"
		OIcon = "CaveFloor"
		CanDigAt = 0
		Sky = 1
		text = "<font color=#999933>×"
	WoodWall
		name = "Wooden Wall"
		icon = 'Cave.dmi'
		icon_state = "WoodWall"
		density = 1
		IsWood = 1
		CanDigAt = 1
		IsWall = 1
		HP = 8000
		OIcon = "Grass"
		text = "<font color=#999900>#"
		opacity = 1
	DetailedFloor
		name = "stone floor"
		icon = 'Cave.dmi'
		icon_state = "DetailedFloor"
		CanDigAt = 0
		text = "<font color=#808080>×"
	Stairs
		Detailed=1
		icon='Stairs.dmi'
		Down icon_state="AncientDown"
		Up icon_state="AncientUp"
		var/DEFAULT_UNDERLAY="DetailedFloor"
		New()
			underlays+=icon('Cave.dmi',DEFAULT_UNDERLAY)
			return(..())
	cellarfloor
		icon = 'Cave.dmi'
		icon_state = "CaveWall"
		density = 1
		CanDigAt = 1
		HP = 100
		opacity = 1
		Cant = 1
		OIcon = "CaveFloor"
		text = "<font color=#999933>#"
	NoDig
		name = "Impenetrible Mountain"
		icon = 'Cave.dmi'
		icon_state = "CaveWall"
		density = 1
		HP = 1000000
		opacity = 1
		Cant = 0
		Sky = 1
		text = "<font color=#999933>#"
	hellfloor
		name = "hellfloor"
		icon = 'Cave.dmi'
		icon_state = "HellFloor"
		Cant = 1
		OIcon = "HellFloor"
		text = "<font color=#990033>×"
	hellcliff
		name = "HellCliff"
		icon = 'Cave.dmi'
		icon_state = "HellCliff"
		density = 1
		CanDigAt = 1
		HP = 100
		opacity = 1
		Cant = 1
		OIcon = "CaveFloor"
		text = "<font color=#999933>#"
	cavefloor
		name = "Mountain"
		icon = 'Cave.dmi'
		icon_state = "CaveWall"
		density = 1
		CanDigAt = 1
		HP = 100
		opacity = 1
		Cant = 0
		Sky = 1
		OIcon = "CaveFloor"
		text = "<font color=#999966>#"
	DetailedWall2
		name = "DetailedWall"
		icon = 'Cave.dmi'
		icon_state = "DetailedWall"
		density = 1
		CanDigAt = 1
		HP = 300000
		IsWall = 1
		opacity = 1
		text = "<font color=##888888>#"
	Tomb
		icon = 'Tomb.bmp'
		density = 1
		opacity = 0
	DetailedWall
		name = "DetailedWall"
		icon = 'Cave.dmi'
		icon_state = "DetailedWall"
		density = 1
		CanDigAt = 1
		IsWall = 1
		HP = 3000000
		opacity = 1
		text = "<font color=#888888>#"
	WoodFloor
		name = "wood floor"
		icon = 'Cave.dmi'
		IsWood = 1
		icon_state = "WoodFloor"
		OIcon = "Grass"
		text = "<font color=#666633>w"
	Chasm
		name = "Chasm"
		icon = 'Cave.dmi'
		icon_state = "Chasm"
		Content = "Chasm"
		text = "<font color=#181818>×"
	Sky
		name = "Sky"
		icon = 'Cave.dmi'
		icon_state = "Sky"
		Content3 = "Peak"
		Content = "Sky"
		OIcon = "Sky"
		text = "<font color=#33FFFF>×"
	MountainPeak
		icon = 'Cave.dmi'
		icon_state = "Peak"
		name = "peak"
		Content3 = "Peak"
		OIcon = "Peak"
		text = "<font color=#CC9900>×"
	lavas
		Content3 = "Lava"
		lava
			name = "Lava"
			icon = 'Lava.dmi'
			icon_state = "Lava"
			density = 1
			Cant = 1
			Content = "Lava"
			text = "<font color=#FF0000>L"
	Trees
		density = 1
		layer = 4
		opacity = 1
		HP = 250
		Sky = 1
		name = "Tree"
		text = "<font color=#99FF00>T"

		Tree1
			icon = 'plants.dmi'
			icon_state = "tree 2x1"
			Tree = 1
			IsWood = 1
			OIcon = "Grass"
			text = "<font color=#99FF00>T"
			New()
				src.overlays += /obj/Trees/tree2x2
				src.overlays += /obj/Trees/tree1x2
				src.overlays += /obj/Trees/tree3x2
				src.overlays += /obj/Trees/leaves3x2
				src.overlays += /obj/Trees/leaves2x2
				src.overlays += /obj/Trees/leaves1x2
				src.overlays += /obj/Trees/leaves1x1
				src.overlays += /obj/Trees/leaves2x1
				src.overlays += /obj/Trees/leaves3x1
				src.density = 1
				src.icon = 'plants.dmi'
				src.icon_state = "tree 2x1"
		GoodTree
			icon = 'plants.dmi'
			icon_state = "GoodTree"
			Tree = 1
			IsWood = 1
			OIcon = "GoodGrass"
			Content3 = "GoodTree"
			text = "<font color=#99FF00>T"
			New()
				src.overlays += /obj/Trees/tree2x2
				src.overlays += /obj/Trees/tree1x2
				src.overlays += /obj/Trees/tree3x2
				src.overlays += /obj/Trees/leaves3x2
				src.overlays += /obj/Trees/leaves2x2
				src.overlays += /obj/Trees/leaves1x2
				src.overlays += /obj/Trees/leaves1x1
				src.overlays += /obj/Trees/leaves2x1
				src.overlays += /obj/Trees/leaves3x1
				src.density = 1
				src.icon = 'plants.dmi'
				src.icon_state = "GoodTree"
		TundraTree
			icon = 'plants.dmi'
			icon_state = "PermSnow"
			Tree = 1
			Content3 = "PermTree"
			OIcon = "Snow"
			IsWood = 1
			text = "<font color=#F8F8F8>T"
			New()
				src.overlays += /obj/Trees/tree2x2
				src.overlays += /obj/Trees/tree1x2
				src.overlays += /obj/Trees/tree3x2
		DeadTree
			icon = 'plants.dmi'
			icon_state = "DeadGrassTree"
			Tree = 1
			Content3 = "EvilTree"
			OIcon = "DeadGrass"
			IsWood = 1
			name = "Dead Tree"
			text = "<font color=#505050>T"
			New()
				src.overlays += /obj/Trees/tree2x2
				src.overlays += /obj/Trees/tree1x2
				src.overlays += /obj/Trees/tree3x2
		Bamboo
			icon = 'Cave.dmi'
			icon_state = "Bamboo"
			Tree = 1
			Bamboo = 1
			name = "Bamboo"
			Content = "Marsh"
			IsWood = 1
			OIcon = "Marsh"
			text = "<font color=#99FF00>B"
		Cactus
			icon = 'Cave.dmi'
			icon_state = "Cactus"
			Tree = 1
			Cactus = 1
			name = "Cactus"
			OIcon = "Desert"
			text = "<font color=#99FF00>C"
		Tree2
			icon = 'Trees.dmi'
			icon_state = "1"
		Tree3
			icon = 'Trees.dmi'
			icon_state = "1"
	DesertWater
		Content3 = "Liquid"
		icon = 'water.dmi'
		icon_state = "water"
		density = 1
		CanFish = 1
		Detailed = 1
		OIcon = "water"
		text = "<font color=#0000CC>W"

	waters
		Content3 = "Liquid"
		swamp
			name = "Swamp"
			icon = 'Swamp.dmi'
			icon_state = "water"
			density = 1
			CanFish = 1
			Detailed = 1
			Content = "Swamp"
			OIcon = "Swamp"
			text = "<font color=#00CC99>S"


		water
			name = "Water"
			icon = 'water.dmi'
			icon_state = "water"
			density = 1
			CanFish = 1
			Detailed = 1
			Content = "Water"
			OIcon = "water"
			text = "<font color=#0000CC>W"

		underwater
			icon = 'water.dmi'
			icon_state = "water"
			density = 1
			CanFish = 1
			CaveWater = 1
			Detailed = 1
			Content = "CaveWater"
			OIcon = "water"
			text = "<font color=#0000CC>W"