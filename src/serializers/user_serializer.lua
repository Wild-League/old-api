local UserSerializer = {}

-- Return the json format for an actor of type Person
function UserSerializer:serializer(user)
	return {
		status = 200,
		json = {
			['@context'] = {
				'https://www.w3.org/ns/activitystreams',
				'https://w3id.org/security/v1'
			},
			id = user.long_url,
			type = user.type,
			following = user.long_url .. '/following',
			followers = user.long_url .. '/followers',
			inbox = user.inbox_url,
			outbox = user.outbox_url,
			preferredUsername = user.username,
			name = user.username,
			summary = user.bio,
			url = user.short_url,
			manuallyApprovesFollowers = true, -- TODO: add this column
			discoverable = false, -- TODO: what is this for?
			indexable = false, -- TODO: what is this for?
			published = user.created_at,
			memorial = false -- TODO: add column and implement
		}
	}
end

return UserSerializer
