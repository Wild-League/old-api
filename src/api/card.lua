local lapis = require('lapis')
local config = require('lapis.config').get()
local prefix_route = require('src.prefix_routes')
local json_params = require("lapis.application").json_params

local https = require('ssl.https')
local ltn12 = require('ltn12')
local json = require('lib.json')

local card, _ = lapis.Application:extend('api')

card:get(prefix_route:add('api', '/card/images', json_params(function()
	local response = {}

	local body = json.encode({
		accessKey = config.minio.user,
		secretKey = config.minio.password,
	})

	https.request({
		url = config.minio.url .. '/cards',
		source = ltn12.source.string(body),
		sink = ltn12.sink.table(response),
		method = 'POST'
	})

	for key, value in pairs(response) do
		print(key, value)
	end

	return 'hello cards'
end)))
