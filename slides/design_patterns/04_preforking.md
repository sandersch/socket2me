!SLIDE

# Preforking

!SLIDE

# Explanation

 * Modification of the _Process Per Connection_ architecture.
 * Instead of forking a process for each connection, server spawns a number of processes when the server starts up

!SLIDE incremental

# Connection Flow

  * Main server process creates a listening socket
  * Main server forks a horde of child processes
  * Each child process accepts connections on the shared socket and then handles them independently
  * Main server keeps an eye on the child processes
  
!SLIDE incremental

# Considerations

  * Same advantages as _Process Per Connection_
  * Cheaper to fork upfront than on-demand
  * Prevents too many processes from being spawned

!SLIDE

# Examples

  * Unicorn
