App.PostsNewRoute = App.PostRoute.extend
  model: ->
    App.Post.createRecord()