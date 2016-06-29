`import Ember from 'ember'`

HostsIndexRoute = Ember.Route.extend
  model: ->
    @store.find('host').then (hosts) ->
      hosts.sortBy('name', 'instanceId')

`export default HostsIndexRoute`
