local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local AccountService = require('src.services.account_service')

local account, _ = lapis.Application:extend('api')

account:post(prefix_route:add('api', '/account', function(self)
	local req = self.params

	if not req.agreement then
		-- TODO: create function to generate this table
		return { status = 422, json = { details = { agreement = { description = 'Must be accepted.' } } } }
	end

	-- TODO: check params
	AccountService:create(req)

	return { status = 201 }
end))

account:get(prefix_route:add('api', '/account/:id', function(self)
	local acct = AccountService:get_by_id(self.params.id)

	return {
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
