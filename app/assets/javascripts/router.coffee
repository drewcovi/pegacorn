App.Router.reopen
  location: 'history'

Em.Route.reopen
  activate: ->
    @_super()
    document.title = this.routeName

# App.LoadingRoute = Ember.Route.extend({});

App.Router.map ->
  @resource 'posts', ->
    @route 'show',
      path: '/:post_id'
    @route 'edit',
      path: '/:post_id/edit'
    @route 'new',
      path: '/new'
  @resource 'users', ->
    @route 'show',
      path: '/:user_id'
    @route 'edit',
      path: '/:user_id/edit'
    @route 'new',
      path: '/new'
    @resource 'workauths',
      path: '/:user_id/workauths'
  # @resource 'user',
  #   path: '/users/:user_id', ->
  #     @resource 'workauths',
  #       path: '/workauths'

