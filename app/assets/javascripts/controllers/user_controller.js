App.UserController = Ember.Object.extend({
	currentUserBinding: 'App.currentUser',
	userStates: null
});

App.userController = App.UserController.create();

App.addObserver('isSignedIn', function() {
  if (App.get('isSignedIn')) {
    App.userController.get('userStates').goToState('signedIn');
  } else {
    App.userController.get('userStates').goToState('signedOut');
  }
});
