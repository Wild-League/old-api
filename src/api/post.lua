local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local PostService = require('src.services.post_service')

local post, _ = lapis.Application:extend('api')

--[[
	create a post

	required params:
	- content: The text of the post
]]
post:post(prefix_route:add('api', '/post', function(self)
	local req = self.params

	local p = PostService:create(req.content)

	if p then
		return {
			status = 201,
			json = {
				id = p.id,
				uri = p.uri,
				created_at = p.created_at,
				edited_at = p.edited_at,
				account_id = p.account_id,
				content = p.content,
				in_reply_to_post_id = p.in_reply_to_post_id,
				in_reply_to_account_id = p.in_reply_to_account_id -- TODO: should I return info about the account? (username, etc),
			}
		}
	else
		return { status = 500, json = { message = 'sorry, an error occurred while creating your post, try again later.' } }
	end
end))

post:get(prefix_route:add('api', '/post/:id', function(self)
	local p = PostService:get_by_id(self.params.id)

	if not p then
		return {
			status = 404
		}
	end

	print(p.in_reply_to_post_id)

	return {
		status = 200,
		json = {
			id = p.id,
			uri = p.uri,
			created_at = p.created_at,
			edited_at = p.edited_at,
			account_id = p.account_id,
			content = p.content,
			in_reply_to_post_id = p.in_reply_to_post_id,
			in_reply_to_account_id = p.in_reply_to_account_id
		}
	}
end))

return post
