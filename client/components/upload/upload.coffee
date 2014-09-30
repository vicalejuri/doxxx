preview_logger = new AppLog('uploadPreview')

Template.upload.events = _.extend( {
    'click .submit': (ev) ->
        _new_post = Session.get( SessEnum.post.upload.preview_post )
        preview_logger.log('FuCK --> ', _new_post)
        Models.Post.insert( _new_post )
    }, 
    LiveTextInput('input[name="url"]', {
        'ok': (text, ev) ->
            Session.set( SessEnum.post.upload.preview_url, text )
            Deps.flush()
    })
)

AutoForm.hooks
    PostUploadPreview: 
        onSubmit: ->
            console.log("Submiting")

        onSuccess: (op, res, template) ->
            console.log(op,res,template)
            preview_logger.log("Saved post successfully!")
            $("#modal-upload").prop('checked',false)


#  Preview of url upload
preview_url_autorun = ->
    preview_url = Session.get( SessEnum.post.upload.preview_url )

    return if not preview_url?

    # Try to get more info, dispatch preview_post
    Models.Post.previewURL preview_url , (err, preview_post ) ->

        # TODO: Show error msg to User
        return if(err)

        preview_logger.log( "#{preview_url} decoded successfully" )

        Session.set( SessEnum.post.upload.preview_post , preview_post )


Meteor.startup ->
    Deps.autorun preview_url_autorun
