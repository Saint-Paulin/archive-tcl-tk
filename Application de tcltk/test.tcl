proc construction {} {
	toplevel .t 
	wm title .t "Les construction"
	button .t.b -text "Donjon lvl 1" -command constr
	pack .t.b
}
proc constr {} {
	tk_messageBox  -title "La contruction" -icon info \
-message "Votre batiment a été bien contruit"
.t.b configure -text "Donjon lvl 2"
destroy .t.b
destroy .t
}

button .b -text "construction" -command construction	
pack .b
