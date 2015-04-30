`import Ember from 'ember'`

HostsShowEditRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.set 'model', @modelFor('hosts/show')

  actions:
    willTransition: ->
      @modelFor('hosts/show').rollback()

`export default HostsShowEditRoute`
