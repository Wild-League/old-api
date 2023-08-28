local bcrypt = require('bcrypt')
local Model = require("lapis.db.model").Model
local config = require("lapis.config").get()

local JWTService = require('src.services.jwt_service')

local User = Model:extend('users')

--[[
	Service that does all things related to the users table.
]]
local UserService = {}

--[[
 TODO: write documentation
 - How to add 'exists' function to all entities?
]]
function UserService:exists(username)
	if User:find({ username = username }) then
		return true
	else
		return false
	end
end

--[[
	returns the user by id
]]
function UserService:get_by_id(id)
	return User:find(id)
end

--[[
	Returns the user by email
]]
function UserService:get_by_email(email)
	return User:find({ email = email })
end

--[[
	Returns the user by username
]]
function UserService:get_by_username(username)
	return User:find({ username = username })
end

--[[
	TODO: add docs
]]
local function hash_password(password)
	return bcrypt.digest(password, config.default_salt_password)
end

--[[
	TODO: move this to AuthService.

	Compare the request with the user on database
]]
function UserService:check_credentials(req)
	local acct = self:get_by_username(req.username)

	if acct.username == req.username and assert(bcrypt.verify(req.password, acct.password)) then
		local token = JWTService:encode(acct)
		return { status = 200, json = { access_token = token }}
	else
		return {
			status = 401,
			json = {
				message = 'Wrong username or password'
			}
		}
	end
end

--[[
	Generate url for users (short and long version), and for inbox and outbox.

	if user_short, returns -> http://domain_url.com/@username

	if user_long, returns -> http://domain_url.com/users/username

	for inbox and outbox always return in the short version.
]]
local function create_url(type, username)
	local urls = {
		user_short = function()
			return config.url .. '@' .. username
		end,
		user_long = function()
			return config.url .. 'users/' .. username
		end,
		inbox = function()
			return config.url .. '@' .. username .. '/inbox'
		end,
		outbox = function()
			return config.url .. '@' .. username .. '/outbox'
		end
	}

	return urls[type]()
end

--[[
	hash the password received and compare to the password on db.

	@params:
	- password: the user password

	@returns:
	- True if passwords are equal, otherwise False
]]
function UserService:compare_hash_password(password)
	return hash_password(password) == true
end

--[[
	create the user

	@return:
	- success: return the user itself
	- failure:
		- return nil if the user could not be created
		- return a table with status_code 400 and a message
]]
function UserService:create(acct)
	if self:exists(acct.username) then
		return {
			status = 400,
			json = { message = 'Username already in use' }
		}
	end

	if not self:is_user_type_valid(acct.type) then
		return {
			status = 400,
			json = { message =  "Field 'type' is not valid." }
		}
	end

	return User:create({
		username = acct.username,
		display_name = '@' .. acct.username .. config.domain,
		email = acct.email,
		type = acct.type,
		password = hash_password(acct.password),
		agreement = acct.agreement,
		domain = config.domain,
		short_url = create_url('user_short', acct.username),
		long_url = create_url('user_long', acct.username),
		inbox_url = create_url('inbox', acct.username),
		outbox_url = create_url('outbox', acct.username),
		created_at = os.date(),
		icon = 'static/default-user.png'
	})
end

--[[
	Check if the user type is valid following the AP actor types,
	if type is nil, then it will receive value 'Person'.
	https://www.w3.org/TR/activitystreams-vocabulary/#actor-types
]]
function UserService:is_user_type_valid(type)
	if type == nil then
		type = 'person'
	end

	local valid_types = {
		'person',
		'application',
		'group' -- TODO: implement guilds | not implemented yet
	}

	for _,t in pairs(valid_types) do
		if t == string.lower(type) then
			return true
		end
	end

	return false
end

--[[
	Return the number of users
]]
function UserService:count()
	return User:count()
end

return UserService
