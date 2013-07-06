App.UsersNewController = App.UserController.extend
  save: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterSave'

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('users.index')

  afterSave: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('user', @content)

  headerTitle: 'Create'
  buttonTitle: 'Create'