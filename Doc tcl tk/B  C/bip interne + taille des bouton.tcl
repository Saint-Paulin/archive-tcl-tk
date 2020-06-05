#Créer par Paulin
#licence: NPL

#------------------------------
#	Le Widget et la commande
#------------------------------

button .b -text "Bip" -command bell -padx 600 -pady 590 \
-font [list helvetica 400 bold underline italic]

#------------------
#	Le placement
#------------------

pack .b

#----------------------
#	tous les commande wm 
#----------------------
wm geometry . 1300x1290
wm geometry . -0+0 
wm overrideredirect . 1 

#------------------
#	Les raccourci
#------------------

bind . <Escape> exit
bind .b <space> {bell}

#on peut aussi faire avec une proc, la sera la command bip
proc bip {} {
	bell
} 

