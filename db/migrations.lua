local schema = require('lapis.db.schema')

local types = schema.types

return {
	[1] = function()
		schema.create_table('accounts', {
			{ 'id', types.serial, primary_key = true },
			{ 'username', 'character varying(25)' }, -- https://github.com/leafo/lapis/issues/591
			{ 'display_name', 'character varying(85)' },
			{ 'bio', 'character varying(500)' },
			{ 'domain', 'character varying(60)' },
			{ 'short_url', types.varchar },
			{ 'long_url', types.varchar },
			{ 'type', types.text({ default='Person' }) },
			{ 'inbox_url', types.varchar },
			{ 'outbox_url', types.varchar },
			{ 'icon', types.varchar },
			{ 'created_at', types.date },
			{ 'level', types.numeric({ default=1 }) },
			{ 'email', 'character varying(100)' },
			{ 'password', 'character varying(100)' },
			{ 'agreement', types.boolean }
		})
	end,
	[2] = function()
		schema.create_table('rules', {
			{ 'id', types.serial, primary_key = true },
			{ 'text', types.varchar },
			{ 'created_at', types.date },
			{ 'updated_at', types.date({ null = true }) },
		})
	end,
}
