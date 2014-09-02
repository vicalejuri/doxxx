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

    original_url:
        type: String,
        regEx: SimpleSchema.RegEx.Url,
        label: "Original URL"

    title:
        type: String,
        label: "Title"

    description:
        type: String,
        label: "Description",
        optional: true

    keywords:
        type: [Object]
        label: "Keywords"
        optional: true

    images:
        type: [Object],
        label: "Thumbnails",
        optional: true

    oembed:
        type: Object
        optional: true

    createdAt: SchemasField.createdAt
    updatedAt: SchemasField.updatedAt


###

,-.-.         |     |
| | |,---.,---|,---.|    ,---.
| | ||   ||   ||---'|    `---.
` ' '`---'`---'`---'`---'`---'

####

@Models = {}
Models.ChannelModel = new Meteor.Collection "channels"
Models.PostModel    = new Meteor.Collection "posts"

Models.ChannelModel.attachSchema(Schemas.Channel)
Models.PostModel.attachSchema( Schemas.Post )


### 
    Create a post from a given URL. 
    
    Asynchronous, pass a cb please.
###
Models.PostModel.previewURL = (url, cb) ->
    _info = Meteor.call 'getURLInfo', url, 
        (err, res) ->
            @DoxxLog.log('Models.PostModel.previewURL', "Failed extraction of #{url}")

            console.log(err, res)
            return res

    return
