label .l 
button .b -text "expr 1+2 ?" -command expr
proc expr {} {
	set exp [expr 1+2]
	.l configure -text $exp
}
pack .b .l