`import Ember from 'ember'`

HostsShowRoute = Ember.Route.extend
  model: (params) ->
    @store.find 'host', params.host_id

`export default HostsShowRoute`
