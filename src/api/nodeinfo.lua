local lapis = require('lapis')
local json_params = require("lapis.application").json_params
local prefix_route = require('src.prefix_routes')

local UserService = require('src.services.user_service')
local PostService = require('src.services.post_service')
local InstanceService = require('src.services.instance_service')

local nodeinfo, mt = lapis.Application:extend('api')

nodeinfo:post(prefix_route:add('api', '/nodeinfo/validate', json_params(function(self)
	local valid = InstanceService:validate(self.params.url)

	return {
		status = valid and 200 or 400,
		json = { valid = valid }
	}
end)))

nodeinfo:get(prefix_route:add('api', '/nodeinfo', function()
	return mt:json_response()
end))

-- Following http://nodeinfo.diaspora.software/schema.html - version 2.1
function mt:json_response()
	return {
		status = 200,
		json = {
			metadata = {
				name = 'wildleague.org',
				nodeDescription = 'Gaming experience on fediverse'
			},
			version = '2.1',
			software = {
				name = 'Wild League',
				version = '0.0.1',
				repository = 'https://github.com/wild-League/api',
				homepage = ''
			},
			protocol = {
				'activitypub'
			},
			services = {
				inbound = {},
				outbound = {}
			},
			openRegistrations = true,
			usage = {
				users = {
					total = UserService:count(),
					activeHalfYear = 0,
					activeMonth = 0
				},
				localPosts = PostService:count(),
				localComments = 0
			}
		}
	}
end

return nodeinfo
