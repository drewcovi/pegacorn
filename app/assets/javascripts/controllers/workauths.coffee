App.WorkauthsController = Em.ArrayController.extend
  worker: null
  needs: 'user'
  workerBinding: 'controllers.user'
  init: ->
    console.log this, @worker, @worker.get 'content'