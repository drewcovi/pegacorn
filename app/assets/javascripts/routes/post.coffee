App.PostRoute = Em.Route.extend
  model: (params) ->
    App.Post.find(params.permalink)

  events:
    error: ->
      @transitionTo('post.index')

  serialize: (model) ->
    permalink: model.get('permalink')
            