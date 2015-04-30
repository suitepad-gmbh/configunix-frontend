`import Ember from 'ember'`
`import LoginControllerMixin from 'simple-auth/mixins/login-controller-mixin'`

LoginController = Ember.Controller.extend LoginControllerMixin,

  # properties
  identification: null
  password: null

  # methods
  authenticate: (email, password) ->
    @get('session').authenticate(
      'simple-auth-authenticator:oauth2-password-grant',
      identification: email,
      password: password
    )

  # actions
  actions:
    authenticate: ->
      @authenticate @get('identification'), @get('password')

`export default LoginController`
