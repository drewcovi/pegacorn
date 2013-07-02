App.PostsRoute = Em.Route.extend
  model: ->
    App.Post.find()

App.PostRoute = App.PostsRoute.extend
  model: (params) ->
    App.Post.find(params.post_id)
    # posts = App.Post.find
    #   permalink: params.post_id

    # posts.one 'didLoad', ->
    #   posts.resolve posts.get 'firstObject'

    # posts
  events:
    error: ->
      console.log 'something went wrong on the backend'
      @transitionTo('post.index')

  setupController: (controller, model) ->
    controller.set('content', model)

  serialize: (model) ->
    post_id: model.get('id')
    # post_id: model.get('permalink')