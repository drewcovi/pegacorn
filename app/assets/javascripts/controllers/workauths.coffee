App.WorkauthsController = Em.ArrayController.extend
  needs: 'user'
  userName: (->
    App.Auth.get('user').get('fullName')
  ).property('App.User')