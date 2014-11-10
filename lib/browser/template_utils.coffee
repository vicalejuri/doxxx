UI.registerHelper 'console_log', (logMsg...) ->
    console.log( '{{console_log}}', logMsg )

UI.registerHelper 'console_trace', ->
    console.trace()

UI.registerHelper 'isLoggedIn', ->
    Meteor.user()?

UI.registerHelper 'isAdmin', ->
    isAdmin(Meteor.user())

UI.registerHelper 'isDebuggerEnabled', ->
    true
