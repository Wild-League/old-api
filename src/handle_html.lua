local etlua = require('lapis.etlua')
local config = require('lapis.config').get()

-- will search from the `/static/views` directory
local function html_to_string(filename)
	local file = io.open('static/views/' .. filename..'.etlua', 'r')

	if file then
		local content = file:read('*a')
		file:close()
		return content
	end

	return nil
end

local function get_email(filename)
	local widget = etlua.EtluaWidget:load(html_to_string(filename))

	local template = widget({
		logo = config.url..'/static/logo.png',
		twitter = config.url..'/static/x.png',
		linkedin = config.url..'/static/linkedin.png'
	})
	return template:render_to_string()
end

return get_email
