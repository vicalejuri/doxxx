class _AppLog
    constructor: (@name) ->

    @log: ( logMsg...) ->
        console.log.apply( console, logMsg )

    log: ( logMsg... ) ->
        console.log.apply( console,  ["[#{@name}] ",logMsg...] )

    @error: ( logMsg... ) ->
        console.error.apply( console , logMsg ) 

    error: ( logMsg... ) ->
        console.error.apply( console ,  ["[#{@name}] ",logMsg...] )


@AppLog = _AppLog
@DoxxLog = new AppLog('AppLog')
