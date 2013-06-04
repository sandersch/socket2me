#!/usr/bin/env ruby

require 'socket'

# Create a TCP socket for an IPv4 address
socket = Socket.new(:INET6, :STREAM)
