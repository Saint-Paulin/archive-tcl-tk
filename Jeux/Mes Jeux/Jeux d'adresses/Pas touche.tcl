# Jeu d'adresse: Pas touche !

# By Oggy (Paulin)
# Créer le 20 Févrié 2012

# ########## Aides ##########
# Comment jouer:
# Passer la souris entre les objets du canvas sans les toucher et atteigner le rouge
# ###########################

# ############################
# ########## Le jeu ##########
# ############################

wm geometry . 500x530
wm title . "Pas touche !"

# ########## Packages ##########
package requir quit

# ########## Variable ##########
set texlab [list Terminal 24 bold]
set texbut [list Terminal 15]
set f ".fon"

# ########## Widgets ##########
# ########## Boutons ##########
button .quit -text "Quitter" -command quitter -font $texbut
button .aprop -text "A propos" -command aprop -font $texbut
button .start -text "Commencer" -command start -font $texbut
button .aide -text "Aide ?" -command aide -font $texbut -fg blue

# ########## Label(s) ##########
label .tos -text "Cliquer sur \n le bouton \n 'Commencer' \n pour \n commencer \n le jeu" -font $texlab -fg black

# ########## Le canvas ########## 
canvas $f -height 500 -width 500 -bg white -cursor plus

# ########## Les objets du canvas ##########
# A évité pour ne pas perdre
$f create rectangle 200 200 250 250 -outline blue -fill blue -tags rectlost
$f create rectangle 150 100 200 175 -outline blue -fill blue -tags rectlost
$f create rectangle 350 350 475 475 -outline blue -fill blue -tags rectlost
$f create rectangle 50 50 200 200 -outline blue -fill blue -tags rectlost
$f create oval 300 100 400 200 -outline blue -fill blue -tags rectlost
# Pour gagner
$f create oval 15 15 75 75 -outline red -fill red -tags rectwin

# ########## Pack ##########
pack .quit .aprop .start
place .quit -x 0 -y 0
place .aprop -x 90 -y 0
place .start -x 190 -y 0
place .tos -x 80 -y 180
place .aide -x 300 -y 0

# Comencencement
proc start {} {
place .fon -x 0 -y 30
destroy .tos
.start configure -text "  Reset  " -command reset
}
proc reset {} {
	global texlab
	destroy .fon
	label .tos2 -text "Cliquer sur \n le bouton \n 'Commencer' \n pour \n commencer \n le jeu" -font $texlab -fg black
	place .tos2 -x 80 -y 180
	.start configure -text "Commencer" -command start
}

# ########## Binds ##########
.fon bind rectwin <Enter> win
.fon bind rectlost <Enter> lost

# ########## Procédure ##########
# => Gagné
proc win {} {
	global texlab
	destroy .fon
	label .win -text "Vous avez gagner !" -font $texlab -fg gold
	place .win -x 10 -y 50
}
# => Perdu
proc lost {} {
	global texlab
	destroy .fon
	label .lost -text "Vous avez perdu !" -font $texlab -fg red
	place .lost -x 10 -y 50
}

# ##############################################################################################
proc aprop {} {
	tk_messageBox -message "Pas touche ! by Oggy" -icon info -type ok -title "A propos"
}
proc aide {} {
	toplevel .top
	wm title .top "Aides au jeu"
	global texlab
	label .top.regle -text "Règles : \n Bleu = Perdu \n Rouge = Gagné !" -font $texlab
	pack .top.regle
}
proc quitter {} {
quit "Pas touche !"
}