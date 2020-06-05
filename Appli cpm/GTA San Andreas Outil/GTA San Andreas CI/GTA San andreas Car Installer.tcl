# GTA San Andreas Car Installer 
# By Paulin

button .dff -text "DFF" -command opendff -font bold
button .txd -text "TXD" -command opentxd -font bold
pack .dff .txd
entry .ide -font bold
entry .hand -font bold
entry .col -font bold
entry .mod -font bold
pack .ide .hand .col .mod

set ide [.ide get]
set hand [.hand get]
set col [.col get]
set mod [.mod get]

# Ouverture de fichier a modifier
set gta3 [open models/gta3.img]
set idefile [open data/vehicles.ide]
set handfile [open data/handling.cfg]
set colfile [open data/carcols.dat]
set modfile [open data/carmods.dat]

set ride [read $idefile]
set rhand [read $handfile]
set rcol [read $colfile]
set rmod [read $modfile]

text .tide
.tide insert end $ride 
text .thand
.thand insert end $rhand
text .tcol
.tcol insert end $rcol
text .tmod
.tmod insert end $rmod


button .insttal -text "insttaller" -command install -font bold
pack .insttal -side right

proc install {} {
# Remplacement des lignes
	global ide
	global hand
	global col
	global mod
	.tide delete 1.0  
	.thand delete 1.0 
	.tcol delete 1.0 
	.tmod delete 1.0 
	.tide insert 1.0 $ide 
	.thand insert 1.0 $hand
	.tcol insert 1.0 $col
	.tmod insert 1.0 $mod
	
# Sauvegarde des fichiers
	global idefile
	global handfile
	global colfile
	global modfile
	#set x [catch {set fid [open $file w+]}]
	set stide [catch {puts $idefile [.tide get 1.0 end]}]
	set sthand [catch {puts $handfile [.thand get 1.0 end]}]
	set stcol [catch {puts $colfile [.tcol get 1.0 end]}]
	set stmod [catch {puts $modfile [.tmod get 1.0 end]}]
	set ctide [catch {close $stide}]
	set cthand [catch {close $sthand}]
	set ctcol [catch {close $stcol}]
	set ctmod [catch {close $stmod}]
}

proc opendff {} {
set typesdff {
    {{DFF Files}       {.dff}		  }
    {{All Files}        *             }
}
set opendff [tk_getOpenFile -filetypes $typesdff]
if {$opendff != "ok"} {
    set opdff [open $opendff]
	set redff [read $opdff]
}
#.t insert end $re
}

proc opentxd {} {
set typestxd {
    {{TXD Files}       {.txd}		  }
    {{All Files}        *             }
}
set opentxd [tk_getOpenFile -filetypes $typestxd]
if {$opentxd != "ok"} {
    set optxd [open $opentxd]
	set retxd [read $optxd]
}
#.t insert end $re
}