# Configuration de la fenetre principale aupres du Windows Manager (WM):
wm resizable . true false
wm title . "Bataille Navale"
focus -force .

###########################################################################################
# 	Initialisation de variables										#
#-----------------------------------------------------------------------------------------#
;# couleurs: \#red blue green
set couleur(1) "\#80B0FF"    ;#bleu clair
set couleur(2) "\#E0FFE0"    ;#vert clair
set couleur(3) "\#80FF80"
set couleur(4) yellow
# ou white

set joueur 1
# taille du canvas:
set size 300
# taille dune case:
set tCase [expr $size / 10]
set NbCase 10



###########################################################################################
# 	Barre de menus												#
#-----------------------------------------------------------------------------------------#

# Creation du menu utilise comme barre de menu:
menu .menu -tearoff 0

# Creation du menu Fichier:
menu .menu.intjeu -tearoff 0
.menu add cascade -label "jeu" -menu .menu.intjeu
.menu.intjeu add command -label "Nouvelle partie" -accelerator "Ctl-N" -command {demarrer}
.menu.intjeu add command -label "Quitter" -accelerator "Escape"  -command exit

. configure -menu .menu

label .information -textvariable info -height 2 -bg white -relief groove -borderwidth 2 -width [expr int($size * 0.15 )]
pack .information

set x "0"
set y "0"


;#pack .lb.info


canvas .xc -width [expr $size + $tCase] -height [expr $tCase+1]
pack .xc -side top


canvas .yc -width $tCase -height $size

canvas .c -width $size -height $size -bg white

pack  .yc .c -side left


;#.c create rectangle 1 1 399 399 -fill white -outline black

set color red


#################################################	----------------------------------------------------------------------------------------------------------------------------------------------#
# 	 Raccourcis clavier:		#
#----------------------------------------------------------------------#

bind . <Control-a> {Affichdamier 0}
bind . <Control-n> {demarrer}
bind . <n> {demarrer}

bind . <Escape> {exit}

update

proc CréeTableaux { } {
    global TabBt1 NbCase TabBt2 TabTir1 TabTir2
    set TabBt1 ""
    set TabBt2 ""
    set TabTir1(trouv,nb) 0
    set TabTir1(lst) ""

    set TabTir2(lst) "" ;# liste des tirs
    set TabTir2(trouv,sens) -1
    set TabTir2(trouv,bool) 0 ;# indique si le preccedent coup a porté
    set TabTir2(trouv,lst) "" ;# liste des coups au but
    
    set TabTir2(trouv,nb) 0
}

# Affiche un bateau
proc afficheBt {x y x1 y1  couleur tag} {
    global tCase
    
    .c create rectangle  [expr $x * $tCase] [expr $y * $tCase] [expr ($x1+1) * $tCase] [expr ($y1+1) * $tCase] -fill $couleur -outline black -tag $tag
    
    
}

# change l'orientation d'un bateau: 
proc ChangeSens {x y } {
    global sens
    incr sens
    if $sens>4 { set sens 1 }
    Button1Motion $x $y
}

# donne les coordonées des extrémitées d'un bateau à partir de son origine et son sens
proc coordBt { x y lg sens } {
    global NbCase
    set x1 $x
    set y1 $y
    switch $sens {
        "1" {
            set x1 [expr $x + $lg]
            if {$x1 >= $NbCase} {
                set x1 [expr $NbCase -1]
                set x  [expr $NbCase - $lg -1]
            }
        }
        "2" {
            
            set y [expr $y - $lg]
            if {$y <0} {
                set y 0
                set y1 $lg
            }
        }
        "3" {
            set x [expr $x - $lg]
            if {$x<0} {
                set x 0
                set x1 $lg
            }
        }
        "4" {
            set y1 [expr $y + $lg]
            if {$y1>=$NbCase} {
                set y1 [expr $NbCase - 1]
                set y  [expr $NbCase -$lg - 1]
            }
        }
    }
    
    return "$x $y $x1 $y1"
    
}

