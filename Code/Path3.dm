/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/
atom
	var
		destination

mob





	proc/WalkToA()
		if(src)
			if (destination)
				var/mob/m = src.destination
				src.loc = m.loc




		spawn(1) WalkToA()

	proc/WalkTo()
		if(src.Fainted == 0)
			if(src.CanWalk)
				if(Stunned == 0)
					if(src.Freeze)
						return
					if (destination)
						step_towards(src,src.destination)
						if (src.loc == destination)
							destination = null




		spawn(src.Delay) WalkTo()



/**
proc/WalkTo()
		if(src)
			if(src.Fainted == 0)
				if(src.CanWalk == 1)
					if(src.Freeze == 1)
						return
					if (destination)
						base_StepTowards(destination)
						if (src.loc == destination)
							destination = null




		spawn(4) WalkTo()

**/