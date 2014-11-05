### 
    Default session variables and values
###
Meteor.startup ->
    AppLog.group()
    AppLog.log("Cleaning Session state...")

    Session.setDefault( SessEnum.channels.selected,     [Meteor.settings.public.channels.default ])
    Session.setDefault( SessEnum.channels.object,              null )
    Session.setDefault( SessEnum.post.upload.preview_url,      null )
    Session.setDefault( SessEnum.post.upload.preview_post,     null )
    Session.setDefault( SessEnum.post.current,                 null )

    AppLog.log("DONE")
    AppLog.endGroup()
