Router.configure
    lodingTemplate:     'loading'
    notFoundTemplate:   'notfound'

###
Router.onBeforeAction ->
    if this.ready()
        Session.set( SessEnum.loading , false)
        this.next()
    else
        Session.set( SessEnum.loading , true)
###

Meteor.startup ->
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
                return Models.Posts.findOne({_id: this.params._id})

            yieldTemplates:
                header: {to: 'header'}
                footer: {to: 'footer'}
            onRun: ->
                post = Models.Posts.findOne({_id: this.params._id})
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


        this.route 'signOut',
            path: '/sign-out',
            onBeforeAction: () ->
                Meteor.logout ->
                    Router.go('/')

                next()



        this.route 'notfound', {path: '*'}


# Common subscription that need to be loaded on all routes
###

@preloadSubs = []
preloadSubs.push('settings')


if(Meteor.isServer)
    Router.onAllRoutes ->
        router = this
        _.each @preloadSubs, (sub) ->
            router.subscribe(sub)
###
