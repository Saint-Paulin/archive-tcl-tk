set (fn:config) Skolem.config
set (fn:score) Skolem.score

# save files
button .b -text "Save files" -font bold -command saveFiles
pack .b
proc saveFiles {} \
{
variable {}
# config
lappend conf [list "global {}"]
lappend conf [list "array set {} {"]
lappend conf [list user "{}"]
lappend conf [list max $]
lappend conf [list x0 ]
lappend conf [list y0 ]
lappend conf [list xunit ]
lappend conf [list yunit ]
lappend conf [list radius ]
lappend conf [list font1 {}]
lappend conf [list font2 {}]
lappend conf [list "}"]
# score
set (scores) 11
lappend scor [list "global {}"]
foreach score $(scores) { 
lappend scor [list lappend (scores) \[list $score \]] }
}