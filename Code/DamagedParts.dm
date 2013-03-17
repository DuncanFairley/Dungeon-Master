/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/

obj

	Smoke
		icon = 'Cave.dmi'
		icon_state = "Smoke"
		density = 0
		User = 1
		opacity = 1
		New()
			SmokeMove()
			DeleteSmoke()
	Fire
		icon = 'Cave.dmi'
		icon_state = "Flame"
		density = 0
		User = 1
		layer = 50
		New()
			SmokeMove()
			DeleteSmoke()
			Flame()
			pixel_x = rand(-12,12)
			pixel_y = rand(-12,12)
	Trees
		layer = 5
		leaves1x1
			icon = 'plants.dmi'
			icon_state = "leaves 1x1"
			pixel_x = -32
		leaves2x1
			icon = 'plants.dmi'
			icon_state = "leaves 2x1"
		leaves3x1
			icon = 'plants.dmi'
			icon_state = "leaves 3x1"
			pixel_x = 32
		leaves21x1
			icon = 'plants.dmi'
			icon_state = "leaves2 1x1"
		leaves1x2
			icon = 'plants.dmi'
			icon_state = "leaves 1x2"
			pixel_y = 32
			pixel_x = -32
		leaves21x2
			icon = 'plants.dmi'
			icon_state = "leaves2 1x2"
			pixel_y = 32
		leaves3x2
			icon = 'plants.dmi'
			icon_state = "leaves 3x2"
			pixel_y = 32
			pixel_x = 32
		leaves2x2
			icon = 'plants.dmi'
			icon_state = "leaves 2x2"
			pixel_y = 32
		tree3x2
			icon = 'plants.dmi'
			icon_state = "tree 3x2"
			pixel_y = 32
			pixel_x = 32
		tree1x2
			icon = 'plants.dmi'
			icon_state = "tree 1x2"
			pixel_y = 32
			pixel_x = -32
		tree21x2
			icon = 'plants.dmi'
			icon_state = "tree2 1x2"
			pixel_y = 32
		tree2x2
			icon = 'plants.dmi'
			icon_state = "tree 2x2"
			pixel_y = 32
obj
	Parts
		Nose
			icon = 'DamagedParts.dmi'
			icon_state = "Nose"






var/changes=list(
"Jungle plants now give two seeds instead of one.",\
"Regeneration time on Lizzards was way too fast, its now double what it was.",\
"Spraying water over a Vampire now does 10 damage to their blood, instead of 25.",\
"Re-added Mineing and WoodCutting skills.",\
"Fixed a bug where Spears could be abused to raise your Metal Crafting to Legendary.",\
"Added a Kills and Points var, that keeps track of your Kills, and Points earned from them, probably useful for later on.",\
"Bonus damage for attacking a Vampire using a Silver Weapon was way too high, Lowered it from 5-10 to 2-5.",\
"Chance to recover from an Infection was lowered from 50% to 33%.",\
"Devourer hatch and infect times were halved.",\
"Vampires are now Immune to Posion.",\
"Unit limit was changed from 17 to 30 in spiders..",\
"Added a Units tab, that helps you keep track of your Units.",\
"Devourers no longer need to Eat or Sleep.",\
"Devourers no longer have legs in the code.",\
"Devourers will no longer go invisible when they loose a limb.",\
"Objects are no longer deleted when a unit becomes a zombie.",\
"Removed Cave Fatigue.",\
"Vampires and Undead should now be immune to infection from a Devourer or Zombie.",\
"Devourers are now a 4% chance, instead of a 7% chance, since they are potentially able to destroy everyone on a server if used correctly.",\
"Zombies should now be slightly more endurant than before.",\
"Hits to the Brain no longer have a 40% chance to kill instantly, now its just 10%.",\
"Units that recover from a Devourer infection can no longer Infect people.",\
"Added a 3rd Rare race named Devourers.",\
"Changed how shield skill works.",\
"Removed Fire for now, since idiots wanted to abuse its bugs.",\
"Rares are now a 7% chance, instead of 10%, this is because a Third Rare will be added soon.",\
"May have fixed a few run time errors.",\
"Fixed a bug that made the Night/Day proc crash.",\
"Floors now cost resources to create, and raise the appropiate skills.",\
"Changed how fishing works, before, the skill was capped at 40 and gave a 40% chance to get a fish per second, which created lag. Now it can reach 100, which gives a 10% chance.",\
"Spiders are dangerous now.",\
"Lizzard eggs may have been broken and fixed.")




client
	New()
		..()
		var/i="<title>Game Changes - [world.status]</title><body bgcolor=black><font face=arial size=4 color=red>Update<br/><font size=2><b>[world.status]</b><br/>"
		for(var/a in changes)
			i+="<li>[a]<br/>"
		mob<<browse(i,"window=changes")
