local https = require('ssl.https')
local ltn12 = require('ltn12')

local EmailService = {
	api_token = 're_ZuiG4zyx_8V2oNJWJWWBG7XNXUhGS8BJn'
}

function EmailService:send()
	print('sending ... ')

	local response = {}

	https.request({
		url = 'https://httpbin.org/get',
		sink = ltn12.sink.table(response),
		method = 'GET'
	})

	for key, value in pairs(response) do
		print(key, value)
	end
end

return EmailService
