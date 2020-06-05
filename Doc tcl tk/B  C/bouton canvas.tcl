# #### Bouton Canvas ####
# Auteur : Paulin

# Variable :
set f ".fon"
set texlab [list Terminal 33 bold]

# Widgets :
canvas $f -width 500 -height 500

# Element du canvas :
$f create rectangle 100 100 400 400 -fill white -outline black -activefill green -tags b1
$f create text 250 250 -text "Quitter" -font $texlab

# Binding :
$f bind b1 <1> exit

# Packing :
pack $f