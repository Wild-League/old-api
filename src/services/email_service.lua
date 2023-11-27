local https = require('ssl.https')
local ltn12 = require('ltn12')
local json = require('lib.json')
local get_email = require('src.handle_html')

local EmailService = {
	api_token = 'bf8d5397-c6ee-49e2-b4bf-9076d1cb3fd8'-- 'd0129e2f-5675-4b3a-997d-a7df0d802a61'
}

function EmailService:welcome()
	local response = {}

	local body = json.encode({
		['From'] = 'contact@wildleague.org',
		['To'] = 'rodrigostramantinoli@gmail.com',
		['Subject'] = 'Welcome to Wild League!',
		['HtmlBody'] = get_email('welcome')
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
