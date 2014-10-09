Template.videofeed.posts = ->
    return Models.Post.find()

Template.gridItem.events =
    'click .grid-item': ( ev, tmpl ) ->
        Router.go('post_watch', {_id: tmpl.data._id})
