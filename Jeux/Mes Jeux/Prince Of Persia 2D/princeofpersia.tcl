# Prince Of persia 2D
# Auteur : Paulin
# Date : 11/03/2012
# Complément : graph.tcl
source [file join graph.tcl]
wm title . "Prince of Persia 2D"
wm geometry . 500x520

bind . <Escape> exit

# Binding du canvas
bind . <space> saut
bind . <KeyPress-Right> right
bind . <KeyPress-Left> left

# Procédures
proc saut {} {
	global m
	$m move prince 0 -10
	after 400 ssaut
}
proc ssaut {} {
	global m
	$m move prince 0 10
}
proc right {} {
	global m
	$m move obj -10 0
}
proc left {} {
	global m
	$m move obj 10 0
}
# .n1s1 saut ssaut right left 