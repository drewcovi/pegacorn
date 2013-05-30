App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'posts', ->
    @route 'show', {path: '/:post_id'}
    @route 'edit', {path: '/:post_id/edit'}
    @route 'new', {path: '/new'}
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}
    @route 'edit', {path: '/:user_id/edit'}
    @route 'new', {path: '/new'}
