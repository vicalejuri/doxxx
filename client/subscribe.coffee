@all_channels = null

# Subscribe to the posts of the current channel
# Or from the userfeed
@post_subscribe = null
Meteor.startup ->
  Tracker.autorun ->
    #channels = Session.get( SessEnum.channels.selected )
    #if channel?
    #  post_subscribe = Meteor.subscribe 'channel_posts', channels
    #else
    #  post_subcribe  = Meteor.subscribe  'userfeed_posts'

    #all_channels_subs = Meteor.subscribe 'all_channels', ->
    #    @all_channels = Models.Channels.find()
