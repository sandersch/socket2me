!SLIDE

# Buffering

!SLIDE small incremental

# Write Buffers

  * Simply returning **does not** mean that data has been successfully sent
  * When write returns, it is just acknowledging that you have left your data to the capable hands of Ruby's IO system and the OS kernel
  * Before the data is sent, it goes through at least one layer of buffering

!SLIDE incremental

# Why Buffer

  * Performance
  * Sending data is slow
  * Small packets incur too much overhead

!SLIDE incremental

# How Much to Write?

  * Many small writes or one big write?
  * We don't usually have to think about it
  * You'll get the best performance from writing everything you have to write in one go

!SLIDE

# Read Buffers

!SLIDE small incremental

# How Much to Read?

  * Less straightforward
  * Impossible to know how much data is coming
  * Why not specify huge value?
  * What about really small?
  * No silver bullet

!SLIDE incremental

# What to other projects do?

  * Mongrel, Unicorn, Puma, Passenger, and Net::HTTP all do `readpartial(1024 * 16)`

  * But redis-rb uses 1KB
  * **Manual tuning required!**
