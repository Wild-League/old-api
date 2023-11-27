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
		user = 'postgres',
		password = '123',
		database = 'wild_league_dev'
	},

	minio = {
		user = 'ropoko',
		password = 'FWbkHQwWPvePOGT',
		url = 'localhost:9001',
	},

	url = 'http://localhost:9090/',
	domain = '@wildleague.org'
})

config("staging", {
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
		host = 'wildleague-db.flycast',
		user = 'postgres',
		password = 'FWbkHQwWPvePOGT',
		database = 'wildleague'
	},

	minio = {
		user = 'ropoko',
		password = 'FWbkHQwWPvePOGT',
		url = '[wild-minio.internal]:9001',
	},

	url = 'https://api.wildleague.org/',
	domain = '@wildleague.org'
})

config("production", {
	-- session
	secret = 'mysecret123123',
	session_name = 'wildleague_session',

	-- jwt
	default_salt_password = 15,

  server = "nginx",
  code_cache = "on",
  num_workers = "1",
	port = 9090,
	postgres = {
		host = '[2a09:8280:1::42:617f]',
		port = '5432',
		user = 'postgres',
		password = 'FWbkHQwWPvePOGT',
		database = 'wildleague'
	},

	minio = {
		user = 'ropoko',
		password = 'FWbkHQwWPvePOGT',
		url = '[wild-minio.internal]:9001',
	},

	url = 'https://api.wildleague.org/',
	domain = '@wildleague.org'
})
