local lapis = require('lapis')

local home, _ = lapis.Application:extend('web')

home:get('/', function()
	return 'welcome to wild league'
end)

return home
