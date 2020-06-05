entry .e  -font bold
button .b -text "Salut" -command act -font bold
button .bq -text "Quitter" -command exit -font bold
label .l -font bold
proc act {} {
	set en [.e get]
	.l configure -text "Salut $en"
}
pack .e 
pack .b
place .bq -y 24 -x 120
pack .l