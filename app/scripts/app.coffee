define (require) ->
	$ = require 'jquery'
	wire = require 'wire'

	modules = require 'modules'

	context = require 'contexts/main'
	templates = require 'templates'

	wire(context).then (wiredContext) ->
		console.log 'Running jQuery %s', $().jquery
		console.log templates.OtherView()

		$('.hero-unit').append wiredContext.navigationView.getElement()

	context
