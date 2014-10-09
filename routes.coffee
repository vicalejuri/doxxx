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

    this.route 'post.watch',
        path: '/w/:_id', layoutTemplate: 'page'
        template: 'post_watch'
        data: ->
            return Models.Post.findOne({_id: this.params._id})

        yieldTemplates:
            header: {to: 'header'}
        onRun: ->
            Session.set( SessEnum.post.watching , this.params._id )

    this.route 'channel',
        path: '/r/:channel_slug', layoutTemplate: 'page'
        template: 'channel_overview'
        waitOn: -> 
            Session.set( SessEnum.channels.selected, this.params.channel_slug )
        yieldTemplates:
            header: {to: 'header'}
        onRun: ->
            AppLog.log('router:channel', this.params )
            Session.set( SessEnum.channels.selected , this.params.channel_slug )

    this.route 'notfound', {path: '*'}

