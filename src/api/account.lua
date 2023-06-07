local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local AccountService = require('src.services.account_service')

local account, _ = lapis.Application:extend('api')

--[[
	create an account
]]
account:post(prefix_route:add('api', '/account', function(self)
	local req = self.params

	if not req.agreement then
		-- TODO: create function to generate this table
		return { status = 422, json = { details = { agreement = { description = 'Must be accepted.' } } } }
	end

	-- TODO: check params
	local user = AccountService:create(req)

	if user then
		return { status = 201 }
	else
		return user
	end
end))

--[[
	get the account by id

	example: url:/account/1
]]
account:get(prefix_route:add('api', '/account/:id', function(self)
	local acct = AccountService:get_by_id(self.params.id)

	if not acct then
		return {
			status = 404
		}
	end

	return {
		status = 200,
		json = {
			id = acct.id,
			username = acct.username,
			display_name = acct.display_name,
			level = acct.level,
			created_at = acct.created_at,
			bio = acct.bio
		}
	}
end))

return account