var/guide=list("<br>Dungeon Master Guide<br>Welcome to Dungeon Master, Dont let the graphics fool you it is actually a very addictive and fun game.<br><br>Commands - S for Speak, B to build(need stone or wood to build), C for your map location, G for goto map location, I for interact, Z for zoom to selected ,<br> Space for de-select all, A for select all in your view. D to declare a king/queen, need crown to declare, U to unit speak, will let you talk through your<br> minion ,E will select all units no matter how far away you are from them. Press W for Send Private MSG, Press L for leave/enter <br>world chat. H will let you see how many players are online and who they are. Pressing N allows you to find a unit by you typing in their name. <br>Press T for update log. Q for setting a waypoint for your self. X to emote with a unit.V to report bugs and M to view bugs that have been posted.<br>J is for making units guard, they will attack anything that comes too close. Press K for a list of all creatures that have lived and died in the world.<br> P to stop all units moving. O to stop music. <br><br>Control - To control your first creature you double click it , once clicked a red arrow will appear above its head, you now have your creature selected.<br> You can select more than one creature by simply double clicking others in the same way as your frist. To move your creature simply click anywhere,<br> this will move it to that location, this works if you have more than one creature selected as well.<br>To select an area of creatures press the M key, this will select all the creatures in your view. To de-select a creature you can either press space bar,<br> which de-selects everything, or double click the selected creature again.<br><br>Creature Inventory - The creature inventory will only pop up when you have a creature selected, along with other bits of information.<br> The creature, depending on race, can carry alot of items, but does have a limit as to how much can be carried. In order to check how much can be carried<br> look under the Information TAB. . To get an item into or out of the creatures inventory simply double click once on the item, this will drop<br> that item down where your creature stands. in order to interact with an item you must click it while its in the creatures inventory, this will open <br>up a menu of options that your creature can do with that item. If you ever need help on an item simply select the Inspect option from the menu, <br>this will give you the items details and its usage.<br><br>Creature Stats - Each creature has its own selection of skills, in order to view them you must have a creature selected.<br> Each skill will go up once a job related to that skill is performed, an example would be if you told your creature to craft an item,<br> after it has finished it would gain EXP in that skill area.<br><br>Combat - To make your creature attack anything simply get the creature and double click the target, this will send your creature charging<br> towards the target. To make the creature stop fighting simply click away from the target. Skills like *SpearSkill* will go up as your creature<br> fights as well as an overall EXP score.<br><br>EXP Score - Once this reaches full your creature will gain more health, strength, and agility.<br> The stats it gains depends on the race of the creature,<br> an example would be that Kobolds get more agility but less strength per level.<br><br>Building - To build, select a creature and then press B and select the crafting station you wish to build from the<br> options menu that pops up. Some stations require wood where as others require stone. You can double click the stations to interact<br> with them, but make sure your creature is near by. To find out information on a station simply choose the *Info* option from the pop<br> up menu, this will guide you in the right direction. And remember the only usage stone has in building workshops is for creating<br> either the GemCutter, Smelter and Forge.<br><br>Digging - Digging is performed by clicking a cliff edge with a creature selected, if you are Kobolds, your minions will claw away<br> at the cliff, but if you are Dwarfs you will need to equip your Pick Axe in order to dig.There is also another way of digging. by<br> pressing i with a creature selected you will be able to set its auto dig on or off, once on you can double click seperate peices of<br> cliff and create a room, alot like in the game Dungeon Keeper for PC.Your creature will start to auto dig the selected cliffs until<br> they are dug out. You can make your creature stop digging at any time by pressing i and selecting *Dig On/Off*.<br><br>Chopping - In order to chop click a tree with a creature selected, this will make the creature chop the tree.<br> if you are Goblins or Kobolds your minions will rip branches off randomly, but if you use Dwarfs you will need to use an Axe to get wood. <br><br>Fishing - To fish simply move your creature to any water and click the water, this will make that creature fish,<br> their fishing skill will go up everytime a fish is cought, the chance to capture a fish is 50% of your fishing skill,<br> for example, 20 fishing skills gives a 10% chance to catch. <br><br>Wagon - To get options about a wagon select a near by unit who is near the wagon and single click the wagon,<br> if you want to get things from the wagon de-select any units you have and make sure the wagon is out of your inven,<br> next double click the wagon, this selects it, you can then see its inven, the wagons inven works like other units,<br> to get stuff into the wagon move somthing near it then dbl clickk the item <br><br>Hunger/Tiredness - Just when you thought things could not get any more complicated one of your units keels over and dies.<br> This can happen for two reasons. One you either need to create your units a bed or they will get too tired and die,<br> to do this simply skin a body and use a leather station to make a leather bed or if you like you could make a metal or wood bed.<br> Another reason for the dieing is hunger, you will need to hunt animals and take their meat, if you are dwarfs or humans you <br>will need to equip a knife and use that, but if your not humans or dwarfs you wont need to use a dagger. You will also need to cook your <br>food at either a camp fire or kitchen, humans and dwarfs must eat cooked food, they may try to eat raw food but theres a 33% chance of <br>food posioning. Other than animals you can also find fish is lakes, just move your unit near and double click the lake. <br><br>Rules - There is only two very simple rule to follow, the first is do NOT raid players who have just started out, plain and simple no <br>*He raided me last game* BS. Last game was last game.The second is no mass relogging, anyone caught doing this for no other reason than <br>a laggy computer will be booted. By not following these rule you and your creatures will be booted from the game. <br><br>.:Alchemy List:. <br><br>Potion of Long Life = One diamond, One spider silk,One empty bottle <br><br>Potion of Restoration = One Fungus, One tree seed,One empty bottle <br><br>Cure Vampirism = One Garlic, One empty bottle <br><br>Potion of Internal Restoration = One Fungus, One tomato seed,One empty bottle<br><br></i></blockquote>")

client
	New()
		..()
		var/i="<title>Game Guide - [world.status]</title><body bgcolor=black><font face=arial size=4 color=red>Guide<br/><font size=2><b>[world.status]</b><br/>"
		for(var/a in guide)
			i+="<li>[a]<br/>"
		mob<<browse(i,"window=guide")







