App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()
  # setupController: (controller, model) ->
    # @controllerFor('application').set('currentRoute', 'posts')

App.PostRoute = App.PostsRoute.extend
  model: (param) ->
    App.Post.find(param.post_id)    
  setupController: (controller, model) ->
    controller.set('content', model)
    # @controllerFor('application').set('currentRoute', 'posts')
  serialize: (model) ->
    post_id: model.get('permalink')