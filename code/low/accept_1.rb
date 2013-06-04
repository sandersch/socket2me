require 'socket'

# Create the server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
server.bind(addr)
server.listen(128)

# Accept a connection.
connection, _ = server.accept

