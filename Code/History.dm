

mob/proc/NPCGoblinName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Gud'don"
		if(2)
			name1 = "Smex'ma"
		if(3)
			name1 = "Lug'ex"
		if(4)
			name1 = "Gugo'plux"
		if(5)
			name1 = "Slash'da"
		if(6)
			name1 = "Qux'lix"
		if(7)
			name1 = "Te'lax"
		if(8)
			name1 = "Smo'mux"
		if(9)
			name1 = "Smaz'sma"
		if(10)
			name1 = "Gug'lu"
		if(11)
			name1 = "Quin'qui"
		if(12)
			name1 = "Plux'meg"
		if(13)
			name1 = "Blah'sma"
		if(14)
			name1 = "Puke'lex"
		if(15)
			name1 = "Snag'la"
		if(16)
			name1 = "Smog'liz"
		if(17)
			name1 = "Yug'lux"
		if(18)
			name1 = "Smas'max"
		if(19)
			name1 = "Xe'loh"
		if(20)
			name1 = "Qel'lex"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Snag'ma"
		if(2)
			name2 = "Smo'balix"
		if(3)
			name2 = "Ba'lix"
		if(4)
			name2 = "Kil'la"
		if(5)
			name2 = "Squah'lug"
		if(6)
			name2 = "Ash'meag"
		if(7)
			name2 = "Spog'mex"
		if(8)
			name2 = "Puk'wa"
		if(9)
			name2 = "Rux'pa"
		if(10)
			name2 = "Pug'pex"
		if(11)
			name2 = "Smack'erlex"
		if(12)
			name2 = "Cug'ma"
		if(14)
			name2 = "Cel'ix"
		if(15)
			name2 = "Trus'lus"
		if(16)
			name2 = "Bug'liz"
		if(17)
			name2 = "Rup'ture"
		if(18)
			name2 = "Diz'miz"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Tez'lek"
	src.name = "{NPC} [name1] [name2]"

mob/proc/NPCKoboldName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Smug"
		if(2)
			name1 = "Ug"
		if(3)
			name1 = "Lum"
		if(4)
			name1 = "Sharpy"
		if(5)
			name1 = "Oglux"
		if(6)
			name1 = "Megma"
		if(7)
			name1 = "Frug"
		if(8)
			name1 = "Snat"
		if(9)
			name1 = "Snoter"
		if(10)
			name1 = "Lux"
		if(11)
			name1 = "Pok"
		if(12)
			name1 = "Pleg"
		if(13)
			name1 = "Hugx"
		if(14)
			name1 = "Welb"
		if(15)
			name1 = "Smag"
		if(16)
			name1 = "Quag"
		if(17)
			name1 = "Quxlux"
		if(18)
			name1 = "Rebspa"
		if(19)
			name1 = "Xelog"
		if(20)
			name1 = "Slashma"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Snagtooth"
		if(2)
			name2 = "Slash"
		if(3)
			name2 = "Smorg"
		if(4)
			name2 = "Alag"
		if(5)
			name2 = "Egad"
		if(6)
			name2 = "Gad"
		if(7)
			name2 = "Icul"
		if(8)
			name2 = "Pukpuk"
		if(9)
			name2 = "Plem"
		if(10)
			name2 = "Deg"
		if(11)
			name2 = "Quickclaw"
		if(12)
			name2 = "Sneakers"
		if(14)
			name2 = "Trickster"
		if(15)
			name2 = "Smegle"
		if(16)
			name2 = "Trug'ug"
		if(17)
			name2 = "Po'log"
		if(18)
			name2 = "Mo'meg"
		if(19)
			name2 = "Ug'lex"
		if(20)
			name2 = "Ty'sme"
	src.name = "[name1] [name2]"
