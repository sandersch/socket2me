!SLIDE

# Thread Per Connection

!SLIDE

# Explanation

Same as _Process Per Connection_ but with threads instead of processes

!SLIDE incremental

# Threads vs. Processes

  * Spawning
  * Synchronizing
  * Parallelism

!SLIDE incremental

# Considerations

  * Similar benefits and disadvantages as _Process Per Connection_
  * Threads are generally lighter weight than processes
  * MRI GIL

!SLIDE

# Examples

  * WEBrick
  * Mongrel
