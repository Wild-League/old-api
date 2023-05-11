local lapis = require('lapis')

local web = require('src.web.web')
local api = require('src.api.api')
local well_known = require('src.well_known.well_known')

local app = lapis.Application()

app.views_prefix = 'src.web.views'

app:include(web, { name='web' })
app:include(api, { name='api' })
app:include(well_known, { name='well_known' })

return app
