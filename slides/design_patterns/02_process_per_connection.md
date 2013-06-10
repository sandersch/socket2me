!SLIDE

# Process Per Connection

!SLIDE incremental

# Explanation

  * Mostly similar to serial architecture
  * After accepting a connection, the server will `fork` a child to handle the new connection
  * Child handles the connection, then exits
  * Provides process-wise concurrency for connections

!SLIDE incremental

# Connection Flow

  * Connection comes into server
  * Main server accepts the connection
  * Forks a new child process which is an exact copy of the server process
  * Child processes connection while server goes back to step #1

!SLIDE incremental

# Considerations

  * Still pretty simple
  * Easy to understand parallelism
  * No upper bound on number of child processes
  * Not well supported on Windows or JRuby

!SLIDE

# Examples

  * shotgun
  * inetd
