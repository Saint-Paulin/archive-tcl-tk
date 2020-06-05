################################################################################
# Procédure
################################################################################

proc allbindup {} {
	.packman move pam 0 -10
}

proc allbinddown {} {
	.packman move pam 0 10
}

proc allbindright {} {
	.packman move pam 10 0
}

proc allbindleft {} {
	.packman move pam -10 0
}

proc changecolor {} {
	set cole [tk_chooseColor -initialcolor gray -title "Chosisser une couleur"]
	.packman itemconfigure pam -fill $cole
}