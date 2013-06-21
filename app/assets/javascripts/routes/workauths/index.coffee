App.WorkauthsIndexRoute = Em.Route.extend
  model: ->
    App.Workauth.find()