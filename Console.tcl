# Console
set font [list Terminal 15]
text .t -font $font
pack .t
button .b -text "Executé" -font bold -command commande
pack .b
bind .b <Control-q> commande
proc commande {} {
set txt [.t get 1.0 end]
after 100 $txt
}

# ----------------
# Les commandes
# ----------------
proc quit {} {
	exit
}

proc cmd {} {
	exec "C:\Windows\System32\cmd.exe"
}

proc firefox {} {
	exec firefox
}
