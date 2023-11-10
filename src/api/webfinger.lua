local lapis = require('lapis')
local config = require('lapis.config').get()
local prefix_routes = require('src.prefix_routes')

local User = require('src.services.user_service')

local webfinger, mt = lapis.Application:extend('api')

webfinger:get(prefix_routes:add('api', '/webfinger', function(self)
	local username = self.params.username

	if User:exists(username) then
		return mt:response_user(username)
	end

	return { status = 404 }
end))

function mt:response_user(username)
	local user = User:get_by_username(username)

	return {
		status = 200,
		json = {
			subject = 'acct:'..username..config.domain,
			aliases = {
				[1] = 'https://wildleague.org/ropoko', -- user.short_url,
				[2] = user.long_url
			},
			links = {
				[1] = {
					rel = 'http://webfinger.net/rel/profile-page',
					type = 'text/html',
					href = user.long_url
				},
				[2] = {
					rel = 'self',
					type = 'application/activity+json',
					href = user.long_url
				}
			}
		}
	}
end

return webfinger
