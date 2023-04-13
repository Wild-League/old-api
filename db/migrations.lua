local schema = require('lapis.db.schema')

local types = schema.types

return {
	[1] = function()
		schema.create_table('account', {
			{ 'id', types.serial, primary_key = true },
			{ 'username', 'character varying(20)' }, -- https://github.com/leafo/lapis/issues/591
			{ 'display_name', 'character varying(20)' },
			{ 'bio', 'character varying(500)' },
			{ 'uri', types.varchar },
			{ 'url', types.varchar },
			{ 'type', types.text({ default='Person' }) },
			{ 'inbox_url', types.varchar },
			{ 'outbox_url', types.varchar },
			{ 'icon', types.varchar },
			{ 'created_at', types.date }
		})
	end
}
