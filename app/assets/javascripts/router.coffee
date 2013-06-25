App.Router.reopen
  location: 'history'

Em.Route.reopen
  activate: ->
    @_super()
    document.title = this.routeName
    # document.title = this \
    #                   .controllerFor('title') \
    #                   .get('dictionary.#{@routeName}')

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
      path: '/:user_id', ->
    @route 'edit',
      path: '/:user_id/edit'
    @route 'new',
      path: '/new'
  @resource 'users',
    path: '/users/:user_id', ->
      @resource 'worakuths',
      path: '/workauths'
  @resource 'workauths', ->
    @route 'show',
      path: '/:workauth_id'
    @route 'edit',
      path: '/:workauth_id/edit'
    @route 'new',
      path: '/new'
