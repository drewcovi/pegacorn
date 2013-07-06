App.WorkauthsRoute = Em.Route.extend
  setupController: ->
    console.log 'setting up workauths controller'
  # model: (params) ->
  #   if App.Auth.get('signedIn')
  #     console.log params
  #     App.Workauth.find()
  setupController: (controller, model) ->
    # @_super(controller, model)
    @controllerFor('user').set('workauths', model)
    console.log model, @controllerFor('user').get('model').get('firstName')
  beforeModel: ->