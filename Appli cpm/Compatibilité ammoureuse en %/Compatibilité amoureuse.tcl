# Compatibilité ammoureuse by Oggy (Paulin) en %
wm title . "Compatibilité amoureuse de signe en %"
package requir tile

# ##### Variable #####
set texbut [list Terminal 15]
set signe [list Bélier Taureau Gémeaux Cancer Lion Vierge Balance Scorpion Sagittaire Capricorne Verseau Poissons]

# ##### Widget #####
ttk::combobox .s1 -value $signe
ttk::combobox .s2 -value $signe
.s1 current 0
.s2 current 0
button .cal -text "Calculer la compabilité en %" -command calccomp -font $texbut
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
# #### Bélier
	# Bélier + Bélier
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 45
	}
	}
	# Bélier + Taureau
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 85
	}
	}
	
	# Bélier + Gémeaux
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Gémeaux"} {
	incr pourcent 51
	}
	}
	
	# Bélier + Cancer
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 48
	}
	}
	
	# Bélier + Lion
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Lion"} {
	incr pourcent 49
	}
	}
	
	# Bélier + Vierge
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 39
	}
	}
	
	# Bélier + Balence
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Balence"} {
	incr pourcent 58
	}
	}
	
	# Bélier + Scorpion
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 53
	}
	}
	
	# Bélier + Sagittaire
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 61
	}
	}
	
	# Bélier + Capricorne
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 58
	}
	}
	
	# Bélier + Verseau
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 72
	}
	}
	
	# Bélier + Poissons
	if {"$s1" == "Bélier"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 45
	}
	}
	
# #### Taureau
	# Taureau + Bélier
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 73
	}
	}
	
	# Taureau + Taureau
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 89
	}
	}
	
	# Taureau + Gémeaux
	if {"$s1" == "Taureau"} {
	if {"$s2" == "Gémeaux"} {
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
	
# #### Gémeaux
	# Gémeaux + Bélier
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 46
	}
	}
	
	# Gémeaux + Taureau
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 72
	}
	}
	
	# Gémeaux + Gémeaux
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Gémeaux"} {
	incr pourcent 75
	}
	}
	
	# Gémeaux + Cancer
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Cancer"} {
	incr pourcent 67
	}
	}
	
	# Gémeaux + Lion
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Lion"} {
	incr pourcent 43
	}
	}
	
	# Gémeaux + Vierge
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Vierge"} {
	incr pourcent 54
	}
	}

	# Gémeaux + Balence
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Balence"} {
	incr pourcent 66
	}
	}
	
	# Gémeaux + Scorpion
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Scorpion"} {
	incr pourcent 58
	}
	}
	
	# Gémeaux + Sagittaire
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Sagittaire"} {
	incr pourcent 71
	}
	}
	
	# Gémeaux + Capricorne
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Capricorne"} {
	incr pourcent 72
	}
	}
	
	# Gémeaux + Verseau
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Verseau"} {
	incr pourcent 78
	}
	}
	
	# Gémeaux + Poissons
	if {"$s1" == "Gémeaux"} {
	if {"$s2" == "Poissons"} {
	incr pourcent 39
	}
	}
	
# #### Cancer
	# Cancer + Bélier
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 47
	}
	}
	
	# Cancer + Taureau
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 79
	}
	}
	
	# Cancer + Gémeaux
	if {"$s1" == "Cancer"} {
	if {"$s2" == "Gémeaux"} {
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
	# Lion + Bélier
	if {"$s1" == "Lion"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 59
	}
	}
	
	# Lion + Taureau
	if {"$s1" == "Lion"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 54
	}
	}
	
	# Lion + Gémeaux
	if {"$s1" == "Lion"} {
	if {"$s2" == "Gémeaux"} {
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
	# Vierge + Bélier
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 48
	}
	}
	
	# Vierge + Taureau
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 76
	}
	}
	
	# Vierge + Gémeaux
	if {"$s1" == "Vierge"} {
	if {"$s2" == "Gémeaux"} {
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
	# Balence + Bélier
	if {"$s1" == "Balance"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 66
	}
	}
	
	# Balance + Taureau
	if {"$s1" == "Balance"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 67
	}
	}
	
	# Balance + Gémeaux
	if {"$s1" == "Balance"} {
	if {"$s2" == "Gémeaux"} {
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
	# Scorpion + Bélier
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 59
	}
	}
	
	# Scorpion + Taureau
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 89
	}
	}
	
	# Scorpion + Gémeaux
	if {"$s1" == "Scorpion"} {
	if {"$s2" == "Gémeaux"} {
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
	# Sagittaire + Bélier
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Bélier"} {
	incr pourcent 67
	}
	}
	
	# Sagittaire + Taureau
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Taureau"} {
	incr pourcent 79
	}
	}
	
	# Sagittaire + Gémeaux
	if {"$s1" == "Sagittaire"} {
	if {"$s2" == "Gémeaux"} {
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