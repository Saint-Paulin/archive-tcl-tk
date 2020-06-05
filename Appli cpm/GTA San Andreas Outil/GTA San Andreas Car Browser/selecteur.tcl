################################################################################
# Selector
################################################################################

label .l1 -text "Selector 1.0" -font 24
place .l1 -y 60 -y 30

foreach bb {"Classer par 'ID'" "Classer par 'Ordre Alphabéthique'"} {
button .b1$bb -text "$bb" -font bold

grid .b1$bb -pady 10
}

label .l -text "By Paulin" -font bold -fg red -relief groove
pack .l
place .l -y 250 -x 160



proc ID {} {
source [file join /gtacarbrowser.tcl]
}

proc ABC {} {
}

wm geometry . 300x300
