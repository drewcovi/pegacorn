App.WorkauthsRoute = Em.Route.extend
  model: ->
      App.Workauths.find()

App.WorkauthRoute = App.WorkauthsRoute.extend 
  model: (param) ->
    if App.Auth.get('signedIn')
      App.Workauth.find(param.user)
