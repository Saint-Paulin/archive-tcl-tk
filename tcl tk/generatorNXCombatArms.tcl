entry .e -font bold -foreground red
pack .e 
package requir tile
set valis [list "10 000 NX" "25 000 NX" "45 000 NX"]
ttk::combobox .comb -values $valis
pack .comb
button .generate -text "generate NX" -command generateb -font bold
pack .generate
proc generateb {} {
	set nx [.comb get]
	tk_messageBox -type ok -icon info -title "Information"\
	-message "$nx seron chargé sur votre compte."
}
frame .cadre -width 200   
frame .barre 
place .cadre  -anchor center -relx 0.5 -rely 0.5
place .barre -in  .cadre -x 0 -y 0
pack .cadre
pack .barre
ttk::menubutton .m -text test -menu .men
pack .m
menu .men
.men add checkbutton 