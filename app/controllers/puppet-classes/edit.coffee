`import Ember from 'ember'`

PuppetClassesEditController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'puppet_classes.index'
      , ->
        alert('An error occured')

`export default PuppetClassesEditController`
