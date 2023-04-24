local lapis = require('lapis')
local users = require('src.api.users')

local api, _ = lapis.Application:extend('app')

api:include(users)

return api