mob/proc/NPCHumanName()
	var/name1
	var/name2
	var/Pick2
	var/Pick1
	Pick1 = rand(1,20)
	switch(Pick1)
		if(1)
			name1 = "Talos"
		if(2)
			name1 = "Morgon"
		if(3)
			name1 = "Selious"
		if(4)
			name1 = "Dulert"
		if(5)
			name1 = "Yobert"
		if(6)
			name1 = "Maditz"
		if(7)
			name1 = "Franious"
		if(8)
			name1 = "Edmen"
		if(9)
			name1 = "Weltra"
		if(10)
			name1 = "Kelok"
		if(11)
			name1 = "Dargon"
		if(12)
			name1 = "Morgoth"
		if(13)
			name1 = "Belven"
		if(14)
			name1 = "Smith"
		if(15)
			name1 = "Ben"
		if(16)
			name1 = "Julious"
		if(17)
			name1 = "Almak"
		if(18)
			name1 = "Hulom"
		if(19)
			name1 = "Richard"
		if(20)
			name1 = "Patrick"
	Pick2 = rand(1,20)
	switch(Pick2)
		if(1)
			name2 = "Smith"
		if(2)
			name2 = "Megs"
		if(3)
			name2 = "Julip"
		if(4)
			name2 = "Tolan"
		if(5)
			name2 = "Tukoms"
		if(6)
			name2 = "Inles"
		if(7)
			name2 = "Curtious"
		if(8)
			name2 = "Mobaine"
		if(9)
			name2 = "Wesman"
		if(10)
			name2 = "Polom"
		if(11)
			name2 = "Cherly"
		if(12)
			name2 = "Statious"
		if(14)
			name2 = "Huknos"
		if(15)
			name2 = "Trucken"
		if(16)
			name2 = "Lilo"
		if(17)
			name2 = "Fredus"
		if(18)
			name2 = "Miloms"
		if(19)
			name2 = "Hobomes"
		if(20)
			name2 = "Tyken"
	src.name = "{NPC} [name1] [name2]"
world/proc/Date() Date = rand(1,1000)
world/proc/History()
	if(world)
		var/name1
		var/name2
		var/name3
		var/name4
		var/name5
		var/Pick=rand(1,14)
		switch(Pick)
			if(1)
				name1 = "Goblin"
			if(2)
				name1 = "Kobold"
			if(3)
				name1 = "Human"
			if(4)
				name1 = "Dwarf"
			if(5)
				name1 = "Vampire"
			if(6)
				name1 = "Spider"
			if(7)
				name1 = "Lizardmen"
			if(8)
				name1 = "Gremlin"
			if(9)
				name1 = "Great Old One"
			if(10)
				name1 = "Escaped Lunatic"
			if(11)
				name1 = "Cheese Golem"
			if(12)
				name1 = "Elve"
			if(13)
				name1 = "Demon"
			if(14)
				name1 = "Zombie Horde"
		var/Pick2 = rand(1,5)
		switch(Pick2)
			if(1)
				name2 = "A great fortress was established."
			if(2)
				name2 = "A great city was established."
			if(3)
				name2 = "A great kingdom was created."
			if(4)
				name2 = "A massive temple was created."
			if(5)
				name2 = "A huge circus was established."

		var/Pick3=rand(1,6)
		switch(Pick3)
			if(1)
				name3 = "Something terrible happened"
			if(2)
				name3 =  "Something went wrong"
			if(3)
				name3 = "Something evil happened"
			if(4)
				name3 = "Something unknowably awful happened."
			if(5)
				name3 = "Something strangely unnerving happened."
			if(6)
				name3 = "Nothing at all happened."
		var/Pick4=rand(1,3)
		switch(Pick4)
			if(1)
				name4 = "and the [name1]s were obliterated"
			if(2)
				name4 =  "and the [name1]s were all killed"
			if(3)
				name4 = "and many [name1]s died"
			if(4)
				name4 = "and the [name1]s dissappeared"
		var/Pick5=rand(1,3)
		switch(Pick5)
			if(1)
				name5= "many different races were drawn to [WorldName] in search of treasure and goods."
			if(2)
				name5 =  "news had spread to other races about new lands that the [name1]'s had found."
			if(3)
				name5 = "many other races found out about [WorldName] and decided to explore."

		History = "[WorldName] was first discovered by [name1]s in [Date/4],during this time [name2] In [Date/2] [name3] [name4].Then in [Date] [name5]"
