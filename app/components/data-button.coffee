`import Ember from 'ember'`

DataButtonComponent = Ember.Component.extend
  # config
  tagName: 'button'
  type: 'button'
  classNames: ['btn']
  attributeBindings: ['isDisabled:disabled']
  enabled: undefined
  disabled: undefined

  # properties
  model: null

  # computed
  waiting: Ember.computed.or 'model.isLoading', 'model.isSaving'

  isDisabled: Ember.computed 'waiting', 'enabled', 'disabled', ->
    return true if @get 'waiting'
    return true if @get('enabled') isnt undefined and not @get('enabled')
    return true if @get('disabled') isnt undefined and @get('disabled')
    false

`export default DataButtonComponent`
