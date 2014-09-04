Template.upload.events = _.extend( {
    'click .submit': (ev) ->
        _new_post = Session.get( SessEnum.post.upload.preview_post )
        Models.Post.insert( _new_post )
    }, 
    LiveTextInput('#url', {
        'ok': (text, ev) ->
            Session.set( SessEnum.post.upload.preview_url, text )
            Deps.flush()
    })
)


#  Preview of url upload
preview_url_autorun = ->
    preview_url = Session.get( SessEnum.post.upload.preview_url )

    # TODO: Add error msg
    return if not preview_url?

    # Try to get more info, dispatch preview_post
    Models.Post.previewURL preview_url , (err, preview_post ) ->
        Session.set( SessEnum.post.upload.preview_post , preview_post )
        Deps.flush()


Meteor.startup ->
    Deps.autorun preview_url_autorun
