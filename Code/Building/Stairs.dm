var/const
	GROUND_LAYER=1
	UNDERGROUND_LAYER=2
	SKY_LAYER=3
	HELL_LAYER=4
obj/HUD/Stairs
	name = "Stairs"
	icon='Stairs.dmi'
	icon_state = "AncientDown"
	text = "S"
	DblClick()
		for(var/mob/Monsters/M in usr.Selected) if(M.z!=HELL_LAYER) if(isturf(M.loc))
			var/TYPE
			switch(M.Race)
				if("Spider")
					if(M.WebContent>=100) TYPE="Spider"
					else
						usr<<"You need at least 100 web content to build stairs."
						break
			if(!TYPE)
				var/list/TYPES=new()
				if(M.HasItem(/obj/Items/woods/wood/))
					TYPES+="Wood"
					if(M.Race=="Lizardman" || M.Race=="Frogman") TYPES+="Bamboo"
				if(M.HasItem(/obj/Items/ores/stone/))
					TYPES+="Stone"
					TYPES+="Ancient"
				if(M.UsesPoison) if(M.HasItem(/obj/Items/Bones/Bones/))
					TYPES+="Bone"
				TYPES+="Cancel"
				TYPE=input("What kind of stairs would you like to create?","Stair Material") in TYPES
			if(TYPE=="Cancel") break

			var/DIR
			var/list/DIRS=new()
			if(M.z==GROUND_LAYER || M.z==UNDERGROUND_LAYER) DIRS+="Up"
			if(M.z==GROUND_LAYER || M.z==SKY_LAYER) DIRS+="Down"
			DIRS+="Cancel"
			DIR=input("What direction would you like to build the stairs in?","Stair Direction") in DIRS
			if(DIR=="Cancel") break
			if(isturf(M.loc) && M.z!=HELL_LAYER)
				var/LEVEL
				switch(DIR)
					if("Up") switch(M.z)
						if(GROUND_LAYER) LEVEL=SKY_LAYER
						if(UNDERGROUND_LAYER) LEVEL=GROUND_LAYER
						if(SKY_LAYER) break
					if("Down") switch(M.z)
						if(GROUND_LAYER) LEVEL=UNDERGROUND_LAYER
						if(UNDERGROUND_LAYER) break
						if(SKY_LAYER) LEVEL=GROUND_LAYER
				var/turf/LOC1=M.loc
				var/turf/LOC2=locate(LOC1.x,LOC1.y,LEVEL)
				if(LOC2.density || LOC2.opacity) if(LOC2.icon_state!="CaveWall")
					usr<<"There's something blocking you from building stairs here."
					break
				if(LOC1.density || LOC1.opacity || LOC1.icon=='Stairs.dmi' || LOC2.icon=='Stairs.dmi')
					usr<<"There's something blocking you from building stairs here."
					break
				if(LOC2.Detailed && DIR=="Up")
					usr<<"There's something blocking you from building stairs here."
					break
				if(TYPE!="Spider")
					var/obj/Items/MAT
					switch(TYPE)
						if("Wood","Bamboo") MAT=M.HasItem(/obj/Items/woods/wood/)
						if("Stone","Ancient") MAT=M.HasItem(/obj/Items/ores/stone/)
						if("Bone") MAT=M.HasItem(/obj/Items/Bones/Bones/)
					if(MAT) if(M.DropItem(MAT)) del(MAT)
					else break
				else
					if(M.WebContent>=100) M.WebContent-=100
					else break

				LOC2.ClearTurf()
				for(var/turf/T in list(LOC1,LOC2))
					T.underlays+=icon(T.icon,T.icon_state)
					T.icon='Stairs.dmi'
					T.Detailed=1
				LOC1.icon_state="[TYPE][DIR]"
				if(DIR=="Up") LOC2.icon_state="[TYPE]Down"
				else LOC2.icon_state="[TYPE]Up"
				M.z=LEVEL
			break
		usr.Close()