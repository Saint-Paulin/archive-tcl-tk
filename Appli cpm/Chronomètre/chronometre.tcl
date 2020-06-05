# Chronomètre !
# Auteur: Paulin
wm title . "Chronomètre"
wm geometry . 200x200
set sec 0
set min 0
set 0 0
set 59 59
label .min -text "Minutes: $min"
label .sec -text "Secondes: $sec"
button .b -text "Commencer" -command start
button .ar -text "Arreter" -command stop
pack .min .sec .b .ar
proc start {} {
	after 1000 start
	global min
	global sec
	global 59
	global 0
	set secc 1
	set ::sec [expr $sec+$secc]
	incr secc
	.sec configure -text "Secondes: $::sec"
	.b configure -state disabled
	if {"$::sec" eq "$59"} {
	unset ::sec
	set ::sec 0
	.sec configure -text "Secondes: $::sec"
	# Minutes
	set minn 1
	set ::min [expr $min+$minn]
	incr $minn
	.min configure -text "Minutes: $::min"
	}
}

proc stop {} {
	global min
	global sec
	global ::sec
	after cancel $::sec
	.sec configure -text "Secondes: $::sec"
}