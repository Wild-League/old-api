local Events = require('udp.events')

local Match = {
	matches = {},
	num_matches = 0,
	max_number_players = 2,
	server_instance = {}
}

function Match:add_user(user)
	if self.num_matches > 0 then
		for i,match in ipairs(self.matches) do
			if #match.players == 1 then
				table.insert(match.players, user)
				self:send_message(i, { event = Events.MatchFound })
				return
			end
		end

		-- if there are no rooms available, create one
		-- TODO: implement create function
		-- self:create()
	else
		-- TODO: implement create function
		-- self:create()

		self.num_matches = self.num_matches + 1
		table.insert(self.matches, { players = {} })
		table.insert(self.matches[1].players, user)
	end
end

function Match:create(name)
	-- if self.matches[name].players == nil then

	-- end
end

function Match:show_users(room)
	for i,v in ipairs(self.matches[room].players) do
		print('player '..i..':', v.ip, v.port)
	end
end

function Match:get_users(room)
	return self.matches[room].players
end

--[[
	Send Message to all players in a room
]]
function Match:send_message(room, message)
	for _,v in pairs(self.matches[room].players) do
		self.server_instance:send(message, v.ip, v.port)
	end
end

--[[
	receive the ip, port and room for the one who sent the message,
	but in this case we return the person who doesn't sent the message.
]]
function Match:get_other_player(ip, port, room)
	local users = self:get_users(room)
	local user

	for _,v in pairs(users) do
		-- I know that each match has only 2 players
		if v.ip ~= ip or v.port ~= port then
			return v
		end
	end

	return user
end

return Match
