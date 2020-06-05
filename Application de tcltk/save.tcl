package require Tk

 # set up the demo frame
 pack [text .t] -expand 1 -fill both -side top
 pack [button .b -text "Save As..." -command "saveAs"] -side top

 proc saveAs {} {

   set file [tk_getSaveFile -filetype {"All Source Files"     {.tcl .c .h}    } -title "Crappy Save Example" -parent .]
   if { $file == "" } {
        return; # they clicked cancel
      }
   set x [catch {set fid [open $file w+]}]
   set y [catch {puts $fid [.t get 1.0 end-1c]}]
   set z [catch {close $fid}]
   if { $x || $y || $z || ![file exists $file] || ![file isfile $file] || ![file readable $file] } {
   tk_messageBox -parent . -icon error \
                 -message "An error occurred while saving to \"$file\""
      } else {
   tk_messageBox -parent . -icon info \
                 -message "Save successful"
      }
 };# saveAs