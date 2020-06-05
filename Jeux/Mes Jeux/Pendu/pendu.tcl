# Pendu 
# Auteur: Paulin
wm title . "Pendu"
set list1 [open liste1.txt]
set rl1 [read $list1]
set tl "....."
text .t
.t insert end $rl1
entry .e -font bold
button .b -text "Valider" -font bold -command valider
label .l -text $tl
pack .e .b .l
proc valider {} {
	set mt [.e get]
	set tget ".t get"
	# set 
	set l1 [$tget 1.0 1.1]
	set l2 [.t get 1.0 1.2]
	set l3 [.t get 1.0 1.3]
	set l4 [.t get 1.0 1.4]
	set l5 [.t get 1.0 1.5]
	if {$mt eq $l1} {
	.l configure -text 
	}
	if {$mt eq $l2} {
	
	}
	if {$mt eq $l3} {
	
	}
	if {$mt eq $l4} {
	
	}
	if {$mt eq $l5} {
	
	}
}