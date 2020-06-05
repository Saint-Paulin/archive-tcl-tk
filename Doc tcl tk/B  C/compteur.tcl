package requir compteur

compteur .cp -value "  " -width 138 -count 2
pack .cp
set var 0
proc val {} {
global var
set vlar [expr $val+1]
.cp value $vlar
set ::id [after 3000 val] 
}