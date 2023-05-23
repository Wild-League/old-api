local Model = require("lapis.db.model").Model
local AccountService = require('src.services.account_service')

local Post = Model:extend('posts')


local PostService = {}

--[[
	Creates a post

	@params:
	- content: a string with the text of the post
	- reply_to_post: the post this is a reply to
]]
function PostService:create(content, reply_to_post)
	-- local reply_account_id = AccountService:get_by_id()

	local post = Post:create({
		uri = '',
		created_at = os.date(),
		account_id = '', -- TODO: get id of the logged user
		content = content,
		in_reply_to_post_id = reply_to_post,
		in_reply_to_account_id = nil
	})

	return post
end

--[[
	Gets the post by id

	@returns
	- success: the post
	- failure: nil
]]
function PostService:get_by_id(id)
	return nil
end

--[[
	Return the number of posts created
]]
function PostService:count_posts()
	return Post:count()
end

return PostService
