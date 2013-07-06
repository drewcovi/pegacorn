App.WorkauthRoute = Em.Route.extend
  model: (params) ->
    if App.Auth.get('signedIn')
      App.Workauth.find(param.workauth_id)
  serialize: (model) ->
    workauth_id: model.get 'id'
    user_id: @controllerFor('user').get 'param'