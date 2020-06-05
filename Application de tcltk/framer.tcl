frame .f -bg green -bd 10 -height 400 -width 800
pack .f
bind .f <Enter> {.f configure -bg red}
bind .f <Leave> {.f configure -bg green}