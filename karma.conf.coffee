# Karma configuration
# http://karma-runner.github.io/0.10/config/configuration-file.html

module.exports = (config) ->
	config.set
		# base path, that will be used to resolve files and exclude
		basePath: ''

		# testing framework to use (jasmine/mocha/qunit/...)
		frameworks: [
			# This order is important. Chai doesn't work if loaded before RequireJS.
			'requirejs'
			'mocha'
			'chai'
		]

		# list of files / patterns to load in the browser
		files: [
			{ pattern: 'app/bower_components/**/*.js', included: false }
			{ pattern: 'app/scripts/templates.js', included: false }
			{ pattern: 'app/scripts/**/*.coffee', included: false }
			{ pattern: 'test/unit/**/*.coffee', included: false }
			'test/main.coffee'
		]

		# list of files / patterns to exclude
		exclude: [
			'app/scripts/contexts/**/*.coffee'
			'app/scripts/app.coffee'
			'app/scripts/main.coffee'
			'app/scripts/modules.coffee'
		]

		# web server port
		port: 8080

		# level of logging
		# possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
		logLevel: config.LOG_INFO

		# enable / disable watching file and executing tests whenever any file changes
		autoWatch: false

		# Start these browsers, currently available:
		# - Chrome
		# - ChromeCanary
		# - Firefox
		# - Opera
		# - Safari (only Mac)
		# - PhantomJS
		# - IE (only Windows)
		browsers: []

		# Continuous Integration mode
		# if true, it capture browsers, run tests and exit
		singleRun: false
