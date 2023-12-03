local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')
local json_params = require("lapis.application").json_params
local DeckService = require('src.services.deck_service')

local deck, _ = lapis.Application:extend('api')

deck:post(prefix_route:add('api', '/deck', json_params(function(self)
	local username = self.session.current_user_name
	local deck_name = self.params.name

	if DeckService:create(username, deck_name) then
		return { status = 201 }
	end

	return { status = 400 }
end)))

deck:get(prefix_route:add('api', '/deck/:id', json_params(function(self)
	return { json = DeckService:get_cards(self.params.id)}

	-- if new_deck then
	-- 	return { status = 201, json = new_deck }
	-- end

	-- -- TODO: handle error
	-- return { status = 400 }
end)))

return deck
