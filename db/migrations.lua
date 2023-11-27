local schema = require('lapis.db.schema')
local types = schema.types

return {
	[1] = function()
		schema.create_table('users', {
			{ 'id', types.serial, primary_key = true },
			{ 'username', 'character varying(25) not null' }, -- https://github.com/leafo/lapis/issues/591
			{ 'display_name', 'character varying(85) not null' },
			{ 'bio', 'character varying(500)' },
			{ 'domain', 'character varying(60) not null' },
			{ 'short_url', types.varchar },
			{ 'long_url', types.varchar },
			{ 'type', types.text({ default='Person' }) },
			{ 'inbox_url', types.varchar },
			{ 'outbox_url', types.varchar },
			{ 'icon', types.varchar },
			{ 'created_at', types.date },
			{ 'level', types.numeric({ default=1 }) },
			{ 'email', 'character varying(100) not null' },
			{ 'password', 'character varying(100) not null' },
			{ 'agreement', types.boolean }
		}, { if_not_exists = true } )
	end,
	[2] = function()
		schema.create_table('rules', {
			{ 'id', types.serial, primary_key = true },
			{ 'text', types.varchar },
			{ 'created_at', types.date },
			{ 'updated_at', types.date({ null = true }) },
		}, { if_not_exists = true } )
	end,
	[3] = function()
		schema.create_table('posts', {
			{ 'id', types.serial, primary_key = true },
			{ 'uri', types.varchar },
			{ 'created_at', types.date },
			{ 'edited_at', types.date({ null = true }) },
			{ 'user_id', types.numeric },
			{ 'content', types.varchar },
			{ 'in_reply_to_post_id', types.numeric({ null = true }) },
			{ 'in_reply_to_user_id', types.numeric({ null = true }) },
		}, { if_not_exists = true } )
	end,
	[4] = function()
		schema.create_table('waitlist', {
			{ 'id', types.serial, primary_key = true },
			{ 'email', 'character varying(100) not null' }
		}, { if_not_exists = true })
	end,
	[5]	= function()
		schema.create_table('deck', {
			{ 'id', types.serial, primary_key = true },
			{ 'name', 'character varying(25) not null' },
			{ 'user_id', types.numeric },
			{ 'created_at', types.date },
			{ 'updated_at', types.date({ null = true }) },
		}, { if_not_exists = true })
	end,
	[6] = function ()
		schema.create_table('card', {
			{ 'id', types.serial, primary_key = true },
			{ 'name', 'character varying(60) not null' },
			{ 'deck_id', types.numeric },
			{ 'created_at', types.date },
			{ 'updated_at', types.date({ null = true }) },
		}, { if_not_exists = true })
	end
}
