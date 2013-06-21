App.PostsNewRoute = App.PostsRoute.extend
  model: ->
    App.Post.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)