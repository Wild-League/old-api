local lapis = require('lapis')
local login = require('src.web.controllers.auth.login')
local signup = require('src.web.controllers.auth.signup')

local auth = lapis.Application()

auth:include(login)
auth:include(signup)

return auth
