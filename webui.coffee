#!/usr/bin/env coffee
# webui.coffee
express = require 'express'
logfmt = require 'logfmt'
config = require 'config'

webconfig = config.Webserver

console.log config

app = express()

app.use logfmt.requestLogger()

app.get '/',
	(req, res) ->
		res.send('Hello World!')

port = Number(webconfig.httpPort) || 5000
app.listen port,
	() ->
		console.log("Listening on " + port)
