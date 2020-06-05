# Compatibilit� ammoureuse by Oggy (Paulin) en %
wm title . "Compatibilit� amoureuse de signe en %"
package requir tile

# ##### Variable #####
set texbut [list Terminal 15]
set signe [list B�lier Taureau G�meaux Cancer Lion Vierge Balance Scorpion Sagittaire Capricorne Verseau Poissons]

# ##### Widget #####
ttk::combobox .s1 -value $signe
ttk::combobox .s2 -value $signe
.s1 current 0
.s2 current 0
button .cal -text "Calculer la compabilit� en %" -command calccomp -font $texbut
label .res -text "Cliquer sur le bouton" -font $texbut
label .h -text "Homme:" -font bold
label .f -text "Femme:" -font bold

# ######### Placement #########
pack .s1 .s2 .cal .res .h .f
place .h -x 0 -y 0
place .f -x 0 -y 20

proc calccomp {} {
	set s1 [.s1 get]
	set s2 [.s2 get]
	# if ...
	set pourcent 0
	
# ### format: Homme + Femme
# #### B�lier
	# B�lier + B�lier
	if {"$s1" == "B�lier"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 45
	}
	}
	# B�lier + Taureau
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 85
	}
	}
	
	# B�lier + G�meaux
	if {"$s1" == "B�lier"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 51
	}
	}
	
	# B�lier + Cancer
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 48
	}
	}
	
	# B�lier + Lion
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Lion"} {
	incr pourcent 49
	}
	}
	
	# B�lier + Vierge
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 39
	}
	}
	
	# B�lier + Balence
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Balence"} {
	incr pourcent 58
	}
	}
	
	# B�lier + Scorpion
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 53
	}
	}
	
	# B�lier + Sagittaire
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 61
	}
	}
	
	# B�lier + Capricorne
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 58
	}
	}
	
	# B�lier + Verseau
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 72
	}
	}
	
	# B�lier + Poissons
	if {"$s1" == "B�lier"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 45
	}
	}
	
# #### Taureau
	# Taureau + B�lier
	if {"$s1" == "Taureau"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 73
	}
	}
	
	# Taureau + Taureau
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 89
	}
	}
	
	# Taureau + G�meaux
	if {"$s1" == "Taureau"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 63
	}
	}
	
	# Taureau + Cancer
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 92
	}
	}
	
	# Taureau + Lion
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Lion"} {
	incr pourcent 53
	}
	}
	
	# Taureau + Vierge
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 55
	}
	}

	# Taureau + Balence
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Balence"} {
	incr pourcent 56
	}
	}
	
	# Taureau + Scorpion
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 84
	}
	}
	
	# Taureau + Sagittaire
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 49
	}
	}
	
	# Taureau + Capricorne
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 95
	}
	}
	
	# Taureau + Verseau
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 56
	}
	}
	
	# Taureau + Poissons
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 92
	}
	}
	
# #### G�meaux
	# G�meaux + B�lier
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 46
	}
	}
	
	# G�meaux + Taureau
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 72
	}
	}
	
	# G�meaux + G�meaux
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 75
	}
	}
	
	# G�meaux + Cancer
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 67
	}
	}
	
	# G�meaux + Lion
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Lion"} {
	incr pourcent 43
	}
	}
	
	# G�meaux + Vierge
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 54
	}
	}

	# G�meaux + Balence
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Balence"} {
	incr pourcent 66
	}
	}
	
	# G�meaux + Scorpion
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 58
	}
	}
	
	# G�meaux + Sagittaire
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 71
	}
	}
	
	# G�meaux + Capricorne
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 72
	}
	}
	
	# G�meaux + Verseau
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 78
	}
	}
	
	# G�meaux + Poissons
	if {"$s1" == "G�meaux"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 39
	}
	}
	
# #### Cancer
	# Cancer + B�lier
	if {"$s1" == "Cancer"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 47
	}
	}
	
	# Cancer + Taureau
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 79
	}
	}
	
	# Cancer + G�meaux
	if {"$s1" == "Cancer"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 57
	}
	}
	
	# Cancer + Cancer
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 51
	}
	}
	
	# Cancer + Lion
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Lion"} {
	incr pourcent 94
	}
	}
	
	# Cancer + Vierge
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 90
	}
	}

	# Cancer + Balence
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Balence"} {
	incr pourcent 74
	}
	}
	
	# Cancer + Scorpion
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 68
	}
	}
	
	# Cancer + Sagittaire
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 61
	}
	}
	
	# Cancer + Capricorne
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 63
	}
	}
	
	# Cancer + Verseau
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 61
	}
	}
	
	# Cancer + Poissons
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 72
	}
	}
	
