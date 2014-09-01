ChannelModel = new Meteor.Collection "channels",
    schema:
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
            label:  "Summary",
            optional: true



PostModel = new Meteor.Collection "posts",
    schema:
        channel:
            type:  String
            label: "Channel"

        original_url:
            type: String,
            regEx: SimpleSchema.RegEx.Url,
            label: "Original URL"

        title:
            type: String,
            label: "Title"

        summary:
            type: String,
            label: "Summary",
            optional: true

        thumb:
            type: String,
            label: "Thumbnail"
            optional: true

        oembed:
            type: Object
            optional: true

