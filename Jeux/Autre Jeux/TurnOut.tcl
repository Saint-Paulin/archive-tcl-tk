  # ====================
  #
  #   TurnOut
  #
  #   v 0.9.1
  #   ulis (NOL)
  # ====================

  # ####################
  # Documentation
  # ####################
  # compile:
  #   use freewrap (http://sourceforge.net/projects/freewrap/)
  # install:
  #   put the executable in your path
  # use:
  #   run & play
  # ####################

  # ---------------
  # parameters
  # ---------------

  set size 50
  set flashy "beige"
  set ccount 4
  set imagefile TurnImage.png

  # ---------------
  # procs
  # ---------------

    # turn-right
    # ---------------
  proc turn-right {ii jj {check ""}} \
  {
    lappend tags i[expr {$ii - 1}]:[expr {$jj - 1}]
    lappend tags i[expr {$ii - 1}]:$jj
    lappend tags i$ii:[expr {$jj - 1}]
    lappend tags i$ii:$jj
    foreach i {1 2 3 4} tag $tags \
    { set img($i) [.c itemcget $tag -image] }
    foreach i {3 1 4 2} tag $tags \
    {
      .c itemconfig $tag -image $img($i)
      set ::current($tag) $img($i)
    }
    if {$check == "check"} { check }
  }

    # turn-left
    # ---------------
  proc turn-left {ii jj {check ""}} \
  {
    lappend tags i[expr {$ii - 1}]:[expr {$jj - 1}]
    lappend tags i[expr {$ii - 1}]:$jj
    lappend tags i$ii:[expr {$jj - 1}]
    lappend tags i$ii:$jj
    foreach i {1 2 3 4} tag $tags \
    { set img($i) [.c itemcget $tag -image] }
    foreach i {2 4 1 3} tag $tags \
    {
      .c itemconfig $tag -image $img($i)
      set ::current($tag) $img($i)
    }
    if {$check == "check"} { check }
  }

    # begin
    # ---------------
  proc begin {} \
  {
    set ::started 0
    press restore
    set ::count 0
    set ::start1 [list]
    set ::start2 [list]
    for {set cnt 0} {$cnt < $::level} {incr cnt} \
    {
      while 1 \
      {
        set i [expr {int(rand() * ($::ny - 1) - 0.1) + 1}]
        set j [expr {int(rand() * ($::nx - 1) - 0.1) + 1}]
        if {[lsearch -exact $::start1 $i:$j] == -1} { break }
      }
      set m [expr {int(rand() * 3 - 0.1) + 1}]
      lappend ::start1 $i:$j
      lappend ::start2 $m
    }
    .l1 config -text "Level : $::level"
    .l2 config -text "Score : $::score"
  }

    # start
    # ---------------
  proc start {} \
  {
    set ::started 1
    press restore
    foreach ij $::start1 m $::start2  \
    {
      foreach {i j} [split $ij :] break
      for {set n 0} {$n < $m} {incr n} { turn-right $i $j }
    }
  }

    # new
    # ---------------
  proc new {} \
  {
    set ::level 1
    set ::score 0
    set ::clevel $::ccount
    press restore
    begin
  }

    # check
    # ---------------
  proc check {} \
  {
    if {!$::started} { return }
    incr ::count
    for {set i 0} {$i < $::ny} {incr i} \
    {
      for {set j 0} {$j < $::nx} {incr j} \
      {
        if {[.c itemcget i$i:$j -image] != $::img($i:$j)} \
        { return }
      }
    }
    set gain [expr {$::level * 1000 - $::count * 25}]
    if {$gain > 0} { incr ::score $gain }
    if {[incr ::clevel -1] == 0} \
    {
      incr ::level
      set ::clevel $::ccount
    }
    flash 8 [. cget -bg]
    begin
  }

    # flash
    # ---------------
  proc flash {count color} \
  {
    if {$count == 0} { return }
    . config -bg [expr {$count %2 == 0 ? $::flashy : $color}]
    after 200 flash [incr count -1] $color
  }

    # press
    # ---------------
  proc press {{restore ""}} \
  {
    for {set i 0} {$i < $::ny} {incr i} \
    {
      for {set j 0} {$j < $::nx} {incr j} \
      {
        .c itemconfig i$i:$j -image $::img($i:$j)
        if {$restore == "restore"} \
        { set ::current(i$i:$j) $::img($i:$j) }
      }
    }
  }

    # release
    # ---------------
  proc release {} \
  {
    for {set i 0} {$i < $::ny} {incr i} \
    {
      for {set j 0} {$j < $::nx} {incr j} \
      {
        .c itemconfig i$i:$j -image $::current(i$i:$j)
      }
    }
  }

    # bgerror
    # ---------------
  proc bgerror {args} { tk_messageBox -message $args }

  # ---------------
  # packages
  # ---------------

  package require Tk
  package require Img

  # ---------------
  # interface
  # ---------------
  wm title . "TurnOut"
    # initial image
    # ---------------
  catch \
  {
    image create photo _img_ -file $imagefile
  } msg
  if {$msg != "_img_"} \
  {
    wm withdraw .
    append msg "\nYou can download an image at "
    append msg "http://www.images.com/TurnImage.png"
    tk_messageBox -message $msg
    exit
  }
  set width [image width _img_]
  set height [image height _img_]
    # canvas
    # ---------------
  canvas .c -height $height -width $width \
    -bd 0 -highlightt 0
    # partial images & micro buttons
    # ---------------
  set nx [expr {$width / $size}]
  set ny [expr {$height / $size}]
  for {set i 0} {$i < $ny} {incr i} \
  {
    for {set j 0} {$j < $nx} {incr j} \
    {
      set img($i:$j) [image create photo -height $size -width $size]
      set x1 [expr {$j * $size}]
      set y1 [expr {$i * $size}]
      set x2 [expr {$x1 + $size}]
      set y2 [expr {$y1 + $size}]
      $img($i:$j) copy _img_ -from $x1 $y1 $x2 $y2 -to 0 0
      .c create image $x1 $y1 -anchor nw -image $img($i:$j) -tags i$i:$j
      set current(i$i:$j) $img($i:$j)
      if {$i > 0 && $j > 0} \
      {
        set x1 [expr {$x1 - 8}]
        set y1 [expr {$y1 - 8}]
        set x2 [expr {$x1 + 8}]
        set y2 [expr {$y1 + 8}]
        .c create oval $x1 $y1 $x2 $y2 \
          -fill red -outline "" -tags b$i:$j
        .c bind b$i:$j <1> [list turn-right $i $j check]
        .c bind b$i:$j <3> [list turn-left $i $j check]
      }
    }
  }
    # level & score
    # ---------------
  label .l1 -font {Arial -20}
  label .l2 -font {Arial -20}
    # action buttons
    # ---------------
  button .b1 -width 20 -text New -command new
  button .b2 -width 20 -text Start -command start
  button .b3 -width 20 -text View
  bind .b3 <ButtonPress> press
  bind .b3 <ButtonRelease> release
  button .b4 -width 20 -text Quit -command exit
    # place & display
    # ---------------
  grid .l1 .l2 -padx 5 -pady 5
  grid .c -columnspan 2 -padx 10 -pady 10
  grid .b1 .b2 -padx 5 -pady 5
  grid .b3 .b4 -padx 5 -pady 5
  focus -force .
  raise .

  # ---------------
  # go
  # ---------------

  set started 0
  new