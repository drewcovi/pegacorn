App.UsersRoute = Em.Route.extend
  model: ->
    if App.Auth.get('signedIn')
      App.User.find()


App.UserRoute = App.UsersRoute.extend
  serialize: (model) ->
    user_id: model.get('param')

  model: (params) ->
    if App.Auth.get('signedIn')
      App.User.find(params.user_id)
