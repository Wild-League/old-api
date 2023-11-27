local https = require('ssl.https')
local ltn12 = require('ltn12')
local json = require('lib.json')
local config = require('lapis.config').get()
local get_email = require('src.handle_html')

local EmailService = {}

function EmailService:welcome()
	local response = {}

	local body = json.encode({
		['From'] = 'contact@wildleague.org',
		['To'] = 'rodrigostramantinoli@gmail.com',
		['Subject'] = 'Welcome to Wild League!',
		['HtmlBody'] = get_email('welcome')
	})

	local headers = {
		['X-Postmark-Server-Token'] = config.postmark_token,
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
