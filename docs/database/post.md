# Table Posts

Represent a post posted by an account.

- Example of Announce: https://indieweb.social/users/ropoko/statuses/110232185728501358/activity

- Example of Post: https://indieweb.social/users/ropoko/statuses/110181196244280203/activity

# Fields

## Id
**Description:** Post id.

**Type:** Int - AutoIncrement

**Version history:** 0.0.1 - added

## URI
**Description:** Uri of the post used for federation.

**Type:** String

**Version history:** 0.0.1 - added

## Created_at
**Description:** The date the post was created.

**Type:** Date

**Version history:** 0.0.1 - added

## Edited_at
**Description:** The date the post was edited.

**Type:** Date

**Version history:** 0.0.1 - added

## Account Id
**Description:** The id of the account that created the post.

**Type:** Int - (Foreign Key Accounts)

**Version history:** 0.0.1 - added

## Content
**Description:** Text content of the post.

**Type:** String

**Version history:** 0.0.1 - added

## In_reply_to_post_id
**Description:** Id of the post being replied to.

**Type:** Int - (Foreign Key Post)

**Version history:** 0.0.1 - added

## In_reply_to_account_id
**Description:** Id of the account that authored the reply.

**Type:** Int - (Foreign Key Accounts)

**Version history:** 0.0.1 - added
