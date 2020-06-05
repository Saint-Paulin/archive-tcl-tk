#  Tetris 1.0

source [file join bind/allbind.tcl]
source [file join graph.tcl]

# ##############################################################################
# Procédure
# ##############################################################################

proc allbinddown {} {
	.tetris move carre 0 10
}

proc allbindright {} {
	.tetris move carre 30 0
}

proc allbindleft {} {
	.tetris move carre -30 0
}

proc quit {} {
	set quit [tk_messageBox -message "Quitter le Tetris ?" -icon info -type yesno -title "Quitter ?"]
	switch -- $quit {
	yes exit
	}
}

proc start {} {
.b configure -state disabled
.tetris move carre 0 5
set c [.tetris coords carre]
set lind [lindex $c 3]
set ::id [after 200 start]
if {$lind eq 500.0} {
after cancel $::id
.tetris dtag carre
after 100 start
.tetris create rectangle 30 30 60 60 -fill red -outline red -tags carre
}
if {$lind eq 550.0} {
after cancel $::id
.tetris dtag carre
after 1 start
.tetris create rectangle 30 30 60 60 -fill red -outline red -tags carre
}
set c2 [.tetris coords carre2]
set lind3 [lindex $c 1]
set lind2 [lindex $c2 3]
if {$lind2 eq $lind3} {
after cancel $::id
.tetris dtag carre2
after 100 start
.tetris create rectangle 30 30 60 60 -fill red -outline red -tags carre2
# ############################
# carré a coté des autres : 1 ligne = disparition de tous les carré
# .pathname itemconfigure -tags tag1 tag2
}
}