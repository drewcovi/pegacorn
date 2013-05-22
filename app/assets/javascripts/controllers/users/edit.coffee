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
    # @content.deleteRecord()
    # @store.commit()

    @transaction = @store.transaction()
    console.log @transaction
    @transaction.add( @content )
    if window.confirm('Are you sure you want to delete?')
      @content.deleteRecord()
      @transaction.commit()
      console.log 'deleting user'
      @content.one 'didDelete', ()=>
        console.log 'did delete user'
        @content.destroy()
        @transitionToRoute 'users.index'
        # @transaction.commit()
    else
      @transaction.rollback()
      @transitionToRoute 'users.edit', @content

    
      console.log 'foo'

  headerTitle: 'Edit'
  buttonTitle: 'Update'

