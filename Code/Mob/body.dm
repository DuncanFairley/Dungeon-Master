mob
	Test //Apparently you can't just delete this line...
	Body
		density = 0
		Body = 1
		layer = 4
		DieAge = 1
		IsWood = 0
		weight = 40
		density = 0
		desc = "This is a body, it can be used as food or burial, or will provide bones."
		New()
			BodyDecay()
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
				for(var/mob/O in M)
					if(O.loc == M)
						if(O.suffix == "(Carrying)")
							O.loc = M.loc
							O.suffix = null
							M.weight -= O.weight
							return