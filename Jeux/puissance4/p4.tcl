#   p4.tcl: un petit jeu de puissance 4 en tcl et c
#   version 0.1
#
#   author : yves Aubry    08-2002
#
#   P4 is distributed under the GNU General Public Licence.
#   p4 comes with ABSOLUTELY NO WARRANTY or GUARANTEE OF FITNESS
#   FOR A PARTICULAR PURPOSE.  
#



# Configuration de la fenetre principale aupres du Windows Manager (WM):
wm resizable . true false
wm title . "Puissance 4"
focus -force .

###########################################################################################
# 	Initialisation de variables										#
#-----------------------------------------------------------------------------------------#
set couleur1 blue
set couleur2 red
set couleur3 green
set couleur4 yellow
# ou white

set joueur 1
# taille du canvas:
set size 400
# taille dune case:
set tcase [expr $size / 8]

set AutoPlay 1
set Niveau 3
set nb_p4_vainqueur max

###########################################################################################
# 	Barre de menus												#
#-----------------------------------------------------------------------------------------#

# Creation du menu utilise comme barre de menu:
menu .menu -tearoff 0

# Creation du menu Fichier:
menu .menu.intjeu -tearoff 0
.menu add cascade -label "jeu" -menu .menu.intjeu
.menu.intjeu add command -label "Nouvelle partie  Ctl-N" -command {demarrer}

menu .menu.option -tearoff 0
.menu add cascade -label "Options" -menu .menu.option
.menu.option add radio -label "jouer à 2" -state normal -variable AutoPlay -value "0" -command {set AutoPlay 0} 
.menu.option add radio -label "Contre l'ordinateur" -state normal -variable AutoPlay -value "1" -command {set AutoPlay 1}
.menu.option add sep
.menu.option add radio -label " 1 seul puissance 4" -state normal -variable nb_p4_vainqueur -value "1" -command {set nb_p4_vainqueur 1;tk_messageBox -icon info -message "Le premier qui fait puissance 4 l'emporte" -title "P4" -parent . -type ok;demarrer}
.menu.option add radio -label " maximum de puissance 4" -state normal -variable nb_p4_vainqueur -value "max" -command {set nb_p4_vainqueur "max";tk_messageBox -icon info -message "Celui qui fait le plus de puissance 4 l'emporte" -title "P4" -parent . -type ok;demarrer}
.menu.option add sep
.menu.option add command -label " Changer niveau" -command "ChangeNiv"

. configure -menu .menu

label .information -textvariable info -height 2 -bg white -relief groove -borderwidth 2 -width 60
pack .information

canvas .lb -width $size -height 20
set x "0"
set y "0"
label .lb.njoueur -textvariable $joueur -width 8
label .lb.posy -textvariable $y -width 8


canvas .c -width $size -height $size

pack .c -padx 6
.c create rectangle 1 1 399 399 -fill white -outline black
 
set color red

#label .lfonc -text "F1             F2             F3             F4             F5             F6             F7             F8"  
label .lf1 -text "F1"  -padx 5
label .lf2 -text "F2"  
label .lf3 -text "F3"  
label .lf4 -text "F4"  
label .lf5 -text "F5"  
label .lf6 -text "F6"  
label .lf7 -text "F7"  
label .lf8 -text "F8"  
#pack .lfonc -pady 4

pack .lf1 .lf2 .lf3 .lf4 .lf5 .lf6 .lf7 .lf8 -padx 16 -pady 4 -side left 

#################################################	----------------------------------------------------------------------------------------------------------------------------------------------#
# 	 Raccourcis clavier:		#
#----------------------------------------------------------------------#

bind . <Control-a> {Affichdamier 0}
bind . <Control-n> {demarrer}



bind . <Up> {
        set Niveau [expr $Niveau +1]
        if $Niveau>7 { ;# j'empêche d'aller au-dela du niveau 7 car au-delà le programme serai trop lent
            set Niveau 7 
        }
        set info "Niveau=$Niveau "    
    }
bind . <Down> {set Niveau [expr $Niveau -1];set info "Niveau=$Niveau "}

bind . <Escape> {exit}

update

;# Changement de niveau: Niveau = nombre de coups calculés à l'avance par l'ordinateur
proc ChangeNiv {} {
    global Niveau niv
    toplevel .niveau
    set niv $Niveau
    label .niveau.lab -text "Nombre de coups calculés à l'avance par l'ordinateur"
    frame .niveau.f1
    entry .niveau.f1.ent -textvariable niv -width 4
    button .niveau.f1.btOk -text "OK" -command {
                        set Niveau $niv
                        destroy .niveau
                        set info "Niveau=$Niveau "
                        if $Niveau>7 {
                            tk_messageBox -icon warning -message "Vous avez sélectionné un niveau de $Niveau \n le programme risque d'être très lent" -title "Attention" -parent . -type ok
                        }
                    }
    button .niveau.f1.btAn -text "Annuler" -command {destroy .niveau;set info "Niveau=$Niveau "}
    pack .niveau.f1.ent .niveau.f1.btOk .niveau.f1.btAn -side left -padx 4
    pack .niveau.lab .niveau.f1
    focus -force .niveau.f1.ent
    
}


