################################################################################
# ProcÚdure
################################################################################


proc topl {i} {
	toplevel .to
	wm title .to "ID: $i" 
	label .to.la -text "ID: $i"
	pack .to.la
	wm geometry . 200x200
}