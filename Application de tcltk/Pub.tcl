set a 9.999.999 
label .l -text "Vous ête le $a visteurs" -font bold -bg red -fg blue
pack .l 
button .b2 -text "Cliquer Ici pour recevoir votre prix" -command cl -font bold -bg red
pack .b2
proc cl {} {
	tk_messageBox -icon error -message "Vous avez cliquer trop tard ..." \
	-title Dommage
	exit
}  