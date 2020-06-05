proc debug {} {
	tk_messageBox -type ok -title "compt - debug" -message "debug has completed"
}
proc run {} {
	tk_messageBox -icon error -title "compt - error" -type ok -message "error #####00011"  
}
button .run -text Run -font bold -foreground green -command run
pack .run -side left
button .debug -text Debug -font bold -foreground green -command debug
pack .debug -side left
text .t -font bold
pack .t
.t insert 1.0 "> Cons 1.0 Beta version #"

