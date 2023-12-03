local lapis = require('lapis')
local user = require('src.api.user')
local auth = require('src.api.auth')
local post = require('src.api.post')
local nodeinfo = require('src.api.nodeinfo')
local waitlist = require('src.api.waitlist')
local webfinger = require('src.api.webfinger')
local card = require('src.api.card')
local deck = require('src.api.deck')

local api, _ = lapis.Application:extend('app')

api:include(user)
api:include(auth)
api:include(post)
api:include(nodeinfo)
api:include(waitlist)
api:include(webfinger)
api:include(card)
api:include(deck)

return api
