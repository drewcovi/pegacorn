App.WorkauthsRoute = Em.Route.extend
  model: ->
    if App.Auth.get('signedIn')
      App.Workauth.find()

App.WorkauthRoute = App.WorkauthsRoute.extend 
  model: (param) ->
    if App.Auth.get('signedIn')
      App.Workauth.find(param.workauth_id)
      
  serialize: (model) ->
    workauth_id: model.get 'gutsId'
