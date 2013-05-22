App.Router.reopen
  location: 'history'

App.Router.map ->
  @resource 'posts', ->
    @route 'show', {path: '/:post_id'}
  @resource 'users', ->
    @route 'show', {path: '/:user_id'}
    @route 'edit', {path: '/:user_id/edit'}
    @route 'new', {path: '/new'}