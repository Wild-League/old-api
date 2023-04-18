local Match = require('udp.match')

local User = {
	clients_connected = {}
}

function User:add(ip, port)
	if not self:exists(ip, port) then
		local index = (function() if #self.clients_connected == 0 then return 1 else return #self.clients_connected + 1 end end)()
		self.clients_connected[index] = { ip = ip, port = port }
		print('client connected', ip, port)
	end
end

function User:remove(ip, port)
	-- TODO: implement
end

--[[
	if the user is not in clients_connected, then add and return the new user.
]]
function User:get(ip, port)
	local user = nil

	for _,v in pairs(self.clients_connected) do
		if v.ip == ip and v.port == port then
			user = v
		end
	end

	if user == nil then
		self:add(ip, port)

		local new_user = { ip=ip, port=port }
		return new_user
	end

	return user
end

function User:exists(ip, port)
	local user_exist = false

	for _,v in pairs(self.clients_connected) do
		user_exist = (v.ip == ip and v.port == port)

		if user_exist then
			return user_exist
		end
	end

	return user_exist
end

--[[
	receives mandatory the ip and port for the user we want to find,
	it also can receive the match the user is in to easy the find
]]
function User:find(ip, port, match)
	if match ~= nil then
		local players_match = Match.matches[match].players

		for _,v in pairs(players_match) do
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

return User
