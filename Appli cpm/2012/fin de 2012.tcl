# compte à rebour de la fin de monde de 2012
set op [open car.txt]
set rop [read $op]
text .t 
.t insert end $rop
set jours [.t get 1.0 1.3]
set heures [.t get 2.0 2.1]
set min [.t get 3.0 3.2]
label .b -text "Fin du monde dans :" -font bold
label .j -text "$jours Jours" -font bold
label .h -text "$heures Heures" -font bold
label .m -text "$min Minutes" -font bold
pack .b .j .h .m

proc cs {} {
	global jours
	global heures
	global min
	after 
	# -- Fin du monde 2012 
	if {$jours eq 0} {
	if {$heures eq 0} {
	if {$min eq 0} {
	.b configure -text "C'est la fin du monde !! (Eh bas nan !)"
	}
	}
	}
}