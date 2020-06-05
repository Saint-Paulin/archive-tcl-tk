entry .resultat -textvariable comande -width 40 -font bold -state normal -bg white -justify center
pack .resultat
button .enter -text Enter -command calcul -font bold
pack .enter
label .result -textvariable res -width 40 -font bold
pack .resultat .result .enter -side top
 bind . <Escape> exit
 bind . <Return> calcul
focus -force .resultat
proc calcul {} {	
   #Variables globales:
   global comande res
   if { [ catch {set res [expr $comande]} msg ] } {    
	 set res $msg   ;# ou set res "Synthax error"	
   }

}