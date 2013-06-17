require.config
	paths:
		jquery: '../bower_components/jquery/jquery'
		bootstrap: 'vendor/bootstrap'

	packages: [
		{ name: 'meld', location: '../bower_components/meld', main: 'meld' }
		{ name: 'poly', location: '../bower_components/poly', main: 'poly' }
		{ name: 'wire', location: '../bower_components/wire', main: 'wire' }
		{ name: 'when', location: '../bower_components/when', main: 'when' }
	]

	shim:
		bootstrap:
			deps: ['jquery']
			exports: 'jquery'

require ['app'], (app) ->
	console.log app
