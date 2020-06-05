menubutton .mb1 -text Fichier -menu .mb1.menu -font bold
pack .mb1 -side left
menu .mb1.menu
.mb1.menu add command -label "Fermer" -command exit

menubutton .mb2 -text Fichier -menu .mb2.menu2 -font bold
pack .mb2 
menu .mb2.menu2
.mb2.menu2 add command -label "Fermer" -command exit

proc top {} { 
	toplevel .t 
	wm title .t "toplevel"
	text .t.tex
	pack .t.tex
	button .t.e -text "Fermer la fenêtre" -command exit -font bold
	pack .t.e
	button .t.bo -text "gras" -command gras -font bold
	pack .t.bo
}
button .b -text Editer -command top -font bold
pack .b -side left
button .exit -text Fermer -command exit -font bold
pack .exit -side right
proc gras {} { 
	.t.tex configure -font bold
}
pack .p 
