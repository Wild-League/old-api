local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local signup, _ = lapis.Application:extend('auth')

signup:get(prefix_route:add('auth','/signup', function()
	return 'create your user'
end))

return signup
