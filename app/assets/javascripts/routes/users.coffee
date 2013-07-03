App.UsersRoute = Em.Route.extend
    model: ->
      if App.Auth.get('signedIn')
        App.User.find()
    # setupController: (controller, model) ->
    #   @_super controller, model

App.UserRoute = Em.Route.extend
  serialize: (model) ->
    user_id: model.get('id')

  model: (params) ->
    if App.Auth.get('signedIn')
      console.log('user params are', params)
      App.User.find(params.user_id)
            
  # setupController: (controller, model) ->
  #   controller.set 'content', model
