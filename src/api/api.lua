local lapis = require('lapis')
local users = require('src.api.account')
local auth = require('src.api.auth')
local post = require('src.api.post')
local nodeinfo = require('src.api.nodeinfo')

local api, _ = lapis.Application:extend('app')

api:include(users)
api:include(auth)
api:include(post)
api:include(nodeinfo)

return api
