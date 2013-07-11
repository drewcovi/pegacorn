App.WorkauthsRoute = Em.Route.extend

  model: ->
    if App.Auth.get('signedIn')
      App.Workauth.find()

  setupController: (controller, model) ->
    userId = App.Auth.get('userId')
    @_super(controller, model)
    @controllerFor('workauths').set('currentUser', App.User.find(userId))

  beforeModel: ->
    userId = App.Auth.get('userId')
    if !App.User.find(userId).get('isLoaded')
      return App.User.find(userId)