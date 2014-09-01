

Template.channel_list.fetchChannelPosts = (_query,_order) ->
    query   =  _query ? {channel: channel.name?.toLowerCase()}
    sel_channel = Session.get( SessEnum.selectedChannel )

    console.assert( _.isObject(_query) , '[fetchChannelPosts] Query malformed!' );
    console.assert( sel_channel , '[fetchChannelPosts] selectedChannel malformed!' )

    PostsModel.find(query)
