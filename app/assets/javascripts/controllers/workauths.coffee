App.WorkauthsController = Em.ArrayController.extend
  userName: (->
    App.Auth.get('user').get('fullName')
  ).property()