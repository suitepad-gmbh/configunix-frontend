`import DS from 'ember-data'`
`import config from '../config/environment'`

ApplicationAdapter = DS.ActiveModelAdapter.extend
  host: config.apiHost
  namespace: config.apiNamespace

`export default ApplicationAdapter`
