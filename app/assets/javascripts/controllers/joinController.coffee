App.JoinController = Ember.ObjectController.extend
  email: null,
  password: null,
  username: null,
  
  create: ->
    console.log 'committed', @email, @username, @password, App.get('paths').join

  afterSave: ->
    @transitionToRoute('account.success', @content)

  init: ->
  	# console.log 'Join page triggered'
