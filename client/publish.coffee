# Subscribe to the channel  posts!
@post_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    channel = Session.get( SessEnum.channels.selected )
    if channel?
      post_subscribe = Meteor.subscribe 'post', channel
    else
      post_subcribe = null



# Subscribe to channels
@channel_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    channel_name = Session.get( SessEnum.channels.selected )
    channel_subscribe = Meteor.subscribe 'channel', ->
      channel = Models.Channel.findOne( {name: channel_name} )
      Session.set( SessEnum.channel.object , channel )
