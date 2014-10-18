Router.configure
    lodingTemplate:     'loading'
    notFoundTemplate:   'notfound'

Router.onBeforeAction 'loading'
Router.map ->
    this.route 'home', 
        path: '/', layoutTemplate: 'page'
        template: 'videofeed'
        yieldTemplates:
            header:   {to: 'header'}
            footer: {to: 'footer'}
        onRun: ->
            Session.set( SessEnum.post.watching , undefined )

    this.route 'post.watch',
        path: '/w/:_id', layoutTemplate: 'page'
        template: 'post_watch'
        data: ->
            return Models.Post.findOne({_id: this.params._id})

        yieldTemplates:
            header: {to: 'header'}
            footer: {to: 'footer'}
        onRun: ->
            post = Models.Post.findOne({_id: this.params._id})
            Session.set( SessEnum.post.watching , post )

    this.route 'channel',
        path: '/r/:channel_slug', layoutTemplate: 'page'
        template: 'channel_overview'
        waitOn: -> 
            Session.set( SessEnum.channels.selected, this.params.channel_slug )
        yieldTemplates:
            header: {to: 'header'}
            footer: {to: 'footer'}
        onRun: ->
            AppLog.log('router:channel', this.params )
            Session.set( SessEnum.channels.selected , this.params.channel_slug )

    this.route 'notfound', {path: '*'}

