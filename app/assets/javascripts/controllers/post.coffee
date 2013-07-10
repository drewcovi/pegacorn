App.PostController = Em.ObjectController.extend
  isEditing: false
  save: ->
    @set 'isEditing', false
    @store.commit()

  edit: ->
    @set 'isEditing', true