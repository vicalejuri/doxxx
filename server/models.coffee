Meteor.publish 'active_channels', (_query) ->
  channel = Session.get(SessEnum.channels.selected)
  qr = _query ? {} 
  return Models.Channel.find( {_id: {$in: [channels]}) 

Meteor.publish 'posts', (channels) ->
  # Subscribe to post on channel array (many or one)
  channels = [channels,] if Match.test(channels,String)
  check(channel, Array )

  Models.Post.find({channels: { $in: channels }})

Meteor.publish 'userfeed_posts' , ->
  # Subscribe to Userfeed (subscribed channels) 
  channels = [ Meteor.settings.public.channels.default ] # , Settings. Meteor.user.profile.subscribed_channels ]
  Models.Post.find({channels: { $in: channels }})
