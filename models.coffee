###

,-.-.         |     |
| | |,---.,---|,---.|    ,---.
| | ||   ||   ||---'|    `---.
` ' '`---'`---'`---'`---'`---'

####

@Models = {}
Models.Channel      = new Meteor.Collection "channels"
Models.Post         = new Meteor.Collection "posts"

Models.Channel.attachSchema(Schemas.Channel)
Models.Post.attachSchema( Schemas.Post )


@modelLogger = new AppLog('Models')

### 
    Create a post from a given URL. 
    
    Asynchronous, pass a cb please.
###
Models.Post.previewURL = (url, cb) ->
    _info = Meteor.call 'getURLInfo', url, 
        (err, res) =>
            if err?
                modelLogger.error('(Post.previewURL)', "Failed extraction of #{url}")

            _data = if err then {url: url} else res
            _post = Models.Post.clone( _data )

            cb(err, _post )

###
    Clone from a object of data. 
###
Models.Post.clone = (embed_data) ->
    _cloned = _.extend( {channel:     Meteor.settings.public.channels.default},
                         _.pick(embed_data, 
                            'channel','url','original_url','title','description',
                            'keywords','images','media') )
