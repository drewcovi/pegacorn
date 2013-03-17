App.LoginController = Ember.ObjectController.extend
  check: ->
    console.log @username, @email, @password

  afterCheck: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('account.success', @content)

  init: ->
  	# console.log 'Login Page Triggered'

