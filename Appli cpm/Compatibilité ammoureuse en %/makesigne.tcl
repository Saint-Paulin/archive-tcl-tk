text .t -font bold
button .b -text "Ins�rer" -command insert -font bold
pack .t .b
set var 1
set 1 B�lier
set 2 Taureau
set 3 G�meaux
set 4 Cancer
set 5 Lion
set 6 Vierge
set 7 Balence
set 8 Scorpion
set 9 Sagittaire
set 10 Capricorne
set 11 Verseau
set 12 Poissons

proc insert {} {
    global var
    incr var
    global s1
    .t insert end {# B�lier + B�lier
    if {"$var" eq "B�lier"} {
    if {"$s2" eq "B�lier"} {
    incr pourcent 45
    }
    }
}
}