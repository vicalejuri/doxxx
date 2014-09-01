return unless Meteor.isServer

http = Meteor.require 'http'

getURLInfo = (url) ->
    ###
        Syncrhonous URL Info fetcher
    ###
    console.log("WTF")
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
    'fuck': ->
        return 'YEAP'
