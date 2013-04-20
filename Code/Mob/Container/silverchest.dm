mob
	Monsters
		SilverChest
			icon = 'Cave.dmi'
			icon_state = "Silver Chest"
			density = 0
			weightmax = 500
			Wagon = 1
			DieAge = 1000000
			CantKill = 1
			Gender = null
			layer = 4
			suffix = null
			desc = "This is a silver chest, it can ued to store items in."
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