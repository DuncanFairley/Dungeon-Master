mob
	Monsters
		Drill
			icon = 'MetalObjects.dmi'
			icon_state = "Drill"
			CantKill = 1
			density = 0
			Drill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a drill, it can be used to extract ore from the ground.This type of drill can be placed in the ground and twisted around to dig with."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.Owner == usr)
					if(src.InHole == 0)
						if(src.Sleeping == 0)
							if(usr.Selected.Find(src))
								usr.Selected.Remove(src)
								usr.client.images -= src.Star
							else
								usr.Selected.Add(src)
								usr.client.images += src.Star