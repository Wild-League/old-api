local https = require('ssl.https')
local ltn12 = require('ltn12')
local json = require('lib.json')

local EmailService = {
	api_token = 'd0129e2f-5675-4b3a-997d-a7df0d802a61'
}

function EmailService:send()
	print('sending ... ')

	local response = {}

	local body = json.encode({
		['From'] = 'contact@wildleague.org',
		['To'] = 'contact@wildleague.org',
		['Subject'] = 'Hello world!',
		['TextBody'] = 'Hello World Email Test'
	})

	local headers = {
		['X-Postmark-Server-Token'] = self.api_token,
		['Content-Type'] = 'application/json',
		['Accept'] = 'application/json',
		["Content-Length"] = string.len(body)
	}

	https.request({
		url = 'https://api.postmarkapp.com/email',
		source = ltn12.source.string(body),
		sink = ltn12.sink.table(response),
		method = 'POST',
		headers = headers
	})
end

return EmailService