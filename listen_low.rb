#!/usr/bin/env ruby

require 'socket'

# Create a TCP socket
socket = Socket.new(:INET, :STREAM)

# Create a C sturct to hold the address for listening
addr = Socket.pack_sockaddr_in(31337, '0.0.0.0')

socket.bind(addr)
