mob
	Monsters
		MetalChest
			icon = 'Cave.dmi'
			icon_state = "Metal Chest"
			density = 0
			weightmax = 500
			CantKill = 1
			Wagon = 1
			DieAge = 1000000
			Gender = null
			layer = 3.5
			suffix = null
			desc = "This is a metal chest, it can ued to store items in."
			New()
				var/image/I = new('mob.dmi',src)
				src.Star = I

			DblClick()
				if(src.suffix == null)
					if(src.Owner == usr)
						if(src.InHole == 0)
							if(src.Sleeping == 0)
								if(usr.Selected.Find(src))
									usr.Selected.Remove(src)
									usr.client.images -= src.Star
								else
									usr.Selected.Add(src)
									usr.client.images += src.Star