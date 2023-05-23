local lapis = require('lapis')
local users = require('src.api.account')
local auth = require('src.api.auth')
local post = require('src.api.post')

local api, _ = lapis.Application:extend('app')

api:include(users)
api:include(auth)
api:include(post)

return api
