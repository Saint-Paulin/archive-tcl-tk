# defilement (Flux RSS)
# main + Tk

source [file join graph.tcl]

after 1 dfr

proc dfr {} {
	set ch [expr int(rand() * 5) + 1]
	if {$ch eq 1} {
	.l configure -text "Felix c'est acheter un TPG-1 !"
	}
	if {$ch eq 2} {
	.l configure -text "Paulin a reussi a géré le problème du punk buster sur far cry 2 !"
	}
	if {$ch eq 3} {
	.l configure -text "Marine Le Pen est une extrème droite !"
	}
	if {$ch eq 4} {
	.l configure -text "Paulin a programmer un + ou - !"
	}
	if {$ch eq 5} {
	.l configure -text "Paulin a programmer une calculette !"
	}
	after 3000 dfr
}
