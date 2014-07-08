return unless Meteor.isServer

http = Meteor.require 'http'

getURLInfo = (url) ->
    embed = Meteor.settings.embed ? {enabled: false}

    extract_uri = 'http://api.embed.ly/1/extract';

    return {} unless embed.enabled
    embed_data = Meteor.http.get( extract_uri, {params: {
        maxwidth: embed.maxwidth,
        key: embed.api_key,
        url: url
    }})

    return embed_data


Meteor.methods
    'getURLInfo': getURLInfo
