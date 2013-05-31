require 'socket'

def html_payload
<<HTML
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>sockets</title>
  </head>
  <body>I love sockets!</body>
</html>
HTML
end

def text_payload
  "I love sockets!"
end

Socket.tcp_server_loop(31337) do |connection|
  connection.write(html_payload)
  connection.close
end

