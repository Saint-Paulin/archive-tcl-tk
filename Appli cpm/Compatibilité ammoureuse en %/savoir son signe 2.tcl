# savoir son signe 2
wm title . "Savoir son signe"
package requir tile
set mois [list 	Janvier Févrié Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre]
set pfmois ""
set texbut [list Terminal 15]

ttk::combobox .mois -value $mois
.mois current 0
button .ssi -text "Savoir son signe" -command svss -font $texbut

pack .mois .ssi

proc svss {} {
set vmois [.mois get]
after 100 $vmois
}

foreach fmois {Janvier Févrié Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre} {
proc $fmois {} {
	global pfmois
	toplevel .sj
	wm title .sj "Selectionner le jour de naissance"
	foreach btm1 {1 2 3 4 5 6 7 8 9 10} {
	global fmois
	set btmc1 [.sj.b$btm1]
	proc $btmc1 {} {
	
	}
	button .sj.b$btm1
	pack .sj.b$btm1 -side left
	.sj.b$btm1 configure -text $btm1 -command $btmc1
	}
	foreach btm2 {11 12 13 14 15 16 17 18 19} {
	button .sj.b$btm2
	pack .sj.b$btm2 
	.sj.b$btm2 configure -text $btm2 -command $btmc2
	set btmc2 [.sj.b$btm2]
	}
	foreach btm3 {20 21 22 23 24 25 26 27 28 29 30 31} {
	button .sj.b$btm3
	pack .sj.b$btm3 -side right -command $btmc3
	.sj.b$btm3 configure -text $btm3
	set btmc3 [.sj.b$btm3]
	}
}
}