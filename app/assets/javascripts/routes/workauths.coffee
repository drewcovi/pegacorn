App.WorkauthsRoute = Em.Route.extend
  setupController: ->
    console.log 'setting up workauths controller'
  model: (params) ->
    if App.Auth.get('signedIn')
      console.log('params are', params)
      App.Workauth.find()
  beforeModel: ->
    

App.WorkauthRoute = App.WorkauthsRoute.extend 
  model: (params) ->
    if App.Auth.get('signedIn')
      console.log('params are', params)
      App.Workauth.find(param.workauth_id)
  serialize: (model) ->
    workauth_id: model.get 'id'
    user_id: @controllerFor('user').get 'param'
