UI.registerHelper 'Schemas', Schemas 
UI.registerHelper 'Models',  Models

UI.registerHelper 'has_preview', ->
    Session.get( SessEnum.post.upload.preview_post )?

UI.registerHelper 'preview_post', ->
    Session.get( SessEnum.post.upload.preview_post )

UI.registerHelper 'page_title', ->
    Session.get( SessEnum.post.watching )?.channels ? 'DOXX'

# Return the feed of posts of the given channel
UI.registerHelper 'posts', (channel) ->
  return Models.Posts.find({channel: {$in: channel}})
