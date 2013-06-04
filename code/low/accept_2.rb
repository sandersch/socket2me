require 'socket'

# Create the server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')
server.bind(addr)
server.listen(128)

# Accept a new connection.
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

