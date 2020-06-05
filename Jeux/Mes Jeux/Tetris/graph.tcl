# Graphismes

# ###############################################################################
# Menu
# ###############################################################################

menubutton .file -text "Fichier" -menu .file.menu -font bold
pack .file 
menu .file.menu 
.file.menu add command -label "Jeu" -command exit
.file.menu add separator
# .file.menu add cascade -label "Autre Action" -menu .file.menu.sousmenu
# .file.menu add separator
.file.menu add command -label "Quitter" -command quit
menu .file.menu.sousmenu
# .file.menu.sousmenu add command -label "Mettre en rouge" -command enrouge 
# .file.menu.sousmenu add command -label "Mettre en gras" -command engras

button .b -text "Commencer" -command start -font bold
button .quit -text "Quitter" -command quit -font bold
pack .b .quit

# ###############################################################################
# Map
# ###############################################################################

canvas .tetris -height 500 -width 500 -bg black 
pack .tetris -side left

# ###############################################################################
# canvas
# ###############################################################################

.tetris create rectangle 30 30 60 60 -fill red -outline black -tags carre