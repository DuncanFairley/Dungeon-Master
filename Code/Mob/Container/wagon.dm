mob
	Monsters
		Wagon
			icon = 'Cave.dmi'
			icon_state = "Wagon"
			density = 0
			weightmax = 1000
			Wagon = 1
			CantKill = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			HasLeftLeg = 1
			Delay = 4
			HasRightLeg = 1
			Fainted = 0
			CanWalk = 1
			New()
				WalkTo()
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