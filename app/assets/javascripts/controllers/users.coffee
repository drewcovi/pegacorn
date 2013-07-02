App.UsersController = Em.ArrayController.extend()

App.UserController = Em.ObjectController.extend
  isCurrent: (->
    console.log(@get('content'), App.Auth.get('user'))
    App.Auth.get('user').get('param') is @get('content').get('param')
    ).property('content')
  foo: 'bar'