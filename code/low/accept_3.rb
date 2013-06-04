require 'socket'

# Create the server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128)

# Enter an endless loop of accepting and
# handling connections.
loop do
  connection, _ = server.accept
  # handle connection
  connection.close
end

