`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

router = Router.map ->
  @route 'login'
  @route 'hosts', path: '/', ->
    @route 'show', path: ':host_id', ->
      @route 'edit'

  @route 'puppet_classes', ->
    @route 'create'
    @route 'edit', path: '/edit/:puppet_class_id'
    @route 'show', path: ':puppet_class_id'

`export default router`
