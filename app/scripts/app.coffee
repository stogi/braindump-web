define (require) ->
	$ = require 'jquery'
	wire = require 'wire'

	modules = require 'modules'
	context = require 'contexts/main'

	wire(context).then (wiredContext) ->
		console.log wiredContext

		console.log wiredContext.navigationView.render()

		console.log $('.navigation')[0]

	context.applicationName
