class _AppLog
    constructor: (@name) ->

    @log: ( logMsg...) ->
        console.log.apply( null, logMsg )

    log: ( logMsg... ) ->
        console.log.apply( null,  ["[#{@name}] ",logMsg...] )

@AppLog = _AppLog
@DoxxLog = new AppLog('AppLog')
