# Wild League Fediverse

# Project

## UDP Server
Moved to another [repo](https://github.com/Wild-League/udp-server).

## HTTP Server
using lapis, used to implement activityPub and take care of things that are related to the user and server.

```bash
lapis serve
```

# Running migrations
`$ lapis migrate --migrations-module ./db/migrations`

# ActivityPub Implementation
Implementation based in [w3](https://www.w3.org/TR/activitystreams-vocabulary/).

- [ ] Activities
  - [ ] Accept
  - [ ] Reject
  - [ ] Add -> not sure how this can be implemented
  - [ ] Remove
  - [ ] Create
  - [ ] Delete
  - [ ] Update
  - [ ] Read
  - [ ] Announce
  - [ ] Follow
  - [ ] Join
  - [ ] Like
  - [ ] Undo
  - [ ] Block
  - [ ] Flag
  - [ ] Question
- [ ] Actors
  - [ ] Group
  - [ ] Person
- [ ] Object
  - [ ] Relationship
  - [ ] Image
  - [ ] Video -> not sure about this
  - [ ] Note - Post
  - [ ] Article (maybe)
  - [ ] Event
  - [ ] Place -> not sure about this
  - [ ] Mention
  - [ ] Profile
  - [ ] Tombstone
