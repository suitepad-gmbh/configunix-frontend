`import Ember from 'ember'`

PuppetClassesShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'puppetClass', params.puppet_class_id

`export default PuppetClassesShowRoute`
