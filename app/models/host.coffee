`import DS from 'ember-data'`

Host = DS.Model.extend

  # attributes
  instanceId:       DS.attr 'string'
  dnsName:          DS.attr 'string'
  privateDnsName:   DS.attr 'string'
  privateIpAddress: DS.attr 'string'
  publicIpAddress:  DS.attr 'string'
  puppetConfig:     DS.attr 'string'
  createdAt:        DS.attr 'date'
  updatedAt:        DS.attr 'date'

`export default Host`
