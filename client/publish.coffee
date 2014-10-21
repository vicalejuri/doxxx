# Subscribe to the posts of the current channel
@post_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    channel = Session.get( SessEnum.channels.selected )
    if channel?
      post_subscribe = Meteor.subscribe 'posts', channel
    else
      post_subcribe = Meteor.subscribe  'userfeed_posts'



# Subscribe to all channels
@channel_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    channel_name = Session.get( SessEnum.channels.selected )
    channel_subscribe = Meteor.subscribe 'channels', ->
      channel = Models.Channel.find( {slug: channel_name} )
