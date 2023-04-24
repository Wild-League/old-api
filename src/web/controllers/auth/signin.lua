local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local signin, _ = lapis.Application:extend('auth')

signin:get(prefix_route:add('auth','/signin', function()
	return { render = 'signin' }
end))

return signin
