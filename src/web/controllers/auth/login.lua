local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local login, _ = lapis.Application:extend('auth')

login:get(prefix_route:add('auth','/login', function()
	return 'login page'
end))

return login
