# Générateur de mots
# Auteur : Oggy

entry .nbdl -font bold
label .mots -font bold -text "cliquer"
button .val -text "Valider" -command 4lettres -font bold
pack .nbdl .mots .val
proc valid {} {
    global alea nb
    set nbdl [.nbdl get]
    foreach i {$nbdl} {
    set alea($i) [expr int(rand() * $nb) + 1]
    .mots configure -text $alea($i)
    }
}
array set nb {
    a 1
    b 2
    c 3
    d 4
    e 5
    f 6
    g 7
    h 8
    i 9
    j 10
    k 11
    l 12
    m 13
    n 14
    o 15
    p 16
    q 17
    r 18
    s 19
    t 20
    u 21
    v 22
    w 23
    x 24
    y 25
    z 26
}

proc 4lettre {} {
    set alea(1) [expr int(rand() * 26) + 1]
    set alea(2) [expr int(rand() * 26) + 1]
    foreach 4l {1 1 1 1 a 2 2 2 2 b 3 3 3 3 c 4 4 4 4 d 5 5 5 5 e 6 6 6 6 f 7 7 7 7 g 8 8 8 8 h 9 9 9 9 i 10 10 10 10 j 11 11 11 11 k 12 12 12 12 l 13 13 13 13 m 14 14 14 14 n 15 15 15 15 o 16 16 16 16 p 17 17 17 17 q 18 18 18 18 18 r 19 19 19 19 s 20 20 20 20 t 21 21 21 21 u 22 22 22 22 v 23 23 23 23 w 24 24 24 24 x 25 25 25 25 y 26 26 26 26 z} {
    if {$alea(4l) eq $4l} {
    unset alea($4l)
    set alea($4l) a
    } elseif {$alea($4l) eq $4l} {
    unset alea($4l)
    set alea($4l) b
    }
    }
    .mots configure -text "$alea1$alea2"
    
}


proc 4lettres {} {
    # global alea4ls1 alea4ls2 alea4ls3 alea4ls4 
    global alpha2
    set alea4ls1 [expr int(rand() * 26) + 1]
    set alea4ls2 [expr int(rand() * 26) + 1]
    set alea4ls3 [expr int(rand() * 26) + 1]
    set alea4ls4 [expr int(rand() * 26) + 1]
    set alpha1 "abcdefghijklmnopqrstuvwxyz"
    array set alpha2 [list 1 a 2 b 3 c 4 d 5 e 6 f 7 g 8 h 9 i 10 j 11 k 12 l 13 m 14 n 15 o 16 p 17 q 18 r 19 s 20 t 21 u 22 v 23 w 24 x 25 y 26 z]
    set l1 [lindex $alpha2 $alea4ls1]
    set l2 [lindex $alpha2 $alea4ls2]
    set l3 [lindex $alpha2 $alea4ls3]
    set l4 [lindex $alpha2 $alea4ls4]
    .mots configure -text "$l1$l2$l3$l4"
}