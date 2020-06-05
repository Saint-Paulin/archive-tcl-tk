#   Petit éditeur de texte
#
#  Raccourcis claviers:
#    Control-o   Ouvrir un autre fichier
#    Control-s   Enregistrer le fichier
#    Escape      Quitte ce programme
#    F1          Affiche ce fichier
#
# correcteur aspell pour windows: http://aspell.net/win32/
################################################################################


proc init {} {
global param
   set param(fic) ""
   set param(idir) "."
    set param(font,p) "Verdana"
    set param(font,s) "10"
    
   bind . <Control-o> {openfic ""}
   bind . <Escape> exit
   bind . <Control-s> {savefic 0}
   bind . <Control-w> ferme
   # Affiche son propre source:
   bind . <F1> "openfic texte.tcl"
   
    text .t -undo true -exportselection true -yscrollcommand ".scroll set" -font "$param(font,p) $param(font,s)"
   scrollbar .scroll -command ".t yview"
   pack .t -side left -expand 1
   pack .scroll -side right -fill y
   
   focus -force .t
   
   menu .menu -tearoff 0 -fg blue
   menu .menu.fichier -tearoff 0 -fg blue
   .menu add cascade -label "Fichier" -menu .menu.fichier
   .menu.fichier add command -label "Ouvrir" -accelerator "Ctrl+o" -command {openfic ""} -underline 0
   .menu.fichier add command -label "Fermer" -accelerator "Ctrl+w" -command {ferme} -underline 0
   .menu.fichier add command -label "Enregistrer" -accelerator "Control-s" -command "savefic 0"
   .menu.fichier add command -label "Enregistrer Sous" -command {savefic 1 }
   .menu.fichier add command -label "Quitter" -accelerator "Escape" -command exit
   
   menu .menu.edit -tearoff 0 -fg blue
   .menu add cascade -label "Edition" -menu .menu.edit
   .menu.edit add command -label "Sélectionner tout" -accelerator "Ctrl+a" -command {.t tag add sel 1.0 end-1c} -underline 0
   .menu.edit add command -label "Copier" -command {clipboard clear;  clipboard append [selection get]}
   .menu.edit add command -label "Coller" -command {.t insert current [clipboard get]}
   
   menu .menu.tools -tearoff 0 -fg blue
   .menu add cascade -label "Outils" -menu .menu.tools
   .menu.tools add command -label "Rot13" -command rot13
   .menu.tools add command -label "Ortho" -command corr_ortho
   
    . configure -menu .menu
    
    #.t configure -font "Verdana 10" ;# arial , times
    
    # initialisation du tableau de conversion
    set param(lst) "abcdefghijklmnopqrstuvwxyzabcdefghijklmno"
    for  {set i 0; set j 13} {$i <26} {incr i; incr j} {
      set c1 [string range $param(lst) $i $i]
      set c2 [string range $param(lst) $j $j]
      eval "set param(rot,$c1) $c2"
    }
    
    
}

proc openfic { fic } {
  global param
 .t delete 0.0 end ;#@0,0 end
 if {$fic==""} {
   set types {
       
        {{All Files}        *             }
    }
    
    set param(fic) [tk_getOpenFile -title "Sélectionnez le fichier a ouvrir" -initialdir $param(idir) -filetypes $types -parent .]
  }
  if {[file exists $param(fic)]} {
    set param(idir) [file dirname $param(fic)]
    set f [open $param(fic) r]
    .t insert end [read $f]
    close $f
  }
 
}

proc ferme {} {
  global param
  .t delete 0.0 end
  set $param(fic) ""
}


proc savefic {bool} {
  global param
  if {$bool>0} {
     set types {
       
       {{All Files}        *             }
     }
      set param(fic) [tk_getSaveFile -title "Enregistrer dans le fichier" -initialdir $param(idir) -filetypes $types -parent .]
  }
  
  set dump [.t get 0.0 end]
  set id [open $param(fic) "w"]
  puts $id $dump
  close $id
}

proc rot13 {} {
global param
    # if {[catch { set temp [selection get]}]} {
      # set temp [.t get 0.0 end]
    # }
    set txt1 [.t get 0.0 end]
    .t delete 0.0 end
    
    set txt2 ""
    set lg [string length $txt1]
    for  {set i 0} {$i < $lg} {incr i} {
      set car [string range $txt1 $i $i]
      if {[string first $car $param(lst)]>-1} {
        eval "set car \$param(rot,$car)"
      }
      
      set txt2 "$txt2$car"
    }
    .t insert end $txt2
}


proc fen_ortho { msg mot} {
  set i [string first "& $mot" $msg]
  if {$i>0} {
      set lgm [string length $mot]
      set lg [string length msg] ;#[expr [string length msg] -$i-$lgm-2]
      set tmp [string range $msg [expr $i + $lgm + 2] [string length $msg]]
      set j [expr [string first ":" $tmp] +2]
      set ch [string range $tmp $j [string length $tmp]]
      
     toplevel .fortho
      wm title .fortho "Correcteur d'orthographe (béta)"
      pack [listbox .fortho.te -yscrollcommand ".fortho.scroll set"] -side left
      scrollbar .fortho.scroll -command ".fortho.te yview"
      pack .fortho.scroll -side right -fill y
      
      foreach prop [split $ch ", "] {
        if {$prop!=""} {
          .fortho.te insert end $prop
        }
      }
  } 
}

proc corr_ortho {} {
  if {[catch { set mot [selection get]}]} {
      set mot [.t get 1.0 end-1c]
    }
    set cmde "exec echo '$mot' | aspell --lang=en pipe"
    if {[catch {set t [eval $cmde]} ] } {
      tk_messageBox -icon info -message "Cette fonction necessite le correcteur aspell\n et un environnement unix, linux ou cygwin" -title "Correction d'orthographe indisponible" -parent . -type ok
      return 0
    }
    fen_ortho $t $mot
    
    
}

init