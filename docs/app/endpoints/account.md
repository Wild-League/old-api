# Accounts API Endpoints

## Create Account

`POST /api/account`

### Request

- `username`: **Required** String. The username for the account.

- `email`: **Required** String. The email for the account.

- `password`: **Required** String. The password for the account.

- `agreement`: **Required** Boolean. If the user agrees with the server rules.

### Response

Success - 201

Error - ?

// TODO: Create list of possible errors

## Get Account

`GET /api/account`

### Response

Success - 200

```json
{
	"username": "user",
	"id": 1,
	"level": 1,
	"created_at": "2023-05-19",
	"display_name": "@user@domain"
}
```

Error - 404 - No Body
