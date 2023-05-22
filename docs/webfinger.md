# Webfinger Endpoint

`/.well-known/webfinger` - the default path to get the user

- Required query params: resource=acct

example of request: `/.well-known/webfinger?resource=acct:user@domain.com`

## Response for users

```json
{
	"subject": "acct:user@domain.com",
	"aliases": [
		"https://domain.com/@user",
		"https://domain.com/users/user"
	],
	"links": [
		{
			"rel": "http://webfinger.net/rel/profile-page",
			"type": "text/html",
			"href": "https://domain.com/@user"
		},
		{
			"rel": "self",
			"type": "application/activity+json",
			"href": "https://domain.com/users/user"
		}
	]
}
```

## Response for server user
Know about the server user here -> `docs/database/account`

```json
{
	"subject": "acct:user@domain.com",
	"game_server": true,
	"aliases": [
		"https://domain.com/"
	],
	"links": [
		{
			"rel": "self",
			"type": "application/activity+json",
			"href": "https://domain.com/"
		}
	],
	"details": [
		"count_users": 0,
	]
}
```
