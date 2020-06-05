catch { source testsaveconf.conf }

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

set fn testsaveconf.conf
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
