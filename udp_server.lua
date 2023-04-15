local socket = require('socket')

local server = socket.udp()
server:setsockname("*", 9091)

while true do
  local data, ip, port = server:receivefrom()

  if data then
    print("Received message: " .. data)
    server:sendto('got it', ip, port)
  end
end
