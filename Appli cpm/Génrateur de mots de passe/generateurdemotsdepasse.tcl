# Générateur de mots de passe a chiffre
# Auteur: Oggy

wm title . "Générateur de mots de passe 1.0 by Oggy"
button .b -text "Générer un mots de passe" -font bold -command genemdp
label .l -text "Mots de passe :  " -font bold
label .byoggy -text "By Oggy" -font bold -fg red
entry .e -font bold
pack .b .l .byoggy
proc genemdp {} {
    set alea1 [expr int(rand() * 9 ) + 1 ]
    set alea2 [expr int(rand() * 9 ) + 1 ]
    set alea3 [expr int(rand() * 9 ) + 1 ]
    set alea4 [expr int(rand() * 9 ) + 1 ]
    set alea5 [expr int(rand() * 9 ) + 1 ]
    set alea6 [expr int(rand() * 9 ) + 1 ]
    set alea7 [expr int(rand() * 9 ) + 1 ]
    set alea8 [expr int(rand() * 9 ) + 1 ]
    .l configure -text "Mots de passe : $alea1$alea2$alea3$alea4$alea5$alea6$alea7$alea8"
    # .e insert end "$alea1$alea2$alea3$alea4$alea5$alea6$alea7$alea8"
}