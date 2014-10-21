UI.registerHelper 'Schemas', Schemas 
UI.registerHelper 'Models',  Models

UI.registerHelper 'has_preview', ->
    return Session.get( SessEnum.post.upload.preview_post )?

UI.registerHelper 'preview_post', ->
    return Session.get( SessEnum.post.upload.preview_post )

UI.registerHelper 'page_title', ->
    return Session.get( SessEnum.post.watching )?.channels ? 'DOXX'

UI.registerHelper 'is_admin', ->
    return true

UI.registerHelper 'is_debugger_enabled', ->
    return true


# Return the feed of posts of the given channel
UI.registerHelper 'posts', (channel) ->
  return Models.Posts.find({channel: {$in: channel}})

