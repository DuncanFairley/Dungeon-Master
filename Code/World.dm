world
	name = "NAMEOFWORLDHERE"
	view = 9
	hub = "Ginseng.DungeonMaster"
	version = 0.395
	loop_checks  = 0
	status = "YOUR STATUS HERE"

	New()
		log = file("ErrorLog.txt")
		Name()
		Date()
		Age()
		Aging()
		History()
		SeasonChange()
		NightChange()
		Repop()
		BirthChanges()
		CallSave()

var/Season = "Summer"
var/WorldName
var/Date
var/History
var/Legends
var/Ages
var/night = 1
var/PlayerList = list()
/proc/SeasonChange()
	Seasons()
	world.Repop()
	spawn(10000)
		SeasonChange()
/proc/Seasons()
	Army()
	Date += 1
	switch(Season)
		if("Summer") Season = "Fall"
		if("Fall") Season = "Winter"
		if("Winter") Season = "Spring"
		if("Spring") Season = "Summer"
	world << "<b><font color=blue>It is now [Season]!"
/proc/BirthChanges()
	Births()
	spawn(600)
		BirthChanges()
		return
/proc/Births() for(var/mob/Monsters/m in world)
	m.overlays -= /obj/dodge/
	m.overlays -= /obj/miss/
	m.overlays -= /obj/block/
/proc/NightChange()
	Night()
	spawn(5500)
		NightChange()
/proc/Night()
	if(night)
		world << "<b><font color=blue>It Starts To Get Lighter"
		spawn(500)
			night = 0
			world << "<b><font color=blue>Day Rises"
			for(var/mob/X in Players2) if(X.client) for(var/obj/Hud/Day/D in X.client.screen)
				D.icon_state = "Sun"
				D.name = "Day"
				D.text = "<font color=yellow>¤"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf") m.WerewolfTransformation()
				m.SunLight()
	else
		world << "<b><font color=blue>It Starts To Get Darker"
		spawn(500)
			night = 1
			world << "<b><font color=blue>Night Falls"
			if(prob(10)) spawn(300)
				world << "<b><font color=yellow>A wonderful shooting star appears in the sky!"
				if(Event("Shooting Star",600))
					ExperienceMultiplier+=9
					spawn(300)
						ExperienceMultiplier-=9
						world << "<b><font color=yellow>The shooting star disappears from the sky!"
			for(var/mob/X in Players2) if(X.client) for(var/obj/Hud/Day/D in X.client.screen)
				D.icon_state = "Moon"
				D.name = "Night"
				D.text = "<font color=blue>°"
			for(var/mob/Monsters/m in world)
				if(m.SubRace == "Werewolf") m.WerewolfTransformation()
obj/proc/CacoonTrap()
	var/OGB = 0
	for(var/mob/Monsters/X in range(4,src))
		if(X.Owner != src.Owner)
			if(!X.Critter)
				for(var/mob/KLL in Players2)
					if(KLL == src.Owner)
						for(var/mob/MK in Players2)
							if(X.Owner == MK)
								if(MK.name in KLL.AllyList || MK.Faction == KLL.Faction)
									OGB = 1
		if(OGB == 0 && X.Owner != src.Owner)
			var/mob/Monsters/Devourer/FleshCrawler/F1 = new(loc)
			var/mob/Monsters/Devourer/FleshCrawler/F2 = new(loc)
			F1.Owner = src.Owner
			F2.Owner = src.Owner
			F1.destination = X
			F2.destination = X
			F1.name = "{[F1.Owner]} Flesh Crawler"
			F2.name = "{[F2.Owner]} Flesh Crawler"
			view(src) << "[src] explodes open in a shower of gore and releases two small monstrosities!"
			src.Owner << "<b><font color=red><font size=3>[src] has detected an intruder at [src.x],[src.y],[src.z]!"
			del src
	spawn(5) src.CacoonTrap()
obj/proc/BSTTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									M.LeftLegHP -= 10
									M.RightLegHP -= 10
									M.BloodContent -= 15
									M.BloodLoss()
									M.SneakingSkill += 0.1
									var/Break = prob(3)
									if(Break == 1)
										del(src)
										return
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									else
										M.SneakingSkill += 0.1
	spawn(5)
		BSTTrap()
		return
obj/proc/RibTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(KLK == src.Owner)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner)
					..()
				else
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							if(M.density == 1)
								var/avoid = prob(M.SneakingSkill)
								if(avoid == 0)
									src.Hole = 0
									src.IsSpiked = 0
									view() << "<b><font color=red>[M] walks over a trap and their legs are crushed!"
									M.LeftLegHP -= 60
									M.RightLegHP -= 60
									M.BloodContent -= 50
									M.BloodLoss()
									M.SneakingSkill += 1.5
									var/Stun = prob(10)
									if(Stun == 1)
										if(M.Race != "Gargoyle")
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
									del(src)
								else
									M.SneakingSkill += 0.1
	spawn(5)
		RibTrap()
		return
