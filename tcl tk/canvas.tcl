# Commande tk: Canvas 

canvas .c -bg green
pack .c

frame .f -bg red -height 500 -width 500
pack .f 

bind .f <Enter> {
	.f configure -bg green
	.c configure -bg red 
	pack .c -side left
}
bind .f <Leave> {
	.f configure -bg red 
	.c configure -bg green
	pack .c -side right
}