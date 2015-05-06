`import Ember from 'ember'`

PuppetClassesCreateController = Ember.Controller.extend
  actions:
    save: ->
      @get('model').save().then =>
        @transitionToRoute 'puppet_classes.index'
      , ->
        alert('An error occured')

`export default PuppetClassesCreateController`
