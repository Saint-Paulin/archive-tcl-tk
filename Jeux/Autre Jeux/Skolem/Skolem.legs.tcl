# ######################
  #
  # Skolem: legs & feet
  #
  # ######################

  # create a leg
  proc createLegs {num y} \
  {
    variable {}
    # compute characteristics
    set height [expr {5 + ($num + 1) * $(yunit)}]
    set width [expr {$num * $(xunit)}]
    set w2 [expr {$width / 2}]
    set x [expr {$(xmax) - $w2}]
    # create 1st leg
    .c create line 0 0 0 $height \
      -width 3 -tags t$num
    # create 1st foot
    createFoot $num a 0 $height
    # create 2nd leg & 2nd foot
    .c create line 0 0 $width 0 \
      -width 3 -tags t$num
    .c create line $width 0 $width $height \
      -width 3 -tags t$num
    createFoot $num b $width $height
    # move to the right place
    move $num $x $y
    # save place
    set (h$num) [.c coords oa$num]
    # return height
    return $height
  }

  # create a foot
  proc createFoot {num snum x y} \
  {
    variable {}
    # compute outline
    set x1 [expr {$x - $(radius)}]
    set x2 [expr {$x + $(radius)}]
    set y1 [expr {$y - $(radius)}]
    set y2 [expr {$y + $(radius)}]
    # create circle
    set tags [list t$num o$snum$num]
    .c create oval $x1 $y1  $x2 $y2 \
      -fill red -outline red -tags $tags
    # put num
    set tags [list t$num t$snum$num]
    .c create text $x $y -text $num \
      -fill gray75 -tags $tags
    # create ghost
    .c create oval $x1 $y1  $x2 $y2 \
      -fill gray75 -outline gray75 -tags g$snum$num
    .c create text $x $y -text $num \
      -fill gray90 -tags g$snum$num
    .c lower g$snum$num
  }

  # move legs
  proc move {num dx dy} \
  {
    variable {}
    .c move t$num $dx $dy
    .c move ga$num $dx $dy
    .c move gb$num $dx $dy
  }