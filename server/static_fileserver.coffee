fs                  = Npm.require 'fs'
colors              = Meteor.require 'colors'


# DEPRECATED
# node_static module File Server
static_fileserver   = Meteor.require 'node-static'
class NodeStaticFileServer
    constructor: (@settings) ->
        @file_server = new static_fileserver.Server( @settings.disk_path ? './public' )
        @log         = new AppLog('FileServer')

    start: ->
        @log.log("Serving #{@settings.disk_path}")
        WebApp.connectHandlers.use @file_server.serve 



#
# Connect.js File Server. 
connect             = Meteor.require 'connect'
class ConnectFileServer
    constructor: (@settings) ->
        console.log connect
        @file_server = connect.static( @settings.disk_path ? './public' )
        @log         = new AppLog('ConnectFileServer')

    start: ->
        @log.log("Serving ", "#{@settings.disk_path}".green, 
                 " to ", "#{@settings.public_path}".magenta )

        RoutePolicy.declare @settings.public_path, 'network'
        WebApp.connectHandlers.use @settings.public_path ,  @file_server



Meteor.startup ->

    fs_settings = Meteor.settings.file_server ? {
        enabled: true
        disk_path: './public'
        public_path: '/assets'
    }

    return unless fs_settings.enabled

    kambo_fileServer = StaticServer.add( fs_settings.public_path , fs_settings.disk_path )
