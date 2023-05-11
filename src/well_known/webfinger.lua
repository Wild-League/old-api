local lapis = require('lapis')
local util = require('lapis.util')
local config = require("lapis.config").get()
local prefix_routes = require('src.prefix_routes')

local Account = require('src.services.account_service')

local webfinger, mt = lapis.Application:extend('well_known')

--[[
	Check if the username is the same as the server
	Since webfinger always require 'acct', and to keep
	compatibility, we need to create special user with the username that is the same
	as the domain.

	So, if the domain is: 'wildleague.org' the special username is 'wildleague.org'

	This is thought to the initial contact with the server, to know if the instance
	is a game instance or not.
]]
local function is_server_equal_user(username)
	-- remove the '@'
	local domain = string.match(config.domain, '.*', 2)

	return username == domain
end

webfinger:get(prefix_routes:add('well_known', '', function(self)
	local resource = util.unescape(self.req.parsed_url.query)

	if not resource then
		return { status = 400, message = "missing parameter 'resource'" }
	end

	resource = string.gsub(resource, 'resource=', '')

	-- check if the param 'acct' exists
	local acct = string.match(resource, '^acct:')

	if acct then
		-- 6, because I know that the ':' is at 5
		-- %w == \w
		local username = string.match(resource, '^%w*', 6)

		if Account:exists(username) then
			if is_server_equal_user(username) then
				return mt:response_server(resource)
			else
				return mt:response_user(resource, username)
			end
		end

		return { status = 404 }
	end

	return { status = 400, json = { message = "missing 'acct'" } }
end))

function mt:response_server(account)
	return {
		status = 200,
		json = {
			subject = account,
			aliases = {
				[1] = config.url
			},
			links = {
				rel = 'self',
				type = 'application/activity+json',
				href = config.url
			},
			details = {
				count_users = 0 -- TODO: create view 'Instance' to gather info related to the instance itself
			}
		}
	}
end

function mt:response_user(account, username)
	local user = Account:get_by_username(username)

	return {
		status = 200,
		json = {
			subject = account,
			aliases = {
				[1] = user.short_url,
				[2] = user.long_url
			},
			links = {
				[1] = {
					rel = 'http://webfinger.net/rel/profile-page',
					type = 'text/html',
					href = user.short_url
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
