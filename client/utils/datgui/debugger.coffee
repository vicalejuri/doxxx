# Session widget (for debugging)
Template.session_debug.rendered = ->
    gui = new dat.GUI({autoPlace: false})
    #gui = new dat.GUI()

    session_obj = Session.keys

    gui.add( session_obg, 'loading' )

    try
        channels = gui.addFolder( 'Channels' )
        channels.add( session_obj , 'channels.selected' )
        channels.add( session_obj , 'channels.selected_object' )
    catch err
        console.error(err)

    try
        posts = gui.addFolder( 'Post' )
        posts.add( session_obj , 'post.watching' )
        posts.add( session_obj , 'post.preview_url' )
        posts.add( session_obj , 'post.preview_post' )
    catch err
        console.error(err)

    $('.debug-pane').append( gui.domElement )
