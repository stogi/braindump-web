define (require) ->
	$ = require 'jquery'
	wire = require 'wire'

	modules = require 'modules'
	context = require 'contexts/main'

	wire(context).then (wiredContext) ->
		console.log wiredContext.message
		console.log 'Running jQuery %s', $().jquery

		$('.hero-unit').append wiredContext.navigationView.getElement()

	context
