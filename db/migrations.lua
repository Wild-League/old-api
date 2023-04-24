local schema = require('lapis.db.schema')

local types = schema.types

return {
	[1] = function()
		schema.create_table('account', {
			{ 'id', types.serial, primary_key = true },
			{ 'username', 'character varying(25)' }, -- https://github.com/leafo/lapis/issues/591
			{ 'display_name', 'character varying(85)' },
			{ 'bio', 'character varying(500)' },
			{ 'domain', 'character varying(60)' },
			{ 'url', types.varchar },
			{ 'type', types.text({ default='Person' }) },
			{ 'inbox_url', types.varchar },
			{ 'outbox_url', types.varchar },
			{ 'icon', types.varchar },
			{ 'created_at', types.date },
			{ 'level', types.numeric({ default=1 }) }
		})
	end
}
