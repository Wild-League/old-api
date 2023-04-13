# Table account

Inspired by the model defined by [mastodon](https://github.com/mastodon/mastodon/blob/99e3e152cd2180cfa9a5bcafae208d44f31078f8/db/schema.rb#L143)

For most of the props here, I'm following the [spec defined by w3](https://www.w3.org/TR/activitypub/#actor-objects)

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
**Description:** The profile's display name.

**Type:** Varchar(25)

**Version history:** 0.0.1 - added

## Bio
**Description:** The profile's bio or description - stored as HTML.

**Type:** Varchar(500)

**Version history:** 0.0.1 - added

## URI
**Description:** Username + domain.

**Type:** Varchar(60)

**Version history:** 0.0.1 - added

## URL
**Description:** Location of user's profile page.

**Type:** Varchar(100)

**Version history:** 0.0.1 - added

## Type
**Description:** Define the user type of the account, can also be understood as [actor type](https://www.w3.org/TR/activitystreams-vocabulary/#actor-types).

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

**Type:** Datetime

**Version history:** 0.0.1 - added
