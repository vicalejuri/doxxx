Schemas.Post = new SimpleSchema
    createdAt: SchemasField.createdAt
    updatedAt: SchemasField.updatedAt
    owner:     
        type:   String
        autoValue: (doc) ->
            return Meteor.userId()

    channels:
        type:  [String],
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
    channels:
        type:  [String],
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


Models.Posts         = new Meteor.Collection "posts"
Models.Posts.attachSchema( Schemas.Post )

PostLogger = new AppLog('Posts')

### 
    Create a post from a given URL. 
    
    Asynchronous, pass a cb please.
###
Models.Posts.fetchURL = (url, cb) ->
    _info = Meteor.call 'getURLInfo', url, 
        (err, res) =>
            if err?
                postLogger.error('(Post.previewURL)', "Failed extraction of #{url}")

            _data = if err then {url: url} else res
            _post = Models.Posts.clone( _data )

            cb(err, _post )


###
    Clone from a object of data. 
###
Models.Posts.clone = (embed_data) ->
    _cloned = _.extend(  _.pick(embed_data, 'type','url','title','description'),
                        {
                            channels:   [ Meteor.settings.public.channels.default ],
                            tags:    []
                            #authors: [   _.pick(embed_data, 'author_name','author_url') , ],
                            images:  [   _.pick(embed_data, 'thumbnail_url','thumbnail_width','thumbnail_height') , ] ,
                            media:   [   _.pick(embed_data, 'html', 'width','height','url') , ]  
                        })


Models.Posts.allow
    insert: (userId, channel) ->
        return true
