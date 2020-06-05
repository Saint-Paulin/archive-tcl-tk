#!/usr/bin/tclsh
# Tires By Paulin

set score 0
label .sc -text "Score: $score" -font bold 
pack .sc
canvas .c -width 500 -height 500 -bg white -cursor plus
pack .c
.c create oval 30 30 50 50 -fill red -outline red -tags mek
.c bind mek <1> mo

proc mo {} {
	global score
	incr score
	.sc configure -text "Score: $score"
	set a1 [expr int(rand() * 500) + 1]
	set a2 [expr int(rand() * 500) + 1]
	set a3 [expr int(rand() * 500) + 1]
	set a4 [expr int(rand() * 500) + 1]
	.c coords mek $a1 30 $a3 $a4
}
