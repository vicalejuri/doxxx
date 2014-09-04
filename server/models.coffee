Meteor.publish 'channels', (_query) ->
  qr = _query ? {} 
  return Models.Channel.find(qr)

Meteor.publish 'post', (channel) ->
  check(channel, String )
  Models.Post.find({channel: channel})
