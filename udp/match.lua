local Events = require('udp.events')

local Match = {
	matches = {},
	max_number_players = 2,
	server_instance = {}
}

function Match:add_user(user, room)
	if self.matches[room] == nil then
		self.matches[room] = {}
		self.matches[room].players = {}
	end

	table.insert(self.matches[room].players, user)

	if #self.matches[room].players == self.max_number_players then
		self:send_message(room, { event = Events.MatchFound })
	end
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

return Match
