require 'socket'
require 'time'

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

def dispatch_request(request)
  if request =~ /boom/
    "Boom!"
  else
    html_payload
  end
end

def respond_to(input)
  lines = input.split "\r\n"
  response_body = dispatch_request(lines.first)
  full_response = add_headers_to(response_body)
end

def add_headers_to(payload)
  header = <<HEADER
HTTP/1.1 200 OK\r
Date: #{Time.now.utc.rfc2822}\r
Content-Type: text/html; charset=utf-8\r
Content-Length: #{payload.length}\r\n\r\n
HEADER

  header + payload
end

Socket.tcp_server_loop(31337) do |connection|
  input = connection.readpartial(1024)
  response = respond_to(input)
  puts "Response = #{response.inspect}"
  connection.write(response)
  connection.close
end

