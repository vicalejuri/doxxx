class _AppLog
    constructor: (@name) ->

    @log: ( logMsg...) ->
        console.log.apply( null, logMsg )

    log: ( logMsg... ) ->
        console.log.apply( null,  ["[#{@name}] ".green,logMsg...] )

    error: (logMsg... ) ->
        console.error.apply( null, logMsg )

    error: ( logMsg... ) ->
        console.error.apply( null,  ["[#{@name}] ".red ,logMsg...] )


@AppLog = _AppLog
@DoxxLog = new AppLog('AppLog')
