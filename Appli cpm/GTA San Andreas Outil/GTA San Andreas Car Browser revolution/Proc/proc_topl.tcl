################################################################################
# Procédure
################################################################################

foreach la {ID: Nom Modification} {
proc topl$la {} {
	toplevel .to
	wm title .to "text" 
	label .to.la$la -text "$la" 
	pack .to.la$a
	wm geometry . 200x200
}
}