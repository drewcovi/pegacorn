App.PostEditController = App.PostController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'post', @content

  cancel: ->
    if @content.get 'isDirty'
      @content.rollback()
    @transitionToRoute 'post'

  destroy: ->
    @transaction = @store.transaction()
    @transaction.add @content
    if window.confirm "Are you sure you want to delete #{@content.get('title')}"
      @content.deleteRecord()
      @transaction.commit()
      @content.one 'didDelete', ()=>
        @transitionToRoute 'posts.index'
    else
      @transaction.rollback()
      @transitionToRoute 'post.edit', @content

  headerTitle: 'Edit'
  buttonTitle: 'Update'