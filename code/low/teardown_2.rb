require 'socket'

# Create the server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)
connection, _ = server.accept

# Create a copy of the connection.
copy = connection.dup

# This shuts down communication on all copies of the connection.
connection.shutdown

# This closes the original connection. The copy will be closed
# when the GC collects it.
connection.close

