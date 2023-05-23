local config = require("lapis.config")

config("development", {
	-- session
	secret = 'mysecret123123',
	session_name = 'wildleague_session',

	-- jwt
	default_salt_password = 15,

  server = "nginx",
  code_cache = "off",
  num_workers = "1",
	port = 9090,
	postgres = {
		host = '127.0.0.1',
		user = 'wild-league',
		password = '123',
		database = 'wild-league'
	},

	url = 'http://localhost:9090/', -- https://wildleague.org
	domain = '@wildleague.org'
})
