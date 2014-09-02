UI.registerHelper 'has_preview', ->
    return Session.get( SessEnum.post.preview_post )?

UI.registerHelper 'preview_post_embed', ->
    return Session.get( SessEnum.post.preview_post )?.media.html

Template.upload.events = _.extend( {
    'click .submit': (ev) ->
        Models.Post.insert( Session.get( SessEnum.post.preview_post ) )
    }, 
    LiveTextInput('#url', {
        'ok': (text, ev) ->
            console.log("URL is -> #{text}");
            Session.set( SessEnum.post.preview_url, text )
            Deps.flush()
    })
)

#  Preview of url upload
preview_url_autorun = ->
    preview_url = Session.get( SessEnum.post.preview_url )

    # TODO: Add error msg
    return if not preview_url

    Models.Post.previewURL preview_url , (err, preview_post ) ->
        Session.set( SessEnum.post.preview_post , preview_post )
        Deps.flush()


Meteor.startup ->
    Deps.autorun preview_url_autorun
