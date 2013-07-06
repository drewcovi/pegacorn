App.Router.reopen
  location: 'history'

Em.Route.reopen
  activate: ->
    @_super()
    document.title = this.routeName


App.Router.map ->
  @resource 'posts', ->
    @resource 'post',
      path: '/:permalink', ->
        @route 'edit',
          path: '/edit'
    # @route 'edit',
    #   path: '/:permalink/edit'
    @route 'new',
      path: '/new'
  @resource 'users', ->
    @resource 'user',
      path: '/:user_id', ->
        @resource 'workauths'
    @route 'new'
    @route 'edit',
      path: '/:user_id/edit'

