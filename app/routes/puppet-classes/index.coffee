`import Ember from 'ember'`

PuppetClassesIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'puppetClass'

`export default PuppetClassesIndexRoute`
