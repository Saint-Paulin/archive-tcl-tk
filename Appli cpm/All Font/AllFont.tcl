package requir tile
set lfont [font families]
ttk::combobox .comb -value $lfont -font bold
.comb current 0
pack .comb
button .b -text "Actualiser" -command rech
pack .b
proc rech {} {
    global font
    set font [.comb get]
    .l configure -text "$font" -font $font ;# Attention: [], {} et "" ont deja été tester et cela ne marche pas !
}
label .l -text "Metter une police !"
pack .l