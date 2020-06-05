# Fichier : graph.tcl
# Type : Complément d'appliquation
# Type de Complément : Graphismmes
# Jeux : Space Invadeurs
# Fichier du jeu : spaceinvadeurs.tcl
# Auteur : Oggy (Paulin)
# Date : 09/03/2012

# Packages
package requir Img

# Variables :
set texbut [list Terminal]
set texlab [list Terminal]
set score 0
set vie 3
set f ".fon"

# Images :
# *Dans le dossier Images/image.jpg
image create photo fon -file Images/ecpace.jpg
image create photo alien1 -file Images/alien1.jpg

# Widgets :
button .quit -text "Quitter" -command quitter -font $texbut
label .score -text "Score : $score" -font $texlab
label .vie -text "Vie : $vie" -font $texlab

# Zone de jeu :
canvas .fon -height 450 -width 450 -bg black
$f create image 200 200 -image fon
$f create rectangle 200 300 300 400 -fill red -tags vu
# $f create image 100 150 -image alien1 -tags alien
$f create rectangle 100 100 150 150 -fill blue -tags alien

# Afichages (Pack) :
pack .quit .score .vie $f

proc quitter {} {
quit "Space Invadeurs"
}