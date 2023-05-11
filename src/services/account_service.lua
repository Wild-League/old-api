local Model = require("lapis.db.model").Model
local config = require("lapis.config").get()

local Account = Model:extend('accounts')

--[[
	Service that does all things related to the account table.
]]
local AccountService = {}

function AccountService:exists(username)
	if Account:find({ username = username }) then
		return true
	else
		return false
	end
end

--[[
	returns the user by id
]]
function AccountService:get_by_id(id)
	return Account:find(id)
end

--[[
	Returns the user by email
]]
function AccountService:get_by_email(email)
	return Account:find({ email = email })
end

--[[
	Returns the user by username
]]
function AccountService:get_by_username(username)
	return Account:find({ username = username })
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
	create the user and return success or failure
]]
function AccountService:create(acct)
	Account:create({
		username = acct.username,
		display_name = '@' .. acct.username .. config.domain,
		email = acct.email,
		-- TODO: cryptography password
		password = acct.password,
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

return AccountService
