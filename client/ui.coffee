UI.registerHelper 'has_preview', ->
    return Session.get( SessEnum.post.upload.preview_post )?

UI.registerHelper 'preview_post', ->
    return Session.get( SessEnum.post.upload.preview_post )?.media.html

# Return the feed of posts of the given channel
UI.registerHelper 'posts', (channel) ->
  return _.map( _.range(20), (i) -> {title: "Fuckety fuck  #{i}"} )

