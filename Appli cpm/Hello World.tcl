label .l -text "hello world" -bg green -font bold -fg blue
pack .l
bind .l <1> {.l configure -bg red}
bind .l <Leave> {.l configure -bg green}

frame .f -bg green -height 450 -width 500
pack .f
