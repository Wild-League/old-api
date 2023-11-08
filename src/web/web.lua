local lapis = require('lapis')
local home = require('src.web.controllers.home')
local auth = require('src.web.controllers.auth.auth')
local post = require('src.web.controllers.post')
local users = require('src.web.controllers.users')

local web, _ = lapis.Application:extend('app')

web:enable('etlua')

web:include(home, { name='home' })
web:include(auth, { name='auth' })
web:include(post, { name='post' })
web:include(users, { name='users' })

return web
