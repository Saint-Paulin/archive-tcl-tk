canvas .c -height 100 -width 150 -bg black
pack .c
.c create rectangle 0 100 160 0 -fill red -tags rect
wm geometry .  200x110

set ::var [after 100 can] 
proc can {} {
.c itemconfigure rect -fill green
set ::id [after 100 canr]
}
proc canr {} {
.c itemconfigure rect -fill red
set ::idd [after 100 can]
}