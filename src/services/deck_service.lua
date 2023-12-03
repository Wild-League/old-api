local db = require("lapis.db")

local UserService = require('src.services.user_service')
local Model = require("lapis.db.model").Model
local Deck = Model:extend('deck')

local DeckService = {}

--[[
	return the cards of a deck
	@param id: the id of the deck
]]
function DeckService:get_cards(id)
	local cards = db.query([[
		select c.id as id, c.name as name, c.type as type,
			c.life as life, c.speed as speed, c.attack_range as attack_range,
			c.cooldown as cooldown, c.damage as damage, c.width as width, c.height as height

		from deck as d

		inner join deck_card dc on dc.deck_id = dc.deck_id
		inner join card c on c.id = dc.card_id

		where d.id = ?
	]], id)

	return cards
end

function DeckService:create(username, deck_name)
	local user = UserService:get_by_username(username)

	return Deck:create({
		user_id = user.id,
		name = deck_name,
		created_at = os.date()
	})
end

return DeckService
