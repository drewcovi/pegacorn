App.UsersRoute = Em.Route.extend
    model: ->
      @_super()
      if App.Auth.get('signedIn')
        App.User.find()