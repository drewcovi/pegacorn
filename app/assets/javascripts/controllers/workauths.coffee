App.WorkauthsController = Em.ArrayController.extend
  worker: null
  needs: 'users'
  workerBinding: 'controllers.users.content'
  init: ->
    console.log this, @worker, @worker.get 'content'