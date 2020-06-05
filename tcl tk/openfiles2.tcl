set types {
        {"All Source Files"     {.tcl .exe .txt}    }
	{"Video Files"		{.avi .mpg}    }
        {"Image Files"          {.gif}          }
        {"All files"            *}
}

proc open {label} {
    global types   
    set file [tk_getOpenFile -filetypes $types -parent .]
    $label configure -text $file
}

label .l -text "pas de fichier!"
button .b -text "Selectionner un fichier?" \
        -command "open .l"

grid .b -row 0 -column 0
grid .l -row 0 -column 1

text .t
pack .t