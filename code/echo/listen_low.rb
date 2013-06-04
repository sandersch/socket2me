#!/usr/bin/env ruby

require 'socket'

# Create a TCP socket for an IPv4 address
socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

# Create a C struct to hold the address for listening
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')

socket.bind(addr)
