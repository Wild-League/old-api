local lapis = require('lapis')
local db = require('lapis.db')

local app = lapis.Application()

app:get('/', function()
	-- local res = table.unpack(db.query('SELECT username FROM account where username = ?', 'ropoko'))

	-- local username = (function() if res ~= nil then return res.username else return 'anonymous' end end)()

  return 'Welcome to Lapis: '..'username'
end)

return app
