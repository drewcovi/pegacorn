App.UsersRoute = Em.Route.extend
    model: ->
      if App.Auth.get('signedIn')
        App.User.find()
    setupController: (controller, model) ->
      @_super controller, model
      # console.log(model.get('length'))
      # @controllerFor('user').set ''

App.UserRoute = App.UsersRoute.extend
  serialize: (model) ->
    user_id: model.get('id')

  model: (params) ->
    if App.Auth.get('signedIn')
      console.log(params)
      App.User.find(params.user_id)
            
  # setupController: (controller, model) ->
  #   controller.set 'content', model
