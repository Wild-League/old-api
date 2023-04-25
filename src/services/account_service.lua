local Model = require("lapis.db.model").Model
local config = require("lapis.config").get()

local Account = Model:extend('account')

--[[
	Service that does all things related to the account table.
]]
local AccountService = {}

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
	create the user and return success or failure
]]
function AccountService:create(acct)
	Account:create({
		username = acct.username,
		display_name = acct.username,
		email = acct.email,
		password = acct.password,
		agreement = acct.agreement,
		domain = config.domain,
		url = config.url .. '@' .. acct.username,
		inbox_url = config.url .. '@' .. acct.username .. '/inbox',
		outbox_url = config.url .. '@' .. acct.username .. '/outbox',
		created_at = os.date(),
		icon = 'static/default-user.png'
	})
end

return AccountService
