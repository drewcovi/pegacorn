App.UsersEditController = App.UserController.extend
  save: ->
    @store.commit()
    @transitionToRoute 'user', @content

  cancel: ->
    @transaction = @store.transaction()
    @transaction.add @content
    if @content.get 'isDirty'
      @content.rollback()
    @transitionToRoute 'users.index'

  destroy: ->
    @transaction = @store.transaction()
    @transaction.add @content
    if window.confirm "Are you sure you want to delete #{@content.get('fullName')}"
      @content.deleteRecord()
      @transaction.commit()
      @content.one 'didDelete', ()=>
        @transitionToRoute 'users.index'
    else
      @transaction.rollback()
      @transitionToRoute 'users.edit', @content

  headerTitle: 'Edit'
  buttonTitle: 'Update'

