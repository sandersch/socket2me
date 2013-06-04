require 'socket'

# Ruby provides shorthand symbols for us to use instead of constants.
# This also opens a TCP port, but one prepared for IPv6 addressing.
socket = Socket.new(:INET6, :STREAM)
