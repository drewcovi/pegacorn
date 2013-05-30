App.PostsNewController = Em.ObjectController.extend
  save: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterSave'

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('posts.index')

  afterSave: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('posts.show', @content)

  headerTitle: 'Create'
  buttonTitle: 'Create'