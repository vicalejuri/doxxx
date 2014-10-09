# Session widget (for debugging)
Template.session_debug.rendered = ->
    gui = new dat.GUI({autoPlace: false})
    #gui = new dat.GUI()

    session_obj = Session.keys

    channels = gui.addFolder( 'Channels' )
    channels.add( session_obj , 'channels.selected' )
    channels.add( session_obj , 'channels.selected_object' )

    posts = gui.addFolder( 'Post' )
    posts.add( session_obj , 'post.watching' )
    posts.add( session_obj , 'post.preview_url' )
    posts.add( session_obj , 'post.preview_post' )

    #channels.open()
    $('.debug-pane').append( gui.domElement )

UI.registerHelper 'log', (data, ctx) -> 
        console.log data
