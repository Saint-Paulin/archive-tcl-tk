 # ######################
  #
  # Skolem: files
  #
  # ######################

  set (fn:config) Skolem.config
  set (fn:score) Skolem.score

  # read
  proc readFile {fn} \
  {
    set lines [list]
    catch \
    {
      set fp [open $fn r]
      set file [split [read $fp] \n]
      close $fp
    }
    foreach line $file \
    {
      lappend lines [split $line \t]
    }
    return $lines
  }

  # source
  proc sourceFile {fn} \
  {
    catch { source $fn }
  }

  # write
  proc writeFile {fn lines} \
  {
    catch \
    {
      set fp [open $fn w]
      foreach line $lines \
      {
        lappend file [join $line \t]
      }
      puts -nonewline $fp [join $file \n]
      close $fp
    } msg
    if {$msg != ""} { tk_messageBox -message $msg }
  }

  # save files
  proc saveFiles {} \
  {
    variable {}
    # config
    lappend conf [list "global {}"]
    lappend conf [list "array set {} {"]
    lappend conf [list user "{$(user)}"]
    lappend conf [list max $(max)]
    lappend conf [list x0 $(x0)]
    lappend conf [list y0 $(y0)]
    lappend conf [list xunit $(xunit)]
    lappend conf [list yunit $(yunit)]
    lappend conf [list radius $(radius)]
    lappend conf [list font1 "{$(font1)}"]
    lappend conf [list font2 "{$(font2)}"]
    lappend conf [list "}"]
    writeFile $(fn:config) $conf
    # score
    lappend scor [list "global {}"]
    foreach score $(scores) \
    { lappend scor [list lappend (scores) \[list $score \]] }
    writeFile $(fn:score) $scor
  }

  # read config
  sourceFile $(fn:config)
  # read score
  sourceFile $(fn:score)