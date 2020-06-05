  # ====================
  #
  #   CrystalsBattle
  #
  #   v 1.0b
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

  # --------------------
  #   parameters
  # --------------------
    set size 15
    set level 1
    set time 0
    set cdelay 2000
    array set sizes {15 {25 20 "SMALL"} 30 {15 10 "BIG"}}
    array set cb {1 0 2 1}
    array set times {0 0 1 15000 2 30000 3 60000 4 120000}
    array set txTimes {0 "TIME" 1 "15 s" 2 "30 s" 3 "1 mn" 4 "2 mn"}
    array set txLevels {0 "NOVICE" 1 "NORMAL" 2 "EXPERT" 3 "KNIGHT"}
    set txTitle "La bataille des cristaux"
    set txName1 "me"
    set txName2 "computer"
    set txAuto "auto"
    set txStart "START"
    set txStop "STOP"
    set txQuit "QUIT"

  # --------------------
  #   colors & animation
  # --------------------
    set glints 16
    set period 250
    array set colors0 \
    {
      01 #8888ff 11 #7373cf 21 #5d5daf 31 #5d5daf
      02 #98e898 12 #73ba73 22 #5fa55f 32 #5f955f
      03 #98e8e8 13 #73baba 23 #5fa5a5 33 #5f9595
      04 #e89898 14 #ba7373 24 #a55f5f 34 #955f5f
      05 #e898e8 15 #ba73ba 25 #a55fa5 35 #955f95
      06 #e8e898 16 #baba73 26 #a5a55f 36 #95955f
      07 #c8c8c8 17 #aaaaaa 27 #959595 37 #858585
    }
    array set colors1 \
    {
      01 #3333df 11 #4848ff 21 #2d2dcf 31 #1d1daf
      02 #13ba13 12 #18e818 22 #0fa50f 32 #0f950f
      03 #13baba 13 #18e8e8 23 #0fa5a5 33 #0f9595
      04 #ba1313 14 #e81818 24 #a50f0f 34 #950f0f
      05 #ba13ba 15 #e818e8 25 #a50fa5 35 #950f95
      06 #baba13 16 #e8e818 26 #a5a50f 36 #95950f
      07 #cacaca 17 #f8f8f8 27 #b5b5b5 37 #a5a5a5
    }

  # --------------------
  #   registered parameters
  # --------------------
    catch { source CrystalsBattle.conf }

  # --------------------
  #   packages
  # --------------------
    package require Tk

  # --------------------
  #   procs
  # --------------------

    # --------------------
    # createDisplay
    # --------------------
    proc createDisplay {} \
    {
      # frames
      # --------------------
      catch \
      {
        destroy .c
        destroy .f
        array unset ::set
        array unset ::crysiz
        array unset ::crycol
        array unset ::cryset
        array unset ::crytag
      }
      canvas .c -width $::width -height $::height \
        -bd 0 -highlightt 0
      frame .f
      # create header
      # --------------------
      set font {Arial 16 bold}
      set xc $::header
      set yc [expr {round($::header * 0.25)}]
      .c create text [expr {$xc - 1}] [expr {$yc - 1}] \
        -tags t1 -font $font -text $::count1 -fill white
      set xc [expr {$::width - $::header}]
      .c create text [expr {$xc - 1}] [expr {$yc - 1}] \
        -tags t2 -font $font -text $::count2 -fill white
      entry .c.e1 -width 10 -textvariable ::txName1 \
        -bd 1 -relief groove -justify center
      entry .c.e2 -width 10 -textvariable ::txName2 \
        -bd 1 -relief groove -justify center
      set xc $::header
      set yc [expr {round($::header * 0.55)}]
      .c create window $xc $yc -window .c.e1
      set xc [expr {$::width - $::header}]
      .c create window $xc $yc -window .c.e2
      set xc $::header
      set yc [expr {round($::header * 0.9)}]
      .c create text [expr {$xc - 1}] [expr {$yc - 1}] \
        -tags l1 -font $font -text 0% -fill white
      .c create text $xc $yc \
        -tags {l1 lr1} -font $font -text 0% -fill gray25
      set xc [expr {$::width - $::header}]
      .c create text [expr {$xc - 1}] [expr {$yc - 1}] \
        -tags l2 -font $font -text 0% -fill white
      .c create text $xc $yc \
        -tags {l2 lr2} -font $font -text 0% -fill gray25
      set xc [expr {$::width / 2}]
      set yc [expr {round($::header * 0.33)}]
      set font {Times 28 italic}
      .c create text [expr {$xc - 1}] [expr {$yc - 1}] \
        -font $font -text $::txTitle -fill white
      .c create text $xc $yc \
        -font $font -text $::txTitle -fill gray25
      button .c.b1 -width 15 -pady 3 -bd 1 -relief ridge \
        -command setSize -text $::txSize
      set xc [expr {$::width / 3}]
      set yc [expr {round($::header * 0.85)}]
      .c create window $xc $yc -window .c.b1
      button .c.b2 -width 15 -pady 3 -bd 1 -relief ridge \
        -command setLevel
      set xc [expr {$::width / 2}]
      .c create window $xc $yc -window .c.b2
      setLevel $::level
      button .c.b3 -width 15 -pady 3 -bd 1 -relief ridge \
        -command setTime
      set xc [expr {$::width * 2 / 3}]
      .c create window $xc $yc -window .c.b3
      setTime $::time
      # create crystals
      # --------------------
      array set ::colors [array get ::colors0]
      set ::total 0
      set xci0 [expr {$::size * 3 + $::padx * 2}]
      set xci1 [expr {$xci0 + $::size}]
      set yci [expr {$::size + $::pady + $::header}]
      set xc $xci0
      set yc $yci
      for {set i 0} {$i < $::imax} {incr i} \
      {
        for {set j 0} {$j < $::jmax} {incr j} \
        {
          if {$j == $::jmax - 1 && $i % 2 == 1} { break }
          set c 0
          while {$c == 0} \
          {
            for {set k 0} {$k < 3} {incr k} \
            { set c [expr {2 * $c + (rand() > 0.5 ? 1 : 0)}] }
          }
          createCrystal $xc $yc $::size $c
          incr ::total
          incr xc $::size2
        }
        incr yc $::size
        set xc [expr {$i % 2 == 0 ? $xci1 : $xci0}]
      }
      set ::half [expr {$::total / 2}]
      # create selection
      # --------------------
      array set ::colors [array get ::colors1]
      set xc [expr {$::size + $::padx}]
      set yc [expr {$::height - $::pady}]
      checkbutton .c.cb1 -variable ::cb(1) -text $::txAuto
      .c create window $xc $yc -window .c.cb1
      set yc [expr {$::height - $::size2 - $::pady}]
      .c create rectangle \
        [expr {$xc - $::size}] [expr {$yc + $::size}] \
        [expr {$xc + $::size}] [expr {$yc + $::size - $::size2 * 7}] \
        -tags r1 -outline "" -fill ""
      for {set i 1} {$i < 8} {incr i} \
      {
        createCrystal $xc $yc $::size $i
        .c bind t$yc:$xc <Button-1> [list selectColor 1 $i]
        .c bind t$yc:$xc <Enter> [list enterColor 1 $i]
        .c bind t$yc:$xc <Leave> [list leaveColor 1 $i]
        set yc [expr {$yc - $::size2}]
      }
      set xc [expr {$::width - $::size - $::padx}]
      set yc [expr {$::pady + $::header}]
      checkbutton .c.cb2 -variable ::cb(2) -text $::txAuto
      .c create window $xc $yc -window .c.cb2
      set yc [expr {$::size2 + $::pady + $::header}]
      .c create rectangle \
        [expr {$xc - $::size}] [expr {$yc - $::size}] \
        [expr {$xc + $::size}] [expr {$yc - $::size + $::size2 * 7}] \
        -tags r2 -outline "" -fill ""
      for {set i 1} {$i < 8} {incr i} \
      {
        createCrystal $xc $yc $::size $i
        .c bind t$yc:$xc <Button-1> [list selectColor 2 $i]
        .c bind t$yc:$xc <Enter> [list enterColor 2 $i]
        .c bind t$yc:$xc <Leave> [list leaveColor 2 $i]
        set yc [expr {$yc + $::size * 2}]
      }
      # create buttons
      # --------------------
      button .f.b1 -width 30 -pady 3 -bd 1 -relief ridge \
        -text $::txStart -command start
      button .f.b2 -width 30 -pady 3 -bd 1 -relief ridge \
        -text $::txQuit -command quit
      grid .f.b1 .f.b2 -padx 20 -pady 10
      # display
      # --------------------
      pack .c
      pack .f
      focus .c.e1
      .c.e1 selection range 0 end
      .c.e1 icursor end
      # colors
      # --------------------
      set ::abg [.c.e1 cget -bg]
      set ::dbg [.c.e1 cget -disabledback]
    }

    # --------------------
    # setSize
    # --------------------
    proc setSize {{size ""}} \
    {
      if {$size == ""} \
      {
        set sizes [array names ::sizes]
        set n [lsearch -exact $sizes $::size]
        set n [expr {$n == 0 ? 1 : 0}]
        set size [lindex $sizes $n]
      }
      set ::size $size
      foreach {::imax ::jmax ::txSize} $::sizes($size) break
      set ::size2 [expr {$::size * 2}]
      set ::height [expr {$::imax * $::size + $::size + $::pady * 2 + $::header}]
      set ::width [expr {($::jmax + 2) * $::size2 + $::padx * 4}]
      set ::start 1
      createDisplay
    }

    # --------------------
    # setLevel
    # --------------------
    proc setLevel {{level ""}} \
    {
      if {$level == ""} \
      {
        set level [incr ::level]
        if {$level > 3} { set level [set ::level 0] }
      }
      .c.b2 config -text $::txLevels($level)
    }

    # --------------------
    # setTime
    # --------------------
    proc setTime {{time ""}} \
    {
      if {$time == ""} \
      {
        set time [incr ::time]
        if {$time > 4} { set time [set ::time 0] }
      }
      .c.b3 config -text $::txTimes($time)
    }

    # --------------------
    # createTriangle
    # --------------------
    proc createTriangle {xc yc num size color} \
    {
      if {$size == $::size} \
      { set tags [list t$yc:$xc t$yc:$xc:$num] } \
      else \
      { set tags [list t:$::turn t$yc:$xc:$num] }
      set size1 $size
      set size2 $size
      if {$num % 2 == 0} { set size1 -$size1 }
      if {$num < 2} { set size2 -$size2 }
      .c create polygon \
        $xc [expr {$yc + $size1}] \
        [expr {$xc + $size2}] $yc \
        $xc $yc -fill $color -tags $tags
    }

    # --------------------
    # changeTriangle
    # --------------------
    proc changeTriangle {tag num color} \
    {
      .c itemconfig $tag:$num -fill $color
    }

    # --------------------
    # createCrystal
    # --------------------
    proc createCrystal {xc yc size c {player 0}} \
    {
      for {set i 0} {$i < 4} {incr i} \
      { set id [createTriangle $xc $yc $i $size $::colors($i$c)] }
      set tag t$yc:$xc
      set ::crysiz($tag) $size
      set ::crycol($tag) $c
      set ::cryset($tag) $player
      set ::crytag($tag) $tag
    }

    # --------------------
    # changeCrystal
    # --------------------
    proc changeCrystal {tag c} \
    {
      for {set i 0} {$i < 4} {incr i} \
      { changeTriangle $tag $i $::colors($i$c) }
      set ::crycol($tag) $c
    }

    # --------------------
    # selectColor
    # --------------------
    proc selectColor {player color} \
    {
      if {$player != $::turn || $::cb($player) == 1} { return }
      if {$color == $::set(c1) || $color == $::set(c2)} { return }
      .c config -cursor ""
      displayResult [llength [computeNewSet $player $color]]
    }

    # --------------------
    # twinkle
    # --------------------
    proc twinkle {args} \
    {
      if {[llength $args] == 1} \
      {
        # restore
        set tag [lindex $args 0]
        if {[info exists ::crycol($tag)] && $::crycol($tag) > 0} \
        {
          set c $::crycol($tag)
          set s $::cryset($tag)
          if {$s > 0} { set s 1 }
          foreach i {0 1 2 3} \
          { .c itemconf $tag:$i -fill [set ::colors${s}($i$c)] }
        }
        set delay [expr {$::period + int(rand() * $::period)}]
        after $delay twinkle
      } \
      else \
      {
        # exchange
        while 1 \
        {
          set xci0 [expr {$::size * 3 + $::padx * 2}]
          set xci1 [expr {$xci0 + $::size}]
          set xc $xci0
          set yci [expr {$::size + $::pady + $::header}]
          set yc $yci
          set imax [expr {$::imax - 1}]
          set jmax [expr {$::jmax - 1}]
          set i [expr {round(rand() * $imax)}]
          if {$i % 2 == 1} { set xc $xci1; incr jmax -1 }
          set j [expr {round(rand() * $jmax)}]
          incr xc [expr {$j * $::size2}]
          incr yc [expr {$i * $::size}]
          set tag t$yc:$xc
          if {[info exists ::crytag($tag)]} \
          {
            while {$::crytag($tag) != $tag} { set tag $::crytag($tag) }
            break
          }
        }
        set c $::crycol($tag)
        set i [expr {int(rand() * 4 - 0.001)}]
        set s $::cryset($tag)
        if {$s > 0} { set s 1 }
        .c itemconf $tag:$i -fill [set ::colors${s}(0$c)]
        after 1 twinkle $tag
      }
    }

    # --------------------
    # computeNewSet
    # --------------------
    proc computeNewSet {player color {do 1}} \
    {
      # extend limits
      if {$do} { set ::set(c$player) $color }
      set sz $::size
      set newset $::set($player)
      for {set ndx 0} {$ndx < [llength $newset]} {incr ndx} \
      {
        set stag [lindex $newset $ndx]
        if {$do} { changeCrystal $stag $color }
        foreach {yc xc} [split [string range $stag 1 end] :] break
        set size $::crysiz($stag)
        set n [expr {$size / $sz}]
        set xc1 [expr {$xc - $size - $sz}]
        set xc2 [expr {$xc + $size + $sz}]
        set yc1 $yc
        set yc2 $yc
        for {set i 0} {$i < $n + 2} {incr i} \
        {
          foreach xc [list $xc1 $xc1 $xc2 $xc2] yc [list $yc1 $yc2 $yc1 $yc2] \
          {
            set tag t$yc:$xc
            if {![info exists ::cryset($tag)]} { continue }
            if {$::cryset($tag) != 0} { continue }
            if {$::crycol($tag) == $color} \
            {
              if {[lsearch -exact $newset $tag] == -1} \
              {
                lappend newset $tag
                if {$do} \
                {
                  lappend ::set($player) $tag
                  set ::cryset($tag) $player
                }
              }
            }
          }
          incr xc1 $sz
          incr xc2 -$sz
          incr yc1 $sz
          incr yc2 -$sz
        }
      }
      # return newset
      if {$do} \
      {
        set ::current($player) [llength $newset]
        grow $player $color
      }
      return $newset
    }

    # --------------------
    # grow
    # --------------------
    proc grow {player color} \
    {
      set sz $::size
      # restore set
      .c delete t:$player
      set newset [lsort -decr $::set($player)]
      foreach t $newset \
      { set ::crycol($t) $color; set ::crysiz($t) $sz }
      # grow crystals
      foreach stag $newset \
      {
        if {$::crycol($stag) != $color} { continue }
        foreach {yc xc} [split [string range $stag 1 end] :] break
        set size $sz
        while 1 \
        {
          set n [expr {$size / $sz}]
          set s [list]
          set xc1 [expr {$xc - $size}]
          set xc2 [expr {$xc + $size}]
          set yc0 [expr {$yc - $sz}]
          for {set nn 0} {$nn < $n} {incr nn} \
          {
            set t t$yc0:$xc1
            if {
                   ![info exists ::cryset($t)]
                || $::crycol($t) != $color
                || $::crysiz($t) != $sz
               } \
            { break }
            lappend s $t
            set t t$yc0:$xc2
            if {
                   ![info exists ::cryset($t)]
                || $::crycol($t) != $color
                || $::crysiz($t) != $sz
               } \
            { break }
            lappend s $t
            incr xc1 $sz
            incr xc2 -$sz
            incr yc0 -$sz
          }
          set t t$yc0:$xc
          if {
               [llength $s] == 2 * $n
            && [info exists ::cryset($t)]
            && $::crycol($t) == $color
            && $::crysiz($t) == $sz
             } \
          {
            lappend s $t $stag
            set yc [expr {$yc - $sz}]
            set size [expr {$size + $sz}]
            set stag t$yc:$xc
            createCrystal $xc $yc $size $color $player
            foreach t $s \
            {
              set ::crycol($t) 0
              set ::crytag($t) $stag
            }
          } \
          else \
          { break }
        }
      }
    }

    # --------------------
    # displayResult
    # --------------------
    proc displayResult {count} \
    {
      set player $::turn
      set ratio [expr {$count / double($::total) * 100}]
      .c itemconfig l$player -text [format %2d [expr {round($ratio)}]]%
      update
      if {$ratio == 50
       && [llength $::set(c1)] == $::half
       && [llength $::set(c2)] == $::half} \
      {
        .c itemconfig l1 -text 50%
        .c itemconfig l2 -text 50%
        stop
      } \
      elseif {$ratio >= 50} \
      {
        .c itemconfig t$player -text [incr ::count$player]
        stop
        displayWinner
      } \
      else \
      {
        changeTurn
      }
    }

    # --------------------
    # displayWinner
    # --------------------
    proc displayWinner {} \
    {
      if {$::start} { return }
      set color [.c.e$::turn cget -fg]
      set color [expr {$color == "red" ? "black" : "red"}]
      .c.e$::turn config -fg $color
      .c itemconfig lr$::turn -fill $color
      after 500 displayWinner
    }

    # --------------------
    # changeTurn
    # --------------------
    set ::turnID ""
    proc changeTurn {} \
    {
      catch [list after cancel $::turnID]
      if {!$::start} { return }
      set player $::turn
      .c.e$player config -disabledback $::dbg
      .c itemconfig r$player -fill $::dbg
      set player [expr {$player == 1 ? 2 : 1}]
      set ::turn $player
      .c.e$player config -disabledback $::abg
      .c itemconfig r$player -fill $::abg
      # computer?
      if {$::cb($player)} { after $::cdelay play } \
      elseif {$::time > 0} \
      { set ::turnID [after $::times($::time) changeTurn] }
    }

    # --------------------
    # enterColor
    # --------------------
    proc enterColor {player color} \
    {
      if {$player != $::turn || $::cb($player) == 1} { return }
      if {$color == $::set(c1) || $color == $::set(c2)} { return }
      .c config -cursor target
    }

    # --------------------
    # leaveColor
    # --------------------
    proc leaveColor {player color} \
    {
      if {$player != $::turn || $::cb($player) == 1} { return }
      if {$color == $::set(c1) || $color == $::set(c2)} { return }
      .c config -cursor ""
    }

    # --------------------
    # play
    # --------------------
    proc play {} \
    {
      set player $::turn
      set level $::level
      if {$level == 2} \
      {
        set other [expr {$player == 1 ? 2 : 1}]
        if {$::current($player) < $::current($other)} \
        { set level 1 }
      }
      switch -exact $level \
      {
        0 \
        {
          # novice
          set c 0
          while {$c == 0} \
          {
            for {set k 0} {$k < 3} {incr k} \
            { set c [expr {2 * $c + (rand() > 0.5 ? 1 : 0)}] }
            if {$c == $::set(c1) || $c == $::set(c2)} { set c 0 }
          }
        }
        1 \
        {
          # normal
          set mc 0
          set n 0
          foreach c {1 2 3 4 5 6 7} \
          {
            if {$c == $::set(c1) || $c == $::set(c2)} { continue }
            set t [llength [computeNewSet $player $c [set do 0]]]
            if {$t > $n} { set n $t; set mc $c }
          }
          set c $mc
        }
        2 \
        {
          # expert
          set mc 0
          set n 0
          foreach c {1 2 3 4 5 6 7} \
          {
            if {$c == $::set(c1) || $c == $::set(c2)} { continue }
            set t [llength [computeNewSet $player $c [set do 0]]]
            if {$t > ($::total / 2.0 + 0.001)} { set mc $c; break }
            incr t $t
            incr t [llength [computeNewSet $other $c [set do 0]]]
            if {$t > $n} { set n $t; set mc $c }
          }
          set c $mc
        }
        3 \
        {
          # knight
          set mc1 0
          set mc2 0
          set n 0
          set dx 0
          set dy 0
          set s 0
          foreach {xi yi} $::first($player) break
          foreach t $::set($player) \
          {
            foreach {y x} [split [string range $t 1 end] :] break
            set ss [expr {abs($xi - $x) + abs($yi - $y)}]
            if {$ss > $s} { set s $ss }
          }
          set s0 $s
          foreach c {1 2 3 4 5 6 7} \
          {
            if {$c == $::set(c1) || $c == $::set(c2)} { continue }
            set tt [computeNewSet $player $c [set do 0]]
            set t [llength $tt]
            if {$t > $n} { set n $t; set mc1 $c }
            set ss 0
            foreach t $tt \
            {
              foreach {y x} [split [string range $t 1 end] :] break
              incr ss [expr {abs($xi - $x) + abs($yi - $y)}]
            }
            if {$ss > $s} { set s $ss; set mc2 $c }
          }
          set c [expr {$s > $s0 ? $mc2 : $mc1}]
        }
      }
      displayResult [llength [computeNewSet $player $c]]
    }

    # --------------------
    # quit
    # --------------------
    proc quit {} \
    {
      set fn CrystalsBattle.conf
      catch \
      {
        set fp [open $fn w]
        puts $fp \
  "
  set ::size  $::size;
  set ::level $::level;
  set ::time $::time;
  set ::cdelay $::cdelay;
  array set ::sizes {[array get ::sizes]};
  array set ::cb {[array get ::cb]};
  array set ::times {[array get ::times]};
  array set ::txTimes {[array get ::txTimes]};
  array set ::txLevels {[array get ::txLevels]};
  set ::txTitle \"$::txTitle\";
  set ::txName1 \"$::txName1\";
  set ::txName2 \"$::txName2\";
  set ::txAuto  \"$::txAuto\";
  set ::txStart \"$::txStart\";
  set ::txStop  \"$::txStop\";
  set ::txQuit  \"$::txQuit\";
  set ::glints $::glints;
  set ::period $::period;
  array set ::colors0 [array get ::colors0];
  array set ::colors1 [array get ::colors1];
  "
        close $fp
      } msg
      if {$msg != ""} { puts stderr $msg }
      exit
    }

    # --------------------
    # start
    # --------------------
    set restart 0
    set start 0
    proc start {} \
    {
      set ::start 1
      if {$::restart} { createDisplay }
      .f.b1 config -text $::txStop -command stop
      .c.b1 config -state disabled
      .c.b2 config -state disabled
      .c.b3 config -state disabled
      .c.e1 config -state disabled -fg black -bg $::abg
      .c.e2 config -state disabled -fg black -bg $::abg
      .c.cb1 config -state disabled
      .c.cb2 config -state disabled
      .c itemconfig l1 -state ""
      .c itemconfig l2 -state ""
      .c itemconfig lr1 -fill gray25
      .c itemconfig lr2 -fill gray25
      array unset ::set
      set xc [expr {$::size * ($::jmax * 2 + 1) + $::padx * 2}]
      set yc [expr {$::size + $::pady + $::header}]
      set tag t$yc:$xc
      set ::set(2) [list $tag]
      set ::set(c2) $::crycol($tag)
      set ::first(2) [list $xc $yc]
      set ::cryset($tag) 2
      set xc [expr {$::size * 3 + $::padx * 2}]
      set yc [expr {$::size * $::imax + $::pady + $::header}]
      set tag t$yc:$xc
      set ::set(1) [list $tag]
      set ::set(c1) $::crycol($tag)
      set ::first(1) [list $xc $yc]
      set ::cryset($tag) 1
      set ::turn [expr {rand() > 0.5 ? 1 : 2}]
      array set ::current {1 0 2 0}
      changeTurn
    }

    # --------------------
    # stop
    # --------------------
    proc stop {} \
    {
      catch [list after cancel $::turnID]
      set ::start 0
      set ::restart 1
      .f.b1 config -text $::txStart -command start
      .c.b1 config -state normal
      .c.b2 config -state normal
      .c.b3 config -state normal
      .c.e1 config -state normal
      .c.e2 config -state normal
      .c.cb1 config -state normal -fg black
      .c.cb2 config -state normal -fg black
      .c itemconfig r1 -fill $::dbg
      .c itemconfig r2 -fill $::dbg
    }

  # --------------------
  #   bgerror
  # --------------------
  proc bgerror {args} { tk_messageBox -message "bgerror:\n$args" }

  # --------------------
  #   computed values
  # --------------------
    set padx 10
    set pady 10
    set header 80
    set turn 0
    set count1 0
    set count2 0
    setSize $::size

  # --------------------
  #   animate
  # --------------------
    set delay 0
    for {set i 0} {$i < $glints} {incr i} \
    { after $delay twinkle; incr delay $period }

  # --------------------
  #   global events
  # --------------------
    wm protocol . WM_DELETE_WINDOW quit
    bind . <Escape> quit

  # --------------------
  #   go
  # --------------------
    wm title . "Crystals Battle"
    focus -force .
    raise .