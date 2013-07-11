App.UsersEditController = App.UserController.extend
  save: ->
    workauths = @content.get('workauths')
    #Check workauth records on client
    if workauths.get('length') <= 0
      @importWorkauths()
    @store.commit()
    @transitionToRoute 'user', @content

  importWorkauths: ->
    console.log 'no workauths, now importing'
    
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

