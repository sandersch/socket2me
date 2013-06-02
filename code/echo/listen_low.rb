#!/usr/bin/env ruby

require 'socket'

# Create an IPv4 (:INET) TCP (:STREAM) socket.
socket = Socket.new(:INET, :STREAM)

# Create a C struct to hold the address for listening
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')

socket.bind(addr)
