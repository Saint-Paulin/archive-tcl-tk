proc actualise {} {
	set s [clock seconds]
	set heure [clock format $s -format "Le %A %B à %X en %Y"]
	.l configure -text $heure
	update
	after 1000 actualise
}
label .l -font bold -fg gold -bg red
pack .l
bind .l <1> exit
actualise
wm overrideredirect . 1
wm geometry . -0+0