obj/proc/StoneTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			for(var/mob/KLK in world)
				if(src.Owner == KLK)
					for(var/mob/MK in world)
						if(M.Owner == MK)
							if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
								OGB = 1
			if(M.Owner == src.Owner)
				..()
			else
				if(M.Wagon == 0)
					if(src.HasPersonIn == 0)
						if(OGB == 0)
							var/avoid = prob(M.SneakingSkill)
							if(avoid == 0)
								if(!M.WearingHelmet)
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head"
										M.HeadHP -= 80
										M.BloodContent -= 65
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(70)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
								else
									if(M.Race != "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head, but some of the force is deflected by their helmet."
										M.HeadHP -= 50
										M.BloodContent -= 40
										M.BloodLoss()
										M.SneakingSkill += 1
										var/Stun = prob(50)
										if(Stun == 1)
											M.Stunned = 1
											view(src) << "<b><font color=red>[M] is stunned!<br>"
										del(src)
									if(M.Race == "Gargoyle")
										src.Hole = 0
										src.IsSpiked = 0
										view() << "<b><font color=red>A large stone falls on [M]'s head and bounces off harmlessly, leaving a small scratch."
										M.HeadHP -= 10
										del(src)
							else
								M.SneakingSkill += 0.1
	spawn(5)
		StoneTrap()
		return
obj/proc/PitTrap()
	var/OGB = 0
	if(src.Hole == 1)
		for(var/mob/Monsters/M in view(0,src))
			if(M.density == 1 && M.Flying == 0)
				for(var/mob/KLK in world)
					if(src.Owner == KLK)
						for(var/mob/MK in world)
							if(M.Owner == MK)
								if(MK.name in KLK.AllyList || MK.Faction == KLK.Faction)
									OGB = 1
				if(M.Owner == src.Owner) ..()
				else
					if(M.Wagon == 0)
						if(src.HasPersonIn == 0)
							if(OGB == 0)
								if(M.density == 1)
									var/avoid = prob(M.SneakingSkill+40)
									if(src.IsSpiked == 0)
										if(avoid == 0)
											M.destination = null
											for(var/mob/A in world) if(A == M.Owner) M.Deselect()
											src.HasPersonIn = 1
											M.InHole = 1
											src.Hole = 0
											src.icon = 'Cave.dmi'
											src.icon_state = "Hole"
											view(src) << "<b><font color=red>[M] falls into a pit"
											src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
											M.Struggle()

									if(src.Poisoned == 1)
										if(avoid == 0)
											if(src.IsSpiked == 1)
												M.HP  -= src.PoisonContent
												M.LeftLegHP -= 80
												M.RightLegHP -= 80
												M.BloodContent -= 60
												M.BloodLoss()
												src.Hole = 0
												src.icon = 'Cave.dmi'
												src.icon_state = "Hole"
												src.IsSpiked = 0
												src.Poisoned = 0
												src.PoisonContent = 0
												view(src) << "<b><font color=red>[M] falls into a posionious spiked trap"
												src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
												var/Stun = prob(50)
												if(Stun == 1)
													if(M.Race != "Gargoyle")
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
												else
													M.SneakingSkill += 0.1
											if(src.IsSpiked == 1)
												if(avoid == 0)
													M.LeftLegHP -= 70
													M.RightLegHP -= 70
													M.BloodContent -= 50
													M.BloodLoss()
													src.Hole = 0
													src.icon = 'Cave.dmi'
													src.icon_state = "Hole"
													src.IsSpiked = 0
													view(src) << "<b><font color=red>[M] falls into a spiked trap"
													src.Owner << "<b><font color=red>[M] falls into your pit at [src.x],[src.y],[src.z]"
													if(prob(50))
														M.Stunned = 1
														view(src) << "<b><font color=red>[M] is stunned!<br>"
													else
														M.SneakingSkill += 0.1
	spawn(5)
		PitTrap()
		return
mob/verb/Update() usr.Intro()
mob/proc/Updates() Intro()
mob/proc/Intro() //**********************Remember to carry "CanBeCaged" or whatever on births, as well as add mage chances. Just look over the old stuff to see if we're missing anything.
	html = {"
		<style>
		body{background:background:white; color:black;}
		</style>
		<font size="10"> HELLO!
		</font><i>It's me, Félix! read me...</i>
		<br>
		If you're new, there's a small guide in the popup that shows up when you first log in. It's slightly out of date but will give you a small explination on the controls of the game.
		<p>
		Here's the only rules that you'll have to worry about:<br>
		<b>1:</b> Be at least a 'little' respectful of the player base. There's no need to go calling people retards just because they have worse units than you do.
		<br><b>2:</b> There is a zero tolerance for sharing pornographic or otherwise 18+ content through any means of chat. You will not be muted for doing so, you'll be banned.
		<br><b>3:</b> Don't spam the world chat, and evade posting links to external content without permission. You won't get banned for it, but you'll get warned if it's an issue, and then muted if you don't correct your actions.
		<p>
		Quick Group Controls:<br>
		Shift + # = Add Selected Units to the Group.<br>
		Ctrl + # = Remove all old members from the group, and then directly add currently selected units.<br>
		Nothing + # = Select all units you've added to the number group. If pressed twice quickly your view will jump to the group.<br>
		<br>
		<b>NOTE</b>, # is one of the following keyboard buttons: 1,2,3,4,5,6,7,8, and 9. Also note that like all verbs in this game, you need "alt" on the macro bar for this to operate properly.<br>
		<p>
		<b>Updates:</b><p>
		<p>Wing damage is no more. It may be readded if combat allows it in the future.
		<p>Made bleed outs happen at much lower numbers, starting at 140 instead of 240.
		<p>Fixed a fun little bug that was causing aging to not have a timer and was processing continually. Although I still question how the server didn't just crash.
		<p>Fixed a few minor crash bugs in combat where it would continue trying to deal damage to a target of which no longer existed.
		<p>Fixed one of the many bugs causing temperature to never set 0.
		<p>Dragons can no longer lose their wings, as in their case their wings are pretty much their arms. That and they don't have a method of regenerating them.
		<p>Gave demons poison resistance and gave them slightly better overall non-physical damage resistances.
		<p>Made flying over water slightly less glichy.
		<p>Added a few new map locations designed after buildings players had created in game.
		<p>Made every connection test actually test if there's a client connected to an creature's owner rather that a boonial decided upon login and logout.
		<p>Fixed a whole bunch of bugs related to people not being online durring a proc related to deselection including but not limited to permanent brainwashing from unholy dragon breath, werewolf infections not working, and sleeping becoming permanent.
		<p>Moved around a bit more item code from single click to double click.
		<p>Fixed a bug with frogman poison skin causing it to trigger infinitely.
		<p>Gave a default value to "OldIcon" so digging out premade walls should now turn said wall into grass instead of resulting in a gliched up weirdo tile.
		<p>Removed vampire bloodline deaths due to it causing an excess of processing on PVP battles, and the fact that it was a rather harsh downside.
		<p>Cave critters now die of old age as a manner of a despawn time for them.
		<p>Spiders now grow 2x as fast for the first 5 years of their life.
		<p>Slightly reduced the level based gain of frogman poison skin, but gave it a base 1% chance of triggering.
		<p>Grandly buffed addy find rate. It now shows up as much as your average gem. So long as you're a dwarf at least.
		<p>Made hair evaluate to 0 on human males so it would actually save.
		<p>Fixed a bug that was allowing demons to get disarmed by the sword skill.
		<p>Improved spider claw skill damage by 25%.
		<p>Made human nobles count as royal units.
		<p>Fixed a typo causing dragons to not gain the intended HPs on level up.
		<p>Lowered the rate NPCs gain EXP.
		<p>Did some recoding to how body regeneration works. All body parts should properly restore to "Good" condition now. Hearts and Brains also regenerate a small bit faster than before.
		<p>Fixed a bug that was causing you to still get the random walk trigger while attempting to destroy a fence or door.
		<p>Reduced the rate of the trigger on the butcher knife, but improved its power slightly.
		<p>Buffed Skorn armor by 1 point to make it actually slightly better than iron, by popular demand.
		<p>Downgraded some NPCs to make up for the now more powerful low quality equipment.
		<p>Fixed a bug that was artificially equipping non-existent items to enslaved NPCs when they were regenerated from a save.
		<p>Made skorn count as royal, thus higher stat and skill cap.
		<p>Retracting your wings now makes your wings un-hitable, wings properly get armored, and wings also cause much less blood loss when they become damaged than they did before.
		<p>Gave bone floors a diffrent icon so you can somewhat more easily tell it appart from a wall. Though it's still pretty bad.
		<p>Recoded stairs entirely. You can now use the destroy floor tool to remove both sides of a set of stairs. You can also choose between stone, wood, ancient, bone, and bamboo stairs rather than only having one per race. Not all races have the ability to craft bone and bamboo stairs however.
		<p>Changed the wooden floor/wall icons and changed a few items colourings to match with it. Currently it looks repulsive with anything stone but that will change eventually.To be honest the only thing it really looks nice with is water, snow, and grass at the moment.
		<p>Improved the ultimate end of the line minimum damage to 5 from 2.
		<p>Fixed a bug that was stopping hunger permanently when you logged out.
		<p>Changed a really random bit of code that was causing wings to only be damaged by vampires.
		<p>Fixed a laughable bug that turns out to have been around for years that made dodging not actually do anything. So yes for the last year or so agility truely has had no use other than 'slightly' reducing enemy block chance. There are so many people you can laugh at now for complaining about how gargoyle's low agility was causing them to suck.
		<p>Started recoding how combat is calculated.
		<p>Fixed a bug with spears that was causing the extra block chance to not apply properly.
		<p>Fixed a bug with cages causing it to tell you that you couldn't cage a unit when you could, and not telling you anything when you couldn't.
		<p>Reduced the illithids rare to 'just' illithids. No more random mind worms and silly elder brains.
		<p>Tweaked training posts so hitting them has slightly less calculation to it to minorly help the CPU.
		<p>Removed the negative effect from unholy weapons so it'd actually be beneficial to use them instead of overall making your weapon worse.
		<p>Gargoyles now deal as much damage as regular units despite their slowness, and units that are running deal regular damage in combat despite their speed.
		<p>Removed the pillar shrines until they can be replaced with a new system that applies more actively. Their current state is simply far too imballenced and infact causes a few bugs.
		<p>Silver is now a fair bit weaker than iron, however when fighting werewolves, vampires, half demons, and undead the effectiveness of the equipment far surpasses iron both defencively and offencively.
		<p>Bone weapons are no longer strictly worse than metal ones, but infact grant a higher max damage but lower min damage.
		<p>Replaced most of the defence and damage values on equipment to be more ballenced out between themselves. Poor rating equipment is now about 10x as strong as it used to be, while legendary is slightly weaker than it was before. Thus using legendary quality gear is not a requirement for survival. As a side effect weaker NPCs may prove more challanging than before.
		<p>Devourer zombies have been nerfed down to a reasonable and mathimatical ammount of fairness. Every and all organs provide benefit for up to 5 stacks, and the organs only cost 1 body to create now. They also have been given slightly improved stat gains, so leveling them actually does good benefit to them.
		<p>Adjusted the part HP gains on all races to be less varient per race, while most of the variation is on the base values. Meaning low leveled units of a swarm race will be dramatically weak compared to low leveled units of a normal race, but at a high level they will be much closer to the same. Thus raising a commander for your swarm is more reasonable of an option with races such as kobolds, ratmen, and elves as they will no longer be delimbed so quickly in combat.
		<p>Dramatically reduced the stat benefit from having a subrace to a fair ammount. Thus remaining as a pure race is actually an option if you intend to stand a chance against other players.
		<p>Chests should no longer delete on restart.
		<p>Changed how statgains are calculated in the level up proc, particularly there's a more consistant variation, thus you don't end up with stats like 54.37. All primary stats now will run on multiples of 0.25. Intelligence will remain weird for now.
		<p>Gave gargoyles proper limb HP gains, as they were gaining the default 0.75 to 1.00 value next to other people who were getting as much as 2 to 3 per level. Thus they get delimbed as fast as anoyone else now.
		<p>Fixed some bugs here and there that were told to me while on vacation.
		<p>Removed lava forging weapons and armor, and ballenced out defence values to a more mathimatically fair ammount rather than just being a big number for the thought "Huh, 50 sounds like a nice number of defence."
		<p>There is no longer any method of GAINING blood from taking poison damage, as it's downright silly in a game like this.
		<p>Limbs will now take only 100 seconds to despawn.
		<p>Starter dragons now start with 0.9 egg content, but egg content raises at a 3rd of the old rate.
		<p>Fixed a bug with taking food from nearby units.
		<p>Fixed a bug that was giving heavily armoured NPCs starter defence values.
		<p>Demons now have a random on their spawns. Meaning upon repopulation they get a randomly generated location within hell, but never within 15 tiles of another creature.
		<p>Gave magma dragons a further 10 points of bonus damage, as it just didn't have anything on the damage of a 1 delay boost you can earn from other dragon types.
		<p>Replaced the "Fly Up" and "Fly Down" interact options with a simple click action. If your units destination is on layer 3 or 1 your unit will automatically fly up or down to get there if they're flying.
		<p>Nerfed adamantium's defence a few points, but multiplied the find rate by 4.
		<p>Added a lovely new weapon to the game and attatched it to a new army, Orcs.
		<p>Nerfed magic a tiny bit. Sure it'd probably be better all around if I outright removed most if not all of it, but people'd cry if I did that. Ranged alteration spells now have a range limit of 10, and only influence a 2 tile distance forming a 3x3 area of whatever turf type.
		<p>Recoded how hunger and eating works. It should operate mostly the same, but for now poisoned food is not a thing. Raw meat will no long have a chance to instantly kill non-carnivores, instead it will simply make them very sleepy and not restore as much hunger.
		<p>Gave up on gremlins. After a multitude of times trying to ballence them into not being overpowered or underpowered I've concluded you simply cannot make a race that's based around creating CLONES to be both not overpowered, and not underpowered. Combined with the excessive ammount of code to make them work the way they do in this game, the fact that they are only used by one or two players, and how little they actually fit into the style of this game, they have been removed.
		<p>Undead no longer feed the soul eater.
		<p>Capes will now actually show up when you equip them.
		<p>Made agility ACTUALLY influence your hit chance.
		<p>Made player creature movement actually check to see if you're sleeping.
		<p>Gave female elves new icons that look slightly less dull.
		<p>Most female creatures now use male icons with overlays instead of their own icon. Notably this should correct the bug where males would get female icons when regenerated from a save file. You'll also notice races that were missing female icons such as frogmen or demons will now have shirts as intended.
		<p>The NPC Alliance is now hostile to evil creatures, such as the undead, half demons, or werewolves in wolf form.
		<p>The "Tear all Meats" and "Tear all Skins" buttons now work without a fire/kitchen/leatherworks station nearby. Though you do still require a knife if you're not a carnivore.
		<p>Silver weapons now do improved damage to half demons, as half demons desperately needed some kind of downside rather than being strictly better than just being a normal race. Not huge but it's there.
		<p>Players have been converted to a new object type and thus can be referanced faster in the code. No real notable changes should happen but you know.
		<p>Waypoints will no longer reset when you restart.
		<p>Gave dragons the ability to be born as males. You always start with a female dragon but her children can now be male. Males start with +10 in strength and agility, but cannot ever lay eggs.
		<p>Re-added declaring units as king or queen. You can declare a unit as king or queen at any time with the (D)eclareLeader macro, or by attempting to equip a crown. A royal unit will gain +10 their max strength and agility, gain +25 to max weapon skills, and a 40 bonus to sneak skill. No matter the situation, a royal unit cannot change ownership, even from a vampire infection. You do not need a crown to declare a unit as royalty, however crowns will provide extra defence and in the case of the bone crown extra damage. Currently any race will be able to be declared as royalty, and if a unit's gender is not female or male it will be treated as male. If you decide to make a royal unit non-royal again or that unit dies, you must wait 1 hour before declaring a new royal of the same gender. Restarting will reset this timer.
		<p>Fixed a bug where if you gained more than 1 level at once when reaching level 100 you would go over the average statcap.
		<p>Fixed a few typos that were causing some races to not gain part HPs as intended.
		<p>Removed the level requirement from gargoyles for flight now that there's a debuff for it.
		<p>Sword disarms now set an items direction back to SOUTH after the disarm fling so you don't end up with invisible items so easily.
		<p>Made demons disarm proof from sword and unarmed skills. They can still lose their weapon to a broken arm however.
		<p>Fixed a bug where units could infinitely pick up weapons with a broken arm.
		<p>Added customization options to guard mode. By default your unit will only attack if it is attacked or sees a unit you control being attacked. You can choose to enable patrol or agressive guarding by the options provided. You can also declare per-unit friendlyness for agressive mode towards players or NPC teams. Regardless of any of these options if your unit is on guard it will attack any unit commiting a hostile act towards your units. All this can be done via the 'J' hotkey or "Guard" macro.
		<p>'N' is no longer the locate unit verb, and has been replaced with a rename verb for quickly renaming your selected units. As the old verb was only used by bug abusers.
		<p>Half Demon statgains now apply retroactively upon turning half demon. Thus you won't miss out on stat gains if you turn into a half demon at level 50 for example.
		<p>Removed some unused crafting options that were really pointless. Particularly spear heads and spear shafts can no longer be crafted.
		<p>Added a fair bit more detail to the map by adding many more mountains to the map, and adding a few new and more interesting NPC villages. Most landmarks are still in the same places.
		<p>Redid the restart process. Particular changes are you should no longer spawn inside caves unless intended to, you won't spawn within 10 tiles of any creature, and now some races start with diffrent numbers of units.
		<p>Devourer cacoon traps can no longer be made while standing directly next to a unit you don't control, and the bodies of the flesh crawlers will no longer be re-absorbable. However the trap costs 1 less, and they deal a tiny bit more damage than before.
		<p>Made the randomly spawning armies spawn a lot more guys, now they can spawn anywhere between 26-100 units total.
		<p>Added in a proper item de-spawn process for dropped items. If the item is of the type to despawn it will now despawn after 3 minutes of not being held. Eventually I'll give diffrent items diffrent despawn times but for now 3 minutes is the deal.
		<p>Lowered the overall breed time so raising normal units in large numbers is a bit faster.
		<p>Stationary NPCs will now pick up gear, though not as often as wandering ones.
		<p>Made sword skillful disarms send the weapon flying rather than just dropping it on the ground, as a result it's actually somewhat useful on NPCs.
		<p>Mages no longer spam you with messages while meditating.
		<p>Took out water floods because they ruined the map too much with the current way water works. They may be readded once a method for properly removing water is added to the game.
		<p>Gargoyles now can only gain 150 points of defence from diamonds, they also now gain 10 defence per diamond instead of the old 7, and diamond defence gained is now treated seperately from the base defence value meaning things like Holy Shield won't mess up your gargoyle defence.
		<p>Gave devourers base damage and a damage per level, they now get slightly above the damage of a hell forged blade by the time they reach level 100 if they use the weapon damage devouerer buff. The "Hardened Casing" devourer buff now only increeses your defence by 125 points rather than infinitely, but also gives 5 points per use rather than 3 points.
		<p>Finished converting EVERY SINGLE LAST NPC to their appropriate perent types. Every NPC you've found before will now be a fair bit diffrent, and probably more powerful.
		<p>Improved the NPC move speed. Now they move at a 1 frame slower than player units instead of 2 frames slower.
		<p>Made the leveling proc loop when you level up with enough experience for more than one level.
		<p>Halved the spider cap, now you can only ever have 50.
		<p>Spiders will now only be told when they first grow a gland rather than every time it improves.
		<p>Gave Dragons a unit cap of 20. It was getting out of hand when players playing as dragons had more units than everyone else on the server combined.
		<p>Made Devourers Subrace immune. Thus they can no longer become vampires, werewolves, or half demons.
		<p>Guard is now a general term and there's only one type of it. It's used by NPCs and Players alike. Diffrent guard targetting rules will become avalible in the future. Currently there is not support for bows and support will not be added until bows are re-worked.
		<p>Removed single click popup menus from sand and some other objects that I can't be bothered to remember.
		<p>Units can no longer die of old age. Long life potions now reduce your age rather than improve your die age, thus can be used to allow a unit too old to breed to breed again. Notably if a mage grows past his or her die age, they will not be able to use their magic.
		<p>Recoded wall climbing races to work with the movement process rather than an independent process to reduce an excess of processing. It should also run more smoothly now.
		<p>Fused the glass forge into the smelter station. Smelting Skill is no longer used, and runs on the metalcrafting skill instead.
		<p>Hopefully fixed a bug causing some races to not be able to skin dead bodies properly.
		<p>Made gremlins subrace-proof, but gave them slightly higher stat gains to make up for this.
		<p>Fixed the invisible werewolf bug.
		<p>Fixed a bug with combat that was causing it to simply not operate if you were standing next to someone who was stunned.
		<p>More changes to the AI. If you kill a NPC, other NPCs of the same owner will be hostile to you for 30 minutes. If you steal an item, NPCs of the same owner will be hostile to you for 10 minutes.
		<p>HP regeneration will now actually work while offline.
		<p>Gave dwarves a 0.25 bonus to the random of agility gains as they were ending up with numbers as low as 20 by level 100.
		<p>Made marsh only effect lizardmen and frogmen with 50% the regular temperature adjust.
		<p>Evil grass will now just make non-evil races really cold really fast rather than dealing direct HP Damage, also saves on some overhead processing.
		<p>Finished up fixing the code for vampire burn. It now actually tests your location, rather than testing variables that are set upon entering a location. Now that those variables are no longer set basic movement will have a much smaller toll on the CPU.
		<p>Made die age trigger when aging happens, rather than every day/night. Saves some unneeded processing.
		<p>Added a CPU display so you can more easily tell the diffrence of your connection lagging vs the server lagging. Found in the YourInformation tab.
		<p>Made the "TakeItems" action on cages not take equipped gear. This will change back in the future, but at the moment it's a requirement until equipment can be recoded to operate more effectively.
		<p>Doubled Elf limb HP gains. Now they're on par with spiders and gremlins for tanking ability, which is still pretty bad.
		<p>Removed a HECK of a lot of random unused objects and processes from the code. You probably don't much care though.
		<p>Made camp fires light wooden turfs on fire 5x as fast as they used to.
		<p>Fixed an issue that was causing dwarves and humans to not autofeed if they were turned vampire.
		<p>Vampires now no longer die so quickly while in sunlight, they will take direct HP damage every 5 seconds similar to how damage from hunger and tiredness works rather than getting hurt every step they take. They die in about 30-50 seconds in sunlight if they enter it at full HP.
		<p>Quickly redid some of the code on how turfs are handeled. There's a high chance there'll be a few bugs. Be sure to report any bugs you find so they can be quickly corrected.
		<p>Due to an increese of players, reduced the number of NPCs to help with the lag issue.
		<p>Gave true illithids slightly more reasonable stat gains now that they aren't so powerful with their mind powers.
		<p>Removed an artifact of code that was causing you to only gain MaxPartHPs if you had a left arm.
		<p>Fixed a few issues with items that were dropped as a result of combat not despawning properly.
		<p>Made lizardmen passively build up defence towards level 40, rather than having to go into an interact menu after reaching level 40 to activate their 20 point defence bonus. They now also gain the cold blooded buff passively.
		<p>Svartalfars no longer grow tired. Being they are suposed to be elves.
		<p>Fixed an issue with elves that was causing them to not regenerate from damage properly.
		<p>Removed the instant kill on maces against gargoyles as it made gargoyles mostly useless. However maces now ignores 50% of a gargoyle's defence in the ability's place.
		<p>Hitting people now gives as much experience as hitting a legendary training post, making training up on NPCs an even better option.
		<p>Buffed humans to make them an actually reasonable choice for making an army with. They now have 50 points higher max to weapon skills, making them do a nice bit more damage.
		<p>Started fixing a few hunger/tiredness probloms with enslaved NPCs and saves, but not all.
		<p>Fixed an issue with NPC orcs acting like frogmen used to and getting double action rate when in combat.
		<p>Buffed dragon's base defence dramatically, as it was downright terrible how a level 50 dragon had less defence than a guy in full legendary armor.
		<p>Gave humans the "DigChannel" option in the floors menu like dwarves. Remember you need a spade to use it.
		<p>Unit's suffering from a temporary mind control can no longer be suicided, buffed the chance of success on unholy breath to go with this.
		<p>Changed up half demons. They are slightly more powerful now and are actually fireproof, however they no longer stack with other subraces. Meaning you can no longer make half demon werewolves for example.
		<p>Made the vampire potion follow the new vampire system.
		<p>Patched up the building code and gave a lot more construction options to various races, particularly bridges. If anyone finds a race that can't build something you think it should be sure to bring it up.
		<p>Made players able to start as frogmen because it was requested.
		<p>Removed white/black selection from Humans.
		<p>Removed adventure mode as an option durring restarts for a number of reasons.
		<p>Recoded frogmen as real units. They now have 2 specials to them. For 1 they have poison skin causing damage to attackers on a chance that increeses with level. For 2 they have an innate 20% resistance to damage, applied after defence so as to not cause damage negation. They now have "low" class statgains, relating to those of a kobold or a goblin. Note also that NPC Frogmen are not hostile to player Frogmen.
		<p>Fixed a bug that was causing players playing as vampires or svartalfars to die when they walked on holy grass.
		<p>Fixed up the sand dragon icon as it was never actually finished.
		<p>Removed illnesses from the game, as they were glichy, caused spam, and were generally pointless to begin with. Sickness related abilities have been buffed in other manners to make up for this however.
		<p>Reduced the blood despawn time and gave it a random. Apperently it IS possible to have too much blood.
		<p>Changed blood to last 6 minutes on the ground before despawning, acid blood however will despawn at the old rate.
		<p>Fixed the bug causing limbs to despawn inside a character's invantory but not take away carry weight, now they despawn like regular items.
		<p>All demons have been dramatically buffed. Just because you could handel them before doesn't mean you can now. Demon Lords may also prove quite deadly.
		<p>Demon Lords now spawn at a 50% the original chance due to the fact that many demons are now being killed by NPCs, thus demons respawn more often and more demon lords show up.
		<p>Lowered the gargoyle max base defence by 100, now 250. Reason being that at 350 with armor you could easily more than fully reduce the damage of a soul blade to minimum. They're still tanks and legendary weapons will probably still do just about nothing to them, but they won't so easily solo an army of dragons on their own. To make up for this slightly, the defence per diamond has increesed from 5 to 7.
		<p>Fixed the bug that has been around forever that messed up the bumping process on stacked units. No longer will you be troubled with 2 stacked critters that you can't attack, but you also won't be able to abuse becoming invulnerable by standing on a wall.
		<p>Removed craftability of wands. They may or may not be re-added with the future plans to remake the magic system.
		<p>Did some large changes to vampires by importing my old server's code for them. The main changes are vampires will always automatically feed in combat but it now shares a cooldown with the normal bite, morph now only morphs into the creature's original race, and a few points of the vampire abilities actually improve in power with level. Otherwise the most of this change was cleaning up the code and fixing a few bugs.
		<p>If a gargoyle decides to fly, its defence will become 50% effective. This is because flying made them immune to their greatest weakness, traps.
		<p>Fixed a bug with gargoyles and poisoncrafting.
		<p>Holy breath from a holy dragon no longer heals blood past its max value.
		<p>Corrected a really curious bit of code that was causing creatures to lose weight when taking from a chest.
		<p>Fixed a bug that was causing NPCs to pick up their weapon with a broken arm.
		<p>Did a large ammount of reconstruction to statpanels. Look for yourself, there's more changes than I'd care to explain here.
		<p>Buffed Spiders by giving them claws and claw skill. They don't gain as much damage from it as other races however.
		<p>Fixed a bug that was causing experience to earned from suicide.
		<p>Dragon breath now automatically target a unit's destination if their magic target it out of range.
		<p>Made changes to the stat() process to make it run slightly faster and include some missing stats. Most notable, any unit with Poison Damage will now get to see just how much they have.
		<p>Kobolds and Vampires gain a small damage bonus to unarmed attacks now.
		<p>Added Quick little Experience Share System on kills. All units you control nearby to the killer now gain 1/10 the experience the killer gains.
		<p>Gave Devourer Zombies an actual race var of "Zombie". All this really means is they get a small ammount of stat gains for leveling up now rather than nothing.
		<p>Moved around a few Dragon type benefits and improved some of them to make diffrent dragon types more ballenced between themselves. Overall dragons are now slightly stronger. Also dragons that turn into a type that gains a speed bonus no longer misses out on it as a result of running.
		<p>Recoded flying. For the most part the only change is that you no longer are stopped from landing just because you lost some limbs. This also fixed a few gliches with Dragons not being able to use any abilities if their icon got lighter or darker.
		<p>Fixed a large number of bugs related to the new breeding system.
		<p>Finally finished implimenting the new breeding code. Breeding can be triggered by both the female and the male side now, rather than only the male being able to use the interact option. For now race will have no effect upon magical chances so anybody can be a mage if the new chance is met, there are plans to change this once I get the chance. In other news there's a chance that pets might be able to breed with plants.
		<p>Fixed a few bugs here and there as requested by various people who noticed them, including but not limited to a bug with gargoyle crafting that wasn't making the weight disappear with the items that got deleted.
		<p>Started making changes to equipment, thus meaning some bugs might rise up, but also meaning soon we'll get some actually useful updates.
		<p>Added shooting stars that can show up at night. You'll have to figure out on your own what they do.
		<p>Dramatically lowered the werewolf stat gain bonus, removed the ability to transform at will ever, made werewolf armor only match adamantium at level 100 rather than being more than more than double it, debuffed their level based damage by 25% but gave them an improvement to the base damage, fixed a bug that caused shadowfiend to cause infinite defence gains on werewolves, improved the silver benefit against werewolves, and fixed another bug that was causing werewolf stats to mess up durring transformations. Overall they're still overpowered in werewolf form, but will actually die fairly quickly if you use lots of silver against them.
		<p>Made Dragons immune to temperature regardless of their element, again. Due to a typo while they were being recoded the last time I did this became obsolete.
		<p>Reconstructed the way Race identification works in the code, any units that have changed race will find their save may be corrupted, but units that havn't had any race changes should be fine. This is a massive change to the code, and there may be bugs, but the possibilities of updates unlocked by this are very much so worth it.
		<p>Fixed a bug that was making svartalfars take sun damage, when they're only supposed to lose mana in the sunlight.
		<p>Removed the Help verb, because it really didn't help anything but clogging up the commands tab.
		<p>Did some changes to admin-related stuff. As a result some of the admin related actions will now have less of a toll on the CPU.
		<p>Added some missing checks in the AI that were allowing limbless NPCs to equip weapons and shields continually after losing limbs in combat.
		<p>Wandering AI no longer targets swamp plants. Swamp plants also now have a near-unreachable die age, and thus can effectively be used to ward off NPCs
		<p>Made the Devourer cacoon time only 1 minute instead of the old 4. Probably will be removed entirely in the future, but that's after I get into changing the area of the code that's actually connected to.
		<p>Gave Devourers a base bonecraft skill of 25 being it didn't make much sense for them to start with 0 in their only crafting skill.
		<p>Removed the werewolf ability to "devour" dead bodies. This being they're overpowered to begin with, without being able to fully recover themselves at will. It may be readded when I get to properly ballencing werewolves however.
		<p>Redid the code on Dragons, the only noticable diffrence should be that the magma and water dragons spit diffrently, and you actually face the direction of your magic target upon use.
		<p>Hopefully fixed an issue with AI that was causing a large lag build up.
		<p>Removed the "Lay Eggs In" option from cages for spiders, this is because the current code it ran on pretty much allowed you to create a spider without the birth delay and it was full of bugs. I probably won't re-add it being it's mostly irrelevent.
		<p>Made closer creatures take targetting priority on the AI.
		<p>Spiders now only bleed silk if they actually have some, making it slightly more difficult to get.
		<p>Remade Spiders a small bit, sadly anyone who had spiders in their save may experience a corrupted save file. This "should" fix many bugs about them, but the remaking process isn't 100% finished and may currently have a few bugs of its own.
		<p>Made more changes to the map by opening up some of the more thin passages to make up for the increesed NPC count.
		<p>Ballenced out Telekinesis a bit by giving it a 3 second cooldown in addition to its tiredness cost, still powerful and deadly against a single unit, but can no longer hold back armies.
		<p>Ballenced out mind control a little by making it only possibly work on people under level 10 in addition to its regular chance based effect.
		<p>Fixed serveral million ways that processes were stacking and causing things like double movement, hunger, tiredness, bleed, and so on. Take that enslave abusing bug abusers!
		<p>Made gargoyles only able to fly once they reach level 40, this is because the cost of flying is tiredness, and gargoyles no longer grow tired.
		<p>Changed the map in a few key locations that were often causing probloms with the AI. Particularly the Skorn Castle is more open.
		<p>Wandering NPC Alliance will now spawn around premade NPC Human towns, they will not attack players unless they are attacked.
		<p>Further improved NPCs, NPC Orcs and NPC Lizardmen will not attack player-owned units of the same race unless attacked. Currently other races will attack as normal however.
		<p>Changed a few cases of the owner "{NPC Human}" to "{NPC Alliance}" so they would be allied as intended and follow proper AI.
		<p>If used by a Devourer, the "Tear All Meat" button on the HUD now incorperates all dead bodies into the Devourer now instead of tearing meat from normal corpses, non-encorperatable creatures such as fish and moles will be torn as normal however if you need bones.
		<p>Made Devourers able to create a zombie with just 1 body now, as they aren't very powerful to begin with.
		<p>Dragons now no longer lose their immunity to temperature when they change form. As it doesn't make sense when one turns into a fire dragon and gets burned for walking in hell..
		<p>Added a few new types of NPCs, and improved the number of NPCs placed on the map.
		<p>Reduced the EXP reward from spiders as they happen to have high values in statistics that have an effect on the EXP formula.
		<p>Removed a weird bit of code that was stopping some NPCs from respawning properly.
		<p>Attempted to make up for gargoyle slowness by making them not sleep. They also no longer hunger as time passes, but will still require stone while training.
		<p>Fixed the Day/Night display on the icon in the middle, it'll now even be right if you're just logging in.
		<p>Made gargoyles craftable, you require a few ingredients listed on the button, and the button won't pop up till you get 100 stonecrafting.
		<p>Made changes to the click movement command so that having a single unit that is crippled doesn't stop other units from being given the movement command.
		<p>The HUD option for interact is now the same as the verb, rather than missing most of the details.
		<p>Gargoyles can fly again, and they also start underground so you don't have to look for a mountain before you can do anything.
		<p>Added Quick Group buttons sure to improve your ability to handel lots of guys at once. Details above.
		<p>Added a new "EVENT" verb that players can use. Its function can be changed at any time by an admin to fit the event, thus allowing better player-side event interaction.
		<p>There is now an experience reward for being the "killer" of a creature based on serveral details about that unit.
		"}
	src << browse(html)
world/proc/Aging() spawn() while(1)
	sleep(4500)
	for(var/mob/Monsters/m in world) if(ismob(m.Owner)) if(m.Owner:client)
		m.Age+=1
		m.SpiderAgeGains()
		if(m.Age<=5)
			m.Age += 1
			m.SpiderAgeGains()
		if(m.Critter) if(m.Age>10) switch(m.Race) if("CaveSpider","DeathBeatle","Mole","TowerCap")
			m.GoingToDie = 1
			m.Killer = "time"
			m.DeathType = "old age"
			m.Death()