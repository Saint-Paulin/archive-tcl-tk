set c grey
button .coul -text "Couleur" -bg $c -command {
  set c [tk_chooseColor -initialcolor $c ]
  .coul configure -bg $c
}
pack .coul
set g red
proc topl {} {
toplevel .t1
	wm title .t1 "gerg"
button .t1.b -text Couleur -bg $g -command {
  set g [tk_chooseColor -initialcolor $g ]
  .coul configure -bg $g
}
pack .t1.b
}
button .at -text "si sa ne marche pas" -command topl -bg $g	
pack .at  