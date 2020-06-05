proc bouger {} {
    .c move cercle 1 1
    set ::id [after 1000 bouger]
}

proc stop {} {
    after cancel $::id
}

proc entrer {} {
    .c itemconfigure cercle -width 5
}

proc sortir {} {
    .c itemconfigure cercle -width 1
}

button .b -text Bouge -command bouger
button .d -text Stop -command stop
canvas .c -bg white
bind .c <1> exit
pack .c 
pack .b .d -side left


.c bind cercle <Enter> entrer
.c bind cercle <Leave> sortir

.c create rectangle 10 10 55 55 -outline red -fill blue -activefill yellow -tags cercle

