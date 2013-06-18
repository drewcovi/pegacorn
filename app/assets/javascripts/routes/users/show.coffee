App.UsersShowRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get 'param'