local lapis = require('lapis')
local json_params = require("lapis.application").json_params
local prefix_route = require('src.prefix_routes')
local UserService = require('src.services.user_service')
local JWTService = require('src.services.jwt_service')

local user, _ = lapis.Application:extend('api')

--[[
	create an user
]]
user:post(prefix_route:add('api', '/user', function(self)
	local req = self.params

	if not req.agreement then
		-- TODO: create function to generate this table
		return { status = 422, json = { details = { agreement = { description = 'Must be accepted.' } } } }
	end

	-- TODO: check params
	local new_user = UserService:create(req)

	return new_user
	-- if new_user.status == then
	-- 	return { status = 201 }
	-- else
	-- 	return new_user
	-- end
end))

--[[
	get the user by id
]]
user:get(prefix_route:add('api', '/user/:id', function(self)
	local acct = UserService:get_by_id(self.params.id)

	-- TODO: need to validate access_token
	-- if not req.access_token then
	-- 	return { status = 401, json = { message = 'Missing access_token.' } }
	-- end

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

user:get(prefix_route:add('api', '/user/current', json_params(function(self)
	local token = self.req.headers['authorization']

	if not token then
			return { status = 401, json = { message = 'Missing access_token.' } }
	end

	local decoded_token, err = JWTService:decode(token)

	if err then
			return { status = 401, json = { message = 'Invalid access_token.' } }
	end

	local acct = UserService:get_by_id(decoded_token.id)
	if not acct then
			return { status = 404 }
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
end)))

return user
