App.PostsEditController = App.PostController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'post', @content

  cancel: ->
    if @content.get 'isDirty'
      @content.rollback()
    @transitionToRoute 'posts.index'

  destroy: ->
    @transaction = @store.transaction()
    @transaction.add @content
    if window.confirm 'Are you sure you want to delete?'
      @content.deleteRecord()
      @transaction.commit()
      @content.one 'didDelete', ()=>
        @transitionToRoute 'posts.index'
    else
      @transaction.rollback()
      @transitionToRoute 'posts.edit', @content

  headerTitle: 'Edit'
  buttonTitle: 'Update'