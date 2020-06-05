# test jeux Zombie vs. Humain
wm title . "Zombie vs Humain"

# ##### Variable #####
set texlab [list Terminal 15 bold]
set texbut [list Terminal 15]
set pa 10

after 1000000 attaque

# widget
label .ti -text "Test zvh" -font $texlab
button .attz -text "Attaque le zombie" -command zvh -font $texbut
button .cz -text "choissir la zone" -command cz -font $texbut
button .ch -text "Chantier"
button .flp -text "Fermer la porte"
pack .ti .cz .attz

# Label d'état
label .bless -text "" -font $texbut
label .infect -text "" -font $texbut
label .desy -text "" -font $texbut


proc cz {} {
	toplevel .cz
	button .cz.zone1 -text "zone 1" -command  
}
proc zvh {} {
	global pa
	set expa [expr 1-$pa]
	set zvh [expr int(rand() * 100) + 1]
	if {$zvh>50} {
	tk_messageBox -message "Bravos !! Il est mort !" -type ok -icon info
	} elseif {$zvh<50} {
	tk_messageBox -message "Vous vous aggriper au zombie mais vous ne réusisser pas a le vincre" -type ok -icon error
	}
	if {$pa eq 0} {
	tk_messageBox -message "Vous avez plus de PA" -type ok -icon 	error
	}
}

proc attaque {} {
	set nz [expr int(rand() 50 * 100) + 1]
}

proc etatbless {} {
	set etatbless [expr int(rand() * 100) + 1]
	if {$etatbless < 50} {
	.bless configure -text "blesser"
	}
} 