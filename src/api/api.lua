local lapis = require('lapis')
local users = require('src.api.account')
local auth = require('src.api.auth')

local api, _ = lapis.Application:extend('app')

api:include(users)
api:include(auth)

return api
