canvas .c -width 1000 -height 500 -bg grey -relief sunken
pack .c

.c create rectangle 500 192 400 300 -width 3 -fill blue -outline blue 

.c create bitmap 450 250 -bitmap info -anchor center \
-background blue -foreground white -tag tagl

.c create text 450 165 -text "salut !" -anchor c \
 -font [list Persia 14 bold underline italic] -tag tagl

#canvas: oval  largeur taile oval:qauche oval:hauteur
.c create oval 500 500 400 320 -fill red -outline red -tag tagl


bind .c <ButtonPress> {bell}
bind . <ButtonPress> {exit} 


