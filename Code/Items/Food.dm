obj/Items/var
	FoodPower=100

obj/Items/Food
	icon='Food.dmi'
	ItemType="Food"
	New() ItemDecay()
	weight = 10
	Cheese
		icon_state = "Cheese"
		desc = "This is a chunk of cheese, it can be eaten"
	Grape
		icon_state = "Grape"
		desc = "This is a grape, once eaten it will provide a seed, it can also be used to create wines."
		FoodPower=30
	Tomato
		icon_state = "Tomato"
		desc = "This is a tomato, it can be used as food and will provide seeds as well."
		FoodPower=50
	Fungus
		icon_state = "Fungus"
		desc = "This is a chunk of fungus, it can be eaten by some creatures such as Kobolds and Goblins"
	Meat
		icon_state = "RawMeat"
		desc = "This is a chunk of meat, it can be eaten."
		FoodPower=125
		Cooked_Meat //Just for quick create.
			icon_state="CookedMeat"
			FoodPower=150
obj/Items/Food/DblClick()
	if(ismob(loc))
		var/mob/M=loc
		if(M.Owner!=usr) return
		var/list/menu=new()
		if(M.Race != "Vampire" && M.Race != "Gargoyle") menu+="Eat"
		menu+="Inspect"
		menu+="Drop"
		menu+="Cancel"
		var/Result=input("What would you like to do with the [src]?","Choose",null)in menu
		switch(Result)
			if("Eat") M.EatItem(src)
			if("Inspect")
				usr<<"\icon[src] <b>[name]</b>"
				if(FoodPower) usr<<"Satisfies [FoodPower] points of hunger when eaten."
				if(weight) usr<<"Weighs [weight] units."
				if(desc)usr<<desc
				usr<<"" //just the same as including a "<br>" at the end, stops people from getting as confused when looking at lots of items.
			if("Drop")M.DropItem(src)
	else if(!suffix) for(var/mob/Monsters/M in usr.Selected) if(M.PickUpItem(src,1)) return(1)
mob/proc/EatItem(obj/Items/ITEM) if(ITEM.loc==src) if(ITEM.suffix=="(Carrying)")
	var/Healthy=1
	switch(ITEM.icon_state)
		if("RawMeat") if(!Carn) Healthy=0
		if("Fungus") if(!Carn&&Race!="Dwarf") Healthy=0
		if("Adamantium")
			Hunger+=100
			MaxHunger+=100
	view(src) << "[src] eats the [ITEM]."
	if(!Healthy)
		Hunger+=ITEM.FoodPower/2
		Tiredness-=ITEM.FoodPower
	else Hunger+=ITEM.FoodPower
	if(Hunger>MaxHunger) Hunger=MaxHunger
	switch(Race)
		if("Spider")
			WebContent += ITEM.FoodPower
			if(WebContent > MaxWebContent) WebContent=MaxWebContent
		if("Dragon") switch(ITEM.Race)
			if("Demon") MagmaPoints += 100
			if("Dragon") ZombiePoints += 250
			if("Gremlin") SandPoints += 50
			if("Lizardman") PoisonPoints += 50
			if("Orc") IcePoints += 50
	switch(ITEM.icon_state)
		if("Grape") MakeMany(/obj/Items/Seeds/GrapeSeed,2,loc)
		if("Tomato") MakeMany(/obj/Items/Seeds/TomatoSeed,2,loc)
	if(DropItem(ITEM)) del(ITEM)
	return(1)