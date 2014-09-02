return unless Meteor.isServer

qs = Meteor.npmRequire 'querystring'
colors              = Meteor.npmRequire 'colors'

embedlyLogger = new AppLog('embedly')

getURLInfo = (url) ->
    ###
        Syncrhonous URL Info fetcher
    ###
    _embed = Meteor.settings.embed ? {enabled: true}
    _embedly_uri = 'http://api.embed.ly/1/extract';

    params = _.extend( _embed, {format: 'json', url: url} )
    params_qs = qs.stringify( params )

    sync_request = Meteor._wrapAsync( HTTP.get )
    response     = sync_request( "#{_embedly_uri}?#{params_qs}" )

    embedlyLogger.log( 'getURLInfo', "Extracted ", "#{url}".magenta )

    return response


Meteor.methods
    'getURLInfo': getURLInfo
