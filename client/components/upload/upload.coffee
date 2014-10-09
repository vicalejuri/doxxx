preview_logger = new AppLog('uploadPreview')

Template.upload.events = _.extend( {
        #Models.Post.insert( _new_post )
    }, 
    LiveTextInput('input[name="url"]', {
        'ok': (text, ev) ->
            Session.set( SessEnum.post.upload.preview_url, text )
            Deps.flush()
    })
)

AutoForm.hooks
    PostUploadPreview: 
        onSuccess: (op, res, template) ->
            preview_logger.log("Saved post successfully!")
            Modals.close('upload')
            #$("#modal-upload").prop('checked',false)

        onError: (op, err, tmpl ) ->
            preview_logger.log("Error --> ", op, err)
            Modals.close('upload')

        docToForm: (doc) ->
            doc.tags = doc.tags.join(", ") if _.isArray(doc.tags)
            doc.authors = JSON.stringify( doc.authors  ) if _.isObject( doc.authors )
            doc.images = JSON.stringify( doc.images ) if _.isObject(doc.images)
            doc.media = JSON.stringify( doc.media ) if _.isObject(doc.media)
            doc

        formToDoc: (doc) ->
            doc.tags = doc.tags.split(", ") if _.isString(doc.tags)
            doc.authors = JSON.parse( doc.authors ) if _.isString(doc.authors)
            doc.images  = JSON.parse( doc.images ) if _.isString(doc.images)
            doc.media   = JSON.parse( doc.media ) if _.isString(doc.media)
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
