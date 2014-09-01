Router.configure
    lodingTemplate:     'loading'
    notFoundTemplate:   'notfound'

Router.onBeforeAction 'loading'

Router.map ->
    this.route 'home', 
        path: '/', layoutTemplate: 'page'
        template: 'hello'
        yieldTemplates:
            header:   {to: 'header'}

    this.route 'channel',
        path: '/r/:channel_slug', layoutTemplate: 'page'
        template: 'channel_overview'
        waitOn: -> 
            Session.set( SessEnum.selectedChannel , this.params.channel_slug )
        yieldTemplates:
            header: {to: 'header'}
        onRun: ->
            AppLog.log('router:channel', this.params )
            Session.set('selectedChannel', this.params.channel_slug)

    this.route 'notfound', {path: '*'}