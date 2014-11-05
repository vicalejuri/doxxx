Meteor.startup ->

    Meteor.publish 'all_channels', ->
        return Models.Channels.find()

    # Get posts from the given (one or many channels)
    Meteor.publish 'posts_from_channel', (channels) ->
        # Subscribe to post on channel array (many or one)
        channels = [channels,] if Match.test(channels,String)
        check(channel, Array )

        Models.Posts.find({channels: { $in: channels }})

    # Get posts from the collection of User subscribed channels
    Meteor.publish 'userfeed_posts' , ->
        # Subscribe to Userfeed (subscribed channels) 
        channels = [ Meteor.settings.public.channels.default ] # , Settings. Meteor.user.profile.subscribed_channels ]
        Models.Posts.find({channels: { $in: channels }})

