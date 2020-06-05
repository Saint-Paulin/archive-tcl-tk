################################################################################
# Procédure
################################################################################
proc aprops {} {
	tk_messageBox -message "Packman 1.0 Beta by Paulin" -icon info -type ok -title "A propos"
}

proc commandes {} {
	toplevel .top 
	label .top.lat1 -text "Commandes:" -font bold
	label .top.lat2 -text "Fleche: Touche directionnells (haut, droite, gauche, bas)" -font bold
	label .top.lat3 -text "Racourcis:" -font bold
	label .top.lat4 -text "Controle-Q: Quitter - Controle-C: Changer la couleur du personnage" -font bold
	pack .top.lat1 .top.lat2 .top.lat3 .top.lat4
	wm geometry .top 470x200
	wm title .top "Commandes"
}

proc cc {} {

}