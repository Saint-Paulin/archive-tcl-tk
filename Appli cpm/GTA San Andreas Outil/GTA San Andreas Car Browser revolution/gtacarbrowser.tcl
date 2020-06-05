#	--GCB-- Gta Car Browser
#Créer par Paulin
#Licence: NOL


source [file join bind/allbind.tcl]
source [file join Variable/Variable.tcl]

foreach i {400 401 402 403 404 405 406 407 408 409 410} {
	button .b$i -text "ID: $i" -command car$i
	grid .b$i -pady 5
}

foreach o {411 412 413 414 415 416 417 418 419 420 421} {
	button .b1$o -text "ID: $o" -command car$o  
	grid .b1$o -pady 5
}



source [file join Proc/car.tcl]


wm geometry . 1000x1200
wm geometry . -0+0

