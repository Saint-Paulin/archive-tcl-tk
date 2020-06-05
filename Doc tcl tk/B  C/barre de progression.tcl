#Créer par Paulin
#licence: NPL

#------------------
#	Le package
#------------------

package require tip

#------------------
#	Les farmes
#------------------


frame .cadre -width 300 -height 100 -borderwidth 2 \
-relief groove -bg grey90
frame .barre -height 96 -bg green
place .cadre -anchor center -relx 0.5 -rely 0.5
place .barre -in .cadre -x 0 -y 0

proc start {} { 
for {set cpt 0} {$cpt <= 100} {incr cpt 5} {
after 100
place .barre -in .cadre -x 0 -y 0 -relwidth [expr $cpt/100.0]
update
.b configure -command message
}
}

button .b -text Commencer -command start -font bold 
pack .b
place .b -x 15 -y 15
bind . <Escape> exit
bind . <space> start
wm geometry . -200+200
proc message {} { 
	tk_messageBox -icon error -message "Chargement deja fait !" -type ok \
-title erreur
} 

tip .barre "Barre verte"
tip .cadre "Le cadre de la barre"
tip .b "Le bouton pour démaré la barre de progression !"

wm geometry . 400x200