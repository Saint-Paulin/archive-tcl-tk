canvas .c -height 1000 -width 2000 -bg black
pack .c
bind . <Escape> exit 
wm geometry . 1300x1290
wm geometry . -0+0 
wm overrideredirect . 1 
.c create rectangle 1000 1000 200 200 -fill red -width 5 -outline blue