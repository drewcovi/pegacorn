App.UsersNewRoute = App.UserRoute.extend
  model: ->
    App.User.createRecord()