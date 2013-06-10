!SLIDE

# Sockets Can Write

!SLIDE small

# Writing to a socket

    @@@ ruby 
    require 'socket' 
    Socket.tcp_server_loop(4481) do |connection|
      # Simplest way to write data to a connection.
      connection.write('Welcome!')
      connection.close
    end

!SLIDE

# Simple Example Applicants

!SLIDE

# TCP echoer

!SLIDE

# Simple HTTP responder
