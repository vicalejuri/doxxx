Schemas.Channel = new SimpleSchema
    name:
        type:   String,
        label:  "Name",
        max:    1024

    slug:
        type:   String,
        label:  "slug",
        max:    30

    admin:
        type:   String,
        label:  "Admin"

    summary:
        type:   String,
        label:  "All POSTS",
        optional: true


Models.Channels    = new Meteor.Collection "channels"

Models.Channels.attachSchema(Schemas.Channel)

Models.Channels.allow 
    insert: (userId, channel) ->
        return true
