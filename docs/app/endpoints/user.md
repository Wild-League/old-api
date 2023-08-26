# Users API Endpoints

## Create User

`POST /api/user`

### Request

- `username`: **Required** String. The username for the user.

- `email`: **Required** String. The email for the user.

- `password`: **Required** String. The password for the user.

- `agreement`: **Required** Boolean. If the user agrees with the server rules.

### Response

Success - 201

Error - ?

// TODO: Create list of possible errors

## Get User

`GET /api/user`

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
