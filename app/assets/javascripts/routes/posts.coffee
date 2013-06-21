App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.PostRoute = App.PostsRoute.extend    
  serialize: (model) ->
    post_id: model.get('param')

  model: (param) ->
    App.Post.find(param.post_id)