App.WorkauthsController = Em.ArrayController.extend
  worker: null
  needs: 'usersShow'
  workerBinding: 'controllers.usersShow'
  init: ->
    console.log this, @worker, @worker.get 'content'