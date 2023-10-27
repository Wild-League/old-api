local Model = require("lapis.db.model").Model

local Waitlist = Model:extend('waitlist')

local WaitlistService = {}

--[[
	@email: string
]]
function WaitlistService:create(email)
	if not Waitlist:find({ email = email }) then
		return Waitlist:create({ email = email })
	end

	return nil
end

return WaitlistService
