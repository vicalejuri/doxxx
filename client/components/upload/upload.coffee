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
        onSuccess: (op, res, template) ->
            preview_logger.log("Saved post successfully!", op, res, template)
            Modals.close('upload')
            Router.go('post.watch', op )

        onError: (op, err, tmpl ) ->
            preview_logger.log("Error --> ", op, err)
            #Modals.close('upload')
            #Router.go('home')

        docToForm: (doc) ->
            doc.tags = doc.tags.join(", ") if _.isArray(doc.tags)
            doc.channels = doc.channels.join(", ") if _.isArray(doc.channels)
            doc.authors = JSON.stringify( doc.authors  ) if _.isObject( doc.authors )
            doc.images = JSON.stringify( doc.images ) if _.isObject(doc.images)
            doc.media = JSON.stringify( doc.media ) if _.isObject(doc.media)
            doc

        formToDoc: (doc) ->
            doc.tags = doc.tags.split(", ") if _.isString(doc.tags)
            doc.channels = doc.channels.split(", ") if _.isString(doc.channels)
            doc.authors = JSON.parse( doc.authors ) if _.isString(doc.authors)
            doc.images  = JSON.parse( doc.images ) if _.isString(doc.images)
            doc.media   = JSON.parse( doc.media ) if _.isString(doc.media)
            doc


#  Preview of url upload
preview_url_autorun = ->
    preview_url = Session.get( SessEnum.post.upload.preview_url )

    return if not preview_url?

    # Try to get more info, dispatch preview_post
    Models.Posts.fetchURL preview_url , (err, preview_post ) ->

        # TODO: Show error msg to User
        return if(err)

        preview_logger.log( "#{preview_url} decoded successfully" )

        Session.set( SessEnum.post.upload.preview_post , preview_post )


Meteor.startup ->
    Deps.autorun preview_url_autorun
