return unless Meteor.isServer

qs                  = Meteor.npmRequire 'querystring'
colors              = Meteor.npmRequire 'colors'

embedlyLogger = new AppLog('embedly')

getURLInfo = (url) ->
    ###
        Syncrhonous URL Info fetcher
    ###
    _embed = Meteor.settings.embed ? {}
    _embedly_uri = 'http://api.embed.ly/1/oembed';

    params = _.extend( _embed, {format: 'json', url: url} )
    params_qs = qs.stringify( params )

    # Request
    embedly_request = Meteor.wrapAsync (uri, cb) ->
        HTTP.get uri, (err,res) ->
            if(err?)
                embedlyLogger.log( '(getURLInfo)', "Cant extract ", "#{url}".magenta )
                cb(err,res)

            # Filter data (remove headers and statusCode)
            embed_data = res?.data

            cb(err, embed_data )


    response     = embedly_request( "#{_embedly_uri}?#{params_qs}" )
    return response


Meteor.methods
    'getURLInfo': getURLInfo
