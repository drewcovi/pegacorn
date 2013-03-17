App.ApplicationController = Ember.Controller.extend
  init: ->
    # console.log 'foo'
  
  create: ->
    alert 'create from here!'

  isHome: (->
    @get('currentRoute') == 'home'
  ).property('currentRoute')

  isUsers: (->
    @get('currentRoute') == 'users'
  ).property('currentRoute')

  isLogin: (->
    @get('currentRoute') == 'login'
  ).property('currentRoute')

  isJoin: (->
    @get('currentRoute') == 'join'
  ).property('currentRoute')