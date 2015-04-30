`import Ember from 'ember'`

HostsShowIndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', @modelFor('hosts/show')

`export default HostsShowIndexRoute`
