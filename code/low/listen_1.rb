require 'socket'

# Create a TCP socket for an IPv4 address
socket = Socket.new(:INET, :STREAM)

# Create a C struct to hold the address for listening
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')

socket.bind(addr)

__END__

This code is basically identical to the C code necessary to implement the same thing.
This runs and quits immediately. While we are telling the OS that we want dibs on the specified address and port number, we are not yet actually listening for a connection.
