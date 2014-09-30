UI.registerHelper 'console_log', (logMsg...) ->
    console.log( '{{console_log}}', logMsg )

UI.registerHelper 'console_trace', ->
    console.trace()
