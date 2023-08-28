# Serializer

Transform objects to the equivalent objects in ActivityPub

- Post - [Note](https://www.w3.org/TR/activitystreams-vocabulary/#dfn-note)
- User - [Actor](https://www.w3.org/TR/activitystreams-vocabulary/#dfn-person)

{
	"@context": [
		"https://www.w3.org/ns/activitystreams",
		"https://w3id.org/security/v1",
		{
			"manuallyApprovesFollowers": "as:manuallyApprovesFollowers",
			"toot": "http://joinmastodon.org/ns#",
			"featured": {
				"@id": "toot:featured",
				"@type": "@id"
			},
			"featuredTags": {
				"@id": "toot:featuredTags",
				"@type": "@id"
			},
			"alsoKnownAs": {
				"@id": "as:alsoKnownAs",
				"@type": "@id"
			},
			"movedTo": {
				"@id": "as:movedTo",
				"@type": "@id"
			},
			"schema": "http://schema.org#",
			"PropertyValue": "schema:PropertyValue",
			"value": "schema:value",
			"discoverable": "toot:discoverable",
			"Device": "toot:Device",
			"Ed25519Signature": "toot:Ed25519Signature",
			"Ed25519Key": "toot:Ed25519Key",
			"Curve25519Key": "toot:Curve25519Key",
			"EncryptedMessage": "toot:EncryptedMessage",
			"publicKeyBase64": "toot:publicKeyBase64",
			"deviceId": "toot:deviceId",
			"claim": {
				"@type": "@id",
				"@id": "toot:claim"
			},
			"fingerprintKey": {
				"@type": "@id",
				"@id": "toot:fingerprintKey"
			},
			"identityKey": {
				"@type": "@id",
				"@id": "toot:identityKey"
			},
			"devices": {
				"@type": "@id",
				"@id": "toot:devices"
			},
			"messageFranking": "toot:messageFranking",
			"messageType": "toot:messageType",
			"cipherText": "toot:cipherText",
			"suspended": "toot:suspended",
			"memorial": "toot:memorial",
			"indexable": "toot:indexable"
		}
	],
	"id": "https://mastodon.social/users/ropoko",
	"type": "Person",
	"following": "https://mastodon.social/users/ropoko/following",
	"followers": "https://mastodon.social/users/ropoko/followers",
	"inbox": "https://mastodon.social/users/ropoko/inbox",
	"outbox": "https://mastodon.social/users/ropoko/outbox",
	"featured": "https://mastodon.social/users/ropoko/collections/featured",
	"featuredTags": "https://mastodon.social/users/ropoko/collections/tags",
	"preferredUsername": "ropoko",
	"name": "ropoko",
	"summary": "",
	"url": "https://mastodon.social/@ropoko",
	"manuallyApprovesFollowers": false,
	"discoverable": false,
	"indexable": false,
	"published": "2023-05-23T00:00:00Z",
	"memorial": false,
	"devices": "https://mastodon.social/users/ropoko/collections/devices",
	"publicKey": {
		"id": "https://mastodon.social/users/ropoko#main-key",
		"owner": "https://mastodon.social/users/ropoko",
		"publicKeyPem": "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA2QkK11xUEd+NgBg2Hvep\nhk19/uKmrhaaruwmfYeNWG0LeVY3KXuhpROZjVr4O7EzveZloXYmVMIKnsl64mgP\nL4Iacg4z0WX9UnzH2jFFTt9WCty6b911iVaFtHbFdA4L9hdp5/U/pAP6BGYaDG9h\nc1nHMa2jZ/4doH6MCHeTEgb2Lb4Y5ZXHqrUfSlFRgDDqYqP58FnLGXblgZOHNU35\nk4GTvmGxKX0h3MsG1+p2GFwM73v+d/E2poswy2MVTCt+61Z816bjvU0ehbE5bBH+\nNORsSedN0vZ/5yejL+Lklr1z+sQApNvMYQzg8m1VddbZf9gFxiVbSkRX3Y1WyyFD\nJQIDAQAB\n-----END PUBLIC KEY-----\n"
	},
	"tag": [],
	"attachment": [],
	"endpoints": {
		"sharedInbox": "https://mastodon.social/inbox"
	}
}
