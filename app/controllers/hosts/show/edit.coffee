`import Ember from 'ember'`

HostsShowEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then (model) =>
        @transitionToRoute 'hosts.show', model
      , ->
        alert 'Error'

`export default HostsShowEditController`
