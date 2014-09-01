fs                  = Npm.require 'fs'
colors              = Meteor.npmRequire 'colors'


# DEPRECATED
# node_static module File Server
static_fileserver   = Meteor.npmRequire 'node-static'
class NodeStaticFileServer
    constructor: (@settings) ->
        @log         = new AppLog('FileServer')
        @file_server = new static_fileserver.Server( @settings.disk_path ? "#{__dirname}/public" )


    start: ->
        @log.log("Serving #{@settings.disk_path}")
        WebApp.connectHandlers.use @file_server.serve 



#
# Connect.js File Server. 
connect             = Meteor.npmRequire 'connect'
class ConnectFileServer extends StaticServer
    constructor: (@settings) ->
        @log         = new AppLog('ConnectFileServer')
        @file_server = connect.static( @settings.disk_path ? './public' )

    start: ->
        @log.log("Serving ", "#{@settings.disk_path}".green, 
                 " as ", "#{@settings.public_path}".magenta )

        WebApp.connectHandlers.use @settings.public_path ,  @file_server



Meteor.startup ->

    fs_settings = Meteor.settings.file_server ? {
        enabled: true
        disk_path: './public'
        public_path: '/assets'
    }

    return unless fs_settings.enabled

    #kambo_fileServer = StaticServer.add( fs_settings.public_path , fs_settings.disk_path )
    fs_server = new ConnectFileServer( fs_settings )
    fs_server.start()
