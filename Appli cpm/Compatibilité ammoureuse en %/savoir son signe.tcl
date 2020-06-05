# Savoir son signe ! Nom + photo
wm title . "Savoir son signe"
set mois [list 	Janvier Févrié Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre]
set jour [list 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31]
set fmois "Janvier Févrié Mars Avril Mai Juin Juillet Août Septembre Octobre Novembre Décembre"
set fjour "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31"
set signe [list Bélier Taureau Gémeaux Cancer Lion Vierge Balence Scorpion Sagittaire Capricorne Verseau Poissons]

set texbut [list Terminal 15]
package requir tile

ttk::combobox .mois -value $mois
ttk::combobox .jour -value $jour
.mois current 0
.jour current 0
button .ssi -text "Savoir son signe" -command svss -font $texbut
label .res -text "Votre signe :    " -font $texbut

pack .mois .jour .ssi .res

foreach m {$fmois} {
foreach j {$fjour} {
proc svss {} {
	global fmois
	global fjour
	global signe
	set vmois [.mois get]
	set vjour [.jour get]
	if {"$vmois" == "$fmois"} {
	if {"$vjour" == "$fjour"} {
	.res configure -text "Votre signe : $signe"
	}
	}
}
}
}