require.config
	paths:
		backbone: '../bower_components/backbone/backbone'
		bootstrap: 'vendor/bootstrap'
		handlebars: '../bower_components/handlebars.js/dist/handlebars.runtime'
		jquery: '../bower_components/jquery/jquery'
		underscore: '../bower_components/underscore/underscore'

	packages: [
		{ name: 'meld', location: '../bower_components/meld', main: 'meld' }
		{ name: 'poly', location: '../bower_components/poly', main: 'poly' }
		{ name: 'wire', location: '../bower_components/wire', main: 'wire' }
		{ name: 'when', location: '../bower_components/when', main: 'when' }
	]

	shim:
		backbone:
			deps: [
				'jquery'
				'underscore'
			]
			exports: 'Backbone'

		bootstrap:
			deps: [
				'jquery'
			]
			exports: 'jquery'

		underscore:
			exports: '_'

require ['app'], (app) ->
	console.log 'App has started!'
