local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

-- local AccountService = require('src.services.account_service')

local post, _ = lapis.Application:extend('api')

post:post(prefix_route:add('api', '/post', function(self)
	return 'post'
end))

return post
