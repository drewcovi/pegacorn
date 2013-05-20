App.UsersIndexRoute = Em.Route.extend
  model: ->
    if App.Auth.get('signedIn')
      App.User.find()