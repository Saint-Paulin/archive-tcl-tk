#	--GCB-- Gta Car Browser
# Créer par Paulin

destroy ".b1 .b1"

source [file join bind/allbind.tcl]
text .t1 
pack .t1

foreach v {Landstalker Bravura Buffalo Linerunner Perenniel Sentinel Dumper Firetruck} {
	.t1 mark set "$v" insert
	.t1 insert end "$v"
}

foreach o {1 2 3 4 5} {

}

wm geometry . 500x500
wm geometry . -0+0

source [file join Proc/proc_topl.tcl]