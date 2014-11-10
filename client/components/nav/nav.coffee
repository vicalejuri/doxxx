Template.userMenu.events =
    'click #logout': (ev) ->
        e.preventDefault()
        Meteor.logout()
