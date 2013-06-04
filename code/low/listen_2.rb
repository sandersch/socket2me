require 'socket'

# This socket will bind to the loopback interface and will only be
# listening for clients from localhost.
local_socket = Socket.new(:INET, :STREAM)
local_addr = Socket.pack_sockaddr_in(31337, '127.0.0.1')
local_socket.bind(local_addr)

# This socket will bind to any of the known interfaces and will be
# listening for any client that can route messages to it.
any_socket = Socket.new(:INET, :STREAM)
any_addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
any_socket.bind(any_addr)

# This socket attempts to bind to an unknown interface and
# raises Errno::EADDRNOTAVAIL.
error_socket = Socket.new(:INET, :STREAM)
error_addr = Socket.pack_sockaddr_in(31337, '1.2.3.4')
error_socket.bind(error_addr)