proc Button1Motion {x y} {
    global vprec tCase couleur sens tailleBt NbCase
    set lg $tailleBt(courant)
    
    set x [expr int($x / $tCase)]
    set y [expr int($y / $tCase)]
    set x1 $x
    set y1 $y
    if {[info exist vprec]==1} {
        if {($x != $vprec(x)) || ($y != $vprec(y)) || ($sens != $vprec(sens))} {
            
            set coord [coordBt $x $y $lg $sens]
            
            
            if {$x <0} { set x 0;set x1 $lg}
            if {$y < 0} { set y 0;set y1 $lg}
            
            
            .c delete prec
            set cmd "afficheBt $coord $couleur(2) prec"
            eval $cmd
        }
        
    }
    set vprec(x) $x
    set vprec(y) $y
    set vprec(sens) $sens
    set vprec(lg) $lg
    
}



###################################################################################################################################
#     Joue: tir du joueur1
#
proc Joue { x y } {
global tCase TabBt2 couleur TabTir1 tailleBt
    bind .adv.c <ButtonPress-1> ""

;#tk_messageBox -icon info -message "TabTir1(lst):$TabTir1(lst)" -title "Debug" -parent . -type ok
    set x [expr int($x / $tCase)]
    set y [expr int($y / $tCase)]
    
    set bool [string first "($x,$y)" $TabTir1(lst)]
    set TabTir1(lst) "$TabTir1(lst)($x,$y)"
    
    if {$bool == -1} {
	set bool [string first "$x,$y" $TabBt2]
    
	if ($bool>-1) { ;# Touché !
	    set TabTir1(trouv,nb) [expr $TabTir1(trouv,nb) + 1]
	    
	    set x1 [expr $x * $tCase]
	    set y1 [expr $y * $tCase]
	    .adv.c create oval $x1 $y1 [expr $x1 + $tCase] [expr $y1 + $tCase] -fill $couleur(3)

            if { $TabTir1(trouv,nb) >= $tailleBt(nb) } {

    tk_messageBox -icon info -message "Vous avez Gagné" -title "Bravo !" -parent . -type ok
            return 0 ;# Fin
	    }
				   

	} else  {
	    ;# tir à l'eau
	    set x1 [expr $x * $tCase]
	    set y1 [expr $y * $tCase]
	    .adv.c create oval $x1 $y1 [expr $x1 + $tCase] [expr $y1 + $tCase] -fill white
    }
    Joue2
    
    }
    bind .adv.c <ButtonPress-1> {Joue %x %y }
    
}

# Tir de l'ordinateur
proc Joue2 { } {
global TabBt1 tCase couleur TabTir2 tailleBt
    set coord [choixAuto]

    set x [lindex $coord 0]
    set y [lindex $coord 1]
    
    set bool [string first "$x,$y" $TabBt1]
    ;#puts "joue:x:$x y:$y bool:$bool"
    if ($bool>-1) { ;# touché !!
	    set couleur1 black
	    set bool [string first "$x,$y" $TabTir2(trouv,lst)]
	 
	    if {$TabTir2(trouv,bool)!=1} { set TabTir2(trouv,sens) 1}

	    set TabTir2(trouv,bool) 1
	    set TabTir2(trouv,lst) "$TabTir2(trouv,lst) $x,$y"

	    set TabTir2(trouv,nb) [expr $TabTir2(trouv,nb) + 1]

	    if { $TabTir2(trouv,nb) >= $tailleBt(nb) } {

	      tk_messageBox -icon info -message "L'ordinateur l'emporte" -title "Vous avez perdu !" -parent . -type ok  

	    }

	    ;#puts "TabTir2(trouv,nb):$TabTir2(trouv,nb)"
    } else {
	    set couleur1 white
    }
	
    set x1 [expr ($x+0.5) * $tCase]
    set y1 [expr ($y+0.5) * $tCase]
    set x $x1
    set y $y1    
    
    for {set i 0;set t [expr $tCase/8]} {$i <=[expr  $tCase/2]} {set i [expr $i + $t]} {
        .c create oval $x $y $x1 $y1 -outline $couleur1
	set x [expr $x - $t]  
	set y [expr $y -$t ]
	;#puts "i:$i x:$x y:$y"
	set x1 [expr $x1 + $t ]
	set y1 [expr $y1 + $t]
    }


}


