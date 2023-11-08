local lapis = require('lapis')

-- local web = require('src.web.web')
local api = require('src.api.api')
local well_known = require('src.well_known.well_known')

local app = lapis.Application()

-- local EmailService = require('src.services.email_service')

-- app.views_prefix = 'src.web.views'
-- app:include(web, { name='web' })

-- EmailService:send()

app:include(api, { name='api' })
app:include(well_known, { name='well_known' })

return app
