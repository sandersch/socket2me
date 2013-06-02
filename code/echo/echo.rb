require 'socket'

Socket.tcp_server_loop(6969) do |connection|
  connection.write(connection.read)
  connection.close
end

