# Webfinger Endpoint

`/.well-known/webfinger` - the default path to get the user

- Required query params: resource=acct

## User Response
`/.well-known/webfinger?resource=acct:user@domain.com`

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

## Nodeinfo Response
`/.well-known/webfinger/nodeinfo`

```json
{
	"links": [
		{
			"rel": "http://nodeinfo.diaspora.software/ns/schema/2.1",
			"href": "http://localhost:9090/api/nodeinfo"
		}
	]
}
```
