# Iditifient + mot de passe
# By Paulin

set comp compte.conf
button .conec -text "Se connecter" -command conec -font bold
entry .id -font bold
entry .mdp -font bold -show •
proc conec {} {
	set id [.id get]
	set mdp [.mdp get]
	if {"$id" == "id"} {
	if {"$mdp" == "mdp"} {
	destroy .conec .id .mdp
	label .l -text "Vous êtes connecter"
	pack .l
	}
	}
}
pack .conec .id .mdp

source [file join compte.conf] 

catch { source compte.conf }
catch {
set fp [open $comp w]
puts $fp \
"
if {"$id" == "id2"} {
if {"$id" == "mdp2"} {
label .l -text "Vous êtes connecter" -font bold
pack .l
}
}
"
close $fp
} msg

