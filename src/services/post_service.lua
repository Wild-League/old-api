local Model = require("lapis.db.model").Model
local AccountService = require('src.services.account_service')
local config = require('lapis.config').get()

local Post = Model:extend('posts')


local PostService = {}

--[[
	Creates a post

	@params:
	- content: a string with the text of the post
	- reply_to_post: the post this is a reply to
]]
function PostService:create(content, reply_to_post)
	-- TODO: need to handle replies
	-- local reply_account_id = AccountService:get_by_id()

	return Post:create({
		uri = '',
		created_at = os.date(),
		account_id = 1, -- TODO: get id of the logged user
		content = content,
		in_reply_to_post_id = nil,
		in_reply_to_account_id = nil
	})
end

--[[
	Gets the post by id

	@returns
	- success: the post
	- failure: nil
]]
function PostService:get_by_id(id)
	return Post:find(id)
end

--[[
	Return the user that created the post by post_id
]]
function PostService:get_author(id)
	local post = self:get_by_id(id)
	return AccountService:get_by_id(post.account_id)
end

--[[
	Return the number of posts created
]]
function PostService:count()
	return Post:count()
end

return PostService
