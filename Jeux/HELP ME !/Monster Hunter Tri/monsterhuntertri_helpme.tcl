# HELP ME ! no'1
# Monster Hunter tri (3)
wm title . "Monster Hunter Tri - HELP ME !"
package requir quit

label .l1
button .mons -text "Monstres" -command monstre -font bold
button .arm -text "Armes" -font bold
button .armure -text "Armures" -font bold
button .quit -text "Quitter" -command quitter -font bold

label .l2 -text ""
pack .mons .arm .armure .quit

proc quitter {} {
    quit "Monster Hunter Tri - HELP ME !"
}
proc monstre {} {
    toplevel .tm
    wm title .tm "Monstre ou boss"
    label .tm.ltm -text "Monstres ou Boss"
    button .tm.btm1 -text "Monstres" -command mons
    button .tm.btm2 -text "Boss" -command boss
    pack .tm.ltm .tm.btm1 .tm.btm2
}

proc mons {} {
    destroy .tm
}
proc boss {} {
    destroy .tm
}