proc choixAuto { } {
global TabTir2 NbCase info

    set nb -1
    set trouve -1
    if {$TabTir2(trouv,bool) == 1} { ;# si le préccédent tir a touché
	    set coord [split $TabTir2(trouv,lst) " "]
	    set coord [lindex $coord [expr [llength $coord]-1] ]
	    set coord [split $coord ","]
	    set x [lindex $coord 0]
	    set y [lindex $coord 1] ;# tir préccédent
        set Fin 0
        while {(($nb<0) || ($trouve<0)) && (! $Fin) }    {
            switch $TabTir2(trouv,sens) {
                "1" {
                      incr x                 
                }
                "2" {
                    set x [expr $x - 1]
                }
                "3" { incr y  }
                
                "4" {
                    set y [expr $y -1]
                                      
                }
              "5"  {
                    set Fin 1
                    set TabTir2(trouv,sens) 1
                    set TabTir2(trouv,bool) 0
                  ;#  tk_messageBox -icon info -message "Coulé !" -title "Dommage" -parent . -type ok
                }
                
            }
            incr nb
            if { ($x<$NbCase) && ($y<$NbCase) && ($x>-1) && ($y>-1) &&  ([string first "$x,$y" $TabTir2(lst)]<0)} {
               set trouve 1
            } elseif { [string first "$x,$y" $TabTir2(trouv,lst)]<0 } {
                  incr TabTir2(trouv,sens)
                  set info "incr sens: $TabTir2(trouv,sens)" 
            }
        }
;#set info "x:$x y:$y  trouve:$trouve nb:$nb  "
    }

    if $trouve==-1 {
	while {($nb<0) || (([string first "$x,$y" $TabTir2(lst)]>-1) && ($nb<1000))} {
	    set x [expr int( rand() * $NbCase)]
	    set y [expr int( rand() * $NbCase)]
	    incr nb
	}
    }

    set TabTir2(lst) "$TabTir2(lst) $x,$y"
    return "$x $y"
}


###############################################################################################
#                       DebutJeu:              
# Crée la fenêtre adv dans laquelle on clicquera pour tirer sur l'adversaire
#

proc DebutJeu {} {
    global size tCase couleur NbCase
    toplevel .adv
    
    canvas .adv.xc -width [expr $size + $tCase] -height [expr $tCase+1]
    pack .adv.xc -side top
    
    
    canvas .adv.yc -width $tCase -height $size
    
    canvas .adv.c -width $size -height $size
    
    pack  .adv.yc .adv.c -side left
    
    focus -force .adv
    .adv.c create rectangle 1 1 399 399 -fill $couleur(1) -outline black
    
    for { set i 0;set x 0} { $i<$NbCase } { incr i;set x [expr $x + $tCase] } {
        .adv.c create line 1 $x $size $x 
        .adv.c create line $x 1 $x $size
        
        .adv.xc create text [expr $tCase*($i + 1.5)] [expr $tCase/2] -text $i
        .adv.yc create text [expr $tCase/2] [expr $tCase*($i + 0.5)] -text $i
    }
    bind .adv <Escape> exit

    PlaceAuto

    bind .adv.c <ButtonPress-1> {Joue %x %y }
    bind .adv <Control-n> {demarrer}   
}

#############################################################################################
###                BateauSuiv:
##  taille du prochain bateau a placer
#
proc BateauSuiv {} {
    global tailleBt
    set lg -1
    set tailleBt(max) [llength $tailleBt(lg)]
    set nb $tailleBt(n)
    ;#puts "nb:$nb "
    if {$nb <= $tailleBt(max)} {
        set lg [lindex $tailleBt(lg) $nb]
        ;#puts " lg:$lg"
    }
    set tailleBt(courant) $lg
    incr nb
    set tailleBt(n) $nb
}

