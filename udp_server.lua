local socket = require('socket')

local Json = require('lib.json')

local Server = {
	clients_connected = {},
	lobbies = {},
	objects = {}
}

function Server:init()
	self.connection = socket.udp()
	self.connection:setsockname("*", 9091)
end

function Server:user_exists(ip, port)
	local user_exist = false

	for _,v in pairs(self.clients_connected) do
		user_exist = (v.ip == ip and v.port == port)

		if user_exist then
			return user_exist
		end
	end

	return user_exist
end

-- TODO: # Create module users #

function Server:add_user(ip, port)
	if not self:user_exists(ip, port) then
		local index = (function() if #self.clients_connected == 0 then return 1 else return #self.clients_connected + 1 end end)()
		self.clients_connected[index] = { ip = ip, port = port }
	end
end

function Server:get_user(ip, port)
	for _,v in pairs(self.clients_connected) do
		if v.ip == ip and v.port == port then
			return v
		end
	end

	return nil
end

function Server:find_user(ip, port, lobby)
	if lobby ~= nil then
		local players_lobby = self.lobbies[lobby].players

		for _,v in pairs(players_lobby) do
			if v.ip == ip and v.port == port then
				return v
			end
		end
	else
		for _,v in pairs(self.clients_connected) do
			if v.ip == ip and v.port == port then
				return v
			end
		end
	end
end

-- # END Create module users #

function Server:receive()
	while true do
		local data, ip, port = self.connection:receivefrom()

		if data then
			self:add_user(ip, port)
			-- print('clients connected: ', #self.clients_connected)

			if data == 'Matchmaking' then
				local user = self:get_user(ip, port)

				if user ~= nil then
					self:add_user_lobby(user, 'room1')
					self:show_users_lobby('room1')
				end
			end

			-- what's the better way to identify a serialized table?
			if '{' == data:match('^{') then
				local obj = Json.decode(data)

				local id = obj.identifier
				self.objects[id] = data

				local users = self:get_users_lobby('room1')
				local user

				for _,v in pairs(users) do
					-- because I want the one who does not sent the message
					-- and I know that each lobby has only 2 players
					if v.ip ~= ip or v.port ~= port then
						user = v
					end
				end

				self.connection:sendto(data, user.ip, user.port)
			end

			-- TODO: create function broadcast
			-- for _,v in pairs(self.clients_connected) do
			-- 	self.connection:sendto('this is a test message', v.ip, v.port)
			-- end
		end
	end
end

-- TODO: # Create module lobby #

function Server:add_user_lobby(user, room)
	if self.lobbies[room] == nil then
		self.lobbies[room] = {}
		self.lobbies[room].players = {}
	end

	table.insert(self.lobbies[room].players, user)

	if #self.lobbies[room].players == 2 then
		for _,v in pairs(self.lobbies[room].players) do
			self.connection:sendto('Match Found', v.ip, v.port)
		end
	end
end

function Server:show_users_lobby(room)
	for i,v in ipairs(self.lobbies[room].players) do
		print('player '..i..':', v.ip, v.port)
	end
end

function Server:get_users_lobby(room)
	return self.lobbies[room].players
end

-- # END Create module lobby #

Server:init()
Server:receive()

return Server
