proc engras {} {
	.file.menu configure -font bold
	.file configure -font bold
}

proc entttry {} {
	entry .ent -fg red -font bold 
	pack .ent
}

proc enrouge {} {
	.file.menu configure -foreground red
	.file configure -foreground red
}
menubutton .file -text "Fichier" -menu .file.menu
pack .file -side left
menu .file.menu 
.file.menu add command -label "Nouveau" -command nouveauerror
.file.menu add command -label "Ouvrir..." -command ouvrir
.file.menu add command -label "Enregistrer Sous" -command saveas
.file.menu add cascade -label "Autre Action" -menu .file.menu.sousmenu
.file.menu add command -label "Quitter" -command exit
menu .file.menu.sousmenu
.file.menu.sousmenu add command -label "Mettre en rouge" -command enrouge 
.file.menu.sousmenu add command -label "Mettre en gras" -command engras
.file.menu.sousmenu add command -label "Entry" -command entttry

button .b -text "Quitter" -command exit -font bold 
pack .b -side right 

proc nouveauerror {} {
    tk_messageBox -type ok -icon error -title Error \
    -message "vous n'avez pas accès a nouveau"
}

proc ouvrir {} {
    tk_getOpenFile 
}

proc saveas {} {
	tk_getSaveFile -title "Enregistrer Sous" 
}


 












