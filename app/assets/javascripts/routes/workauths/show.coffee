App.WorkauthsShowRoute = Em.Route.extend
  serialize: (model) ->
    workauth_id: model.get 'gutsId'