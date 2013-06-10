!SLIDE

# Sockets Can Read

!SLIDE small

# Simple Reads

    @@@ ruby
    require 'socket'

    Socket.tcp_server_loop(31337) do |connection|
      # Simplest way to read data from the connection.
      puts connection.read

      # Close the connection once we're done reading. 
      # Lets the client know that they can stop 
      # waiting for us to write something back.
      connection.close
    end

!SLIDE incremental

# It's Never That Simple

 * `$ tail -f /var/log/system.log | nc localhost 31337`
 * `read` waits for an EOF before returning

!SLIDE small

# Read Length

    @@@ ruby
    require 'socket'
    one_kb = 1024 # bytes

    Socket.tcp_server_loop(31337) do |connection|
      # Read data in chunks of 1 kb.
      while data = connection.read(one_kb) do
        puts data
      end

      connection.close
    end

!SLIDE incremental

# Blocking

  * A call to `read` will always block
  * Can return early if client sends EOF
  * Or the server can use partial read

!SLIDE smaller

# Partial Reads

    @@@ ruby
    require 'socket'
    one_hundred_kb = 1024 * 100

    Socket.tcp_server_loop(31337) do |connection|
      begin
        # Read data in chunks of 1 hundred kb or less.
        while data = connection.readpartial(one_hundred_kb) do
          puts data
        end
      rescue EOFError
      end

      connection.close
    end
