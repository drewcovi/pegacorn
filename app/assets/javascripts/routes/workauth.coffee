App.WorkauthRoute = Em.Route.extend
  model: (params) ->
    if App.Auth.get('signedIn')
      App.Workauth.find(params.workauth_id)
  serialize: (model) ->
    workauth_id: model.get 'id'