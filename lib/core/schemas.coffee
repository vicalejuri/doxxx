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
    channel:
        type:  String,
        label: "Channel"

    url: 
        type: String,
        regEx: SimpleSchema.RegEx.Url,
        label: "Original URL"
        index: true

    original_url:
        type: String,
        regEx: SimpleSchema.RegEx.Url,
        label: "Original URL"

    title:
        type: String,
        label: "Title"
        index: true

    description:
        type: String,
        label: "Description",
        optional: true

    authors:
        type: [Object]
        label: "Authors"
        optional: true

    keywords:
        type: [Object]
        label: "Keywords"
        optional: true

    images:
        type: [Object],
        label: "Thumbnails",
        optional: true

    media:
        type: Object
        optional: true

    createdAt: SchemasField.createdAt
    updatedAt: SchemasField.updatedAt
