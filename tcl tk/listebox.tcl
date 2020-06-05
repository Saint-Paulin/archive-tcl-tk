set list [list Mdr ptdr xptdr]
set t [.l get]
listbox .l -listvariable list
pack .l
bind .l <Double-ButtonPress> {tk_messageBox -message "Bravos !::$t " -type ok -icon info}