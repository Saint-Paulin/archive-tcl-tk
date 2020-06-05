# Executing
# Nom : executing.tcl
# Auteur : Oggy (Paulin)

# Le logiciel (packages, ...) :

wm title . "Executing"
wm geometry . 300x200
package require quit

# Procédures :

proc gtasa {} {exec "C:/Program Files/Rockstar Games/GTA San Andreas/gta_sa.exe"}
proc qdir {} {exec "C:/Program Files/Q-Dir/Q-Dir.exe"}
proc minecraft {} {}
proc minecraft_serveur {} {}
proc farcry2 {} {}
proc aom {} {}
proc aomx {} {}
proc quitter {} {quit Executing}

# Interface Graphique :

button .quit -text "Quitter" -command quitter -font bold
button .gtasa -text "GTA San Andreas" -command gtasa -font bold
button .qdir -text "Q-Dir" -command qdir -font bold

label .lp -text "Sélctionner une application a démaré" -font bold
label .lj -text "Jeux:" -font bold -fg black
pack .lp
pack .lj
pack .qdir .gtasa
pack .quit