# #### Lion
	# Lion + B�lier
	if {"$s1" == "Lion"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 59
	}
	}
	
	# Lion + Taureau
	if {"$s1" == "Lion"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 54
	}
	}
	
	# Lion + G�meaux
	if {"$s1" == "Lion"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 48
	}
	}
	
	# Lion + Cancer
	if {"$s1" == "Lion"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 95
	}
	}
	
	# Lion + Lion
	if {"$s1" == "Lion"} {
	if {"$s2" == "Lion"} {
	incr pourcent 45
	}
	}
	
	# Lion + Vierge
	if {"$s1" == "Lion"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 76
	}
	}

	# Lion + Balence
	if {"$s1" == "Lion"} {
	if {"$s2" == "Balence"} {
	incr pourcent 89
	}
	}
	
	# Lion + Scorpion
	if {"$s1" == "Lion"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 92
	}
	}
	
	# Lion + Sagittaire
	if {"$s1" == "Lion"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 93
	}
	}
	
	# Lion + Capricorne
	if {"$s1" == "Lion"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 88
	}
	}
	
	# Lion + Verseau
	if {"$s1" == "Lion"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 78
	}
	}
	
	# Lion + Poissons
	if {"$s1" == "Lion"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 52
	}
	}
	
# #### Vierge
	# Vierge + B�lier
	if {"$s1" == "Vierge"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 48
	}
	}
	
	# Vierge + Taureau
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 76
	}
	}
	
	# Vierge + G�meaux
	if {"$s1" == "Vierge"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 56
	}
	}
	
	# Vierge + Cancer
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 87
	}
	}
	
	# Vierge + Lion
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Lion"} {
	incr pourcent 68
	}
	}
	
	# Vierge + Vierge
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 62
	}
	}

	# Vierge + Balence
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Balence"} {
	incr pourcent 61
	}
	}
	
	# Vierge + Scorpion
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 72
	}
	}
	
	# Vierge + Sagittaire
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 53
	}
	}
	
	# Vierge + Capricorne
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 49
	}
	}
	
	# Vierge + Verseau
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 38
	}
	}
	
	# Vierge + Poissons
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 63
	}
	}
	
# #### Balance
	# Balence + B�lier
	if {"$s1" == "Balance"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 66
	}
	}
	
	# Balance + Taureau
	if {"$s1" == "Balance"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 67
	}
	}
	
	# Balance + G�meaux
	if {"$s1" == "Balance"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 73
	}
	}
	
	# Balance + Cancer
	if {"$s1" == "Balance"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 74
	}
	}
	
	# Balance + Lion
	if {"$s1" == "Balance"} {
	if {"$s2" == "Lion"} {
	incr pourcent 69
	}
	}
	
	# Balance + Vierge
	if {"$s1" == "Balance"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 62
	}
	}

	# Balance + Balence
	if {"$s1" == "Balance"} {
	if {"$s2" == "Balence"} {
	incr pourcent 69
	}
	}
	
	# Balance + Scorpion
	if {"$s1" == "Balance"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 54
	}
	}
	
	# Balance + Sagittaire
	if {"$s1" == "Balance"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 85
	}
	}
	
	# Balance + Capricorne
	if {"$s1" == "Balance"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 45
	}
	}
	
	# Balance + Verseau
	if {"$s1" == "Balance"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 89
	}
	}
	
	# Balance + Poissons
	if {"$s1" == "Balance"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 68
	}
	}
	
# #### Scorpion
	# Scorpion + B�lier
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 59
	}
	}
	
	# Scorpion + Taureau
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 89
	}
	}
	
	# Scorpion + G�meaux
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 60
	}
	}
	
	# Scorpion + Cancer
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 79
	}
	}
	
	# Scorpion + Lion
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Lion"} {
	incr pourcent 76
	}
	}
	
	# Scorpion + Vierge
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 78
	}
	}

	# Scorpion + Balence
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Balence"} {
	incr pourcent 64
	}
	}
	
	# Scorpion + Scorpion
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 38
	}
	}
	
	# Scorpion + Sagittaire
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 95
	}
	}
	
	# Scorpion + Capricorne
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 64
	}
	}
	
	# Scorpion + Verseau
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 50
	}
	}
	
	# Scorpion + Poissons
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 65
	}
	}
# #### Sagittaire
	# Sagittaire + B�lier
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "B�lier"} {
	incr pourcent 67
	}
	}
	
	# Sagittaire + Taureau
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 79
	}
	}
	
	# Sagittaire + G�meaux
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "G�meaux"} {
	incr pourcent 66
	}
	}
	
	# Sagittaire + Cancer
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 55
	}
	}
	
	# Sagittaire + Lion
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Lion"} {
	incr pourcent 88
	}
	}
	
	# Sagittaire + Vierge
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 78
	}
	}

	# Sagittaire + Balence
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Balence"} {
	incr pourcent 87
	}
	}
	
	# Sagittaire + Scorpion
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 96
	}
	}
	
	# Sagittaire + Sagittaire
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 91
	}
	}
	
	# Sagittaire + Capricorne
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 40
	}
	}
	
	# Sagittaire + Verseau
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 75
	}
	}
	
	# Sagittaire + Poissons
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 82
	}
	}
	# Reconfiguration
	.res configure -text "$s1 + $s2 = $pourcent%"
}