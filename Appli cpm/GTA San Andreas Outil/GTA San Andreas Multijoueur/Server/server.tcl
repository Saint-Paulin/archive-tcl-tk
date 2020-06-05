# Server active
source [file join server.cfg]


# -------------------
# ---- client connection
# -------------------
proc connect {channel client port} \
{ 
  # log event
  log "connect $client $channel" 1
  # start a new process
  exec $::parms(tclsh) $::parms(process) $::parms(init) $channel &
  set ::clients($channel) [list [_date] $client]
  .tree insert end $port
}
# -------------------
# ---- client disconnection
# -------------------
proc disconnect {client process} \
{
  catch { close $client }
  catch { close $process }
  if {[info exists ::clients($client)]} \
  {
    log "disconnect [lindex $::clients($client) 1] $client" 1
    unset ::clients($client)
  }
}

set port 6000 ;# 0 if no known free port
set rc [catch \
{
set channel [socket -server server $port]
if {$port == 0} \
    {
      set port [lindex [fconfigure $channel -sockname] end]
      puts "--> server port: $port"
    }
  } msg]
if {$rc == 1} {
    log server <exiting>\n***$msg
    exit
}
set (server:host) server
set (server:port) $port

 proc input {channel} \
  {
    if {[eof $channel]} \
    {
      # client closed -> log & close
      log $channel <closed>
      catch { close $channel }
    } \
    else \
    {
      # receiving
      set rc [catch { set count [gets $channel data] } msg]
      if {$rc == 1} \
      {
        # i/o error -> log & close
        log $channel ***$msg
        catch { close $channel }
      } \
      elseif {$count == -1} \
      {
        # client closed -> log & close
        log $channel <closed>
        catch { close $channel }
      } \
      else \
      {
        # got data -> do some thing
        log $channel $data
      }
    }
  }