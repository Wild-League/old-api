local lapis = require('lapis')
local user = require('src.api.user')
local auth = require('src.api.auth')
local post = require('src.api.post')
local nodeinfo = require('src.api.nodeinfo')
local waitlist = require('src.api.waitlist')

local api, _ = lapis.Application:extend('app')

api:include(user)
api:include(auth)
api:include(post)
api:include(nodeinfo)
api:include(waitlist)

return api
