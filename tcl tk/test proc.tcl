button .b -text "obtenir mon pack" -command ot
button .b2 -text "ouvrir mon pack" -command nonepack
pack .b .b2

label .l -text "Pas de pack"
pack .l

proc ot {} {
	.l configure -text "1 pack"
	.b configure -command otnone
	.b2 configure -command open
}

proc otnone {} {
	tk_messageBox -message "Vous avez deja un pack" -icon error \
	-type ok -title "error"
}

proc open {} {
	tk_messageBox -message "Vous avez gagné!!" -type ok \
	-icon info -title "You Win"
	.l configure -text "Pas de pack"
	.b2 configure -command nonepack
	.b configure -command ot
}

proc nonepack {} {
	tk_messageBox -message "vous n'avez pas de pack" -type ok \
	-icon error -title error
}


	
	 
	