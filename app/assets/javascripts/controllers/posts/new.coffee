App.PostsNewController = App.PostController.extend
  save: ->
    @store.commit()
    @content.addObserver 'id', @, 'afterSave'

  cancel: ->
    @content.deleteRecord()
    @transitionToRoute('posts.index')

  afterSave: ->
    @content.removeObserver 'id', @, 'afterSave'
    @transitionToRoute('post', @content)

  headerTitle: 'Create'
  buttonTitle: 'Create'