local lapis = require('lapis')
local prefix_route = require('src.prefix_routes')

local AccountService = require('src.services.account_service')

local auth, _ = lapis.Application:extend('api')

-- TODO: implement OAuth

auth:post(prefix_route:add('api', '/auth/login', function(self)
	local req = self.params

	if not req.username or not req.password then
		return { status = 400, json = {
			message = "Missing 'username' or 'password'"
		}}
	end

	local user = AccountService:exists(req.username)

	if user then
		-- TODO: should I return status codes from the service?
		-- probably not
		return AccountService:check_credentials(req)
	else
		return { status = 404, json = { message = 'User not found.' }}
	end
end))

return auth
