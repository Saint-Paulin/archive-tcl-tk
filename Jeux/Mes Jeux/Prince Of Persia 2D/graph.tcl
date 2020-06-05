 # Complément : graph.tcl
# Jeux : Prince Of Persia
# Fichier : princeofpersia.tcl

set m .map
global m
canvas .map -height 500 -width 500 -bg black
$m create line 200 200 400 200 -fill red -tags obj
$m create rectangle 400 400 300 500 -fill white -tags prince
pack .map

# Lvl 1
canvas .n1s1 -height 500 -width 500 -bg black
canvas .n1s2 -height 500 -width 500 -bg black
canvas .n1s3 -height 500 -width 500 -bg black
canvas .n1s4 -height 500 -width 500 -bg black
pack .n1s1 .n1s2 .n1s3 .n1s3 .n1s3 -pady 10
.n1s1 create rectangle 300 300 400 400 -fill red