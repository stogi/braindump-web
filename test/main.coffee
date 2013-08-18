tests = []
for file of window.__karma__.files
  if window.__karma__.files.hasOwnProperty(file)
    if /Spec\.js$/.test(file)
      tests.push(file)

console.debug 'after loop', tests

require.config
  baseUrl: '/base/app/scripts'

  paths:
    backbone: '../bower_components/backbone/backbone'
    bootstrap: 'vendor/bootstrap'
    chai: '../bower_components/chai/chai'
    handlebars: '../bower_components/handlebars/handlebars.runtime'
    jquery: '../bower_components/jquery/jquery'
    underscore: '../bower_components/underscore/underscore'

#	packages: [
#		{ name: 'meld', location: '../bower_components/meld', main: 'meld' }
#		{ name: 'poly', location: '../bower_components/poly', main: 'poly' }
#		{ name: 'wire', location: '../bower_components/wire', main: 'wire' }
#		{ name: 'when', location: '../bower_components/when', main: 'when' }
#	]

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

    chai:
      exports: 'chai'

    handlebars:
      exports: 'Handlebars'

    underscore:
      exports: '_'

  deps: tests

  callback: window.__karma__.start
