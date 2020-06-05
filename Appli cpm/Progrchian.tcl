# Un programme qui est chian

wm title . "Chian"
wm geometry . 100x100
wm overrideredirect . 1
button .b -text "Cliquer ici" -font bold
pack .b 
place .b -x 15 -y 35
bind . <Control-q> exit
bind .b <Enter> ent
bind . <Control-o> {wm overrideredirect . 0}
proc ent {} {
	set a1 [expr int(rand() * 500) + 1]
	set a2 [expr int(rand() * 500) + 1]
	wm geometry . +$a1-$a2
}