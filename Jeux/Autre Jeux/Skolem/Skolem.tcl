 # ######################
  #
  # Skolem: main
  #
  # ######################

  # -----
  # packages
  # -----

  package require Tk

  # -----
  # global
  # -----

  array set {} \
  {
    user    user
    max     4
    x0      20
    y0      20
    xunit   25
    yunit   10
    radius  8
    font1   {Arial 12 bold}
    font2   {Arial 10 bold}
    date    %Y-%m-%d
    scores  {}
  }

  # -----
  # main
  # -----

  source Skolem.files.tcl
  source Skolem.GUI.tcl
  source Skolem.moves.tcl