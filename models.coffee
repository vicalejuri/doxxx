DoxxChannel = new Meteor.Collection "doxx_channel",
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



DoxxVideo = new Meteor.Collection "doxx_videos",
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
