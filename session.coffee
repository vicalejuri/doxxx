### 
    Default session variables and values
###

if not Meteor.isServer
    Meteor.startup ->
        Session.setDefault( SessEnum.channels.selected,     Meteor.settings.public.channels.default )
        Session.setDefault( SessEnum.post.preview_url,      '' )
        Session.setDefault( SessEnum.post.preview_post,     null )
        Session.setDefault( SessEnum.post.current,          null )
