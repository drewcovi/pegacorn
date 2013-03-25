App.JoinController = Ember.ObjectController.extend
  email: null,
  password: null,
  username: null,
  
  create: ->
    console.log 'committed', @email, @password
    @store.commit()
    @content.addObserver 'id', @, 'afterSave'

  afterSave: ->
    @transitionToRoute('account.success', @content)

  init: ->

  cancel: ->
    # @content.deleteRecord()
    # @transitionToRoute('users.index')

  afterSave: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('home', @content)
