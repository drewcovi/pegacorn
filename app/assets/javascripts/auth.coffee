App.Auth = Em.Auth.create
  signInEndPoint: '/users/sign_in'
  signOutEndPoint: '/users/sign_out'

  tokenKey: 'auth_token'
  tokenIdKey: 'user_id'

  userModel: 'App.User'

  modules: ['emberData', 'rememberable']

  rememberable:
    tokenKey: 'remember_token'
    period: 7
    autoRecall: true
