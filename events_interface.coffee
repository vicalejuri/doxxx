###
    We define all session variables and events/messages here, because looselying defining in JS with strings
    introduces too much errors. Sometimes static type was better...

    Instead of using the 'stringly-typed' convention of JS

    xx.emit('layoutChaned', {data: [1,2,3]})

    Declare and use it here.

    xx.emit( EvsEnum.layoutChanged )

    This way if a event/session is non-existant, we can detect , stop it, and provide better error messages
    than silently ignoring and letting the bug tsunami destroy everything, letting you without any useful
    piece of evidence of the crash.

    </RANT END>

###
@EvsEnum =
    layout:
        changed:   'layout.changed'

@SessEnum =
    page:                 'frontpage'
    channels:
        selected:         'channels.selected'            # Name of selected channel
        object:           'channels.selected_object'     # Selected Channel Object

        subscribed:       'channels.subscribed'          # Subscribed channel (per-user)

    post:
        upload:
            preview_url:    'post.preview_url'               # Submit Preview URL
            preview_post:   'post.preview_post'              # Submit preview (video)

        watching:        'post.watching'                   # Currently watching video
