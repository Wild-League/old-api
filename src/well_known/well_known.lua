local lapis = require('lapis')
local webfinger = require('src.well_known.webfinger')

local well_known = lapis.Application()

well_known:include(webfinger)

return well_known
