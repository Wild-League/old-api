local lapis = require('lapis')

local home, _ = lapis.Application:extend('web')

home:get('/', function()
	return 'welcome to wild league'
end)

home:get('/ropoko', function()
	return {
		status = 200,
		json = {
			['@context'] = {
			"https://www.w3.org/ns/activitystreams",
			"https://w3id.org/security/v1"
			},
			inbox = "https://wildleague.org/@ropoko/inbox",
			following = "https://wildleague.org/users/ropoko/following",
			outbox = "https://wildleague.org/@ropoko/outbox",
			followers = "https://wildleague.org/users/ropoko/followers",
			discoverable = true,
			preferredUsername = "ropoko",
			id = "https://wildleague.org/ropoko/",
			manuallyApprovesFollowers = true,
			published = "2023-08-26",
			memorial = false,
			type = "Person",
			indexable = true,
			url = "https://wildleague.org/ropoko",
			name = "ropoko",
			followers_count = 1000,
			following_count = 1000,
			statuses_count = 1000,
		}
	}
end)

return home
