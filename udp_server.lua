local socket = require('socket')

local server = socket.udp()
server:setsockname("*", 9091)

local clients_connected = {}

local function user_exists(ip, port)
	local user_exist = false

	for _,v in pairs(clients_connected) do
		user_exist = (v.ip == ip and v.port == port)

		if user_exist then
			return user_exist
		end
	end

	return user_exist
end

local function add_user(ip, port)
	if not user_exists(ip, port) then
		local index = (function() if #clients_connected == 0 then return 1 else return #clients_connected + 1 end end)()
		clients_connected[index] = { ip = ip, port = port }
	end
end

while true do
  local data, ip, port = server:receivefrom()

  if data then
		add_user(ip, port)
    -- print("Received message: "..data)
		print('clients connected: ', #clients_connected)

		for _,v in pairs(clients_connected) do
			server:sendto('this is a test message', v.ip, v.port)
		end
  end
end
