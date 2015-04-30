`import Ember from 'ember'`

HostsIndexRoute = Ember.Route.extend
  model: ->
    @store.find 'host'

`export default HostsIndexRoute`
