local lapis = require('lapis')

local web = require('src.web.web')
local api = require('src.api.api')

local app = lapis.Application()

app.views_prefix = 'src.web.views'

app:include(web, { name='web' })
app:include(api, { name='api' })

return app
