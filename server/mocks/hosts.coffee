module.exports = (app) ->
  express = require 'express'
  hostsRouter = express.Router()

  hosts = [{
    id:                 1
    dns_name:           "95-173-65-76.runolfsson.biz"
    private_dns_name:   "6-97-31-33.hammes.us"
    private_ip_address: "6.97.31.33"
    public_ip_address:  "95.173.65.76"
    puppet_config:      "classes:\n- admins\n"
    created_at:         "2015-04-30T11:25:14.112Z"
    updated_at:         "2015-04-30T11:25:14.112Z"
    instance_id:        "instance#01"
  }]

  hostsRouter.get '/', (req, res) ->
    res.send hosts: hosts

  hostsRouter.get '/:id', (req, res) ->
    res.send hosts: hosts.filter((e) ->
      e.id is parseInt(req.params.id)
    )[0]

  hostsRouter.put '/:id', (req, res) ->
    res.send hosts: hosts.filter((e) ->
      e.id is parseInt(req.params.id)
    )[0]

  app.use('/api/hosts', hostsRouter)
