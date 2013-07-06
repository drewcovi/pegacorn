App.UserController = Em.ObjectController.extend
  isCurrent: (->
    App.Auth.get('user').get('param') is @get('content').get('param')
    ).property('content')
  foo: 'bar'