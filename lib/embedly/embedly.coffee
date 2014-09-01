return unless Meteor.isServer

http = Meteor.npmRequire 'http'

getURLInfo = (url) ->
    ###
        Syncrhonous URL Info fetcher
    ###
    embed = Meteor.settings.embed ? {enabled: true}

    extract_uri = 'http://api.embed.ly/1/extract';

    _req = _.wrapAsync( Meteor.http.get )
    
    res = _req( extract_uri, {params: {
        maxwidth: embed.maxwidth,
        key: embed.api_key,
        url: url
    }} )

    return res


Meteor.methods
    'getURLInfo': getURLInfo
