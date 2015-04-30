`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

router = Router.map ->
  @route 'login'
  @route 'hosts', path: '/', ->
    @route 'show', path: ':host_id', ->
      @route 'edit'

`export default router`