# Lancement d'une nouvelle partie
proc demarrer { } {
    global tHauteur enableJeu nbj1 nbj2 AutoPlay info 
	set enableJeu 1
# Efface le damier si une partie etait en cours
 	.c create rectangle 1 1 399 399 -fill white -outline black
 	init_jeu 0
	pack .lb.njoueur

 	for { set i 0} { $i<8 } { incr i } {
		set tHauteur($i) 0 
	}
	set nbj1 0
    set nbj2 0
    bind . <F1> { action 0 }
    bind . <F2> { action 1 }
    bind . <F3> { action 2 }
    bind . <F4> { action 3 }
    bind . <F5> { action 4 }
    bind . <F6> { action 5 }
    bind . <F7> { action 6 }
    bind . <F8> { action 7 }
    if {$AutoPlay == 1 } {
        set info "Vous jouez contre l'ordinateur"
    }
}

demarrer


proc findePartie {} {
    bind . <F1> ""
    bind . <F2> ""
    bind . <F3> ""
    bind . <F4> ""
    bind . <F5> ""
    bind . <F6> ""
    bind . <F7> ""
    bind . <F8> ""
}

proc action {x} {
global enableJeu AutoPlay Niveau info
	if {$enableJeu == 1 } {
		set enableJeu 0
		set chaine [Joue $x]
		set list1 [split $chaine " " ]
		set y [lindex $list1 0]
#tk_messageBox -icon info -message "Joue retourne:($chaine) y:($y)" -title "Debug" -parent . -type ok
		
        if { $y > -1 } {
            if  {[string compare [affiche $x $y $list1] "FIN"]==0} {
                set info "Vous avez gagné !!"
                
            } elseif {  $AutoPlay ==1 } {
				set chaine [JoueAuto $Niveau]				
				set list1 [split $chaine " " ]
				affiche $x -1 $list1
				
			}
		}
		set enableJeu 1
	}
}

proc affiche {x y list1} {
global joueur couleur1 couleur2 couleur3 couleur4 tcase tHauteur AutoPlay nbj1 nbj2 info
global nb_p4_vainqueur

 	set ind 1	
	set lg [llength $list1]


	set nbp4 0
	#set jprec $joueur
	#set id [open "temp.dat" "r" ]
	if { ($y==-1) && ($AutoPlay==1) } {
	#	gets $id x
	#	gets $id y
	set x [lindex $list1 0]
	set y [lindex $list1 1]
	if {$y<-1} { 
			tk_messageBox -icon error -message "Erreur JoueAuto return $y" -title "Fatal Error" -parent . -type ok
			exit
		}
		set ind 2
	}
	#gets $id joueur
	set joueur [lindex $list1 $ind]
	incr ind
	update
	
	if {$ind<$lg} {
		# res indique s'il y a puissance 4
		#gets $id 
		set nbp4 [lindex $list1 $ind]
		incr ind			
	}	
	
		
		#affiche $x $y $joueur
	set xmin [expr $x * $tcase]
	set xmax [expr $xmin + $tcase]
	set ymax [expr (7 -$y) * $tcase]
	set ymin [expr $ymax + $tcase]

	if {$joueur==1} { set couleur $couleur1 } else { set couleur $couleur2 }

	.c create rectangle  $xmin $ymin $xmax $ymax -fill $couleur -tag rect

		
            if {$nbp4>0} {
                # le dernier joueur viens de faire puissance 4
				# joueur est le prochain joueur jrprec est celui qui vient de jouer
				if {$joueur	=="1"} {set jrprec "2";set colort $couleur4} else {set jrprec "1";set colort $couleur3}
				for { set i 0} { $i<$nbp4 } { incr i } {
					#gets $id x1
					#gets $id y1
					set x1 [lindex $list1 $ind]
					incr ind
					set y1 [lindex $list1 $ind]
					incr ind
					set x2 [lindex $list1 $ind]
					incr ind
					set y2 [lindex $list1 $ind]
					incr ind

					#gets $id x2
					#gets $id y2
					set x1 [expr ($x1 + 0.5) * $tcase ]
					set y1 [expr (7.5 - $y1)* $tcase]
					set x2 [expr ($x2 + 0.5) * $tcase ]
					set y2 [expr (7.5 - $y2)* $tcase]

					.c create line $x1 $y1 $x2 $y2 -fill $colort -width 3
					#tk_messageBox -icon info -message " p4 de ($x1,$y1) à ($x2,$y2) " -title "Puissance 4" -parent . -type ok
				}
							
                if [string compare $nb_p4_vainqueur 1]==0 {
                    if {$couleur=="red"} { set couleur rouge } else {set couleur bleu}
                   
                    tk_messageBox -icon info -message " Le joueur $couleur l'emporte " -title "Fin de partie" -parent . -type ok
                    findePartie
                    set tmp "set nbj$jrprec 1"
                    eval $tmp
                    return "FIN"
                } elseif {$jrprec == "1"} {
                    set nbj1 [expr $nbj1 + $nbp4]
					tk_messageBox -icon info -message " $nbp4 Puissance 4 \n pour le joueur1 \n total:$nbj1 " -title "Bravo" -parent . -type ok
				} else {
					set nbj2 [expr $nbj2 + $nbp4]
					tk_messageBox -icon info -message " $nbp4 Puissance 4 \n pour le joueur2 \n total:$nbj2 " -title "Bravo" -parent . -type ok
				} 
				set info "joueur1:$nbj1    joueur2:$nbj2"

			}
			if { $y>6} {
				set tHauteur($x) $y
				set i 0
				while {($i<8) && ($tHauteur($i)>6)} { incr i }
				if { $i>7 } {
					tk_messageBox -icon info -message " La partie est terminé\n Joueur1:$nbj1 puissance4\n Joueur2:$nbj2 puissance4" -title "Fin" -parent . -type ok
					
				}
			}
		
			
		return "RAS"
	
	
}





