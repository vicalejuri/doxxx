postPageLogger = new AppLog('postPageLogger')

Template.post_watch.rendered = (el, tmpl)->
    return

Template.post_watch.events =
    'click .up': (data, ev) ->
        Meteor.call('upvote', Session.get(SessEnum.post.watching))

    'click .down': (data, ev) ->
        Meteor.call('downvote', Session.get(SessEnum.post.watching))

    'click .save': (data, ev) ->
        postPageLogger.log("Not yet implemented save:post", data, ev)
