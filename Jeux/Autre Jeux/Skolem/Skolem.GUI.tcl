# ######################
  #
  # Skolem: GUI
  #
  # ######################

  source Skolem.mouse.tcl
  source Skolem.legs.tcl
  set (curmax) $(max)

  # create GUI
  proc createGUI {} \
  {
    variable {}
    # title
    wm title . "Skolem $(max)"
    # main parts
    catch { destroy .c .f }
    frame .f
    canvas .c -bg gray75
    # frame
    set (xmax) [expr {$(max) * $(xunit)}]
    set (curmax) $(max)
    button .f.z -width 10 -bd 1 -text Z -command createGUI
    scale .f.s -orient horizontal -from 1 -to 8 \
      -variable (curmax) -command change \
      -width 15 -sliderlength 15 -bd 1 \
      -length 100 -bigincrement 1 -showval 0
    entry .f.e -width 15 -textvariable (user) \
      -bd 1 -justify center
    set (curcount) 0
    foreach score $(scores) \
    {
      if {[lindex $score 0] == $(max)} { incr (curcount) }
    }
    button .f.b -width 10 -bd 1 -textvar (curcount) \
      -command displayScore
    # canvas
    set y $(y0)
    for {set num 0} {$num <= $(max)} {incr num} \
    {
      set height [createLegs $num $y]
      incr y [expr {$height + 2 * $(yunit)}]
    }
    set (height) $y
    set x0 [expr {$(xmax) * 2}]
    .c create rectangle 0 0 $x0 $(height) \
      -fill gray80 -outline gray80 -tags r
    .c lower r
    incr x0 $(xunit)
    set y0 [expr {$(height) / 2}]
    set y1 [expr {$y0 - $(radius)}]
    set y2 [expr {$y0 + $(radius)}]
    for {set i 0} {$i < 2 * $(max) + 1} {incr i} \
    {
      set x1 [expr {$x0 - $(radius)}]
      set x2 [expr {$x0 + $(radius)}]
      .c create oval $x1 $y1 $x2 $y2 \
        -fill red -outline red -tags tt$i
      .c lower tt$i
      set (tt$i) ""
      incr x0 $(xunit)
    }
    .c config -width $x0 -height $(height)
    # place & display
    grid .f -sticky w
    grid .f.z .f.s .f.e .f.b -padx 10 -pady 10
    grid .c
    # events
    bind .c <ButtonPress> {press %x %y}
    bind .c <ButtonRelease> {release %x %y}
    bind .c <Motion> {motion %x %y}
    wm protocol . WM_DELETE_WINDOW { saveFiles; exit }
  }

  # change max
  proc change {max} \
  {
    variable {}
    if {$(max) == $max} { return }
    set (max) [expr {int($max)}]
    createGUI
  }

  # display current score
  proc displayScore {} \
  {
    variable {}
    set scor [list]
    foreach score $(scores) \
    {
      if {[lindex $score 0] == $(max)} \
      { lappend scor [lrange $score 1 end] }
    }
    tk_messageBox -message [join $scor \n]
  }