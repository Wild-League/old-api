local config = require('love.config').get()
local PostService = require('src.services.post_service')

local NoteSerializer = {}

--[[
	Create a note following model from https://www.w3.org/TR/activitystreams-vocabulary/#dfn-note

	Use cases:
	- Posts to everyone - OK
	- Direct Messages -
	- Posts with Mention -
	- Posts with tags -
]]
function NoteSerializer:serializer(post)
	-- TODO: get username
	local account = PostService:get_author(post.account_id)
	local username = account.username

	-- TODO: get post reply
	local post_reply = PostService:get_by_id(post.in_reply_to_post_id)
	local url_post_reply = (function() if post_reply then return post_reply.uri else return nil end end)

	return {
		json = {
			['@context'] = {
				'https://www.w3.org/ns/activitystreams'
			},
			id = config.url .. 'users/' .. username .. '/posts' .. post.id .. '/activity',
			type = 'Create',
			actor = config.url .. 'users/' .. username,
			published = post.created_at,
			to = 'https://www.w3.org/ns/activitystreams#Public',
			cc = config.url 'users/' .. username .. '/followers',
			object = {
				id = config.url .. 'users/' .. username .. '/posts' .. post.id,
				type = 'Note',
				summary = '',
				inReplyTo = url_post_reply,
				published = post.created_at,
				url = config.url .. 'users/' .. username .. '/posts' .. post.id,
				attributedTo = config.url .. 'users/' .. username,
				to = 'https://www.w3.org/ns/activitystreams#Public',
				cc = config.url 'users/' .. username .. '/followers',
				sensitive = false,
				-- atomUri
				-- inReplyToAtomUri
				content = post.content,
				-- TODO: Identify the language
				contentMap = {
					en = post.content
				},
				attachment = {},
				-- TODO: get the # and the @
				tag = {},
				replies = {
					id = config.url .. 'users/' .. username .. '/posts/' .. post.id .. '/replies',
					type = 'Collection',
					items = {}
					-- TODO: I dont know if I need it
					-- first = {
					-- 	type = 'CollectionPage'
					-- }
				}
			}
		}
	}
end

return NoteSerializer
