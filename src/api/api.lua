local lapis = require('lapis')
local users = require('src.api.account')

local api, _ = lapis.Application:extend('app')

api:include(users)

return api
