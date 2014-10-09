###

,---.     |
`---.,---.|---.,---.,-.-.,---.,---.
    ||    |   ||---'| | |,---|`---.
`---'`---'`   '`---'` ' '`---^`---'

###

@Schemas = {}
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
        label:  "Summary",
        optional: true



Schemas.Post = new SimpleSchema
    createdAt: SchemasField.createdAt
    updatedAt: SchemasField.updatedAt

    channel:
        type:  String,
        label: "Channel",
        index: true

    type:
        type: String,
        label: "Type",
        allowedValues: ['video','rich','photo','link'],
        autoValue: (doc) ->
            "video"

    url: 
        type: String,
        regEx: SimpleSchema.RegEx.Url,
        label: "URL"
        index: true

    title:
        type: String,
        label: "Title"
        index: true

    description:
        type: String,
        label: "Description",
        optional: true
        autoform: {
            rows: 5 
        }

    tags:
        type: [String]
        label: "Comma separated tags",
        optional: true

    keywords:
        type: [Object]
        label: "Keywords"
        optional: true

    images:
        type: [Object],
        label: "Thumbnails",
        optional: false

    "images.$.thumbnail_width":
        type: Number,
        optional: false

    "images.$.thumbnail_height":
        type: Number,
        optional: false

    "images.$.thumbnail_url":
        type: SimpleSchema.RegEx.Url,
        optional: false

    media:
        type: [Object],
        label: "Media",
        optional: false

    "media.$.html":
        type: String,
        optional: false

    "media.$.url":
        type: String,
        optional: false

    "media.$.width":
        type: String,
        optional: true

    "media.$.height":
        type: String,
        optional: true


Schemas.UploadPost = new SimpleSchema
    channel:
        type:  String,
        label: "Channel",
        index: true

    url: 
        type: String,
        regEx: SimpleSchema.RegEx.Url,
        label: "URL"
        index: true

    title:
        type: String,
        label: "Title"
        index: true

    description:
        type: String,
        label: "Description",
        optional: true
        autoform: {
            rows: 5 
        }

    tags:
        type: [String]
        label: "Comma separated tags",
        optional: true
