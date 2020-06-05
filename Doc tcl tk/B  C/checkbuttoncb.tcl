#Créer par Paulin
#licence: NPL

#------------
#	Proc
#------------

proc cbactiver {} {
.cb configure -state disabled
}

#----------------
#	Le Widget
#----------------

checkbutton .cb -font bold -text "cb1" -command cbactiver

#------------------
#	Le placement
#------------------

pack .cb
place .cb -x 75 -y 45

wm geometry . 200x100
