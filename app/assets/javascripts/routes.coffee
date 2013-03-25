App.Router.reopen
  location: 'history'

App.Router.map () -> 
  @resource 'users', ->
    @route 'new'
    @route 'edit',
      path: '/:user_id/edit'
    @route 'show',
      path: '/:user_id'
  @route 'login',
    path: '/login'
  @route 'join',
    path: '/join'

App.ApplicationRoute = Ember.Route.extend
  setupController: (controller,model) ->

App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @controllerFor('application').set('currentRoute', 'home')
  activate: ->

App.LoggedInRoute = Ember.Route.extend
  setupController: ->
    console.log 'landed on loggedin'

App.UsersRoute = Ember.Route.extend
  setupController: (controller, model) ->
    console.log controller
    @controllerFor('application').set('currentRoute', 'users')

App.LoginRoute = Ember.Route.extend
  setupController: (controller, model) ->
    console.log controller, 'foo'
    @controllerFor('application').set('currentRoute', 'login')

App.JoinRoute = Ember.Route.extend
  setupController: (controller, model) ->
    # console.log 'join route controller set up', controller, model
    @controllerFor('application').set('currentRoute', 'join')

App.UsersIndexRoute = App.UsersRoute.extend
  model: ->
    App.User.find()
  setupController: (controller, model) ->
    @_super()
    controller.set('users', model)

App.UsersNewRoute = App.UsersRoute.extend
  model: ->
    App.User.createRecord()
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.UserRoute = App.UsersRoute.extend    
  model: (params) ->
    App.User.find(params.user_id)
  setupController: (controller, model) ->
    @_super()
    controller.set('content', model)

App.UsersShowRoute = App.UserRoute.extend()
App.UsersEditRoute = App.UserRoute.extend()


