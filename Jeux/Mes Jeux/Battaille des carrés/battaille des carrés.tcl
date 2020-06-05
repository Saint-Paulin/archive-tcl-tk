# Battaille des carrés
# Auteur : Oggy (Paulin)
# Date : 01/04/2012
wm title . "La battaille des carrés"
set c .c
set b black
set r red

canvas .c -width 250 -height 180 -bg white
button .b -text "Commancer" -command map1 -font bold
entry .e -font bold
pack .c .b .e

proc map1 {} {
    global c b r
    .e configure -state disabled
    $c create line 100 20 100 30 -fill $b -activefill $r -tags a
    $c create line 90 30 100 30 -fill $b -activefill $r -tags a
    $c create line 90 30 90 40 -fill $b -activefill $r -tags a
    $c create line 80 40 90 40 -fill $b -activefill $r -tags a
    $c create line 80 30 80 40 -fill $b -activefill $r -tags a
    $c create line 80 20 80 30 -fill $b -activefill $r -tags a
    $c create line 70 20 80 20 -fill $b -activefill $r -tags a
    $c create line 70 10 70 20 -fill $b -activefill $r -tags a
    $c create line 60 10 70 10 -fill $b -activefill $r -tags a
    $c create line 50 10 60 10 -fill $b -activefill $r -tags a
    $c create line 50 10 50 20 -fill $b -activefill $r -tags a
    $c create line 50 20 40 20 -fill $b -activefill $r -tags a
    $c create line 40 20 40 30 -fill $b -activefill $r -tags a
    $c create line 40 30 30 30 -fill $b -activefill $r -tags a
    $c create line 30 30 30 40 -fill $b -activefill $r -tags a
    $c create line 30 40 20 40 -fill $b -activefill $r -tags a
    $c create line 20 40 20 50 -fill $b -activefill $r -tags a
    $c create line 20 50 10 50 -fill $b -activefill $r -tags a
    $c create line 10 50 10 60 -fill $b -activefill $r -tags a
    $c create line 10 60 10 70 -fill $b -activefill $r -tags a
    $c create line 10 70 20 70 -fill $b -activefill $r -tags a
    $c create line 20 70 20 80 -fill $b -activefill $r -tags a
    $c create line 20 80 10 80 -fill $b -activefill $r -tags a
    $c create line 10 80 10 90 -fill $b -activefill $r -tags a
}
map1