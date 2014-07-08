Router.map ->
    this.route 'home', 
        path: '/', layoutTemplate: 'page'
        template: 'hello'
        yieldTemplates:
            header:   {to: 'header'}

    this.route 'channel',
        path: '/r/:channel_name', layoutTemplate: 'page'
        template: 'channel-overview'
        yieldTemplates:
            header: {to: 'header'}

    this.route 'notfound', {path: '*'}

