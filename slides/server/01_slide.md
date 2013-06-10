!SLIDE 

# Getting Started with Ruby's Socket APIs

!SLIDE bullets incremental small

# Overview of Server Lifecycle

  * `1. create`
  * `2. bind`
  * `3. listen`
  * `4. accept`
  * `5. close`

!SLIDE smaller

# Creating Our First Socket

    @@@ ruby
    require 'socket'

    # Create a TCP socket for an IPv4 address
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

!SLIDE smaller

# A pinch of sugar

Ruby provides abbreviated symbols for almost all options in the sockets API

    @@@ ruby
    require 'socket'
    socket = Socket.new(:INET6, :STREAM)

!SLIDE smaller

# Servers Bind

    @@@ ruby
    require 'socket'

    # Create a TCP socket for an IPv4 address
    socket = Socket.new(:INET, :STREAM)

    # Create a C struct to hold the address for listening
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')

    socket.bind(addr)

!SLIDE smaller

# Servers Listen

    @@@ ruby
    require 'socket'

    # Create a socket and bind it to port 31337.
    socket = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    socket.bind(addr)

    # Tell it to listen for incoming connections.
    socket.listen(5)

!SLIDE

# The Listen Queue

The `listen` method takes an integer argument representing the maximum number of pending connections to allow. This list is called the `listen queue`.

## How big should the listen queue be?

Depends greatly on the application, but often makes sense to make it as large as your system will allow:

`server.listen(Socket::SOMAXCONN)`

!SLIDE small

# Servers Accept

    @@@ ruby
    require 'socket'

    # Create the server socket.
    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(128)

    # Accept a connection.
    connection, _ = server.accept

!SLIDE

# Accept is Blocking

After adding accept, our server will no longer exit immediately, but instead will block while waiting for a connection to arrive.

Accept simply pops the next pending connection off of the listen queue and returns an array containing the connection and an Addrinfo object.

!SLIDE smaller

# Connection Class

    @@@ ruby
    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(128)
    connection, _ = server.accept

    print 'Connection class: '
    p connection.class

    print 'Server fileno: '
    p server.fileno

    print 'Connection fileno: '
    p connection.fileno

    print 'Local address: '
    p connection.local_address

    print 'Remote address: '
    p connection.remote_address

!SLIDE smaller

# The Accept Loop

    @@@ ruby
    require 'socket'

    # Create the server socket.
    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(128)

    # Enter an endless loop of accepting and
    # handling connections.
    loop do
      connection, _ = server.accept
      # handle connection
      connection.close
    end

!SLIDE small incremental

# Servers Close

All sockets opened by an applicant are closed upon program termination.

## Why is close needed?

  * Resource usage
  * Open file limit

!SLIDE smaller

# Different Kinds of Closing

    @@@ ruby
    require 'socket'

    # Create the server socket.
    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(128)
    connection, _ = server.accept

    # After this the connection may no longer write data, 
    # but may still read data.
    connection.close_write

    # After this the connection may no longer 
    # read or write any data.
    connection.close_read

!SLIDE smaller

# Shutdown vs Close

    @@@ ruby
    require 'socket'

    # Create the server socket.
    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(128)
    connection, _ = server.accept

    # Create a copy of the connection.
    copy = connection.dup

    # Shuts down communication on all copies of the connection.
    connection.shutdown

    # This closes the original connection. The copy will be 
    # closed when the GC collects it.
    connection.close

!SLIDE

# Higher Level Ruby APIs

!SLIDE small

# Server Construction the Easy Way

The `TCPServer` class simplifies things greatly.

    @@@ ruby
    require 'socket'

    server = TCPServer.new(31337)

!SLIDE smaller

# The Hard Way

    @@@ ruby
    require 'socket'

    server = Socket.new(:INET, :STREAM)
    addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
    server.bind(addr)
    server.listen(5)

!SLIDE

# Listening on both IP and IPv6

    @@@ ruby
    require 'socket'

    servers = Socket.tcp_server_sockets(31337)

!SLIDE small

# Connection Handling

    @@@ ruby
    require 'socket'

    # Create the listener socket.
    server = TCPServer.new(31337)

    # Enter an endless loop of accepting and
    # handling connections.
    Socket.accept_loop(server) do |connection|
      # handle connection
      connection.close
    end

!SLIDE small

# accept_loop handles multiple sockets

    @@@ ruby
    require 'socket'

    # Create the listener socket.
    servers = Socket.tcp_server_sockets(31337)

    # Enter an endless loop of accepting and
    # handling connections.
    Socket.accept_loop(servers) do |connection|
      # handle connection
      connection.close
    end

!SLIDE small

# Grandaddy of them all

    @@@ ruby
    require 'socket'

    Socket.tcp_server_loop(31337) do |connection|
      # handle connection
      connection.close
    end

