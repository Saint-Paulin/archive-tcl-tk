# password / mot de passe by paulin

proc connec {} {
	set pass [.e get]
	after 100 $pass
	label .l -text "connexion en cours" -font bold
	pack .l
} 

foreach mtn {adm test paua} {
proc $mtn {} {
	destroy .e
	destroy .b
	destroy .l
	tk_messageBox -message "Conexion réussite !" -icon info -title "Connexion réussite" -type ok 
	label .ll -text "Vous ête connecter" -font bold
	pack .ll
	button .b1 -text "Déconection" -command reco -font bold
	pack .b1
} 
}

proc adminadmin {} {
	destroy .e
	destroy .b
	destroy .l
	tk_messageBox -message "Conexion réussite !" -icon info -title "Connexion réussite" -type ok 
	label .ll -text "Boujour Admin" -font bold
	pack .ll
	button .b1 -text "Déconection" -command reco -font bold
	pack .b1
	entry .em -font bold
	pack .em
	set cp [.em get]
	button .b2 -text "Créer un nouveau compte"
	pack .b2
	proc $cp {} {
	destroy .e
	destroy .b
	destroy .l .ll .b1 .b2 .em
	tk_messageBox -message "Conexion réussite !" -icon info -title "Connexion réussite" -type ok 
	label .ll -text "Vous ête connecter" -font bold
	pack .ll
	button .b1 -text "Déconection" -command reco -font bold
	pack .b1
	}
	}

proc reco {} {
destroy .ll .b1
entry .e -show • -font bold
pack .e
button .b -text "Connexion" -command connec -font bold
pack .b
}

entry .e -show • -font bold
pack .e
button .b -text "Connexion" -command connec -font bold
pack .b
wm geometry . 200x50
wm geometry . +500+100
