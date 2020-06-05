button .b -text ok -command ok
pack .b
proc ok {} {
	destroy .b
	tk_messageBox -message "salut" -type ok -icon info 
} 