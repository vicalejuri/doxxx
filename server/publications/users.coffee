Meteor.publish 'currentUser', ->
    user = Meteor.users.find({_id: this.userId})
    user
