# Plus ou moins (+ ou -)
# Auteur : Oggy (Paulin)

wm title . "Plus ou Moins"
wm geometry . 360x150+500-400
#package requir Img

# Variables
set alea [expr int(rand() * 100) + 1]
set nbdc 0

# Widgets
entry .e -font bold
button .b -text "Valider" -command val -font bold
button .rcn -text "Changer le numero mystère" -command rechangenum -font bold
button .quit -text "Quitter" -command quit -font bold
button .diff -text "Diffculté" -command diff -font bold
label .byoggy -text "By Oggy (Paulin)" -fg red -font bold -relief sunken
label .l1 -font bold -text "Taper un nombre !" -relief groove
label .nbdc -text "Nombres de coups : $nbdc" -font bold
pack .e .b .quit .l1 .rcn .nbdc .diff
place .e -x 15 -y 15
place .b -x 210 -y 11
place .quit -x 280 -y 11
place .l1 -x 30 -y 95
place .byoggy -x 230 -y 126
place .rcn -x 140 -y 50
place .nbdc -x 15 -y 120
place .diff -x 60 -y 50
bind . <Control-w> val
bind . <Escape> quit
bind . <Control-q> quit

# Procédures
proc val {} {
	global alea
	global nbdc
	set num [.e get]
	if {$num<$alea} {
		incr nbdc
		.nbdc configure -text "Nonbre de coups : $nbdc"
		.l1 configure -text "$num est plus petit que le chiffre mystère"
	} elseif {$num>$alea} {
		incr nbdc
		.nbdc configure -text "Nonbre de coups : $nbdc"
		.l1 configure -text "$num est plus grand que le chiffre mystère"
	} elseif {$num eq $alea} {
		incr nbdc
		.nbdc configure -text "Nonbre de coups : $nbdc"
		.l1 configure -text "Bravos !! Le chiffre mystère étais bien $num"
	} elseif {$num eq ""} {
		tk_messageBox -message "Vous n'avez rien mis !" -icon error -type ok -title "Erreur !"
	}
}
proc rechangenum {} {
	global nbdc
	global alea
	incr nbdc -$nbdc
	.nbdc configure -text "Nonbre de coups : $nbdc"
	unset alea
	set alea [expr int(rand() * 100) + 1]
}
proc aprop {} {
	tk_messageBox -message "Plus ou Moins By Oggy (Paulin)" -icon info -type ok -title "A propos du Plus ou Moins"
}
proc aide {} {
	toplevel .top 
	label .top.lat1 -text "Aide:" -font bold
	label .top.lat2 -text "Taper sur la ligne de texte un chiffre de 0 a 100(Exemple: 69)" -font bold
	label .top.lat3 -text "" -font bold
	label .top.lat4 -text "Racourcis:" -font bold
	label .top.lat5 -text "Controle-Q: Quitter - Controle-w: Valider" -font bold
	pack .top.lat1 .top.lat2 .top.lat3 .top.lat4 .top.lat5 
	wm geometry .top 555x200
	wm title .top "Commandes"
}
proc quit {} {
set quit [tk_messageBox -message "Quitter le Plus ou Moins ?" -icon info -type yesno -title "Quitter ?"]
switch -- $quit {
yes exit 
}
}

proc diff {} {
toplevel .top
label .top.lb1 -text "Choissisez votre difficulté :" -font bold
label .top.lb1f -text "Facile : 0-50" -font bold
label .top.lb1n -text "(Par default) Normale : 0-100" -font bold
label .top.lb1d -text "Difficile : 0-500" -font bold
pack .top.lb1 .top.lb1f .top.lb1n .top.lb1d
 set i 0
 foreach lb [winfo children .top] {grid $lb -sticky w -row [incr i]}
 foreach j {difficile normale facile} {
	radiobutton .top.$j -text $j -command $j -value $j -font bold
        grid .top.$j -sticky w -row [incr i]
 }
}

proc difficile {} {
	global nbdc
	global alea
	incr nbdc -$nbdc
	.nbdc configure -text "Nombre de coups : $nbdc"
	unset alea
	set alea [expr int(rand() * 500) + 1]
}
proc normale {} {
	global nbdc
	global alea
	incr nbdc -$nbdc
	.nbdc configure -text "Nombre de coups : $nbdc"
	unset alea
	set alea [expr int(rand() * 100) + 1]
}
proc facile {} {
	global nbdc
	global alea
	incr nbdc -$nbdc
	.nbdc configure -text "Nombre de coups : $nbdc"
	unset alea
	set alea [expr int(rand() * 50) + 1]
}