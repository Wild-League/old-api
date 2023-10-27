local lapis = require('lapis')
local json_params = require("lapis.application").json_params
local prefix_route = require('src.prefix_routes')

local WaitlistService = require('src.services.waitlist_service')

local waitlist, _ = lapis.Application:extend('api')

waitlist:post(prefix_route:add('api', '/waitlist', json_params(function(self)
	return WaitlistService:create(self.params.email)
end)))

return waitlist
