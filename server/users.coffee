Accounts.onCreateUser (options, user) ->
    userProps = 
        profile: options.profile or {}
        karma: 0
        votes:
            upPosts: []
            downPosts: []

    user = _.extend( user, userProps )

    if options.email
        user.profile.email = options.email

    if not options.profile.name
        user.profile.name = user.username
