#!/usr/bin/env coffee
# webui.coffee
express = require 'express'
logfmt = require 'logfmt'
config = require 'config'
ejs = require 'ejs'

webconfig = config.Webserver

console.log config

app = express()

app.use express.static(__dirname + '/public')
app.use logfmt.requestLogger()

app.get '/',
	(req, res) ->
		res.render('main.ejs')

port = Number(process.env.PORT) || Number(webconfig.httpPort) || 5000
app.listen port,
	() ->
		console.log("Listening on " + port)

app.post '/send'
	(req, res) ->
		