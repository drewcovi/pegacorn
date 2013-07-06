App.PostsRoute = Em.Route.extend
  model: (params) ->
    App.Post.find()
  serialize: (model, params) ->
    permalink: model.get('permalink')