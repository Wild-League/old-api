local lapis = require('lapis')
local db = require('lapis.db')

local app = lapis.Application()

app:get('/', function()
	local res = table.unpack(db.query('SELECT username FROM account where username = ?', 'ropoko'))

	-- TODO: should I use this as implementation for ternary operator?
	local username = (function() if res ~= nil then return res.username else return 'anonymous' end end)()

  return 'Welcome to Lapis: '..username
end)

app:get('/test', function()
	return { json = {logged = true} }
end)

return app
