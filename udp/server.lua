local socket = require('socket')
local User = require('udp.user')
local Match = require('udp.match')
local Json = require('lib.json')

local Events = require('udp.events')

local Server = {
	objects = {},
	the_other_player = nil
}

-- TODO: remove the laggy from the server
-- possible solution -> create coroutines to control each lobby (match)

function Server:init()
	self.connection = socket.udp()
	self.connection:setsockname("*", 9091)
	self.connection:settimeout(0)

	Match.server_instance = self
end

function Server:receive()
	while true do
		local data, ip, port = self.connection:receivefrom()

		if data then
			self:process_received_data(data, ip, port)
		end
	end
end

function Server:process_received_data(data, ip, port)
	data = Json.decode(data)

	if data.event == Events.Object then
		-- local id = data.identifier
		-- self.objects[id] = data.obj

		local user = Match:get_other_player(ip, port, 1)
		self:send({ event=Events.Object, obj=data.obj, identifier=data.identifier }, user.ip, user.port)
	end

	if data.event == Events.Connect then
		User:add(ip, port)
	end

	if data.event == Events.Matchmaking then
		self:handle_matchmaking(ip, port)
	end

	if data.event == Events.Disconnect then
		User:remove(ip, port)
	end
end

function Server:handle_matchmaking(ip, port)
	local user = User:get(ip, port)

	if user ~= nil then
		Match:add_user(user)
	end
end

function Server:broadcast(message)
	for _,v in pairs(User.clients_connected) do
		self.connection:sendto(message, v.ip, v.port)
	end
end

function Server:send(data, ip, port)
	-- TODO: check for only the events defined
	if data.event == nil then
		error('should have a valid event')
	end

	self.connection:sendto(Json.encode(data), ip, port)
end

Server:init()
Server:receive()

return Server
