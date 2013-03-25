# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

App.sessionController = Ember.Object.create
  signedIn: false

  isSignedIn: ->
    @signedIn;

  signOut: ->
    @signedIn = false
    App.stateManager.goToState('signedout')

  signIn: ->
    @signedIn = true;
    App.stateManager.goToState('signedin')

App.session = Ember.StateManager.create

  start: Ember.State.create
    enter: (manager) ->
      if App.sessionController.isSignedIn()
        manager.goToState('signedin')
      else
        manager.goToState('signedout')

  signedin: Ember.State.create
    enter: (manager) ->
      console.log 'entered signedin state'

    exit: (manager) ->
      console.log 'exited signedin state'


  signedout: Ember.State.create
    enter: (manager) ->
      console.log 'entered signedout state'

    exit: (manager) ->
      console.log 'exited signedout state'