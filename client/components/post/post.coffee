postPageLogger = new AppLog('postPageLogger')

Template.post_watch.rendered = (el, tmpl)->
    return

Template.post_watch.events =
    'click .up': (data, ev) ->
        postPageLogger.log("Not yet implemented upvote:post", data, ev)
        Meteor.call('upvote', Session.get(essEnum.post.watching))

    'click .down': (data, ev) ->
        postPageLogger.log("Not yet implemented downvote:post", data, ev)
        Meteor.call('downvote', Session.get(SessEnum.post.watching))

    'click .save': (data, ev) ->
        postPageLogger.log("Not yet implemented save:post", data, ev)
