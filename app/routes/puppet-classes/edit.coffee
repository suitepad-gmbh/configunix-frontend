`import Ember from 'ember'`

PuppetClassesEditRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'puppetClass', params.puppet_class_id

  actions:
    willTransition: ->
      @modelFor('puppet_classes/edit').rollback()

`export default PuppetClassesEditRoute`