# procedure appellee avant de placer un bateau pour vérifier
# si certaines cases du bateau ne sont pas déjà occuppées
proc verifCoord { x y x1 y1  joueur} { 
    global  TabBt1 TabBt2 info NbCase
    if { $y==$y1 }  {
        set a $x
        set b $x1
    } elseif $x==$x1  {
        set a $y
        set b $y1
    }
    set OQP 0
    for  {set i $a} { $i<=$b } {incr i} {
        if ($y==$y1) {
            ;#set cmd "set t \$TabBt${joueur}($i,$y)"
            set cmd "set t \[string first \"($i,$y)\"   \$TabBt${joueur}\]"
            eval $cmd
 ;#   tk_messageBox -icon info -message "TabBt1:$TabBt1 \n $cmd\n t:$t" -title "Debug:verifCoord" -parent . -type ok
        } else  {
            ;#  set cmd "set t \$TabBt${joueur} $x,$i"
            set cmd "set t \[string first \"$x,$i\"   \$TabBt${joueur}\]"
            eval $cmd
        }
        if $t>=0 {    ;# si la case est déjà occupé
            set OQP 1    
        }
       ;#   tk_messageBox -icon info -message "$cmd\nt:$t" -title "Debug:verifCoord" -parent . -type ok      
    }


    if {$OQP == 0} { ;# Vérifie que le bateau n'en touche pas un autre
	
	set t -1
	set t1 -1

	incr x1
	if {$x1<$NbCase} {
	    set cmd "set t \[string first \"$x1,$y\"   \$TabBt${joueur}\]"
	    eval $cmd
puts "cmd:$cmd  t:$t "
	} 
	if {$x>1} {

	    set cmd "set t1 \[string first \"([expr $x-1],$y)\"   \$TabBt${joueur}\]"
	    eval $cmd
	    ;#puts "cmd:$cmd  t1:$t1"
	}
	

	incr y1
	if {$y1<$NbCase} {
	    set cmd "set t \[string first \"([expr $x-1],$y)\"   \$TabBt${joueur}\]"
	    eval $cmd

	} elseif {$x>1} {

	    set cmd "set t \[string first \"([expr $x-1],$y)\"   \$TabBt${joueur}\]"
	    eval $cmd
	}
	if $t>-1 {set OQP -1}

	
    }

    return $OQP
}

# Sauvegarde la position d'un bateau
proc saveCoord { x y x1 y1  joueur} {
global  TabBt1 TabBt2 info
    if { $y==$y1 }  {
        set a $x
        set b $x1      
    } elseif $x==$x1  {       
        set a $y
        set b $y1
    }
    for  {set i $a} { $i<=$b } {incr i} {
        if ($y==$y1) {
           ;# set  cmd "set TabBt${joueur}($i,$y) 1"
            set  cmd "set TabBt${joueur} \"\$TabBt${joueur} ($i,$y)\" "
        } else  {
           
                set  cmd "set TabBt${joueur} \"\$TabBt${joueur} $x,$i\" "
        }
       ;# tk_messageBox -icon info -message "$cmd" -title "Debug:saveCoord" -parent . -type ok
        eval $cmd
    }
   ;# tk_messageBox -icon info -message "$TabBt1" -title "Debug:saveCoord" -parent . -type ok
}

