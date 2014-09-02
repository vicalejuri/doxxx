### 
    Default session variables and values
###

if not Meteor.isServer
    Meteor.startup ->
        Session.setDefault( SessEnum.channels.selected,     'frontpage')
        Session.setDefault( SessEnum.post.preview_url,      '')
        Session.setDefault( SessEnum.post.preview_post,     {})
