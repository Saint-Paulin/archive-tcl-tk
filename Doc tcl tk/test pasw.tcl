entry .e -show • -relief sunken -validate key -textvariable passw
pack .e
set pass [.e get]
button .b -text "Activer" -command act
pack .b
proc act {} { 
global pass
if {$pass == 1001} {
tk_messageBox -message salut -type ok -icon info
}
if {$pass != 1001} {
tk_messageBox -message "mauvais mot de pass" -type ok -icon error
}
}
