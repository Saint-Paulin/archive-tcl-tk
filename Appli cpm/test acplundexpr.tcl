# test
set vie 100
button .att -text Attaquer -command comb
pack .att
label .viep1 -text $vie
pack .viep1
label .viep2 -text $vie
pack .viep2
proc p1 {} {
	label .vie -textvariable vie
	#label .def -textvariable def
	#label .att -textvariable att
	global vie
	set def 10
	set att 15
}
proc comb {} {
	toplevel .catt 
	button .catt.laser -text "Laser" -command laser
	pack .catt.laser
	if {1 == 0} {
	tk_messageBox -message "K.O" -icon info -title "Information" -type ok
	}
}
proc ko {} {
set viedm [.viep2 cget]
if {$viedm == 0} {
	tk_messageBox -message "K.O" -icon info -title "Information" -type ok
	}
}
# ### attaque ###
proc laser {} {
	global vie
	unset vie
	set vie 0
	.viep2 configure -text $vie
	ko
}