require 'socket'

# Create a TCP socket for an IPv4 address
socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)
