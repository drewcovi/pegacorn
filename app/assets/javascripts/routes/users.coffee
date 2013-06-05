App.UsersRoute = Em.Route.extend
  model: ->
    if App.Auth.get('signedIn')
      App.User.find()


App.UserRoute = App.UsersRoute.extend    
  serialize: (model) ->
    user_id: model.get('param')

  model: (param) ->
    console.log(param)
    if App.Auth.get('signedIn')
      App.User.find(param.user_id)
