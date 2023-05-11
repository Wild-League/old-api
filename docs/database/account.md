# Table account

Inspired by the model defined by [mastodon](https://github.com/mastodon/mastodon/blob/99e3e152cd2180cfa9a5bcafae208d44f31078f8/db/schema.rb#L143)

For most of the props here, I'm following the [spec defined by w3](https://www.w3.org/TR/activitypub/#actor-objects)

# Server user
That's a special user that need to be created, mainly to get info about the server itself.

Since webfinger always require 'acct' on requests and also to keep compatibility, you need to create a user that has the same as the domain.

Example:

Domain: `@wildleague.org` -> User: `wildleague.org`

Just to keep it simple, it's recommended to create this user first.

The type of this user will be 'Application', following [w3](https://www.w3.org/TR/activitystreams-vocabulary/#actor-types).

# Fields

## Id
**Description:** Account id.

**Type:** Int - AutoIncrement

**Version history:** 0.0.1 - added

## Username
**Description:** Username, not including the domain.

**Type:** Varchar(25)

**Version history:** 0.0.1 - added

## Display_name
**Description:** The profile's display name (Username + domain).

**Type:** Varchar(25)

**Version history:** 0.0.1 - added

## Bio
**Description:** The profile's bio or description - stored as HTML.

**Type:** Varchar(500)

**Version history:** 0.0.1 - added

## Domain
**Description:** The domain of the current server.

**Type:** Varchar(60)

**Version history:** 0.0.1 - added

## Short_URL
**Description:** Short location of user's profile page "https://wildleague.org/@ropoko".

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Long_URL
**Description:** Long location of user's profile page "https://wildleague.org/users/ropoko".

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Type
**Description:** Define the user type of the account, can also be understood as [actor type](https://www.w3.org/TR/activitystreams-vocabulary/#actor-types).

**Default:** Person

**Type:** Varchar(20)

**Version history:** 0.0.1 - added

## Inbox_URL
**Description:** Location of user's inbox.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Outbox_URL
**Description:** Location of user's outbox.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Icon (URL)
**Description:** An image icon shows in the user profile.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Created_at
**Description:** When the account was created.

**Type:** Date

**Version history:** 0.0.1 - added

## Level
**Description:** The user level.

**Default:** 1

**Type:** Int

**Version history:** 0.0.1 - added

## Email
**Description:** The email used for login.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Password
**Description:** The password used for login.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Agreement
**Description:** If the users agrees with the server rules.

**Type:** Boolean

**Version history:** 0.0.1 - added
