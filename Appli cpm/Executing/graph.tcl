# Fichier : graph.tcl
# Type : Compl�ment d'appliquation
# Type de Compl�ment : Graphismmes
# Application : Executing
# Fichier de l'application : executing.tcl
# Auteur : Paulin
# Date : 10/03/2012

button .quit -text "Quitter" -command quitter -font bold
button .gtasa -text "GTA San Andreas" -command gtasa -font bold
button .qdir -text "Q-Dir" -command qdir -font bold

label .lp -text "S�lctionner une application a d�mar�" -font bold
label .lj -text "Jeux:" -font bold -fg black
frame .jeux -bg red
pack .jeux
place .lp -y 0 -x 0
pack .lj -in .jeux
pack .quit .qdir
