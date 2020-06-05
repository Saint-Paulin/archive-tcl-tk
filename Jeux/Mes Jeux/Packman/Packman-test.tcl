# La frame de fond

frame .f -width 550 -height 550 -bg red
pack .f

################################################################################
# Menu
################################################################################

menubutton .file -text "Fichier" -menu .file.menu -font bold -bg red -fg blue
pack .file 
place .file -x 0 -y 0 -in .f
menu .file.menu 
.file.menu add command -label "Jeu" -command cc
.file.menu add separator
.file.menu add cascade -label "Autre Action" -menu .file.menu.sousmenu
.file.menu add separator
.file.menu add command -label "Quitter" -command exit
menu .file.menu.sousmenu
.file.menu.sousmenu add command -label "Mettre en rouge" -command enrouge 
.file.menu.sousmenu add command -label "Mettre en gras" -command engras

menubutton .aide -text "Aide" -menu .aide.menuai -font bold -bg red -fg blue
pack .aide 
place .aide -x 140 -y 0 -in .f 
menu .aide.menuai 
.aide.menuai add command -label "Commandes" -command commandes


menubutton .aprop -text "A propos" -menu .aprop.menuap -font bold -bg red -fg blue
pack .aprop 
place .aprop -x 60 -y 0 -in .f 
menu .aprop.menuap 
.aprop.menuap add command -label "A propos" -command aprops

wm geometry . 550x550

################################################################################
# Source
################################################################################

source [file join Variable/variable.tcl]
source [file join map/maptest.tcl]
source [file join canvas/mur/canvasmtest.tcl]
source [file join canvas/perso/fantome.tcl]
source [file join canvas/perso/packman.tcl]
source [file join bind/allbind.tcl]
source [file join proc/procallbind.tcl]
source [file join proc/procfile.tcl]