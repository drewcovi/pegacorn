App.UsersEditController = Em.ObjectController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'users.show', @content

  cancel: ->
    if @content.isDirty
      @content.rollback()
      console.log 'cancelled'
    @transitionToRoute 'users.index'

  destroy: ->
    @transaction = @store.transaction()
    @transaction.add( @content )
    if window.confirm('Are you sure you want to delete?')
      @content.deleteRecord()
      @transaction.commit()
      @content.one 'didDelete', ()=>
        @content.destroy()
        @transitionToRoute 'users.index'
    else
      @transaction.rollback()
      @transitionToRoute 'users.edit', @content

    
      console.log 'foo'

  headerTitle: 'Edit'
  buttonTitle: 'Update'

