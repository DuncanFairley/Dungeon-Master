/*
Dungeon Master Copyright © 2013 Aaron Davey and contributors.
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version
2 of the License, or (at your option) any later version.
Full terms in included LICENSE file.
*/




mob/proc/ReportDate(time)
	var/format = "<b>hh:mm:ss</b>" //MM/DD/YYYY
	return time2text(time, format)

var
	Bugs = null//The var for the logging

mob
	verb
		Reportabug(msg as message)
			set hidden = 1
			set desc = "If this is spam, you will be banned"
			Bugs+="([ReportDate(world.realtime)]) [src] Reported: [html_encode(msg)]<br>"//THIS IS WHERE THE BUG LOGS TO THE HTML
			text2file("([ReportDate(world.realtime)]) [src] Reported: [html_encode(msg)]<br>","Bugreport.html") //THIS IS WHERE IT WILL BE RECORDED IN TO A HTML FILE FOR HISTORY CHECKS

		ViewBug()
			set hidden = 1
			usr<<browse("<b><body bgcolor=black><font color=white><center><u>Bug Reports For [world.name]</u></center></b><br><br>Time at view [ReportDate(world.realtime)]<br><br><font color=white>[(Bugs)]<br>")//HERES WHERE THE BUGS RECORED WILL SHOW
