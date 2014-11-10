Meteor.publish 'all_channels', ->
    return Models.Channels.find()
