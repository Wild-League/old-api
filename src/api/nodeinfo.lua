local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local nodeinfo, mt = lapis.Application:extend('api')

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
					total = 1,
					activeHalfYear = 0,
					activeMonth = 0
				},
				localPosts = 0,
				localComments = 0
			}
		}
	}
end

return nodeinfo
