local https = require('ssl.https')
local ltn12 = require('ltn12')
local json = require('lib.json')

local InstanceService = {}

--[[
	validate a given instance
	for now, it only checks the nodeinfo file at `url/nodeinfo`
	and see if the software is `Wild League`

	@param: url -> string
	@returns: whether is a valid or not -> boolean
]]
function InstanceService:validate(url)
	local response = {}
	local body = ''

	local headers = {
		['Accept'] = 'application/json'
	}

	-- TODO: check the actual nodeinfo file
	-- some instances like mastodon.social
	-- uses /nodeinfo/2.0 instead
	local _, code = https.request({
		url = url .. '/nodeinfo',
		sink = ltn12.sink.table(response),
		method = 'GET',
		headers = headers
	})

	if code ~= 200 then
		return false
	end

	for _, v in ipairs(response) do
		body = body .. v
	end

	local nodeinfo = json.decode(body)

	if nodeinfo.software.name == 'Wild League' then
		return true
	end

	return false
end

return InstanceService
