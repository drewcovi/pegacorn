App.PostsEditController = Em.ObjectController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'posts.show', @content

  cancel: ->
    if @content.isDirty
      @content.rollback()
      console.log 'cancelled'
    @transitionToRoute 'posts.index'

  destroy: ->
    @transaction = @store.transaction()
    console.log @transaction
    @transaction.add( @content )
    if window.confirm('Are you sure you want to delete?')
      @content.deleteRecord()
      @transaction.commit()
      console.log 'deleting post'
      @content.one 'didDelete', ()=>
        console.log 'did delete post'
        @content.destroy()
        @transitionToRoute 'posts.index'
        # @transaction.commit()
    else
      @transaction.rollback()
      @transitionToRoute 'posts.edit', @content

  headerTitle: 'Edit'
  buttonTitle: 'Update'

