@all_channels = null

# Subscribe to the posts of the current channel
# Or from the userfeed
@post_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    channels = Session.get( SessEnum.channels.selected )
    if channel?
      post_subscribe = Meteor.subscribe 'posts_from_channel', channels
    else
      post_subcribe  = Meteor.subscribe  'userfeed_posts'

    all_channels_subs = Meteor.subscribe 'all_channels', ->
        @all_channels = Models.Channels.find()



# Subscribe to all channels
@channel_subscribe = null
Meteor.startup ->
  Deps.autorun ->
    subscribed_channels = Meteor.subscribe 'active_channels'
    Session.set( SessEnum.channels.object , Models.Channels.find().fetch() )
