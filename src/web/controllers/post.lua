local lapis = require('lapis')
local prefix_routes = require('src.prefix_routes')

local post, _ = lapis.Application:extend('web')

post:get(prefix_routes:add('post', '', function()
	return 'post'
end))

return post
