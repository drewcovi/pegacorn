App.UserRoute = Em.Route.extend
  serialize: (model) ->
    console.log(model)
    user_id: model.get('id')

  model: (params) ->
    if App.Auth.get('signedIn')
      App.User.find(params.user_id)
