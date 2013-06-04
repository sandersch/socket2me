require 'socket'

# Create a socket and bind it to port 31337.
socket = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
socket.bind(addr)

# Tell it to listen for incoming connections.
socket.listen(5)

