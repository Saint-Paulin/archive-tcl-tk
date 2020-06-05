# ######################
  #
  # Skolem: mouse
  #
  # ######################

  # mouse button was pressed
  proc press {x y} \
  {
    variable {}
    # find closest
    set index [.c find closest $x $y $(radius)]
    set tag [lindex [.c gettags $index] 0]
    set num [string range $tag 1 end]
    if {[string is integer -strict $num]} \
    {
      #found! give som feedback
      .c itemconfig ta$num -fill white
      .c itemconfig tb$num -fill white
      # set current moved num
      set (num) $num
      # save current coords
      set (last) [list $x $y]
      # unregister from slots
      for {set i 0} {$i < 2 * $(max) + 1} {incr i} \
      { if {$(tt$i) == $num} { set (tt$i) "" } }
    }
  }

  # mouse button was released
  proc release {x y} \
  {
    variable {}
    # was a num moving?
    if {[info exists (num)]} \
    {
      # end of move, give some feedback
      .c itemconfig ta$(num) -fill gray75
      .c itemconfig tb$(num) -fill gray75
      # get slots
      set hits [hits $(num)]
      foreach {a b} $hits break
      set ok [expr {[llength $hits] == 2}]
      if {$ok} \
      {
        # are the 2 slots free?
        set ok [expr {($(tt$a) == "") && ($(tt$b) == "")}]
      }
      if {$ok} \
      {
        # register for each slot
        set (tt$a) $(num)
        set (tt$b) $(num)
        # center the feet
        goto $(num) [.c coords tt$a]
        # check if done
        check
      } \
      else \
      {
        # go back home
        goto $(num) $(h$(num))
      }
      unset (num)
    }
  }

  # mouse was moving
  proc motion {x y} \
  {
    variable {}
    if {[info exists (num)]} \
    {
      foreach {x0 y0} $(last) break
      set dx [expr {$x - $x0}]
      set dy [expr {$y - $y0}]
      .c move t$(num) $dx $dy
      set (last) [list $x $y]
    }
  }