App.UsersController = Em.ArrayController.extend()

App.UserController = Em.ObjectController.extend
  isCurrent: (->
    App.Auth.get('user') is @get('content')
    ).property('content')