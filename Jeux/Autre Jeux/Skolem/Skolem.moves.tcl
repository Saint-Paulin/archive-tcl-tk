# ######################
  #
  # Skolem: moves
  #
  # ######################

  # go to home
  proc goto {num coords} \
  {
    variable {}
    foreach {x y} $coords break
    foreach {xa ya} [.c coords oa$num] break
    set dx [expr {$x - $xa}]
    set dy [expr {$y - $ya}]
    .c move t$num $dx $dy
  }

  # compute all hits
  proc hits {num} \
  {
    variable {}
    # init res, a & b coords
    set res [list]
    foreach {xa ya} [.c coords ta$num] break
    foreach {xb yb} [.c coords tb$num] break
    # check each slot
    set x0 [expr {$(xmax) * 2 + $(xunit)}]
    set y0 [expr {$(height) / 2}]
    for {set i 0} {$i < 2 * $(max) + 1} {incr i} \
    {
      # a met?
      if {[expr {abs($xa - $x0) + abs($ya - $y0) <= 2 * $(radius)}]} \
      { lappend res $i }
      # b met?
      if {[expr {abs($xb - $x0) + abs($yb - $y0) <= 2 * $(radius)}]} \
      { lappend res $i }
      incr x0 $(xunit)
    }
    # res
    return $res
  }

  # check result
  proc check {} \
  {
    variable {}
    # count placed feet
    set count 0
    set max [expr {2 * $(max) + 1}]
    for {set i 0} {$i < $max} {incr i} \
    { if {$(tt$i) != ""} { incr count; append feet "$(tt$i)." } }
    if {$count == $max} \
    {
      # done
      set score ""
      foreach score $(scores) \
      {
        foreach {level skolem name date} $score break
        if {$level == $(max) && $skolem == $feet} \
        {
          tk_messageBox -message "$name $date"
          set score "found"
          break
        }
      }
      if {$score != "found"} \
      {
        set date [clock format [clock seconds] -format $(date)]
        lappend (scores) [list $(max) $feet $(user) $date]
        incr (curcount)
      }
    }
  }

  createGUI