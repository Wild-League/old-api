local lapis = require('lapis')

local api = require('src.api.api')
local well_known = require('src.well_known.well_known')

local app = lapis.Application()
app:enable("etlua")
app.views_prefix = 'static.views'


app:include(api, { name='api' })
app:include(well_known, { name='well_known' })

return app
