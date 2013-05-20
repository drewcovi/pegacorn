App.AuthSignInView = Em.View.extend
  templateName: 'auth/sign-in'

  email:    null
  password: null
  remember: false

  submit: (event, view) ->
    event.preventDefault()
    event.stopPropagation()
    App.Auth.signIn
      data:
        email:    @get 'email'
        password: @get 'password'
        remember: @get 'remember'