local lapis = require('lapis')
local signin = require('src.web.controllers.auth.signin')
local signup = require('src.web.controllers.auth.signup')

local auth = lapis.Application()

auth:include(signin)
auth:include(signup)

return auth
