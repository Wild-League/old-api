local lapis = require('lapis')
local account = require('src.api.account')
local auth = require('src.api.auth')
local post = require('src.api.post')
local nodeinfo = require('src.api.nodeinfo')

local api, _ = lapis.Application:extend('app')

api:include(account)
api:include(auth)
api:include(post)
api:include(nodeinfo)

return api
