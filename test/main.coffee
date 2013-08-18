tests = []
for file of window.__karma__.files
	if window.__karma__.files.hasOwnProperty(file)
		if /Spec\.js$/.test(file)
			tests.push(file)

require.config
	baseUrl: '/base/app/scripts'

	paths:
		backbone: '../bower_components/backbone/backbone'
		bootstrap: 'vendor/bootstrap'
		handlebars: '../bower_components/handlebars/handlebars.runtime'
		jquery: '../bower_components/jquery/jquery'
		underscore: '../bower_components/underscore/underscore'

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

		handlebars:
			exports: 'Handlebars'

		underscore:
			exports: '_'

	deps: tests

	callback: window.__karma__.start
