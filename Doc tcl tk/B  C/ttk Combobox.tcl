# ComboxBox
package requir tile
set valis [list 1 2 3 4 5]
ttk::combobox .comb -values $valis -postcommand poscmd
pack .comb
.comb current 0
proc poscmd {} {

}