world/proc/Age()
	if(world)
		var/name1
		var/name2
		var/name3
		var/Pick=rand(1,2)
		switch(Pick)
			if(1)
				name1 = "Age of the"
			if(2)
				name1 = "Time of the"
			if(3)
				name1 = "Aeon of the"
			if(4)
				name1 = "Boring Morning of the"
			if(5)
				name1 = "Golden Age of the"
			if(6)
				name1 = "Dark Age of the"
			if(7)
				name1 = "Last Days of the"
		var/Pick2 = rand(1,22)
		switch(Pick2)
			if(1)
				name2 = "Dark"
			if(2)
				name2 = "Lost"
			if(3)
				name2 = "Blood"
			if(4)
				name2 = "Mysterious"
			if(5)
				name2 = "Mad"
			if(6)
				name2 = "Hell"
			if(7)
				name2 = "Red"
			if(8)
				name2 = "Ancient"
			if(9)
				name2 = "Hidden"
			if(10)
				name2 = "Star"
			if(11)
				name2 = "Deadly"
			if(12)
				name2 = "Fantasy"
			if(13)
				name2 = "Unholy"
			if(14)
				name2 = "Rape"
			if(15)
				name2 = "Doom"
			if(16)
				name2 = "Crazy"
			if(17)
				name2 = "Murder"
			if(18)
				name2 = "Burning"
			if(19)
				name2 = "Hatred"
			if(20)
				name2 = "Mutilated"
			if(21)
				name2 = "Nasty"
			if(22)
				name2 = "Fairy"
		var/Pick3=rand(1,19)
		switch(Pick3)
			if(1)
				name3 = "Dwarf"
			if(2)
				name3 =  "Diamond"
			if(3)
				name3 = "Temple"
			if(4)
				name3 =  "Scroll"
			if(5)
				name3 = "Goblin"
			if(6)
				name3 = "Blood"
			if(7)
				name3 ="Dragon"
			if(8)
				name3 ="Fantasy"
			if(9)
				name3 = "Ugly"
			if(10)
				name3 = "Witch"
			if(11)
				name3 = "God"
			if(12)
				name3 = "Pestilence"
			if(13)
				name3 = "Unholy"
			if(14)
				name3 = "Rape"
			if(15)
				name3 = "Doom"
			if(16)
				name3 = "Crazy"
			if(17)
				name3 = "Murder"
			if(18)
				name3 = "Burning"
			if(19)
				name3 = "Hatred"
			if(20)
				name3 = "Fairies"
			if(21)
				name3 = "Ooze"
			if(22)
				name3 = "Plague"
			if(23)
				name3 = "Clowns"
		Ages = "[name1] [name2] [name3]"
world/proc/Name()
	if(world)
		var/name1
		var/name2
		var/name3
		var/Pick=rand(1,10)
		switch(Pick)
			if(1)
				name1 = "Land of the"
			if(2)
				name1 = "Plains of the"
			if(3)
				name1 = "Lands of the"
			if(4)
				name1 = "Oblivion of the"
			if(5)
				name1 = "Mountains of the"
			if(6)
				world<<"Stars of the"
			if(7)
				world<<"Wasteland of the"
			if(8)
				world<<"Paradise of the"
			if(9)
				world<<"Hell of the"
			if(10)
				world<<"Purgatory of the"
		var/Pick2 = rand(1,16)
		switch(Pick2)
			if(1)
				name2 = "Dark"
			if(2)
				name2 = "Lost"
			if(3)
				name2 = "Blood"
			if(4)
				name2 = "Mysterious"
			if(5)
				name2 = "Mad"
			if(6)
				name2 = "Hell"
			if(7)
				name2 = "Red"
			if(8)
				name2 = "Ancient"
			if(9)
				name2 = "Hidden"
			if(10)
				name2 = "Star"
			if(11)
				name2 = "Deadly"
			if(12)
				name2 = "Fantasy"
			if(13)
				name2 = "Rape"
			if(14)
				name2 = "Insane"
			if(15)
				name2 = "Doomed"
			if(16)
				name2 = "Unholy"
		var/Pick3=rand(1,15)
		switch(Pick3)
			if(1)
				name3 = "Dwarf"
			if(2)
				name3 =  "Diamond"
			if(3)
				name3 = "Temple"
			if(4)
				name3 =  "Scroll"
			if(5)
				name3 = "Goblin"
			if(6)
				name3 = "Blood"
			if(7)
				name3 ="Dragon"
			if(8)
				name3 ="Fantasy"
			if(9)
				name3 ="Meat"
			if(10)
				name3 ="Cheese"
			if(11)
				name3 ="Cake"
			if(12)
				name3 ="Rape"
			if(13)
				name3 ="Boredom"
			if(14)
				name3 ="Ecstasy"
			if(15)
				name3 ="Gnomes"
		WorldName = "[name1] [name2] [name3]"