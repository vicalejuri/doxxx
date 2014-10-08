preview_logger = new AppLog('uploadPreview')

Template.upload.events = _.extend( {
    }, 
    LiveTextInput('input[name="url"]', {
        'ok': (text, ev) ->
            Session.set( SessEnum.post.upload.preview_url, text )
            Deps.flush()
    })
)

AutoForm.hooks
    PostUploadPreview: 
        onSubmit: (insertDoc, updateDoc, currentDoc)->
            console.log("Submiting", insertDoc)
            Schemas.Post.clean(insertDoc)
            this.done()
            false

        onSuccess: (op, res, template) ->
            preview_logger.log("Saved post successfully!")
            $("#modal-upload").prop('checked',false)

        docToForm: (doc) ->
            doc.tags = doc.tags.join(", ") if _.isArray(doc.tags)
            doc

        formToDoc: (doc) ->
            doc.tags = doc.tags.split(", ") if _.isString(doc.tags)
            doc


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
