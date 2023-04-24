local lapis = require('lapis')
local home = require('src.web.controllers.home')
local auth = require('src.web.controllers.auth.auth')

local web, _ = lapis.Application:extend('app')

web:enable('etlua')

web:include(home, { name='home'} )
web:include(auth, { name='auth'} )

return web