# Tente de placer un bateau du joueur à la position x,y
proc PlaceBateau { x y} {
    global sens tCase NbCase info tailleBt vprec couleur
    if [info exists vprec] {unset vprec}
    bind .c <Motion> ""
    bind .c <ButtonPress-1> ""
    bind .c <ButtonPress-3>  ""
    
    set x [expr int($x/$tCase)]
    set y [expr int($y/$tCase)]
    
    set lg $tailleBt(courant)
    
   
        
    set coord [coordBt $x $y $lg $sens]
    
    set cmd "verifCoord $coord 1"
    set bool [eval $cmd]    ;# Vérifie si certaines cases du bateau ne sont pas déjà occuppées
    
    if ($bool<1) {
    
        set cmd "afficheBt $coord $couleur(3) bat"
        eval $cmd
    
    
        set cmd "saveCoord $coord 1"    ;# x y x1 y1 joueur1
        eval $cmd
    
         BateauSuiv
        
        
          if { $tailleBt(n) > $tailleBt(max) } {
            set Fin 1
            
           } else {
            ;#set tailleBt(n) $nb
                set Fin 0
          }
    
        set info "x:[lindex $coord 0] , y:[lindex $coord 1] -- x1:[lindex $coord 2] , y1:[lindex $coord 3] "
        if $Fin==1 {
            set info "Tous les bateaux sont placés"
            DebutJeu
        
        
        } else  {	    
            bind .c <ButtonPress-1> "PlaceBateau %x %y"
            bind .c <Motion> "Button1Motion %x %y"
            bind .c <ButtonPress-3>  " ChangeSens %x %y"
        }
    } else  {
        bind .c <ButtonPress-1> "PlaceBateau %x %y"
        bind .c <Motion> "Button1Motion %x %y"
        bind .c <ButtonPress-3>  " ChangeSens %x %y"
    }
    
}

# Debut du placement des bateaux du joueur
proc PlaceBt { } {
    global sens tailleBt
    set sens 1
    set info "Placez vos bateaux "
    set tailleBt(lg) "4 3 2 1"
    set tailleBt(n) 0
    BateauSuiv

  
    bind .c <Motion> "Button1Motion %x %y"
    bind .c <ButtonPress-1> "PlaceBateau %x %y"
    bind .c <ButtonPress-3>  " ChangeSens %x %y"
   
    
}

# Lancement d'une nouvelle partie
proc demarrer { } {
    global enableJeu nbj1 nbj2 AutoPlay info tCase NbCase size tailleBt
    global couleur
    destroy .adv

    set enableJeu 1
    # Efface le damier si une partie etait en cours
    .c create rectangle 1 1 399 399 -fill $couleur(1) -outline black
    
    
    
    for { set i 0;set x 0} { $i<$NbCase } { incr i;set x [expr $x + $tCase] } {
        .c create line 1 $x $size $x
        .c create line $x 1 $x $size
        
        .xc create text [expr $tCase*($i + 1.5)] [expr $tCase/2] -text $i
        .yc create text [expr $tCase/2] [expr $tCase*($i + 0.5)] -text $i
    }
    set nbj1 0
    set nbj2 0
    
    set indx 0
    set indy 0
    set txty A
    
    CréeTableaux
      
    PlaceBt 
    
}

# Placement des bateaux de l'ordinateur
proc PlaceAuto { } {
    global sens tailleBt NbCase couleur
    set sens 1
    set info "Placez vos bateaux "
    set tailleBt(lg) "4 3 2 1"
    set tailleBt(nb) 14 ;# 5 + 4 + 3 + 2 = 14
    set tailleBt(n) 0
    
    BateauSuiv
    set indice 1

    while {$indice>0} {
	
	set lg $tailleBt(courant)

	;# positionnement aléatoire du bateau
	set x [expr int( rand() * $NbCase)]
	
	for {set t 0;set a [expr 100*rand()]} {$t < $a} {incr t} {set b [expr rand()+rand()] }

	set sens [expr int( rand() * 4)+1 ]
	set t [expr rand() * rand()]

	set y [expr int( rand() * $NbCase)]
	

	set coord [coordBt $x $y $lg $sens]
	set cmd "verifCoord $coord 2"
	set bool [eval $cmd]    ;# Vérifie si certaines cases du bateau ne sont pas déjà occuppées
       
	if {(($bool==0) || (($bool<1) && ($indice>50))  )  } {
    
	    ;#set cmd "afficheBt $coord blue bat"
	    ;# eval $cmd
    
    
	    set cmd "saveCoord $coord 2"    ;# x y x1 y1 joueur1
	    eval $cmd

	    BateauSuiv
	    if {$tailleBt(n) > $tailleBt(max)} { set indice -1}
puts "x:$x y:$y sens:$sens"
	}

	incr indice
    }
puts "indice:$indice"
}

