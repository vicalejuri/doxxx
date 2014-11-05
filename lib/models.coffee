###

,-.-.         |     |
| | |,---.,---|,---.|    ,---.
| | ||   ||   ||---'|    `---.
` ' '`---'`---'`---'`---'`---'

####

@Models = {}
Models.Channels      = new Meteor.Collection "channels"
Models.Posts         = new Meteor.Collection "posts"

Models.Channels.attachSchema(Schemas.Channel)
Models.Posts.attachSchema( Schemas.Post )

@modelLogger = new AppLog('Models')

### 
    Create a post from a given URL. 
    
    Asynchronous, pass a cb please.
###
Models.Posts.fetchURL = (url, cb) ->
    _info = Meteor.call 'getURLInfo', url, 
        (err, res) =>
            if err?
                modelLogger.error('(Post.previewURL)', "Failed extraction of #{url}")

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


Models.Channels.allow 
    insert: (userId, channel) ->
        return true

Models.Posts.allow
    insert: (userId, channel) ->
        return true
