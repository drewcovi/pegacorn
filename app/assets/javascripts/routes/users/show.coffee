App.UsersShowRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get('param')

  model: (param) ->
    if App.Auth.get('signedIn')
      App.User.find(param.user_id)