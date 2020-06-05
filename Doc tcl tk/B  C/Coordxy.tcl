wm title . "Coordonnées"

#canvas et ses objets
canvas .c -width 250 -height 200 -bg grey 

.c create rectangle 100 10 130 160 -width 3 -fill blue -outline blue 

.c create bitmap 116 72 -bitmap info -anchor center \
-background blue -foreground white 

.c create text 190 130 -text "salut !" -anchor c \
 -font [list ComicSansMS 14 bold underline italic]

.c create oval 50 50 70 100 -fill green

label .m -width 20 -height 1 -borderwidth 1 -relief sunken \
-text "X = 0 - Y= 0"

pack .c .m

#Tous les bind
bind .c <Motion> {.m configure -text "X = %x - Y = %y"}
bind .c <Leave> {.m configure -text "X= 0 - Y = 0"}

bind . <Key> {puts "%A - nom symbolique: %K - valeur: %N"}
bind .c <ButtonPress> {bell}
bind . <ButtonPress> {exit} 

wm geometry . +500+300