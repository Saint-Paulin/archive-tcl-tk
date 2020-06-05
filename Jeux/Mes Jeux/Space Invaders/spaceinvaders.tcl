# Space Invaders
# Nom : spaceinvaders.tcl
# Auteur : Oggy (Paulin)
# Compléments :
	# Graphismmes : graph.tcl
	source [file join graph.tcl]
	
# Packages :
package requir snack
package requir quit
package requir Img

# Le jeu :
wm title . "Space invaders"

# Binding :
bind . <KeyPress-Right> right
bind . <KeyPress-Left> left
bind . <space> tire

# Sons :
set s [snack::sound s]
set talien [snack::sound talien]
$s read "sons/tirlaser.mp3"
$talien read "sons/elim.wav"
 
# Les commandes After :
after 6000 boucle
after 50 recvar

# Procedures :
proc tire {} {
	global f
	global c
	global lind
	global y1
	global lind1
	global s
	$s play
	set c [$f coords vu]
	set lind [lindex $c 0]
	set lind1 [lindex $c 1]
	set lind2 [lindex $c 2]
	set lind3 [lindex $c 3]
	set y1 [expr $lind+50]
	set y2 [expr $lind1-50]
	set y3 [expr $lind2-50]
	set y4 [expr $lind3-50]
	$f create line $y1 $y2 $y3 $y4 -fill red -tags miss
	after 100 movemiss
}
proc right {} {
	global f
	$f move vu 30 0
}
proc left {} {
	global f
	$f move vu -30 0
}
proc movemiss {} {
	global f
	global c
	global y1
	global score
	global la0
	global la1
	global la2
	global la3
	global lind1
	global talien
	$f move miss 0 -5
	after 100 mmiss
	# Variable aleatoire
	#set cx1 [expr int(rand() 50 * 500) + 1]
	if {$la0 eq $y1} {
	$f delete alien
	set ply3 [expr int(rand() * 200) + 1]
	set ply2 [expr int(rand() * 150) + 1]
	$talien play
	$f create rectangle 100 $ply2 200 $ply3 -fill blue -tags alien
	$f delete miss
	incr score
	.score configure -text "Score : $score"
	}
}
proc mmiss {} {
	after 100 mmmiss
	global f
	global c
	global y1
	global score
	global la0
	global la1
	global la2
	global la3
	global lind1
	$f move miss 0 -5
}
proc mmmiss {} {
	after 100 mmiss
	global f
	$f move miss 0 -5
}
proc recvar {} {
	global f
	global la0
	global la1
	global la2
	global la3
	global lind1
	set alien [$f coords alien]
	set la0 [lindex $alien 0]
	set la1 [lindex $alien 1]
	set la2 [lindex $alien 2]
	set la3 [lindex $alien 3]
}
proc boucle {} {
	after 100 te
}
# L'Alien attaque
proc te {} {
	global f
	global la0
	global la1
	global la2
	global la3
	global alien
	global vie
	set ey0 [expr $la0+50]
	set ey1 [expr $la1+50]
	set ey2 [expr $la2-50]
	set ey3 [expr $la3+50]
	$f create line $ey0 $ey1 $ey2 $ey3 -fill blue -tags te
	$f move te 0 5
	global lind1
	if {$ey3 == $lind1} {
	set exprlife [expr $vie-1]
	incr vie $exprlife
	.vie confgure -text "$vie"
	}
	after 100 tem
}

proc tem {} {
	after 100 tem
	global f
	global alien
	$f move te 0 5
}