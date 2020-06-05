set types {
    {{Text Files}       {.txt}    TEXT}
    {{TCL Scripts}      {.tcl}        }
    {{C Source Files}   {.c}      TEXT}
    {{GIF Files}        {.gif}        }
    {{GIF Files}        {}        GIFF}
    {{All Files}        *             }
}

proc open {} {
set filename [tk_getOpenFile -filetypes $types]
if {$filename != "ok"} {
    set op [open $filename]
	set re [read $op]
}
.t insert end $re
}
button .b -font bold -command open -text "Ouvrir"
pack .b
text .t -font bold 
pack .t 
.t configure -state normal