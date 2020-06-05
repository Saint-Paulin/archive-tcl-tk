# GTA San Andreas Multijoueur
package requir tile
set ::dem [after 100 dema]
label .l -text "server: 0"  
pack .l
proc dema {} {
	
}
ttk::treeview .tree -columns "player mode map"
.tree insert {} 0 -id server -text "server"
.tree heading player -text "Player" 
.tree heading mode -text "Mode de jeu"
.tree heading map -text "Carte"
.tree column player -width 100 -anchor center

button .conec -text "Connexion" -command connexion -font bold
button .addserv -text "Ajouter un server" -command addserv -font bold
pack .conec .addserv .tree 


proc connexion {} {

}

proc addserv {} {

}

# ===================
#
#       client
#
# ===================

# -------------------
# ---- input channel
# -------------------
# -- gets lines from server
proc input {} \
{ 
  if {[eof $::channel]} \
  { 
    # something went wrong
    #fileevent $::channel readable {}
    catch { close $::channel }
    display err "***channel was closed"
  } \
  else \
  {
    # read & display line
    set line [string map {\\n \n} [gets $::channel]]
    switch -exact -- [lindex $line 0] \
    {
      :end:   { }
      :error: { display err [lindex $line 1] }
      default { display ok $line }
    }
  }
} 
# -------------------
# ---- channel writer
# -------------------
# -- puts lines to server
proc output {text} \
{ 
  set rc [script { puts $::channel $text; flush $::channel }]
  if {$rc} { catch { close $::channel } }
  return $rc
}
# -------------------
# ---- script executer
# -------------------
# -- catches & displays error if any
proc script {script} \
{ 
  # catch & display error, if any
  set rc [catch { uplevel 1 $script } msg]
  if {$rc} { display err $msg } 
  return $rc
}
# -------------------
# ---- exit
# -------------------
# -- stop the client
set ::exited 0
proc _exit {} \
{ 
  if {!$::exited} \
  { 
    set ::exited 1
    catch { close $::channel }
    exit 
  }
}
# -------------------
# ---- error displayer
# -------------------
# -- catches & displays background errors
proc bgerror {args} { display err $args }
# -------------------
# ---- displayer
# -------------------
# -- window colored display
proc display {{color ok} {text ""}} \
{ 
  .tree insert end $text\n $color
  .tree see end
  update
}
# -------------------
# ---- set parameters
# -------------------
  # -- default values
array set parms \
{ 
  init    .client.tcl
  font    {Courier 9}
  port    3456
  host    localhost
  cmd     "help"
}
catch { source $parms(init) }
  # local values
set fn [lindex $argv 0]
if {$fn != "" && [string index $fn 0] != "-"} \
{ # first arg was init file name
  set argv [lrange $argv 1 end]
} \
else { set fn $parms(init) }
script { source $fn }
  # -- current values
set keys [array names parms]
foreach {key value} $argv \
{
  set key2 [string range $key 1 end]
  if {[lsearch $keys $key] != -1} \
  { set parms($key2) $value; display ok "-->$key2 $value" } \
  else { display err "unknown key: $key $value\n(expected: $keys)" }
}