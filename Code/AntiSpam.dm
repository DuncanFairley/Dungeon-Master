


proc/SGS_Filter_txt(txt)
	SGS_log_spam(txt)
	var/stars
	var/s_amount
	var/mem
	var/find_t
	var/txtLen
	var/Words[]
	Words = new /list/
	Words = list("\n","Yog Sothoth","<br>")
	if(Words.len)
		memo:
			for(mem = 1,mem < Words.len + 1,mem++)
				find_t = findtext(txt,Words[mem])
				if(find_t)
					txtLen = length(Words[mem])
					stars = null
					s_amount = null
					for(s_amount = 0,s_amount < txtLen,s_amount++)
						stars += "*"
					txt = copytext(txt,1,find_t) + stars + copytext(txt,find_t+txtLen,0)
					if(findtext(txt,Words[mem])) goto memo
	return txt
mob/var/tmp/SGS_kick_for_repeat
mob/var/tmp/SGS_remember_txt
mob/var/tmp/SGS_locked = 0
proc/SGS_AntiSpam(txt)
  SGS_log_spam(txt)
  var/spam = list("<beep>")
  for(var/m in spam)
    if(SGS_allow_beep == 0)
      if(findtext(txt,m))
        return ""
      else if(SGS_allowhtml == 0) return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))
      else if(SGS_allowhtml == 1) return SGS_AntiSpam2(copytext(html_encode(txt),1,SGS_Brake_txt))
proc/SGS_AntiSpam2(txt)
  if(usr.SGS_locked == 0)
    if(usr.SGS_remember_txt == txt)
      usr.SGS_kick_for_repeat ++
    else
      usr.SGS_remember_txt = txt
      usr.SGS_kick_for_repeat = null
      usr.SGS_kick_for_repeat ++
    return txt
    SGS_reset()
proc/SGS_reset()
  spawn(SGS_Waittime) usr.SGS_kick_for_repeat = null
proc/SGS_log_spam(txt)
  if(SGS_Safe_Log_txt == 1)
    var/txt2 = "<br>[usr] said at time: [time2text(world.realtime,"MMM DD hh:mm")] : [txt]"
    SGS_Spam_log_file.Add(txt2)
proc/Safe_Guard(txt)
	return SGS_Filter_txt(SGS_AntiSpam(txt))
var/SGS_Brake_txt = 750
var/SGS_spam_num = 3
var/SGS_allow_beep = 0
var/SGS_Safe_Log_txt = 1
var/SGS_allowhtml = 0
var/SGS_CrashGuard = 0
var/SGS_Waittime = 100
var/SGS_Bantime = 100
var/tick_mem

var/list/SGS_Spam_log_file = new/list
