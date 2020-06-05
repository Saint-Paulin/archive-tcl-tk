 # tangram

  package require Tk
  catch { package require Img }

  array set {} \
  {
    unit    60
    size    600
    before  200
    after   200
    bg      gray90
    item    ""
  }

  set (tiles) \
  {
    {red      0 0 2 0 0 2}
    {yellow   2 0 2 0 1 1}
    {blue     2 0 1 1 0 2 -1 1}
    {green    1 1 0 2 -1 3 -1 1}
    {purple   1 1 1 1 0 2}
    {orange   2 2 2 -2 2 2}
    {cyan     2 2 2 2 -2 2}
  }

  proc tile {num} \
  {
    variable {}
    set tile [lindex $(tiles) $num]
    foreach {color dx0 dy0} $tile break
    set deltas [lrange $tile 3 end]
    set x0 [expr {$(x0) + $dx0 * $(unit)}]
    set y0 [expr {$(y0) + $dy0 * $(unit)}]
    lappend coords $x0 $y0
    foreach {dx dy} $deltas \
    {
      set x [expr {$x0 + $dx * $(unit)}]
      set y [expr {$y0 + $dy * $(unit)}]
      lappend coords $x $y
    }
    .c create polygon $coords -tags poly \
      -fill $color -outline black -width 0
  }

  proc select {x y} \
  {
    variable {}
    set x [.c canvasx $x]
    set y [.c canvasy $y]
    set item [lindex [.c find overlapping $x $y $x $y] end]
    if {$item == [.c find withtag image]} \
    { nextExample 1; return }
    set (item) $item
    set (selected) $item
    .c itemconfig poly -width 0
    .c itemconfig $(item) -width 2
    .c raise $(item)
    set (lastx) $x
    set (lasty) $y
  }

  proc release {} \
  {
    variable {}
    set (item) ""
  }

  proc move {x y} \
  {
    variable {}
    if {$(item) == ""} { return }
    set x [.c canvasx $x]
    set y [.c canvasy $y]
    set dx [expr {$x - $(lastx)}]
    set dy [expr {$y - $(lasty)}]
    set (lastx) $x
    set (lasty) $y
    .c move $(item) $dx $dy
  }

  proc turn {xm ym} \
  {
    variable {}
    set xm [.c canvasx $xm]
    set ym [.c canvasy $ym]
    set item [lindex [.c find overlapping $xm $ym $xm $ym] end]
    if {$item == [.c find withtag image]} \
    { nextExample -1; return }
    set coords [.c coords $item]
    set n [expr {[llength $coords] / 2}]
    if {$n == 0} { return }
    set rot [expr {sqrt(2) / 2}]
    set gx 0
    set gy 0
    for {set i 0} {$i < $n} {incr i} \
    {
      set j $i; incr j $i
      set x($i) [lindex $coords $j]
      set y($i) [lindex $coords [incr j]]
      set gx [expr {$gx + $x($i)}]
      set gy [expr {$gy + $y($i)}]
    }
    set gx [expr {$gx / $n}]
    set gy [expr {$gy / $n}]
    set coords [list]
    for {set i 0} {$i < $n} {incr i} \
    {
      set dx [expr {$x($i) - $gx}]
      set dy [expr {$y($i) - $gy}]
      lappend coords [expr {$gx + $dx * $rot - $dy * $rot}]
      lappend coords [expr {$gy + $dx * $rot + $dy * $rot}]
    }
    .c coords $item $coords
  }

  proc nextExample {dir} \
  {
    variable {}
    incr (example) $dir
    set max [llength $(examples)]
    if {$(example) < 0} { set (example) $max; incr (example) -1 }
    if {$(example) >= $max} { set (example) 0 }
    $(image) config -file [lindex $(examples) $(example)]
  }

  # main

  set before [expr {0 - $(before)}]
  set after [expr {$(size) + $(after)}]
  set region [list $before $before $after $after]
  canvas .c -width $(size) -height $(size) -bg $(bg) \
    -xscrollcommand {.xs set} -yscrollcommand {.ys set} \
    -scrollregion $region
  scrollbar .xs -orient horizontal -command {.c xview}
  scrollbar .ys -orient vertical -command {.c yview}

  set (x0) [expr {($(size) - 4 * $(unit)) / 2}]
  set (y0) [expr {($(size) - 4 * $(unit)) / 2}]
  for {set i 0} {$i < [llength $(tiles)]} {incr i} { tile $i }

  grid .c .ys -sticky nsew
  grid .xs -sticky ew
  grid rowconfigure . 0 -weight 2
  grid columnconfigure . 0 -weight 2
  bind .c <ButtonPress-3> {turn %x %y}
  bind .c <ButtonPress-1> {select %x %y}
  bind .c <ButtonRelease-1> {release}
  bind .c <Motion> {move %x %y}

  set (examples) [list]
  catch { set (examples) [glob *.gif *.jpg *.png] }
  set (example) 0
  if {[llength $(examples)] > 0} \
  {
    set (image) [image create photo -file [lindex $(examples) 0]]
    .c create image 0 0 -anchor nw -image $(image) -tags image
    .c lower image
  }