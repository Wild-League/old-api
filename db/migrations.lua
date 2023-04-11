local schema = require('lapis.db.schema')

local types = schema.types

return {
	[1] = function()
		schema.create_table('account', {
			{ 'id', types.serial, primary_key = true },
			{ 'username', 'character varying(20)' }, -- https://github.com/leafo/lapis/issues/591
			{ 'type', 'character varying(20)' },
			{ 'url', types.varchar },
			{ 'inbox_url', types.varchar },
			{ 'outbox_url', types.varchar },
			{ 'display_name', 'character varying(20)' },
			{ 'icon', types.varchar }
		})
	end
}
