local lapis = require('lapis')
local prefix_routes = require('src.prefix_routes')
local UserService = require('src.services.user_service')

local users, _ = lapis.Application:extend('web')

-- using as optional parameter in this case so I can return
-- an appropriate http error
users:get(prefix_routes:add('users', '(/:username)', function(self)
	local username = self.params.username

	if not username then
		-- TODO: create view
		return { status = 404 }
	end

	local account = UserService:get_by_username(username)

	if not account then
		-- TODO: create view
		return { status = 404 }
	end

	local headers = self.req.headers

	if headers['Accept'] then
		-- TODO: Create serializer user
		-- TODO: should return as ActivityPub object
		return { status = 200, json = {} }
	end

	-- TODO: create view
	return 'user ' .. account.username
end))

return users
