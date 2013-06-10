!SLIDE

# Reactor

!SLIDE incremental

# Explanation

Completely different approach unlike the others

  * Single-threaded, single-process
  * Able to achieve conncurrency at least on par with other patterns discussed
  * Centers around a _Reactor_ core that view each stage of the connection lifecycle as an event

!SLIDE smaller incremental

# Connection Flow

  * Server monitors socket for connections
  * When connection is received, adds it to list of sockets to monitor
  * Server monitors active connection as well as listening socket
  * When connection becomes readable, server read chunk of data and dispatches relevant callback
  * If active connection is still readable, server reads another chunk and dipatches again
  * Any new incoming connections are added to list of sockets to monitor
  * Server is notified the first connection is ready for writing and sends responses for that connection

!SLIDE incremental

# Considerations

  * Extremely high levels of concurrency
  * More complicated programming model
  * Simplifies some aspects, complicates others
  * Easy to screw up

!SLIDE

# Examples

  * EventMachine
  * Celluoid::IO
  * Twisted
