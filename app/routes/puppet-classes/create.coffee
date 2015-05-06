`import Ember from 'ember'`

PuppetClassesCreateRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @set 'model', @store.createRecord('puppetClass')
    controller.set 'model', @get('model')

  actions:
    willTransition: ->
      @get('model').deleteRecord() if Ember.isEmpty @get('model.id')

`export default PuppetClassesCreateRoute`
