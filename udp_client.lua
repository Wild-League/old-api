local socket = require("socket")

local udp = socket.udp()
while udp:setpeername('127.0.0.1', 9091) == 1 do
	-- udp:send("I AM CLIENT!")

	local data = udp:receive()

	if data then
		print(data)
	end
end
