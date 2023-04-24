local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local users, _ = lapis.Application:extend('api')

users:get(prefix_route:add('api', '/users', function()
	return '/users'
end))

return users
